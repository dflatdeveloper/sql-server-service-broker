CREATE PROCEDURE [dbo].[usp_QueueA_Activation_In]
AS	
BEGIN
    SET NOCOUNT ON

	BEGIN TRAN
       
    DECLARE @Conversation_Handle UNIQUEIDENTIFIER,
            @MessageBody VARCHAR(MAX),
            @MessageType NVARCHAR(MAX),
            @MessageSequenceNumber INT,
            @ErrorMessage NVARCHAR(4000),  
            @ErrorNumber INT,
            @PayloadData XML

    BEGIN TRY    
        
        ;RECEIVE 
            @Conversation_Handle = CAST(conversation_handle AS UNIQUEIDENTIFIER),
            @MessageBody = CAST(message_body AS VARCHAR(MAX)), 
            @MessageType = CAST(message_type_name AS NVARCHAR(MAX)),
            @MessageSequenceNumber = CAST(message_sequence_number AS INT)
        FROM dbo.QueueA_In;

        IF (@MessageType = 'ValidatedSenderMessageType')
        BEGIN

            DECLARE @XmlData_Request XML =  CAST(@MessageBody AS XML)
            DECLARE @XmlData_Response XML

            INSERT INTO @PayloadData
            SELECT 
            T.D.VALUE('/payloads/payload/id[1]', 'int') id,
            T.D.Value('/payloads/payload/content[1]','nvarchar(-1)') content
            FROM @XmlData_Request.nodes('.') T(D)
                               
            SEND ON CONVERSATION @Conversation_Handle
				MESSAGE TYPE [ReceiverMessageType]('Recieved'); -- REMOVE HARD CODING
        END
        ELSE IF (@MessageType = 'http://schemas.microsoft.com/SQL/ServiceBroker/EndDialog')
        BEGIN

            -- The workflow was completed and can be forwarded to the external activation listener
            -- C# code that runs in a console app
            DECLARE @dialog_handle	UNIQUEIDENTIFIER

            SAVE TRANSACTION WorkflowStep

            BEGIN TRY


		        --IN THIS EXAMPLE WE ONLY WANT NEW RECORDS
		        --IN REALITY WE WOULD HANDLE UPDATES IN THIS CALL TOO
		        INSERT INTO @PayloadData
		        SELECT Id,
		               Content
		        FROM Payload
                --Use a where clause to send only the update with modified dates

		        SET @PayloadData = (SELECT id,
								           content
							        FROM @PayloadData
							        FOR XML PATH ('payload'), ROOT('payloads'));

                BEGIN DIALOG CONVERSATION @dialog_handle 
			    FROM SERVICE 
				    [ServiceA_Out]
			    TO SERVICE 
				    N'ServiceC_In'
			    ON CONTRACT 
				    [SBMessageContract];

		        SEND ON CONVERSATION @dialog_handle
				        MESSAGE TYPE [ValidatedSenderMessageType](@PayloadData);

                END CONVERSATION @Conversation_Handle
            END TRY
            BEGIN CATCH
                SELECT @ErrorMessage = ERROR_MESSAGE();  
                SELECT @ErrorNumber = ERROR_NUMBER();

                ROLLBACK TRANSACTION WorkflowStep;

                END CONVERSATION @Conversation_Handle WITH ERROR = @ErrorNumber DESCRIPTION = @ErrorMessage

                RETURN
            END CATCH
        END

        COMMIT WORK

    END TRY
    BEGIN CATCH
        SELECT @ErrorMessage = ERROR_MESSAGE();  
        SELECT @ErrorNumber = ERROR_NUMBER();
                
        END CONVERSATION @Conversation_Handle WITH ERROR = @ErrorNumber DESCRIPTION = @ErrorMessage
    END CATCH
END
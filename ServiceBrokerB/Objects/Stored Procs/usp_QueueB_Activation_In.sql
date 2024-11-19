CREATE PROCEDURE [dbo].[usp_QueueB_Activation_In]
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
            @PayloadData Payload_TT

    BEGIN TRY    
        
        ;RECEIVE 
            @Conversation_Handle = CAST(conversation_handle AS UNIQUEIDENTIFIER),
            @MessageBody = CAST(message_body AS VARCHAR(MAX)), 
            @MessageType = CAST(message_type_name AS NVARCHAR(MAX)),
            @MessageSequenceNumber = CAST(message_sequence_number AS INT)
        FROM dbo.QueueB_In;

        IF (@MessageType = 'ValidatedSenderMessageType')
        BEGIN

            DECLARE @XmlData_Request XML (ValidatedData) =  CAST(@MessageBody AS XML)
            DECLARE @XmlData_Response XML

            INSERT INTO @PayloadData
            SELECT 
            request.data.value('id[1]', 'int') id,
            request.data.value('content[1]','nvarchar(max)') content
            FROM @XmlData_Request.nodes('/payloads/payload') request(data)


            UPDATE Payload 
            SET CONTENT = D.Content + CHAR(10) + 'Received'
            FROM Payload P 
            JOIN @PayloadData D ON P.ID = D.ID


            --IN REALITY SOMETHING WOULD HAPPEN HERE 
            --THIS EXAMPLE WERE ARE ADDING A SMALL BIT OF CONTENT AND SENDING BACK
            SET @XmlData_Response = (SELECT id,
					content
			    FROM @PayloadData
			FOR XML PATH ('payload'), ROOT('payloads'));
                               
            SEND ON CONVERSATION @Conversation_Handle
				MESSAGE TYPE [ValidatedReceiverMessageType](@XmlData_Response);
        END
        ELSE IF (@MessageType = 'http://schemas.microsoft.com/SQL/ServiceBroker/EndDialog')
        BEGIN
            END CONVERSATION @Conversation_Handle
        END

        COMMIT

    END TRY
    BEGIN CATCH
        SELECT @ErrorMessage = ERROR_MESSAGE();  
        SELECT @ErrorNumber = ERROR_NUMBER();

        DECLARE @PayloadError XML(ErrorData)

        SET @PayloadError = (SELECT id,
							@ErrorNumber [errorId],
                            @ErrorMessage [errorDescription]                            
					FROM @PayloadData
					FOR XML PATH ('error'), ROOT('errorDescription'));            


        SEND ON CONVERSATION @Conversation_Handle
            MESSAGE TYPE [ErrorReceiverMessageType](@PayloadError)
    END CATCH

END
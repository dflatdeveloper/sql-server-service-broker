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
            @ErrorNumber INT

    BEGIN TRY    
        
        ;RECEIVE 
            @Conversation_Handle = CAST(conversation_handle AS UNIQUEIDENTIFIER),
            @MessageBody = CAST(message_body AS VARCHAR(MAX)), 
            @MessageType = CAST(message_type_name AS NVARCHAR(MAX)),
            @MessageSequenceNumber = CAST(message_sequence_number AS INT)
        FROM dbo.QueueB_In;

        IF (@MessageType = 'ValidatedSenderMessageType')
        BEGIN

            DECLARE @XmlData_Request XML =  CAST(@MessageBody AS XML)
            DECLARE @XmlData_Response XML

            UPDATE Payload 
            SET CONTENT = P.Content + CHAR(10) + 'Received'
            FROM Payload P
            CROSS APPLY @XmlData_Request.nodes('.') T(D) 


            --IN REALITY SOMETHING WOULD HAPPEN HERE 
            --THIS EXAMPLE WERE ARE ADDING A SMALL BIT OF CONTENT AND SENDING BACK
            SET @XmlData_Response = (SELECT id,
					content
			FROM @XmlData_Response
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

        ROLLBACK TRANSACTION;

        END CONVERSATION @Conversation_Handle WITH ERROR = @ErrorNumber DESCRIPTION = @ErrorMessage
    END CATCH

END
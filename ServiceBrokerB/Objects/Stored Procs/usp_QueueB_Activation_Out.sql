CREATE PROCEDURE [dbo].[usp_QueueB_Activation_Out]
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
        FROM dbo.QueueB_Out;

        IF (@MessageType = 'ReceiverMessageType')
        BEGIN
            UPDATE Payload SET CONTENT = '' WHERE ID = 1; -- Change this to ID from message

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

CREATE PROCEDURE [dbo].[QueueA_OutActivationSProc]
AS
BEGIN
	SET NOCOUNT ON

	BEGIN TRAN
       
    DECLARE @Conversation_Handle UNIQUEIDENTIFIER,
            @MessageBody VARCHAR(MAX),
            @MessageType NVARCHAR(MAX),
            @MessageSequenceNumber INT

    BEGIN TRY    
        
        ;RECEIVE 
            @Conversation_Handle = CAST(conversation_handle AS UNIQUEIDENTIFIER),
            @MessageBody = CAST(message_body AS VARCHAR(MAX)), 
            @MessageType = CAST(message_type_name AS NVARCHAR(MAX)),
            @MessageSequenceNumber = CAST(message_sequence_number AS INT)
        FROM dbo.QueueA_Out;

        Print @MessageType

        IF (@MessageType = 'ReceiverMessageType')
        BEGIN
            UPDATE Payload SET ReceiverAcknowledged = 1 WHERE ID = 1 -- Change this to ID from message

            END CONVERSATION @Conversation_Handle
        END

        COMMIT

    END TRY
    BEGIN CATCH
        ROLLBACK
    END CATCH
END
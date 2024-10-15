CREATE PROCEDURE [dbo].[QueueB_InActivationSProc]
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
        FROM dbo.QueueB_In;

        Print @MessageType

        IF (@MessageType = 'SenderMessageType')
        BEGIN
            INSERT INTO SOMEVALUE (MSG_Contents) VALUES (@MessageBody);
                               
            SEND ON CONVERSATION @Conversation_Handle
				MESSAGE TYPE [ReceiverMessageType]('Test B In');
        END
        ELSE IF (@MessageType = 'http://schemas.microsoft.com/SQL/ServiceBroker/EndDialog')
        BEGIN
            END CONVERSATION @Conversation_Handle
        END

        COMMIT

    END TRY
    BEGIN CATCH
        ROLLBACK
    END CATCH

END
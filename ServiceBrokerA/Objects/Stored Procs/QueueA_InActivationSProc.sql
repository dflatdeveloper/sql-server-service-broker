CREATE PROCEDURE [dbo].[QueueA_InActivationSProc]
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
        FROM dbo.QueueA_In;

        Print @MessageType

        IF (@MessageType = 'SenderMessageType')
        BEGIN
            UPDATE Payload SET CONTENT = '' WHERE ID = 1 -- REMOVE HARDCODING
                               
            SEND ON CONVERSATION @Conversation_Handle
				MESSAGE TYPE [ReceiverMessageType]('Test A In'); -- REMOVE HARD CODING
        END
        ELSE IF (@MessageType = 'http://schemas.microsoft.com/SQL/ServiceBroker/EndDialog')
        BEGIN
            END CONVERSATION @Conversation_Handle

            -- The workflow was completed and can be forwarded to the external activation listener
            -- C# code that runs in a console app

            DECLARE @dialog_handle	UNIQUEIDENTIFIER

            BEGIN DIALOG CONVERSATION @dialog_handle 
			FROM SERVICE 
				[ServiceA_Out]
			TO SERVICE 
				N'ServiceC_In'
			ON CONTRACT 
				[SBMessageContract];

		 SEND ON CONVERSATION @dialog_handle
				MESSAGE TYPE [SenderMessageType]('test A Out');

        END

        COMMIT

    END TRY
    BEGIN CATCH
        ROLLBACK
    END CATCH
END
CREATE PROCEDURE [dbo].[QueueC_InActivationSProc]
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
        FROM dbo.QueueC_In;

        Print @MessageType

        IF (@MessageType = 'SenderMessageType')
        BEGIN
            INSERT INTO SOMEVALUE (MSG_Contents) VALUES (@MessageBody);
                               
            SEND ON CONVERSATION @Conversation_Handle
				MESSAGE TYPE [ReceiverMessageType]('Test C In');
        END
        ELSE IF (@MessageType = 'http://schemas.microsoft.com/SQL/ServiceBroker/EndDialog')
        BEGIN

            DECLARE @external_activator_dialog UNIQUEIDENTIFIER
            
            BEGIN TRAN

            BEGIN TRY  -- IF THE QUEUE NOTIFICATION FAILS, WE DON'T WANT TO PREVENT ENDING THE CONVERSATION

                BEGIN DIALOG @external_activator_dialog
                    FROM SERVICE [ServiceC_Out]
                    TO SERVICE N'NotificationServiceC';
                    
                SEND ON CONVERSATION @external_activator_dialog
                    ('http://schemas.microsoft.com/SQL/Notifications/PostQueryNotification');

                COMMIT
            END TRY
            BEGIN CATCH

                ROLLBACK

            END CATCH

            END CONVERSATION @Conversation_Handle 
        END

        COMMIT

    END TRY
    BEGIN CATCH
        ROLLBACK
    END CATCH

END
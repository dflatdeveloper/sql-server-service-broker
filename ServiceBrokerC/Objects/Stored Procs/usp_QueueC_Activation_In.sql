CREATE PROCEDURE [dbo].[usp_QueueC_Activation_In]
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
        FROM dbo.QueueC_In;

        IF (@MessageType = 'SenderMessageType')
        BEGIN
            UPDATE Payload SET CONTENT = '' WHERE ID = 1; -- REMOVE HARDCODING
                               
            SEND ON CONVERSATION @Conversation_Handle
				MESSAGE TYPE [ReceiverMessageType]('Test C In');
        END
        ELSE IF (@MessageType = 'http://schemas.microsoft.com/SQL/ServiceBroker/EndDialog')
        BEGIN

            DECLARE @external_activator_dialog UNIQUEIDENTIFIER

            SAVE TRANSACTION ExternalActivation;

            BEGIN TRY 

                BEGIN DIALOG @external_activator_dialog
                    FROM SERVICE [ServiceC_Out]
                    TO SERVICE N'Workflow_Notification', 'CURRENT DATABASE';
                    
                SEND ON CONVERSATION @external_activator_dialog
                    ('http://schemas.microsoft.com/SQL/Notifications/PostQueryNotification');
          
            END TRY
            BEGIN CATCH
 
                SELECT @ErrorMessage = ERROR_MESSAGE();  
                SELECT @ErrorNumber = ERROR_NUMBER();

                ROLLBACK TRANSACTION ExternalActivation;

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
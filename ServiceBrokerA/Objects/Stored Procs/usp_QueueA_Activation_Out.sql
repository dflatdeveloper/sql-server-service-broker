CREATE PROCEDURE [dbo].[usp_QueueA_Activation_Out]
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
        FROM dbo.QueueA_Out;

        IF (@MessageType = 'ValidatedReceiverMessageType')
        BEGIN
            END CONVERSATION @Conversation_Handle
        END
        ELSE IF (@MessageType = 'ErrorReceiverMessageType')
        BEGIN
            -- IN REALITY WE WOULD HANDLE SOME RETRY FROM THE ERROR ID AND DESCRIPTION

            DECLARE @XmlData_Response XML (ErrorData) =  CAST(@MessageBody AS XML)
            DECLARE @PayloadData [dbo].ReceiverError_TT

            INSERT INTO @PayloadData
            SELECT 
            response.data.value('id[1]', 'int') id,
            response.data.value('errorId[1]','int') error_id,
            response.data.value('errorDescription[1]','nvarchar(max)') error_description
            FROM @XmlData_Response.nodes('/errors/error') response(data) 

            --IN REALITY SOMETHING ELSE WOULD BE DONE
            --NOTHING WOULD BE LISTENING TO THIS RESULTSET
            SELECT Id,
                   Error_ID,
                   Error_Description
            FROM @PayloadData
            
        END
        ELSE IF (@MessageType = 'http://schemas.microsoft.com/SQL/ServiceBroker/Error')
        BEGIN
            
            --THIS IS A SYSTEM ERROR SUCH AS XML VALIDATION ERROR, CERTIFICATE ERROR, ETC
            --WE WOULD NEED TO ADDRESS THIS ERROR AS A RETRY IF POSSIBLE, OR SOMETHING ELSE TO PREVENT A POISON MESSAGE
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
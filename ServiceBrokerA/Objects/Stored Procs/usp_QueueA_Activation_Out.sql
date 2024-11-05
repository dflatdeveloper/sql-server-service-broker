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

        IF (@MessageType = 'ReceiverMessageType')
        BEGIN
            DECLARE @XmlData_Request XML =  CAST(@MessageBody AS XML)
            DECLARE @XmlData_Response XML
            DECLARE @PayloadData Payload_TT

            INSERT INTO @PayloadData
            SELECT 
            T.D.VALUE('/payloads/payload/id[1]', 'int') id,
            T.D.Value('/payloads/payload/content[1]','nvarchar(-1)') content
            FROM @XmlData_Request.nodes('.') T(D)


            UPDATE Payload 
            SET ReceiverAcknowledged = 1
            FROM Payload P JOIN @PayloadData D  ON P.Id = D.Id


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
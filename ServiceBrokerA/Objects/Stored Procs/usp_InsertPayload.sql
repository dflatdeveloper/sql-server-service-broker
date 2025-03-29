CREATE PROCEDURE [dbo].[usp_InsertPayload]
	@payloads dbo.Payload_TT READONLY
AS
BEGIN
	PRINT 'usp_InsertPayloads'

	DECLARE @dialog_handle	UNIQUEIDENTIFIER

	BEGIN TRAN

	DECLARE @PayloadData XML

	DECLARE @NewPayload [dbo].[Payload_TT]

	INSERT INTO @NewPayload
	SELECT Id,
		    Content
	FROM @payloads


        
    IF EXISTS(SELECT 0 FROM @NewPayload)
    BEGIN

        SET @PayloadData = (SELECT id,
							        content
					        FROM @NewPayload
					        FOR XML PATH ('payload'), ROOT('payloads'));
        
	    BEGIN DIALOG CONVERSATION @dialog_handle 
		    FROM SERVICE 
			    [ServiceA_Out]
		    TO SERVICE 
			    N'ServiceB_In'
		    ON CONTRACT 
			    [ValidatedSBMessageContract];

		SEND ON CONVERSATION @dialog_handle
			MESSAGE TYPE [ValidatedSenderMessageType](@PayloadData);
    END
    ELSE
        PRINT 'No Records'

	COMMIT
END
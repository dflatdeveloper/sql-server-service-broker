CREATE PROCEDURE [dbo].[usp_InsertPayload]
	@payloads dbo.Payload_TT READONLY
AS
BEGIN
	PRINT 'usp_InsertPayloads'

	DECLARE @dialog_handle	UNIQUEIDENTIFIER

	BEGIN TRAN

		DECLARE @PayloadData XML

		DECLARE @NewPayload [dbo].[Payload_TT]


		--IN THIS EXAMPLE WE ONLY WANT NEW RECORDS
		--IN REALITY WE WOULD HANDLE UPDATES IN THIS CALL TOO
		INSERT INTO @NewPayload
		SELECT Id,
		       Content
		FROM @payloads
		WHERE ID = 0


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

	COMMIT
END
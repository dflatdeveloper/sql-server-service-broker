CREATE PROCEDURE SendQueueMessage
AS
BEGIN
	DECLARE @dialog_handle	UNIQUEIDENTIFIER

	BEGIN TRANSACTION

		BEGIN DIALOG CONVERSATION @dialog_handle 
			FROM SERVICE 
				[ServiceB_Out]
			TO SERVICE 
				N'ServiceA_In'
			ON CONTRACT 
				[SBMessageContract];

		 SEND ON CONVERSATION @dialog_handle
				MESSAGE TYPE [SenderMessageType]('test B Out');

	COMMIT
END
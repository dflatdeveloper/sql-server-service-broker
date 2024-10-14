CREATE PROCEDURE SendQueueMessage
AS
BEGIN
	DECLARE @dialog_handle	UNIQUEIDENTIFIER

	BEGIN TRANSACTION

		BEGIN DIALOG CONVERSATION @dialog_handle 
			FROM SERVICE 
				[ServiceA_Out]
			TO SERVICE 
				N'ServiceB_In'
			ON CONTRACT 
				[SBMessageContract]
			WITH ENCRYPTION = OFF;

		 SEND ON CONVERSATION @dialog_handle
				MESSAGE TYPE [SenderMessageType];

		END CONVERSATION @dialog_handle

	COMMIT
END
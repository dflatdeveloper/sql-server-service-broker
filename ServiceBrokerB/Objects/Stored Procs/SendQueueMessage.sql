DECLARE @dialog_handle	UNIQUEIDENTIFIER

BEGIN DIALOG @dialog_handle 
	FROM SERVICE [SERVICEB_Out]
	TO SERVICE 'ServiceA_In'
	ON CONTRACT [EmptySBMessageContract];

SEND ON CONVERSATION @dialog_handle
	MESSAGE TYPE [EmptySenderMessageType];
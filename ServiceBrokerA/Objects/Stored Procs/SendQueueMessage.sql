
DECLARE @dialog_handle	UNIQUEIDENTIFIER

BEGIN DIALOG @dialog_handle 
	FROM SERVICE [SERVICEA_Out]
	TO SERVICE 'ServiceB_In'
	ON CONTRACT [EmptySBMessageContract];

SEND ON CONVERSATION @dialog_handle
	MESSAGE TYPE [EmptySenderMessageType];
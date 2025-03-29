CREATE SERVICE [Workflow_Notification]
	ON QUEUE [dbo].[Queue_Workflow_Notification]
	(
		[http://schemas.microsoft.com/SQL/Notifications/PostEventNotification]
	)

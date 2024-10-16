CREATE SERVICE [NotificationServiceC]
	ON QUEUE [dbo].[NotificationQueueC]
	(
		[http://schemas.microsoft.com/SQL/Notifications/PostEventNotification]
	)

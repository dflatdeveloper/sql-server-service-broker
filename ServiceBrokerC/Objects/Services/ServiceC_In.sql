CREATE SERVICE [ServiceC_In]
	ON QUEUE [dbo].[QueueC_In]
	(
		[http://schemas.microsoft.com/SQL/Notifications/PostQueryNotification]
	);

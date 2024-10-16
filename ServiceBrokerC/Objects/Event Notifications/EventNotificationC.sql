CREATE EVENT NOTIFICATION EVENTC
ON QUEUE [dbo].[NotificationQueueC]
FOR QUEUE_ACTIVATION
TO SERVICE 'NotificationServiceC' , 'current database'
GO
﻿CREATE SERVICE [ServiceC_Out]
	ON QUEUE [dbo].[QueueC_Out]
	(
		[http://schemas.microsoft.com/SQL/Notifications/PostQueryNotification]
	);
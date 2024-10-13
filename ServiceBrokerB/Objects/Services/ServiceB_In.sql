CREATE SERVICE [ServiceB_In]
	ON QUEUE [dbo].[QueueB_In]
	(
		[SBMessageContract]
	)

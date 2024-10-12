USE ServiceBrokerB

CREATE SERVICE [ServiceB]
	ON QUEUE [dbo].[QueueB]
	(
		[SBMessageContract]
	)

USE ServiceBrokerB

CREATE SERVICE [ServiceB_Out]
	ON QUEUE [dbo].[QueueB_Out]
	(
		[SBMessageContract]
	)

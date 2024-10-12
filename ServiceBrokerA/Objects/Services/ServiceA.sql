USE ServiceBrokerA

CREATE SERVICE [ServiceA]
	ON QUEUE [dbo].[QueueA]
	(
		[SBMessageContract]
	)

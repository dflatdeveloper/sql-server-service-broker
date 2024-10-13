USE ServiceBrokerA

CREATE CONTRACT [SBMessageContract]
(
	[SenderMessageType] SENT BY INITIATOR,
	[ReceiverMessageType] SENT BY TARGET
)
GO

CREATE CONTRACT [ValidatedSBMessageContract]
(
	[ValidatedSenderMessageType] SENT BY INITIATOR,
	[ValidatedReceiverMessageType] SENT BY TARGET
)
GO

CREATE CONTRACT [WellFormedXMLSBMessageContract]
(
	[WellFormedXMLSenderMessageType] SENT BY INITIATOR,
	[WellFormedXMLReceiverMessageType] SENT BY TARGET
)
GO

CREATE CONTRACT [EmptySBMessageContract]
(
	[EmptySenderMessageType] SENT BY INITIATOR,
	[EmptyReceiverMessageType] SENT BY TARGET
)
GO
CREATE TYPE QUEUEB_RESULTS_TT
AS TABLE
(
    Conversation_Handle UNIQUEIDENTIFIER,
    MessageBody NVARCHAR(MAX),
    MessageType VARCHAR(MAX),
    Message_Sequence_Number INT,
    PRIMARY KEY (Conversation_Handle, Message_Sequence_Number) 
)
GO
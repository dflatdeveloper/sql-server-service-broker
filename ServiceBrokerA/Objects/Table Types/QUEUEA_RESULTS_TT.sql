CREATE TYPE QUEUEA_RESULTS_TT
AS TABLE
(
    Conversation_Handle UNIQUEIDENTIFIER PRIMARY KEY,
    MessageBody NVARCHAR(MAX),
    MessageType VARCHAR(MAX),
    Message_Sequence_Number INT,
    INDEX IDX1 (Conversation_Handle, Message_Sequence_Number)
)
GO
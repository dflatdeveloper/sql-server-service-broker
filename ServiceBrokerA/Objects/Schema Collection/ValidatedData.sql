CREATE XML SCHEMA COLLECTION [dbo].[ValidatedData]
AS
N'<xs:schema attributeFormDefault="unqualified" elementFormDefault="qualified" xmlns:xs="http://www.w3.org/2001/XMLSchema">
  <xs:element name="payload" type="payloadType"/>
  <xs:complexType name="payloadType">
    <xs:sequence>
      <xs:element type="xs:int" name="id"/>
      <xs:element type="xs:string" name="content"/>
      <xs:element type="xs:boolean" name="receiverAcknowledged"/>
    </xs:sequence>
  </xs:complexType>
</xs:schema>'
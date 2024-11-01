CREATE XML SCHEMA COLLECTION [dbo].[ValidatedData]
AS
N'<xs:schema attributeFormDefault="unqualified" elementFormDefault="qualified" xmlns:xs="http://www.w3.org/2001/XMLSchema">
  <xs:element name="id" type="xs:int"/>
  <xs:element name="content" type="xs:string"/>
  <xs:element name="payload">
    <xs:complexType>
      <xs:sequence>
        <xs:element ref="id"/>
        <xs:element ref="content"/>
      </xs:sequence>
    </xs:complexType>
  </xs:element>
  <xs:element name="payloads">
    <xs:complexType>
      <xs:sequence>
        <xs:element ref="payload" maxOccurs="unbounded" minOccurs="0"/>
      </xs:sequence>
    </xs:complexType>
  </xs:element>
</xs:schema>'
CREATE XML SCHEMA COLLECTION [dbo].[ErrorData]
	AS N'<xs:schema attributeFormDefault="unqualified" 
             elementFormDefault="qualified" 
             xmlns:xs="http://www.w3.org/2001/XMLSchema">
  <xs:element name="id" type="xs:int"/>
  <xs:element name="errorId" type="xs:int"/>
  <xs:element name="errorDescription" type="xs:string"/>
  <xs:element name="error">
    <xs:complexType>
      <xs:sequence>
        <xs:element ref="id"/>
        <xs:element ref="errorId"/>
        <xs:element ref="errorDescription"/>
      </xs:sequence>
    </xs:complexType>
  </xs:element>
  <xs:element name="errors">
    <xs:complexType>
      <xs:sequence>
        <xs:element ref="error" maxOccurs="unbounded" minOccurs="0"/>
      </xs:sequence>
    </xs:complexType>
  </xs:element>
</xs:schema>'

CREATE XML SCHEMA COLLECTION [dbo].[ValidatedData]
	AS
N'<xs:schema targetNamespace="uri:payload_example" xmlns="uri:payload_example" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<xs:element name="payload">
		<xs:complexType>
			<xs:sequence>
				<xs:element name="set">
					<xs:complexType>
						<xs:sequence>
							<xs:element name="meta">
								<xs:complexType>
									<xs:sequence>
										<xs:element name="ss" type="xs:string" />
									</xs:sequence>
									<xs:attribute name="auth" type="xs:unsignedByte" use="required" />
								</xs:complexType>
							</xs:element>
							<xs:element name="body" type="xs:string" />
						</xs:sequence>
						<xs:attribute name="id" type="xs:unsignedByte" use="required" />
					</xs:complexType>
				</xs:element>
				<xs:element name="note">
					<xs:complexType>
						<xs:sequence>
							<xs:element name="reference_old">
								<xs:complexType>
									<xs:simpleContent>
										<xs:extension base="xs:string">
											<xs:attribute name="id" type="xs:unsignedByte" use="required" />
										</xs:extension>
									</xs:simpleContent>
								</xs:complexType>
							</xs:element>
						</xs:sequence>
						<xs:attribute name="id" type="xs:unsignedByte" use="required" />
					</xs:complexType>
				</xs:element>
			</xs:sequence>
			<xs:attribute name="name" type="xs:string" use="required" />
		</xs:complexType>
	</xs:element>
</xs:schema>'

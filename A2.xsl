<?xml version="1.0" ?>
<xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema">
    <xsd:element name="forecast">
        <xsd:complexType>
            <xsd:sequence>
                <xsd:element name="weather" minOccurs="0" maxOccurs="unbounded">
                    <xsd:complexType>
                        <xsd:sequence>
                            <xsd:element name="year" type="xsd:string"/>
                            <xsd:element name="month" type="xsd:string"/>
                            <xsd:element name="date" type="xsd:string"/>
                            <xsd:element name="dayOfWeek" type="xsd:string"/>
                            <xsd:element name="overall" type="xsd:string"/>
                            <xsd:element name="overallCode" type="xsd:string"/>
                            <xsd:element name="highest" type="xsd:string"/>
                            <xsd:element name="lowest" type="xsd:string"/>
                        </xsd:sequence>
                        <xsd:attribute name="yyyymmdd" type="xsd:string"/>
                    </xsd:complexType>
                </xsd:element>
            </xsd:sequence>
            <xsd:attribute name="queryLocation" type="xsd:string"/>
        </xsd:complexType>
    </xsd:element>
</xsd:schema>
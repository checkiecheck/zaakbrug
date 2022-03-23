<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:zgw="http://google.com/zgw" version="2.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
    <xsl:param name="StatusBody"/>

    <xsl:template match="/">
        <xsl:for-each select="root/results">
            <xsl:if test="zgw:convertZdsDatetimeToZgwDatetime(datumStatusGezet) = zgw:convertZdsDatetimeToZgwDatetime($StatusBody/status/datumStatusGezet)">
                <xsl:choose>
                    <xsl:when test="statustype != $StatusBody/status/statustype">
                        <exception>ConverterException</exception>
                    </xsl:when>
                    <xsl:otherwise>
                        <statusExists>true</statusExists>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

    <xsl:function name="zgw:convertZdsDatetimeToZgwDatetime" as="xs:dateTime">
    	<xsl:param name="dateTimeStr" as="xs:string"/>
		<xsl:value-of select="substring($dateTimeStr,1,19)"/>
	</xsl:function>
</xsl:stylesheet>
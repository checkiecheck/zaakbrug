<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:StUF="http://www.egem.nl/StUF/StUF0301" xmlns:ZKN="http://www.egem.nl/StUF/sector/zkn/0310" xmlns:ZDS="http://www.stufstandaarden.nl/koppelvlak/zds0120" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:param name="UnwrapMessageResult" as="node()?" />
    <xsl:param name="Identificatie" select="''" as="xs:string" />
   
	<xsl:template match="/">
        <ZDS:genereerBesluitIdentificatie_Du02>
            <ZDS:stuurgegevens>
                <StUF:berichtcode>Du02</StUF:berichtcode>
                <StUF:zender>
                    <StUF:organisatie><xsl:value-of select="$UnwrapMessageResult/*/stuurgegevens/ontvanger/organisatie"/></StUF:organisatie>
                    <StUF:applicatie><xsl:value-of select="$UnwrapMessageResult/*/stuurgegevens/ontvanger/applicatie"/></StUF:applicatie>
                </StUF:zender>
                <StUF:ontvanger>
                    <StUF:organisatie><xsl:value-of select="$UnwrapMessageResult/*/stuurgegevens/zender/organisatie"/></StUF:organisatie>
                    <StUF:applicatie><xsl:value-of select="$UnwrapMessageResult/*/stuurgegevens/zender/applicatie"/></StUF:applicatie>
                    <StUF:gebruiker><xsl:value-of select="$UnwrapMessageResult/*/stuurgegevens/zender/gebruiker"/></StUF:gebruiker>
                </StUF:ontvanger>
                <StUF:referentienummer><xsl:value-of select="$UnwrapMessageResult/*/stuurgegevens/referentienummer"/></StUF:referentienummer>
                <StUF:tijdstipBericht><xsl:value-of select="$UnwrapMessageResult/*/stuurgegevens/tijdstipBericht"/></StUF:tijdstipBericht>
                <StUF:crossRefnummer><xsl:value-of select="$UnwrapMessageResult/*/stuurgegevens/referentienummer"/></StUF:crossRefnummer>
                <StUF:functie>genereerBesluitidentificatie</StUF:functie>
            </ZDS:stuurgegevens>
            <ZKN:besluit StUF:entiteittype="BSL" StUF:functie="entiteit">
                <ZKN:identificatie xmlns:ZKN="http://www.egem.nl/StUF/sector/zkn/0310"><xsl:value-of select="$Identificatie"/></ZKN:identificatie>
            </ZKN:besluit>
        </ZDS:genereerBesluitIdentificatie_Du02>
	</xsl:template>
</xsl:stylesheet>
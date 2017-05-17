<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gco="http://www.isotc211.org/2005/gco"
                xmlns:gmd="http://www.isotc211.org/2005/gmd"
                xmlns:che="http://www.geocat.ch/2008/che"
                version="1.0"
>

  <xsl:template match="che:CHE_MD_Metadata">
    <thumbnail>
      <xsl:for-each select="gmd:identificationInfo/gmd:MD_DataIdentification/gmd:graphicOverview/gmd:MD_BrowseGraphic|
				gmd:identificationInfo/*[@gco:isoType='gmd:MD_DataIdentification']/gmd:graphicOverview/gmd:MD_BrowseGraphic|
				gmd:identificationInfo/srv:SV_ServiceIdentification/gmd:graphicOverview/gmd:MD_BrowseGraphic|
				gmd:identificationInfo/*[@gco:isoType='srv:SV_ServiceIdentification']/gmd:graphicOverview/gmd:MD_BrowseGraphic">
        <xsl:choose>
          <xsl:when test="(gmd:fileDescription/gmd:PT_FreeText/gmd:textGroup/gmd:LocalisedCharacterString = 'large_thumbnail' or
					 									gmd:fileDescription/gco:CharacterString = 'large_thumbnail')
					 									and gmd:fileName/gco:CharacterString != ''">
            <large>
              <xsl:value-of select="gmd:fileName/gco:CharacterString"/>
            </large>
          </xsl:when>
          <xsl:when test="(gmd:fileDescription/gmd:PT_FreeText/gmd:textGroup/gmd:LocalisedCharacterString = 'thumbnail' or
														gmd:fileDescription/gco:CharacterString = 'thumbnail')
														and gmd:fileName/gco:CharacterString != ''">
            <small>
              <xsl:value-of select="gmd:fileName/gco:CharacterString"/>
            </small>
          </xsl:when>
          <xsl:otherwise>
            <description>
              <xsl:value-of select="gmd:fileDescription/gco:CharacterString"/>
            </description>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:for-each>
    </thumbnail>
  </xsl:template>

</xsl:stylesheet>

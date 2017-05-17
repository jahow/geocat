<?xml version="1.0" encoding="UTF-8"?>
<!--
Stylesheet used to remove a reference to a parent record.
-->
<xsl:stylesheet xmlns:geonet="http://www.fao.org/geonetwork" xmlns:gmd="http://www.isotc211.org/2005/gmd"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0">

  <xsl:param name="uuidref"/>

  <!-- Do a copy of every nodes and attributes -->
  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

  <!-- Remove geonet:* elements. -->
  <xsl:template match="geonet:*|gmd:aggregationInfo[*/gmd:aggregateDataSetIdentifier/*/gmd:code/* = $uuidref]"
                priority="2"/>
</xsl:stylesheet>

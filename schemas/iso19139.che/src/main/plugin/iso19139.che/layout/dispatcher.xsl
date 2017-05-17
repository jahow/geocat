<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:saxon="http://saxon.sf.net/"
                version="2.0" extension-element-prefixes="saxon"
                exclude-result-prefixes="#all">

  <xsl:include href="layout.xsl"/>

  <!--
    Load the schema configuration for the editor.
    Same configuration as ISO19139 here.
      -->
  <xsl:template name="get-iso19139.che-configuration">
    <xsl:copy-of select="document('config-editor.xml')"/>
  </xsl:template>


  <!-- Dispatch to the current profile mode -->
  <xsl:template name="dispatch-iso19139.che">
    <xsl:param name="base" as="node()"/>
    <xsl:param name="overrideLabel" as="xs:string" required="no" select="''"/>

    <xsl:apply-templates mode="mode-iso19139.che" select="$base">
      <xsl:with-param name="overrideLabel" select="$overrideLabel"/>
    </xsl:apply-templates>

  </xsl:template>


  <!-- The following templates usually delegates all to iso19139. -->
  <xsl:template name="evaluate-iso19139.che">
    <xsl:param name="base" as="node()"/>
    <xsl:param name="in"/>
    <!-- <xsl:message>in xml <xsl:copy-of select="$base"></xsl:copy-of></xsl:message>
     <xsl:message>search for <xsl:copy-of select="$in"></xsl:copy-of></xsl:message>-->
    <xsl:variable name="nodeOrAttribute" select="saxon:evaluate(concat('$p1', $in), $base)"/>
    <xsl:choose>
      <xsl:when test="$nodeOrAttribute/*">
        <xsl:copy-of select="$nodeOrAttribute"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$nodeOrAttribute"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="evaluate-iso19139.che-boolean">
    <xsl:param name="base" as="node()"/>
    <xsl:param name="in"/>

    <xsl:value-of select="saxon:evaluate(concat('$p1', $in), $base)"/>
  </xsl:template>

</xsl:stylesheet>

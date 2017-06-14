<?xml version="1.0" encoding="UTF-8"?>
<!--
  ~ Copyright (C) 2001-2016 Food and Agriculture Organization of the
  ~ United Nations (FAO-UN), United Nations World Food Programme (WFP)
  ~ and United Nations Environment Programme (UNEP)
  ~
  ~ This program is free software; you can redistribute it and/or modify
  ~ it under the terms of the GNU General Public License as published by
  ~ the Free Software Foundation; either version 2 of the License, or (at
  ~ your option) any later version.
  ~
  ~ This program is distributed in the hope that it will be useful, but
  ~ WITHOUT ANY WARRANTY; without even the implied warranty of
  ~ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
  ~ General Public License for more details.
  ~
  ~ You should have received a copy of the GNU General Public License
  ~ along with this program; if not, write to the Free Software
  ~ Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA
  ~
  ~ Contact: Jeroen Ticheler - FAO - Viale delle Terme di Caracalla 2,
  ~ Rome - Italy. email: geonetwork@osgeo.org
  -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

  <xsl:output indent="yes" method="text" encoding="UTF-8" media-type="application/json"/>

  <xsl:include href="base-variables.xsl"/>

  <xsl:template match="/">{"error": {
    <xsl:apply-templates mode="error" select="root/error/*"/>
    }
    }
  </xsl:template>

  <xsl:template mode="error" match="*"/>
  <xsl:template mode="error" match="at">
    "<xsl:value-of select="name(.)"/>": "<xsl:value-of
    select="concat(@class, ' ', @file, ' line ', @line, ' #', @method)"/>"
    <xsl:if test="following-sibling::at">,</xsl:if>
  </xsl:template>
  <xsl:template mode="error" match="message|class|stack|request">
    "<xsl:value-of select="name(.)"/>":
    <xsl:choose>
      <xsl:when test="*">
        {<xsl:apply-templates mode="error" select="*"/>}
      </xsl:when>
      <xsl:otherwise>
        "<xsl:value-of select="replace(replace(translate(., '&quot;', ''), '&lt;script&gt;', '', 'i'), '&lt;/script&gt;', '', 'i')"/>"
      </xsl:otherwise>
    </xsl:choose>
    <!-- Last element of interest for error is request. Next one is the record. -->
    <xsl:if test="name() != 'request'">,</xsl:if>
  </xsl:template>
</xsl:stylesheet>

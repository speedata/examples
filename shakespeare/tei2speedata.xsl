<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  exclude-result-prefixes="xs"
  version="2.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0">
  <xsl:output indent="no"/>


  <xsl:template match="/">
    <data>
      <xsl:apply-templates select="TEI/text/body/div"/>
    </data>
  </xsl:template>

  <xsl:template match="TEI/text/body/div">
    <xsl:apply-templates select="head|stage|sp"/>
  </xsl:template>

  <xsl:template match="head">
    <head><xsl:value-of select="."/></head><xsl:text>&#x0A;</xsl:text>
  </xsl:template>
  <xsl:template match="stage">
    <stage><xsl:apply-templates/></stage><xsl:text>&#x0A;</xsl:text>
  </xsl:template>

  <!-- Initial -->
  <xsl:template match="node() | @*" mode="initial" xpath-default-namespace="">
    <xsl:copy>
      <xsl:apply-templates select="node() | @*" mode="initial"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="part[. = ../part[1]]" mode="initial" xpath-default-namespace="">
    <part><xsl:value-of select="concat(upper-case(substring(.,2,1)), substring(.,3))"/></part>
  </xsl:template>

  <xsl:template match="sp">
    <xsl:choose>
      <!-- First item, render with initial -->
      <xsl:when test=". = ../sp[1]">
        <xsl:variable name="foo">
          <speaker capital="{substring(ab/text()[matches(.,'\S+')][1],1,1)}" center="true" name="{speaker}"><xsl:apply-templates select="ab/*|ab/text()[matches(.,'\S+')]"/></speaker>
        </xsl:variable>
        <xsl:apply-templates select="$foo" mode="initial"/>
      </xsl:when>
      <xsl:otherwise>
        <speaker name="{speaker}"><xsl:apply-templates select="ab/*|ab/text()[matches(.,'\S+')]"/></speaker>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>&#x0A;</xsl:text>
  </xsl:template>


  <xsl:template match="lb">
    <xsl:choose>
      <xsl:when test="position() > 1 and position() != last()">
        <part><br/></part>
      </xsl:when>
    </xsl:choose>
  </xsl:template>
  <xsl:template match="hi">
    <part type="italic"><xsl:value-of select="."/></part>
  </xsl:template>
  <xsl:template match="ab/stage">
    <part type="stage"><xsl:value-of select="."/></part>
    <xsl:text>&#x0A;</xsl:text>
  </xsl:template>

  <xsl:template match="ab/text()">
    <part><xsl:value-of select="string(.)"></xsl:value-of></part>
    <xsl:text>&#x0A;</xsl:text>
  </xsl:template>
</xsl:stylesheet>
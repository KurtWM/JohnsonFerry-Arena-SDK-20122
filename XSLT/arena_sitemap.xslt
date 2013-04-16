﻿<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
                xmlns:html="http://www.w3.org/TR/REC-html40"
				xmlns:image="http://www.google.com/schemas/sitemap-image/1.1"
                xmlns:sitemap="http://www.sitemaps.org/schemas/sitemap/0.9"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/">

    <xsl:if test="page">
      <script	type="text/javascript">
        <![CDATA[
					$(document).ready(function() { 
				        $(".tablesorter").tablesorter( { widgets: ['zebra'] } ); 
					});
				]]>
      </script>
      <style type="text/css">
        /*body {
        font-family: Helvetica, Arial, sans-serif;
        font-size: 13px;
        color: #545353;
        }*/
        table.tablesorter {
        border: none;
        border-collapse: collapse;
        }
        table.tablesorter tr.odd {
        background-color: #eee;
        }
        table.tablesorter tbody tr:hover {
        background-color: #ccc;
        }
        table.tablesorter tbody tr:hover td, #sitemap tbody tr:hover td a {
        color: #000;
        }
        #content {
        margin: 0 auto;
        width: 940px;
        }
        .expl {
        font-size: 10px;
        line-height: 1em;
        }
        .expl a {
        font-size: 10px;
        color: #da3114;
        font-weight: bold;
        }
        table.tablesorter tr td {
        font-size:11px;
        }
        table.tablesorter tr th {
        text-align:left;
        padding-right:30px;
        font-size:11px;
        }
        table.tablesorter thead th {
        border-bottom: 1px solid #000;
        cursor: pointer;
        }

        table.tablesorter thead tr .header {
        background-position: 100% 80%;
        }

        .MainContentAreaBackground {
        background-image: none;
        }
      </style>
      <div id="content">
        <h1>XML Sitemap</h1>
        <p class="expl">
          Generated by <a href="http://yoast.com/">Yoast</a>'s WordPress SEO plugin, this is an XML Sitemap, meant for consumption by search engines.
        </p>
        <p class="expl">
          You can find more information about XML sitemaps on <a href="http://sitemaps.org">sitemaps.org</a>.
        </p>
        <p class="expl">
          <!--This sitemap contains <xsl:value-of select="count(sitemap:urlset/sitemap:url)"/> URLs.-->
          This sitemap contains <xsl:value-of select="count(page/settings)"/> URLs.
        </p>
        <table id="sitemap" class="tablesorter" cellpadding="3">
          <thead>
            <tr>
              <th width="75%">URL</th>
              <th width="5%">Priority</th>
              <th width="5%">Images</th>
              <th width="5%">Change Freq.</th>
              <th width="10%">Last Change</th>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="page">
          <xsl:call-template name="pagenode"></xsl:call-template>
        </xsl:for-each>
          </tbody>
        </table>
      </div>
    </xsl:if>

  </xsl:template>

  <xsl:template name="pagenode">
    <xsl:variable name="lower" select="'abcdefghijklmnopqrstuvwxyz'"/>
              <xsl:variable name="upper" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'"/>
              <xsl:for-each select="sitemap:urlset/sitemap:url">
                <tr>
                  <td>
                    <xsl:variable name="itemURL">
                      <xsl:value-of select="sitemap:loc"/>
                    </xsl:variable>
                    <a href="{$itemURL}">
                      <xsl:value-of select="sitemap:loc"/>
                    </a>
                  </td>
                  <td>
                    <xsl:value-of select="concat(sitemap:priority*100,'%')"/>
                  </td>
                  <td>
                    <xsl:value-of select="count(image:image)"/>
                  </td>
                  <td>
                    <xsl:value-of select="concat(translate(substring(sitemap:changefreq, 1, 1),concat($lower, $upper),concat($upper, $lower)),substring(sitemap:changefreq, 2))"/>
                  </td>
                  <td>
                    <xsl:value-of select="concat(substring(sitemap:datemodified,0,11),concat(' ', substring(sitemap:datemodified,12,5)))"/>
                  </td>
                </tr>
              </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
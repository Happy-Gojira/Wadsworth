<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <!-- Creates the body of the finding aid.-->
    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" media="screen" href="wadsworth.css" />
                <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
                <script>
                    $(document).ready(function() {
                    $(".content .dropdown").click(function () {
                    $(this).next().slideToggle('slow');
                    });
                    });		
                </script>
            </head>
            <body id="index">
                <div id="wrap">
                    <header>...</header>
                    <nav>
                        <ul>
                            <li class="finding"><a href="WadsworthFA.html">Finding Aid</a></li>
                            <li class="index"><a href="WadsworthFA_name_index.html">Selective Name and Subject Indexes</a>
                                <ul>
                                    <li><a href="WadsworthFA_name_index.html">Listed by Name</a></li>
                                    <li><a href="WadsworthFA_subject_index.html">Listed by Subject</a></li>
                                </ul>
                            </li>
                        </ul>
                    </nav>                    
                    <section class="odd">
                        <xsl:call-template name="odd"/>                        
                    </section>
                </div>
            </body>
        </html>
    </xsl:template>

        
        
        
    
    <!--This template rule formats a list element.-->
    <xsl:template match="list/head">
        <div>
            
            <xsl:apply-templates/>
            
        </div>
    </xsl:template>
    
    <xsl:template match="list">
        <div class="content">
            <input type="button" class="dropdown" value="Click to show/hide names"/>
            <ul class="hide list">
            <xsl:for-each select="item">
                <li>
                    
                    <xsl:if test="persname">
                        <xsl:value-of select="persname"/> <xsl:if test="date"><xsl:value-of select="date"/></xsl:if>
                    </xsl:if>
                    <xsl:if test="geogname"><xsl:value-of select="geogname"/></xsl:if>
                </li>
                
            </xsl:for-each>
            
        </ul>
        </div>
    </xsl:template>
    
    <xsl:template name="odd">
        <xsl:param name="size" select="count(ead/archdesc/odd/list/item)"/>
       
        <h1><xsl:value-of select="ead/archdesc/odd/list/head"/></h1>
        <ul>
            <xsl:for-each select="ead/archdesc/odd/list/item[ceiling($size div 2) &gt;= position()]">
                <li>
                    <xsl:if test="persname[not(@role)]"><span class="clear">Name: <xsl:value-of select="persname[not(@role)]"/></span></xsl:if>
                    <xsl:if test="famname"><span class="clear">Family: <xsl:value-of select="famname"/></span></xsl:if>
                    <xsl:if test="corpname"><span class="clear">Corpname: <xsl:value-of select="corpname"/></span></xsl:if>                   
                    <xsl:if test="geoname"><span class="clear">Location: <xsl:value-of select="geoname"/></span></xsl:if>
                    <xsl:if test="occupation"><span class="clear">Relation: <xsl:value-of select="occupation"/></span></xsl:if>
                    <xsl:if test="genreform"><span class="clear">Format: <xsl:value-of select="genreform"/></span></xsl:if>
                    <xsl:if test="unitdate"><span class="clear">Date: <xsl:value-of select="unitdate"/></span></xsl:if>
                    <xsl:if test="persname[contains(@role, 'wadsworth')]"><span class="clear">Name: <xsl:value-of select="persname[contains(@role, 'wadsworth')]"/></span></xsl:if>
                    <xsl:if test="note"><span class="clear">Agent: <xsl:value-of select="note"/></span></xsl:if>
                    <xsl:if test="subject"><span class="clear">Subject: <xsl:value-of select="subject"/></span></xsl:if>
                    <xsl:if test="ref"><span class="clear">Reference: <xsl:value-of select="ref"/></span></xsl:if>
                </li>
            </xsl:for-each>
        </ul>
        <ul>
            <xsl:for-each select="ead/archdesc/odd/list/item[ceiling($size div 2) &gt;= position()]">
                <li>
                    
                    
                    <xsl:if test="following::item[ceiling($size div 2)]/persname[not(@role)]"><span class="clear">Name: <xsl:value-of select="following::item[ceiling($size div 2)]/persname[not(@role)]"/></span></xsl:if>
                    <xsl:if test="following::item[ceiling($size div 2)]/famname"><span class="clear">Family: <xsl:value-of select="following::item[ceiling($size div 2)]/famname"/></span></xsl:if>
                    <xsl:if test="following::item[ceiling($size div 2)]/corpname"><span class="clear">Corpname: <xsl:value-of select="following::item[ceiling($size div 2)]/corpname"/></span></xsl:if>                   
                    <xsl:if test="following::item[ceiling($size div 2)]/geoname"><span class="clear">Location: <xsl:value-of select="following::item[ceiling($size div 2)]/geoname"/></span></xsl:if>
                    <xsl:if test="following::item[ceiling($size div 2)]/occupation"><span class="clear">Relation: <xsl:value-of select="following::item[ceiling($size div 2)]/occupation"/></span></xsl:if>
                    <xsl:if test="following::item[ceiling($size div 2)]/genreform"><span class="clear">Format: <xsl:value-of select="following::item[ceiling($size div 2)]/genreform"/></span></xsl:if>
                    <xsl:if test="following::item[ceiling($size div 2)]/unitdate"><span class="clear">Date: <xsl:value-of select="following::item[ceiling($size div 2)]/unitdate"/></span></xsl:if>
                    <xsl:if test="following::item[ceiling($size div 2)]/persname[contains(@role, 'wadsworth')]"><span class="clear">Name: <xsl:value-of select="following::item[ceiling($size div 2)]/persname[contains(@role, 'wadsworth')]"/></span></xsl:if>
                    <xsl:if test="following::item[ceiling($size div 2)]/note"><span class="clear">Agent: <xsl:value-of select="following::item[ceiling($size div 2)]/note"/></span></xsl:if>
                    <xsl:if test="following::item[ceiling($size div 2)]/subject"><span class="clear">Subject: <xsl:value-of select="following::item[ceiling($size div 2)]/subject"/></span></xsl:if>
                    <xsl:if test="following::item[ceiling($size div 2)]/ref"><span class="clear">Reference: <xsl:value-of select="following::item[ceiling($size div 2)]/ref"/></span></xsl:if>
                </li>
            </xsl:for-each>
        </ul>
    </xsl:template>
</xsl:stylesheet>
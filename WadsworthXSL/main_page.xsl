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
            <body id="finding">
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
                    <aside class="left">
                        <xsl:call-template name="toc"/>
                    </aside>
                    <section class="cover">
                        <xsl:call-template name="cover"/>
                    </section>                                        
                    <section class="archdesc_did">
                        <xsl:call-template name="archdesc-did"/>
                    </section>
                    <section class="archdesc-admininfo">
                        <xsl:call-template name="archdesc-admininfo"/>
                    </section>
                    <section class="archdesc-scopecontent">
                        <xsl:call-template name="archdesc-scopecontent"/>
                    </section>                    
                    <section class="dsc1">
                        <xsl:apply-templates select="/ead/archdesc/dsc/c01"/>
                    </section>
                    <section class="odd">
                        <xsl:call-template name="odd"/>                        
                    </section>
                </div>
            </body>
        </html>
    </xsl:template>
    
    
    <!-- Table of Contents -->
    <xsl:template name="toc">
        <xsl:variable name="file">
            <xsl:value-of select="ead/eadheader/eadid" />
        </xsl:variable>
        <h3><a class="dark" name="toc">TABLE OF CONTENTS</a></h3>
        <xsl:if test="ead/archdesc/did">
            <p>                
                <a href="#{ead/archdesc/did/head}"><xsl:value-of select="ead/archdesc/did/head"/></a>                
            </p>
        </xsl:if>
        <xsl:if test="ead/archdesc/acqinfo | ead/archdesc/separatedmaterial | ead/archdesc/originalsloc | ead/archdesc/relatedmaterial | ead/archdesc/processinfo | ead/archdesc/altformavail | ead/archdesc/prefercite | ead/archdesc/accessrestrict | ead/archdesc/userestrict | ead/archdesc/custodialhist | ead/archdesc/appraisal | ead/archdesc/accruals">
        </xsl:if>
        <xsl:if test="ead/archdesc/descgrp">
            <p>
                <a href="#{ead/archdesc/descgrp/head}"><xsl:value-of select="ead/archdesc/descgrp/head"/></a>
            </p>
        </xsl:if>
        <xsl:if test="ead/archdesc/bioghist">
            <p>
                <a href="#{ead/archdesc/bioghist/head}"><xsl:value-of select="ead/archdesc/bioghist/head"/></a>
            </p>
        </xsl:if>
        <xsl:if test="ead/archdesc/scopecontent">
            <p>
                <a href="#{ead/archdesc/scopecontent/head}"><xsl:value-of select="ead/archdesc/scopecontent/head"/></a>
            </p>
        </xsl:if>
        <xsl:if test="ead/archdesc/arrangement">
            <p>
                <a href="#{ead/archdesc/arrangement/head}"><xsl:value-of select="ead/archdesc/arrangement/head"/></a>                
            </p>
        </xsl:if>
        <xsl:if test="ead/archdesc/controlaccess">
            <p>
                <a href="#{ead/archdesc/controlaccess/head}"><xsl:value-of select="ead/archdesc/controlaccess/head"/></a>                
            </p>
        </xsl:if>
        <xsl:if test="ead/archdesc/dsc">
            <a href="#{ead/archdesc/dsc/head}">
                <p>
                    <xsl:value-of select="ead/archdesc/dsc/head" />                    
                </p>
            </a>
            <xsl:for-each select="ead/archdesc/dsc/c01">
                <p>                                       
                    <a>
                        <xsl:attribute name="href"><xsl:text>#</xsl:text>                            
                            <xsl:value-of select="did/unittitle"/>
                        </xsl:attribute>
                        <xsl:choose>
                            <xsl:when test="did/unittitle/unitdate">
                                <xsl:for-each select="did/unittitle">
                                    <xsl:apply-templates select="." />
                                </xsl:for-each>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:apply-templates select="did/unittitle" />
                                <xsl:text>
                                    
                                </xsl:text>
                                <xsl:apply-templates select="did/unitdate" />
                            </xsl:otherwise>
                        </xsl:choose>
                    </a>                                        
                </p>
            </xsl:for-each>
            <xsl:for-each select="//odd">
                <xsl:if test="//odd/head">
                    <p>
                        
                        <a href="#{@id}"><xsl:value-of select="head" /></a>
                        
                    </p>
                </xsl:if>
            </xsl:for-each>
            <xsl:if test="ead/archdesc/otherfindaid">
                <p>
                    <a href="#a8"><xsl:value-of select="ead/archdesc/otherfindaid/head" /></a>                    
                </p>
            </xsl:if>
            <xsl:if test="ead/archdesc/index">
                <p>
                    <a href="#a9"><xsl:value-of select="ead/archdesc/index/head" /></a>                    
                </p>
            </xsl:if>
            <xsl:if test="ead/archdesc/bibliography">
                <p>
                    <a href="#a10"><xsl:value-of select="ead/archdesc/bibliography/head" /></a>                    
                </p>
            </xsl:if>
            <xsl:if test="ead/archdesc/odd">
                <p>
                    <a href="#{ead/archdesc/odd/list/head}"><xsl:value-of select="ead/archdesc/odd/list/head" /></a>                    
                </p>
            </xsl:if>
        </xsl:if>
    </xsl:template>
    
    <xsl:template name="cover">
        <xsl:for-each select="ead/eadheader/filedesc/titlestmt">
            <xsl:if test="string-length(titleproper)">
                <h1><xsl:value-of select="titleproper"/></h1>       
            </xsl:if>
            <h2><xsl:value-of select="subtitle"/></h2>          
            <h3><xsl:value-of select="author"/></h3>
            
        </xsl:for-each>
        <xsl:for-each select="ead/eadheader/profiledesc">
            <h4><xsl:value-of select="creation"/></h4>
        </xsl:for-each>
        <ul>
            <li>Contact Informtion: <a href="http://www.geneseo.edu/library/staff-directory">Special Collections Librarian</a></li>
            <li>Milne Library, SUNY Geneseo.</li>
            
        </ul>
        
        <hr></hr>
    </xsl:template>
    
    <!--This template rule formats the top-level did element.-->
<xsl:template name="archdesc-did">
    
  <!--For each element of the did, this template inserts the value of the LABEL attribute or, if none is present, a default value.-->
  
  <xsl:for-each select="ead/archdesc/did">
    <h3><a name="{head}"><xsl:apply-templates select="head"/></a></h3>
    <table>
      <xsl:if test="origination[string-length(text()|*)!=0]">
        <xsl:for-each select="origination">
          <xsl:choose>
            <xsl:when test="@label">
              <tr>
                <td></td>
                <td class="bold">
                  <xsl:value-of select="@label"/>
                </td>
                <td>
                  <xsl:apply-templates select="."/>
                </td>
              </tr>
            </xsl:when>
            <xsl:otherwise>
              <tr>
                <td></td>
                <td class="bold">
                  <xsl:text>Creator: </xsl:text>
                </td>
                <td>
                  <xsl:apply-templates select="."/>
                </td>
              </tr>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:for-each>
      </xsl:if>
      
      
      <!-- Tests for and processes various permutations of unittitle and unitdate.-->
      <xsl:for-each select="unittitle">
        <xsl:choose>
          <xsl:when test="@label">
            <tr>
              <td></td>
              <td class="bold">
                <xsl:value-of select="@label"/>
              </td>
              <td>
                <xsl:apply-templates
                  select="text() |* [not(self::unitdate)]"/>
              </td>
            </tr>
          </xsl:when>
          <xsl:otherwise>
            <tr>
              <td></td>
              <td class="bold">
                <xsl:text>Title: </xsl:text>
              </td>
              <td>
                <xsl:apply-templates
                  select="text() |* [not(self::unitdate)]"/>
              </td>
            </tr>
          </xsl:otherwise>
        </xsl:choose>
        
        <xsl:if test="child::unitdate">
          <xsl:choose>
            <xsl:when test="./unitdate/@label">
              <tr>
                <td></td>
                 <td class="bold">
                  <xsl:value-of select="./unitdate/@label"/>
                </td>
                <td>
                  <xsl:apply-templates
                    select="./unitdate"/>
                </td>
              </tr>
            </xsl:when>
            <xsl:otherwise>
              <tr>
                <td></td>
                <td>
                  <xsl:text>Dates: </xsl:text>
                </td>
                <td>
                  <xsl:apply-templates
                    select="./unitdate"/>
                </td>
              </tr>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:if>
      </xsl:for-each>
      
      
      <!-- Processes the unit date if it is not a child of unit title but a child of did, the current context.-->
      <xsl:if test="unitdate">
        <xsl:for-each select="unitdate[string-length(text()|*)!=0]">
          <xsl:choose>
            <xsl:when test="./@label">
              <tr>
                <td></td>
                <td>
                  <xsl:value-of select="./@label"/>
                </td>
                <td>
                  <xsl:apply-templates select="."/>
                </td>
              </tr>
            </xsl:when>
            <xsl:otherwise>
              <tr>
                <td></td>
                <td>
                  <xsl:text>Dates: </xsl:text>
                </td>
                <td>
                  <xsl:apply-templates select="."/>
                </td>
              </tr>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:for-each>
      </xsl:if>
      
      <xsl:if test="abstract">
        <xsl:choose>
          <xsl:when test="@label">
            <tr>
              <td></td>
              <td>
                <xsl:value-of select="@label"/>
              </td>
              <td>
                <xsl:apply-templates select="abstract"/>
              </td>
            </tr>
          </xsl:when>
          <xsl:otherwise>
            <tr>
              <td></td>
              <td class="bold">
                <xsl:text>Scope: </xsl:text>
              </td>
              <td>
                <xsl:apply-templates select="abstract"/>
              </td>
            </tr>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:if>
      
      <xsl:if test="physdesc[string-length(text()|*)!=0]">
        <xsl:choose>
          <xsl:when test="@label">
            <tr>
              <td></td>
                <td>
                <xsl:value-of select="@label"/>
              </td>
              <td>
                <xsl:apply-templates select="physdesc"/>
              </td>
            </tr>
          </xsl:when>
          
          <xsl:otherwise>
            <tr>
              <td></td>
              <td class="bold">
                <xsl:text>Extent: </xsl:text>
              </td>
              <td>
                <xsl:apply-templates select="physdesc"/>
              </td>
            </tr>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:if>
      
      <xsl:if test="langmaterial[string-length(text()|*)!=0]">
        <xsl:choose>
          <xsl:when test="@label">
            <tr>
              <td></td>
              <td>
                <xsl:value-of select="@label"/>
              </td>
              <td>
                <xsl:apply-templates select="langmaterial"/>
              </td>
            </tr>
          </xsl:when>
          
          <xsl:otherwise>
            <tr>
              <td></td>
              <td>
                <xsl:text>Language: </xsl:text>
              </td>
              <td>
                <xsl:apply-templates select="langmaterial"/>
              </td>
            </tr>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:if>
      
      <xsl:if test="unitid[string-length(text()|*)!=0]">
        <xsl:choose>
          <xsl:when test="@label">
            <tr>
              <td></td>
              <td>
                <xsl:value-of select="@label"/>
              </td>
              <td>
                <xsl:apply-templates select="unitid"/>
              </td>
            </tr>
          </xsl:when>
          
          <xsl:otherwise>
            <tr>
              <td></td>
              <td>
                <xsl:text>Identification: </xsl:text>
              </td>
              <td>
                <xsl:apply-templates select="unitid"/>
                
              </td>
            </tr>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:if>
      
      <xsl:if test="physloc[string-length(text()|*)!=0]">
        <xsl:choose>
          <xsl:when test="@label">
            <tr>
              <td></td>
              <td>
                <xsl:value-of select="@label"/>
              </td>
              <td>
                <xsl:apply-templates select="physloc"/>
              </td>
            </tr>
          </xsl:when>
          
          <xsl:otherwise>
            <tr>
              <td></td>
              <td>
                <b><xsl:text>Location: </xsl:text></b>
              </td>
              <td>
                <xsl:apply-templates select="physloc"/>
              </td>
            </tr>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:if>
      
      <xsl:if test="note[string-length(text()|*)!=0]">
        <xsl:for-each select="note">
          <xsl:choose>
            <xsl:when test="@label">
              <tr>
                <td></td>
                  <td class="bold">
                  <xsl:value-of select="@label"/>
                </td>
              </tr>
              <xsl:for-each select="p">
                <tr>
                  <td></td>
                  <td>
                    <xsl:apply-templates/>
                  </td>
                </tr>
              </xsl:for-each>
            </xsl:when>
            
            <xsl:otherwise>
              <tr>
                <td></td>
                <td >
                  Location:
                </td>
                <td>
                  <xsl:apply-templates select="note"/>
                </td>
              </tr>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:for-each>
      </xsl:if>
      
    </table>
    <hr></hr>
    
  </xsl:for-each>
</xsl:template>
    <!--This template rule formats a top-level admininfo element.-->
    <xsl:template name="archdesc-admininfo">
        <xsl:if
            test="ead/archdesc/descgrp">
            <h3><a name="{ead/archdesc/descgrp/head}"><xsl:apply-templates select="ead/archdesc/descgrp/head"/></a></h3>
            <xsl:for-each select="ead/archdesc/descgrp/acqinfo">
                <h4><xsl:value-of select="head"/></h4>
                <xsl:for-each select="p">
                    <p>
                        <xsl:apply-templates select="."/>
                    </p>
                </xsl:for-each>
            </xsl:for-each>
            <xsl:for-each select="ead/archdesc/descgrp/separatedmaterial">
                <h4><xsl:value-of select="head"/></h4>
                <xsl:for-each select="p">
                    <p>
                        <xsl:apply-templates select="."/>
                    </p>
                </xsl:for-each>     
            </xsl:for-each>
            <xsl:for-each select="ead/archdesc/descgrp/originalsloc">
                <h4><xsl:value-of select="head"/></h4>
                <xsl:for-each select="p">
                    <p>
                        <xsl:apply-templates select="."/>
                    </p>
                </xsl:for-each>           
            </xsl:for-each>
            <xsl:for-each select="ead/archdesc/descgrp/relatedmaterial">
                <h4><xsl:value-of select="head"/></h4>
                <xsl:for-each select="p">
                    <p>
                        <xsl:apply-templates select="."/>
                    </p>
                </xsl:for-each>           
            </xsl:for-each>
            <xsl:for-each select="ead/archdesc/descgrp/altformavail">
                <h4><xsl:value-of select="head"/></h4>
                <xsl:for-each select="p">
                    <p>
                        <xsl:apply-templates select="."/>
                    </p>
                </xsl:for-each>           
            </xsl:for-each>
            <xsl:for-each select="ead/archdesc/descgrp/processinfo">
                <h4><xsl:value-of select="head"/></h4>
                <xsl:for-each select="p">
                    <p>
                        <xsl:apply-templates select="."/>
                    </p>
                </xsl:for-each>           
            </xsl:for-each>
            <xsl:for-each select="ead/archdesc/descgrp/prefercite">
                <h4 ><xsl:value-of select="head"/></h4>
                <xsl:for-each select="p">
                    <p>
                        <xsl:apply-templates select="."/>
                    </p>
                </xsl:for-each>           
            </xsl:for-each>
            <xsl:for-each select="ead/archdesc/descgrp/accessrestrict">
                <h4><xsl:value-of select="head"/></h4>
                <xsl:for-each select="p">
                    <p>
                        <xsl:apply-templates select="."/>
                    </p>
                </xsl:for-each>           
            </xsl:for-each>
            <xsl:for-each select="ead/archdesc/descgrp/userestrict">
                <h4><xsl:value-of select="head"/></h4>
                <xsl:for-each select="p">
                    <p>
                        <xsl:apply-templates select="."/>
                    </p>
                </xsl:for-each>           
            </xsl:for-each>
            <xsl:for-each select="ead/archdesc/descgrp/accruals">
                <h4>
                    <xsl:value-of select="head"/>
                </h4>
                <xsl:for-each select="p">
                    <p>
                        <xsl:apply-templates select="."/>
                    </p>
                </xsl:for-each>           
            </xsl:for-each>
            <p>
                <a href="#toc">Return to the Table of Contents</a>
            </p>
            <hr></hr>
        </xsl:if>
    </xsl:template>
    
    <!--This template rule formats the scopecontent element.-->
    <xsl:template name="archdesc-scopecontent">
        <xsl:if test="ead/archdesc/scopecontent">
            <xsl:for-each select="ead/archdesc/scopecontent">
                <xsl:apply-templates/>
            </xsl:for-each>
            <p>
                <a href="#toc">Return to the Table of Contents</a>
            </p>
            <hr></hr>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="ead/archdesc/scopecontent/head">
        <h3><a name="{/ead/archdesc/scopecontent/head}"><xsl:apply-templates/></a></h3>
    </xsl:template>
    
    <xsl:template match="ead/archdesc/scopecontent/p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    
    
    
    <!-- Template for c01-->
    <xsl:template match="c01">
        <h3><a name="{did/unittitle}"><xsl:value-of select="did/unittitle"/><xsl:text> </xsl:text>  <xsl:value-of select="did/unitdate"/></a></h3>
        <xsl:if test="did/physdesc"><p><b>Physical Description: </b> <xsl:value-of select="did/physdesc"/></p></xsl:if>
        <xsl:if test="scopecontent"><p><b>Scope and Content: </b> <xsl:value-of select="scopecontent"/></p></xsl:if>
        <xsl:if test="did/note"><p><b>Note: </b> <xsl:value-of select="did/note"/></p></xsl:if>    
        <xsl:if test="bioghist"><p><b>History: </b> <xsl:value-of select="bioghist"/></p></xsl:if>        
        <xsl:if test="note">
            <xsl:for-each select="note">
                <xsl:apply-templates/>
            </xsl:for-each>
        </xsl:if>
        <xsl:apply-templates select="c02"/>
        <p>
            <a href="#toc">Return to the Table of Contents</a>
        </p>
        <hr></hr>
    </xsl:template>
    
    <!-- Template for c02-->
    <xsl:template match="c02">
        <h4 class="indentc02"><xsl:value-of select="did/unittitle"/> <xsl:value-of select="did/unitdate"/></h4>
        <xsl:if test="did/container"><p class="indentc02"><xsl:value-of select="did/container/@label"/>: <xsl:value-of select="did/container"/></p></xsl:if>
        <xsl:if test="did/unitid"><p class="indentc02"><xsl:value-of select="did/unitid/@label"/>: <xsl:value-of select="did/unitid"/></p></xsl:if>
        <xsl:if test="did/physloc"><p class="indentc02"><xsl:value-of select="did/physloc/@label"/>: <xsl:value-of select="did/physloc"/></p></xsl:if>
        <xsl:if test="scopecontent"><p class="indentc02">Scope and Content: <xsl:value-of select="scopecontent"/></p></xsl:if>
        <xsl:if test="bioghist"><p class="indentc02">History: <xsl:value-of select="bioghist"/></p></xsl:if>        
        <xsl:if test="did/note"><p class="indentc02">Note: <xsl:value-of select="did/note/p"/></p></xsl:if>
        <xsl:if test="note">
            <xsl:for-each select="note">
                <p class="indentc02"><xsl:apply-templates/></p>
            </xsl:for-each>
        </xsl:if>
        <xsl:apply-templates select="c03"/>
    </xsl:template>
    
    <!-- Template for c03-->
    <xsl:template match="c03">
        <xsl:if test="did/unittitle"><h4 class="indentc03"><xsl:value-of select="did/unittitle"/> <xsl:value-of select="did/unitdate"/></h4></xsl:if>
        <xsl:if test="did/unitid"><p class="indentc03"> <xsl:value-of select="did/unitid"/> </p></xsl:if>                      
        <xsl:if test="did/container"><p class="indentc03"><xsl:value-of select="did/container/@label"/>: <xsl:value-of select="did/container"/></p></xsl:if>
        <xsl:if test="scopecontent"><p class="indentc03">Scope and Content: <xsl:value-of select="scopecontent"/></p></xsl:if>
        <xsl:if test="note">
            <xsl:for-each select="note">
                <p class="indentc03"><xsl:apply-templates/></p>
            </xsl:for-each>
        </xsl:if>
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
        <h3><a name="{/ead/archdesc/odd/list/head}"><xsl:value-of select="ead/archdesc/odd/list/head"/></a></h3>
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
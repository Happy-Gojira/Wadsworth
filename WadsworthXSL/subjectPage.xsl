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
            <body id="index2">
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
                    <section class="oddsubject">
                        <xsl:call-template name="oddsubject"/>                        
                    </section>
                </div>
            </body>
        </html>
    </xsl:template>
    
    
    
    
    

    
    <!-- This is a subject template if the attribute normal in the elment subject is change
    it must also be changed... -->
    <xsl:template name="oddsubject">
        
        <h1><xsl:value-of select="ead/archdesc/odd/list/head"/></h1>
        <nav>
            <ul>
                <li><a href="#">List of Subjects</a>                <ul>
                <li><a href="#Agri">Agriculture</a></li>
                <li><a href="#Art">Art</a></li>
                <li><a href="#Estate">Estate</a></li>
                <li><a href="#Finance">Finance</a></li>
                <li><a href="#Hunt">Hunt</a></li>
                <li><a href="#Images">Images by Marth Wadsworth</a></li>
                <li><a href="#Indian">Indian Affairs</a></li>
                <li><a href="#Personal">Personal</a></li>
                <li><a href="#Political">Political</a></li>
                <li><a href="#Public">Public Works</a></li>
                <li><a href="#Misc">Misc</a></li>
            </ul></li></ul>
        </nav>
        
        
        
        
        <!-- Agricultural subjects -->
        <div class="Agriculture">
            <xsl:variable name="size" select="count(ead/archdesc/odd/list/item/subject[contains(@normal, 'Agriculture')])"/>
                        
            <h2><a name="Agri">Agricultural</a></h2>
            <ul>
                <xsl:for-each select="ead/archdesc/odd/list/item[subject/@normal='Agriculture']">
                    <xsl:sort select="subject/@normal"/>

                    <xsl:if test="ceiling($size div 2) &gt;= position()">
                        <li>
                            <span class="clear">Subject: <xsl:value-of select="subject/@normal"/></span>
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
                        </li></xsl:if>
                </xsl:for-each>                
            </ul>
            <ul>
                <xsl:for-each select="ead/archdesc/odd/list/item[subject/@normal='Agriculture']">
                    <xsl:sort select="subject/@normal"/>

                    <xsl:if test="ceiling($size div 2) &lt; position()">
                        <li>
                            <span class="clear">Subject: <xsl:value-of select="subject/@normal"/></span>
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
                        </li></xsl:if>
                </xsl:for-each>                
            </ul>
        </div>
        <!-- Art subjects -->
        <div class="Art">
            <xsl:variable name="size" select="count(ead/archdesc/odd/list/item/subject[contains(@normal, 'Art')])"/>
            
            
            <h2><a name="Art">Art</a></h2>
            <ul>
                <xsl:for-each select="ead/archdesc/odd/list/item[subject/@normal='Art']">
                    <xsl:sort select="subject/@normal"/>

                    <xsl:if test="ceiling($size div 2) &gt;= position()">
                            <li>
                                <span class="clear">Subject: <xsl:value-of select="subject/@normal"/></span>
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
                            </li></xsl:if>
                </xsl:for-each>                
            </ul>
            <ul>
                <xsl:for-each select="ead/archdesc/odd/list/item[subject/@normal='Art']">
                    <xsl:sort select="subject/@normal"/>

                    <xsl:if test="ceiling($size div 2) &lt; position()">
                        <li>
                            <span class="clear">Subject: <xsl:value-of select="subject/@normal"/></span>
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
                        </li></xsl:if>
                </xsl:for-each>                
            </ul>
        </div>
        <!-- Estate subjects -->
        <div class="Estate">
            <xsl:variable name="size" select="count(ead/archdesc/odd/list/item/subject[contains(@normal, 'Estate')])"/>
            
            
            <h2><a name="Estate">Estate</a></h2>
            <ul>
                <xsl:for-each select="ead/archdesc/odd/list/item[subject/@normal='Estate']">
                    <xsl:sort select="subject/@normal"/>

                    <xsl:if test="ceiling($size div 2) &gt;= position()">
                        <li>
                            <span class="clear">Subject: <xsl:value-of select="subject/@normal"/></span>
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
                        </li></xsl:if>
                </xsl:for-each>                
            </ul>
            <ul>
                <xsl:for-each select="ead/archdesc/odd/list/item[subject/@normal='Estate']">
                    <xsl:sort select="subject/@normal"/>

                    <xsl:if test="ceiling($size div 2) &lt; position()">
                        <li>
                            <span class="clear">Subject: <xsl:value-of select="subject/@normal"/></span>
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
                        </li></xsl:if>
                </xsl:for-each>                
            </ul>
        </div>
        <!-- Finance subjects -->
        <div class="Finance">
            <xsl:variable name="size" select="count(ead/archdesc/odd/list/item/subject[contains(@normal, 'Finance')])"/>
            
            
            <h2><a name="Finance">Finance</a></h2>
            <ul>
                <xsl:for-each select="ead/archdesc/odd/list/item[subject/@normal='Finance']">
                    <xsl:sort select="subject/@normal"/>

                    <xsl:if test="ceiling($size div 2) &gt;= position()">
                        <li>
                            <span class="clear">Subject: <xsl:value-of select="subject/@normal"/></span>
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
                        </li></xsl:if>
                </xsl:for-each>                
            </ul>
            <ul>
                <xsl:for-each select="ead/archdesc/odd/list/item[subject/@normal='Finance']">
                    <xsl:sort select="subject/@normal"/>

                    <xsl:if test="ceiling($size div 2) &lt; position()">
                        <li>
                            <span class="clear">Subject: <xsl:value-of select="subject/@normal"/></span>
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
                        </li></xsl:if>
                </xsl:for-each>                
            </ul>
        </div>
        <!-- Hunt Subjects -->
        <div class="Hunt">
            <xsl:variable name="size" select="count(ead/archdesc/odd/list/item/subject[contains(@normal, 'Hunt')])"/>
            
            
            <h2><a name="Hunt">Hunt</a></h2>
            <ul>
                <xsl:for-each select="ead/archdesc/odd/list/item[subject/@normal='Hunt']">
                    <xsl:sort select="subject/@normal"/>

                    <xsl:if test="ceiling($size div 2) &gt;= position()">
                        <li>
                            <span class="clear">Subject: <xsl:value-of select="subject/@normal"/></span>
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
                        </li></xsl:if>
                </xsl:for-each>                
            </ul>
            <ul>
                <xsl:for-each select="ead/archdesc/odd/list/item[subject/@normal='Hunt']">
                    <xsl:sort select="subject/@normal"/>

                    <xsl:if test="ceiling($size div 2) &lt; position()">
                        <li>
                            <span class="clear">Subject: <xsl:value-of select="subject/@normal"/></span>
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
                        </li></xsl:if>
                </xsl:for-each>                
            </ul>
        </div>
        <!-- Images by Martha Blow Wadsworth subjects-->
        <div class="ImagesMBW">
            <xsl:variable name="size" select="count(ead/archdesc/odd/list/item/subject[contains(@normal, 'Images by Martha Blow Wadsworth')])"/>
            
            
            <h2><a name="Images">Images by Martha Wadsworth</a></h2>
            <ul>
                <xsl:for-each select="ead/archdesc/odd/list/item[subject/@normal='Images by Martha Blow Wadsworth']">
                    <xsl:sort select="subject/@normal"/>
                    <xsl:if test="ceiling($size div 2) &gt;= position()">
                        <li>
                            <span class="clear">Subject: <xsl:value-of select="subject/@normal"/></span>
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
                        </li></xsl:if>
                </xsl:for-each>                
            </ul>
            <ul>
                <xsl:for-each select="ead/archdesc/odd/list/item[subject/@normal='Images by Martha Blow Wadsworth']">
                    <xsl:sort select="subject/@normal"/>
                    
                    <xsl:if test="ceiling($size div 2) &lt; position()">
                        <li>
                            <span class="clear">Subject: <xsl:value-of select="subject/@normal"/></span>
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
                        </li></xsl:if>
                </xsl:for-each>                
            </ul>
        </div>
        <!-- Indian Affair Subject -->
        <div class="IndianAffairs">
            <xsl:variable name="size" select="count(ead/archdesc/odd/list/item/subject[contains(@normal, 'Indian affairs')])"/>
            
            
            <h2><a name="Indian">Indian Affairs</a></h2>
            <ul>
                <xsl:for-each select="ead/archdesc/odd/list/item[subject/@normal='Indian affairs']">
                    <xsl:sort select="subject/@normal"/>
                    
                    <xsl:if test="ceiling($size div 2) &gt;= position()">
                        <li>
                            <span class="clear">Subject: <xsl:value-of select="subject/@normal"/></span>
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
                        </li></xsl:if>
                </xsl:for-each>                
            </ul>
            <ul>
                <xsl:for-each select="ead/archdesc/odd/list/item[subject/@normal='Indian affairs']">
                    <xsl:sort select="subject/@normal"/>
                    
                    <xsl:if test="ceiling($size div 2) &lt; position()">
                        <li>
                            <span class="clear">Subject: <xsl:value-of select="subject/@normal"/></span>
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
                        </li></xsl:if>
                </xsl:for-each>                
            </ul>
        </div>
        <!-- Personal Subjects -->
        <div class="Personal">
            <xsl:variable name="size" select="count(ead/archdesc/odd/list/item/subject[contains(@normal, 'Personal')])"/>
            
            
            <h2><a name="Personal">Personal</a></h2>
            <ul>
                <xsl:for-each select="ead/archdesc/odd/list/item[subject/@normal='Personal']">
                    <xsl:sort select="subject/@normal"/>

                    <xsl:if test="ceiling($size div 2) &gt;= position()">
                        <li>
                            <span class="clear">Subject: <xsl:value-of select="subject/@normal"/></span>
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
                        </li></xsl:if>
                </xsl:for-each>                
            </ul>
            <ul>
                <xsl:for-each select="ead/archdesc/odd/list/item[subject/@normal='Personal']">
                    <xsl:sort select="subject/@normal"/>

                    <xsl:if test="ceiling($size div 2) &lt; position()">
                        <li>
                            <span class="clear">Subject: <xsl:value-of select="subject/@normal"/></span>
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
                        </li></xsl:if>
                </xsl:for-each>                
            </ul>
        </div>
        <!-- Political subjects -->
        <div class="political">
            <xsl:variable name="size" select="count(ead/archdesc/odd/list/item/subject[contains(@normal, 'Political')])"/>
            
            
            <h2><a name="Political">Political</a></h2>
            <ul>
                <xsl:for-each select="ead/archdesc/odd/list/item[subject/@normal='Political']">
                    <xsl:sort select="subject/@normal"/>

                    <xsl:if test="ceiling($size div 2) &gt;= position()">
                        <li>
                            <span class="clear">Subject: <xsl:value-of select="subject/@normal"/></span>
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
                        </li></xsl:if>
                </xsl:for-each>                
            </ul>
            <ul>
                <xsl:for-each select="ead/archdesc/odd/list/item[subject/@normal='Political']">
                    <xsl:sort select="subject/@normal"/>

                    <xsl:if test="ceiling($size div 2) &lt; position()">
                        <li>
                            <span class="clear">Subject: <xsl:value-of select="subject/@normal"/></span>
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
                        </li></xsl:if>
                </xsl:for-each>                
            </ul>
        </div>
        <!-- Public Works subjects -->
        <div class="Publicworks">
            <xsl:variable name="size" select="count(ead/archdesc/odd/list/item/subject[contains(@normal, 'Public Works')])"/>
            
            
            <h2><a name="Public">Public Works</a></h2>
            <ul>
                <xsl:for-each select="ead/archdesc/odd/list/item[subject/@normal='Public Works']">
                    <xsl:sort select="subject/@normal"/>

                    <xsl:if test="ceiling($size div 2) &gt;= position()">
                        <li>
                            <span class="clear">Subject: <xsl:value-of select="subject/@normal"/></span>
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
                        </li></xsl:if>
                </xsl:for-each>                
            </ul>
            <ul>
                <xsl:for-each select="ead/archdesc/odd/list/item[subject/@normal='Public Works']">
                    <xsl:sort select="subject/@normal"/>

                    <xsl:if test="ceiling($size div 2) &lt; position()">
                        <li>
                            <span class="clear">Subject: <xsl:value-of select="subject/@normal"/></span>
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
                        </li></xsl:if>
                </xsl:for-each>                
            </ul>
        </div>
        <!-- Misc subject -->
        <div class="Misc">
            <xsl:variable name="size" select="count(ead/archdesc/odd/list/item/subject[contains(@normal, 'misc')])"/>
            
            
            <h2><a name="Misc">Misc</a></h2>
            <ul>
                <xsl:for-each select="ead/archdesc/odd/list/item[subject/@normal='misc']">
                    <xsl:sort select="subject/@normal"/>
                    <xsl:if test="ceiling($size div 2) &gt;= position()">
                        <li>
                            <span class="clear">Subject: <xsl:value-of select="subject/@normal"/></span>
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
                        </li></xsl:if>
                </xsl:for-each>                
            </ul>
            <ul>
                <xsl:for-each select="ead/archdesc/odd/list/item[subject/@normal='misc']">
                    <xsl:sort select="subject/@normal"/>
                    
                    <xsl:if test="ceiling($size div 2) &lt; position()">
                        <li>
                            <span class="clear">Subject: <xsl:value-of select="subject/@normal"/></span>
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
                        </li></xsl:if>
                </xsl:for-each>                
            </ul>
        </div>
        
        
        
    </xsl:template>
</xsl:stylesheet>
  <?xml version="1.0" encoding="UTF-8"?>
    <xsl:stylesheet version="1.0" 
    xmlns="http://www.w3.org/1999/xhtml" 
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" omit-xml-declaration="yes"/>
        <xsl:template match="/">
            <html>
                <head>
                <link href="stile.css" rel="stylesheet" type="text/css"/>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.js"></script>
                <script type="text/javascript" src="impo.js"></script>
            
                    <title>
                        <xsl:value-of select="//tei:title" /> | <xsl:value-of select="//tei:title[@xml:lang='it']" />
                    </title>

                </head>
                <body>                   
                    <nav> 
                        <li class="text">Descrizione manoscritto</li>
                    </nav>

                    <!-- come prima cosa andiamo a delineare le informazione sul manoscritto 
                    compresa la vita e la morte dell'autore-->
                    <div class="infTitle">
                        <div class="sin">
                            <p>Titolo dell'opera in francese: <br/>
                            <span id="test"><xsl:value-of select="//tei:title" /></span></p>
                            
                            <p>Traduzione dell'opera  in italiano: <br/>
                            <span id="test"><xsl:value-of select="//tei:title[@xml:lang='it']" /></span></p> 
                        </div>
                        <div class="dest">
                            <p>Autore dell'opera: <br/>
                            <span id="test"><a href="#life"><xsl:value-of select="//tei:titleStmt/tei:author" /></a></span></p><!-- link a de saussure-->

                            <p>Traduttore del manoscritto: <br/>
                            <span id="test"><xsl:value-of select="//tei:name" /></span></p> 
                        </div>
                    </div>

                    <div class="contMan">
                        <div class="sini">
                            <h2> Contenuti del manoscritto  </h2>
                                
                                <xsl:apply-templates select="//tei:msIdentifier" /> <br/>
                                <xsl:apply-templates select="//tei:msContents" /> <br/> 
                                
                        </div>

                        <div class="destr">
                            <h2> Descrizione fisica del manoscritto </h2>
                                <xsl:apply-templates select="//tei:physDesc" /> <br/>
                                <xsl:apply-templates select="//tei:history" /> 
                        </div>
                    </div>
                    <hr class="stile"/>

                    <h1 class="life">La vita e la morte dell'autore:</h1><br/>

                    <div class="cont">

                        <div class="sini">
                            <img src="src/De_Saussure.jpeg" />
                        </div>

                        <div class="destr">
                            <xsl:apply-templates select="//tei:listPerson" />
                        </div>    

                    </div>
                    <div id="keywords">
                        <div class="ragrBtns">
                          <button class="Off" id="parKey">Parole chiave</button>

                          <button class="Off" id="luoghi">Luoghi</button>
                        </div>
                    </div>
                    <hr class="stile"/>
                    <div id="edits">
                        <h4>Interventi editoriali</h4>
                        <div class="ragrBtns">
                          <button class="Off" id="Gap"><i>Gap</i></button>
                          <button class="Off" id="agg">Aggiunte</button>
                          <button class="Off" id="canc">Parole cancellate</button>
                        </div>
                    </div>
                     <div id="translation">
                        <h4>Traduzione</h4>
                        <div class="keyBtns">
                          <button class="Off" id="trslBtn">Mostra</button> <br />
                          <div id="trslWrapper">
                            <h5>Paragrafo</h5>
                            <div class="slider">
                              <label for="trSlider">1</label>
                              <input name="trSlider" type="range" min="1" max="7" value="1" />
                              <label for="trSlider">7</label>
                            </div>
                            <div id="trslTextContainer">
                              <xsl:apply-templates select="//tei:div[@type='translation']" />
                            </div>
                          </div>
                        </div>
                      </div>

                    <section id="pg6">
                        <h3> Pagina 6 </h3>
                        <div class="page">
                            <div class="imgContainer">
                                <xsl:apply-templates select="//tei:surface[@xml:id='P2_06']" />
                                <xsl:apply-templates select="//tei:surface[@xml:id='P2_061']" />
                                <div class="chooseSide">
                                    <label for="vers6">
                                        <input type="checkbox" id="vers6" name="cSide_6" class="chSideBtn versOn" /> Retro Pagina
                                    </label>
                                </div>
                            </div>
                            <div class="textContainer">
                                <xsl:apply-templates select="//tei:body/tei:div[@n = '6']" />
                                <xsl:apply-templates select="//tei:body/tei:div[@n = '61']" />
                            </div>
                        </div>
                    </section>
                    <hr class="stile"/>
                    <br/><br/><br/>


                  <section id="pg7">
                    <h3> Pagina 7 </h3>
                    <div class="page">
                      <div class="imgContainer">
                        <xsl:apply-templates select="//tei:surface[@xml:id='P2_07']" />
                        <xsl:apply-templates select="//tei:surface[@xml:id='P2_071']" />
                        <div class="chooseSide">
                          <label for="vers7">
                            <input type="checkbox" id="vers7" name="cSide_7" class="chSideBtn versOn" />Retro Pagina
                          </label>
                        </div>
                      </div>
                      <div class="textContainer">
                        <xsl:apply-templates select="//tei:body/tei:div[@n = '7']" />
                      </div>
                    </div>
                  </section>     

                <div class="biblFin">
                        <div class="sin">
                            <h3>Elementi Bibliografici: </h3><br/>
                            <xsl:apply-templates select="//tei:listBibl" />
                        </div>
                        <div class="dest">
                            <h3> Elementi editoriali: </h3><br/> 
                            <xsl:apply-templates select="//tei:editionStmt" />
                        </div>
                </div>
              </body>
          </html>
        </xsl:template>
    
    <xsl:template match="tei:surface">
        <xsl:element name="img">
            <xsl:attribute name="class">document
                <xsl:choose>
                    <xsl:when test="current()/@n mod 2 = 0"> Verso </xsl:when><!-- se il risultato dell'operazione riporta un resto pari a 0 risulta essere il verso del documento-->
                    <xsl:when test="current()/@n mod 2 = 1"> Recto </xsl:when><!-- RECTO= DIRITTO,-->
                </xsl:choose>
            </xsl:attribute>
            <xsl:attribute name="id">
                <xsl:value-of select="@xml:id" />
            </xsl:attribute>
            <xsl:attribute name="src">
                <xsl:value-of select="concat('src/', @xml:id, '.png')" />
            </xsl:attribute>
            <xsl:attribute name="alt">
                <xsl:value-of select="@xml:id" />
            </xsl:attribute>
            <xsl:attribute name="width">400px</xsl:attribute>
            
            <xsl:attribute name="usemap">
                <xsl:value-of select="@xml:id" />
            </xsl:attribute>
        </xsl:element>

        <xsl:element name="map">
            <xsl:attribute name="name">
            <xsl:value-of select="@xml:id" />
            </xsl:attribute>
            <xsl:for-each select="current()/tei:zone">
                <xsl:variable name="ulx" select="@ulx" />
                <xsl:variable name="uly" select="@uly" />
                <xsl:variable name="lrx" select="@lrx" />
                <xsl:variable name="lry" select="@lry" />
                <xsl:variable name="width" select="translate(../tei:graphic/@width, 'px', '')" />
                <xsl:variable name="height" select="translate(../tei:graphic/@height, 'px', '')" />
                <xsl:variable name="ratio" select="400 div $width" />
                <xsl:variable name="w" select="$width * $ratio" />
                <xsl:variable name="h" select="$height * $ratio" />

                <xsl:element name="area">
                    <xsl:attribute name="shape">rect</xsl:attribute>
                    <xsl:attribute name="coords">
                        <xsl:value-of select="concat(@ulx, ',', @uly, ',', @lrx, ',', @lry)" />
                    </xsl:attribute>
                    <xsl:attribute name="href">
                        <xsl:choose>
                            <xsl:when test="../@n mod 2 = 1">
                                <xsl:value-of select="concat('#Line', substring(@xml:id, 5, 1), '_', (position() - 1))" />
                            </xsl:when>
                            <xsl:when test="../@n mod 2 = 0">
                                <xsl:value-of select="concat('#Line', substring(@xml:id, 5, 1), '1_', (position() - 1))" />
                            </xsl:when>
                        </xsl:choose>
                    </xsl:attribute>
                </xsl:element>
            </xsl:for-each>

      </xsl:element>
    </xsl:template>
    
    <xsl:template match="tei:ab[@type='paragraph']">
      <xsl:element name="span">
        <xsl:attribute name="class">paragrafo</xsl:attribute>
        <xsl:attribute name="class">pr_p<xsl:value-of select="current()/@n" /></xsl:attribute>
        <xsl:apply-templates />
      </xsl:element>
    </xsl:template>

    <xsl:template match="tei:ab[@type='translation']">
      <xsl:element name="span">
        <xsl:attribute name="class">translation</xsl:attribute>
        <xsl:attribute name="class">tr_p<xsl:value-of select="current()/@n" /></xsl:attribute>
        <xsl:apply-templates />
      </xsl:element>
    </xsl:template>
    
     <xsl:template match="//tei:div[@type='translation']">
      <xsl:for-each select="current()/tei:ab">
        <xsl:element name="p">
          <xsl:attribute name="class">trslText</xsl:attribute>
          <xsl:attribute name="id">
            <xsl:value-of select="concat('tr_', substring(@corresp, 2))" />
          </xsl:attribute>
          <xsl:apply-templates />
        </xsl:element>
      </xsl:for-each>
   </xsl:template>

        <xsl:template match="tei:msIdentifier">
            <xsl:element name="h3">Dove troviamo il manoscritto</xsl:element>
            <xsl:element name="p">
                <xsl:value-of select="//tei:idno[@xml:id='collocation']" /> 
            </xsl:element>  
            <xsl:element name="p">
                <xsl:value-of select="//tei:idno" /> 
            </xsl:element>  
            <xsl:element name="p">
                <xsl:value-of select="//tei:repository" /> 
            </xsl:element>
            
            <xsl:element name="p">
                <xsl:value-of select="//tei:settlement" /> 
                <xsl:value-of select="//tei:region" /> 
            </xsl:element>

        </xsl:template>

        <xsl:template match="tei:msContents">
            <xsl:element name="h3">Contenuto del manoscritto</xsl:element>
            <xsl:element name="p"> Titolo: <br/>
                <xsl:value-of select="//tei:title" /> 
            </xsl:element>  
            <xsl:element name="p"> Lingua del manoscritto:<br/> 
                <xsl:value-of select="//tei:textLang" /> 
            </xsl:element>  
            <xsl:element name="p"> Autore:<br/>
                <xsl:value-of select="//tei:msItem/tei:author/tei:persName" /> 
            </xsl:element>
            
            <xsl:element name="p">
                <xsl:value-of select="//tei:settlement" /> 
            </xsl:element>

            <xsl:element name="p">
                <xsl:value-of select="//tei:summary" /> 
            </xsl:element>

        </xsl:template>

        <xsl:template match="tei:history">
            <xsl:element name="h3">Storico manoscritto</xsl:element>
            <xsl:element name="p"> Origine documento: <br/>
                <xsl:value-of select="//tei:origin" /> 
            </xsl:element>  
            <xsl:element name="p">Provenienza documento: <br/>
                <xsl:value-of select="//tei:provenance" /> 
            </xsl:element>  
            <xsl:element name="p"> Acquisizione manoscritto:<br/>
                <xsl:value-of select="//tei:acquisition" /> 
            </xsl:element>
            
        </xsl:template>

        <xsl:template match="tei:physDesc">
            <xsl:element name="h3">Descrizione fisica del manoscritto</xsl:element>
            <xsl:element name="p"> Layout documento: <br/>
                <xsl:value-of select="//tei:layout" /> 
            </xsl:element>  
            <xsl:element name="p"> Condizione manoscritto: <br/>
                <xsl:value-of select="//tei:condition" /> 
            </xsl:element>  
            <xsl:element name="p"> 
                <xsl:value-of select="//tei:handDesc" /> 
            </xsl:element>
            
            <xsl:element name="p"> Supporto utilizzato:<br/>
                <xsl:value-of select="//tei:support" /> 
            </xsl:element>

            <xsl:element name="p"> Descrizione generale: <br/>
                <xsl:value-of select="//tei:extent" /> 
            </xsl:element>

        </xsl:template>

    <xsl:template match="tei:expan">
        <xsl:element name="span">
            <xsl:attribute name="class">expan</xsl:attribute>
            <xsl:value-of select="current()" />
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:abbr">
      <abbr><xsl:value-of select="current()" /></abbr>
    </xsl:template>

    <xsl:template match="tei:corr">
      <xsl:element name="span">
        <xsl:attribute name="class">corr</xsl:attribute>
        <xsl:value-of select="current()" />
      </xsl:element>
    </xsl:template>

    <xsl:template match="tei:sic">
      <sic><xsl:value-of select="current()" /></sic>
    </xsl:template>

    <xsl:template match="tei:add">
      <ins><xsl:apply-templates /></ins>
    </xsl:template>

    <xsl:template match="tei:del">
      <del><xsl:apply-templates /></del>
    </xsl:template>

    <xsl:template match="tei:gap">
      <span class="gap">(Gap)</span>
    </xsl:template>
    
    <xsl:template match="tei:div[@type='page']">
        <xsl:element name="div">
            <xsl:attribute name="id"><xsl:value-of select="../tei:pb[@n=current()/@n]/@facs"/></xsl:attribute>
            <xsl:attribute name="class">item</xsl:attribute>
            <h2>Foglio <xsl:value-of select="current()/@n"/></h2>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

        <xsl:template match="tei:lb">
      <br />
      <xsl:element name="span">
        <xsl:attribute name="class">lineNumber</xsl:attribute>
        <xsl:attribute name="id">
          <xsl:value-of select="concat('line', substring(@xml:id, 6, 1), '_', @n)" />
        </xsl:attribute>
        <xsl:value-of select="@n" />
      </xsl:element>
    </xsl:template>

    <xsl:template match="tei:pb">
      <xsl:element name="span">
        <xsl:attribute name="class">pageNumber</xsl:attribute>
        <xsl:attribute name="id">page_<xsl:value-of select="current()/@n" /></xsl:attribute>
      </xsl:element>
    </xsl:template>


<xsl:template match="tei:term | tei:placeName">

      <xsl:element name="div">
        <xsl:attribute name="class">key</xsl:attribute>
        <xsl:element name="span">
            <xsl:choose>
              <xsl:when test="name() = 'term'">
                <xsl:attribute name="class">park</xsl:attribute>
                <xsl:attribute name="id">
                  <xsl:value-of select="current()/@ref" />
                </xsl:attribute>
              </xsl:when>
    
              <xsl:when test="name() = 'placeName'">
                <xsl:attribute name="class">
                  <xsl:value-of select="name()" />
                </xsl:attribute>
                <xsl:attribute name="id">
                  <xsl:value-of select="current()/@ref" />
                </xsl:attribute>
              </xsl:when>
            </xsl:choose>

          <xsl:apply-templates />
        </xsl:element>

        <!-- Descrizione dei termini -->

        <xsl:element name="div">
          <xsl:choose>
            <xsl:when test="name() = 'term'">
              <xsl:attribute name="class">tooltip keyDesc</xsl:attribute>
              <xsl:attribute name="id">
                <xsl:value-of select="current()/@ref" />
              </xsl:attribute>
              <xsl:apply-templates select="//tei:gloss[@target=current()/@ref]" />
            </xsl:when>

            <xsl:when test="name() = 'placeName'">
              <xsl:attribute name="class">tooltip placeDesc</xsl:attribute>
              <xsl:attribute name="id">
                <xsl:value-of select="current()/@ref" />
              </xsl:attribute>
              <xsl:element name="span">
                <xsl:attribute name="class">settlement</xsl:attribute>
                <xsl:choose>
                  <xsl:when test="//tei:place/tei:settlement[@type = 'municipality']">
                    comune
                  </xsl:when>
                  <xsl:when test="//tei:place/tei:settlement[@type = 'state']">
                    Stato
                  </xsl:when>
                  <xsl:when test="//tei:place/tei:settlement[@type = 'capital']">
                    Capitale
                  </xsl:when>
                </xsl:choose>
                <strong>
                  <xsl:value-of select="//tei:place/tei:settlement" />
                </strong>
              </xsl:element>
              <br />
              <xsl:element name="span">
                <xsl:attribute name="class">country</xsl:attribute>
                <strong><xsl:value-of select="//tei:place/tei:country" /></strong>
              </xsl:element>
            </xsl:when>
          </xsl:choose>
        </xsl:element>
      </xsl:element>
    </xsl:template>

  <xsl:template match="tei:listBibl">
    <xsl:element name="p"> Autore : <br/>
        <xsl:value-of select="//tei:bibl/tei:author" /> 
    </xsl:element>  

    <xsl:element name="p"> Titolo:<br/> 
        <xsl:value-of select="//tei:bibl/tei:title[@type='main']" /> 
    </xsl:element>  

    <xsl:element name="p"> Sottotitolo:<br/>
        <xsl:value-of select="//tei:bibl/tei:title[@type='sub']" /> 
    </xsl:element>
    
    <xsl:element name="p">Pubblicazioni: <br/>
        <xsl:value-of select="//tei:bibl/tei:pubPlace/tei:placeName[@n='1']" /> <br/>
        <xsl:value-of select="//tei:bibl/tei:pubPlace/tei:placeName[@n='2']" /> 
    </xsl:element>

    <xsl:element name="p">Editore:
        <xsl:value-of select="//tei:bibl/tei:publisher" /> 
    </xsl:element>

    <xsl:element name="p">Anno di pubblicazione: <br/>
          <xsl:value-of select="//tei:bibl/tei:date" /> <br/>
    </xsl:element>

    <xsl:element name="p">Volume: <br/>
          <xsl:value-of select="//tei:bibl/tei:biblScope[@unit='volume']" /> <br/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tei:editionStmt">
    <xsl:element name="p">
     <xsl:value-of select="//tei:edition" />
    </xsl:element>
    <xsl:element name="p">
     <xsl:value-of select="//tei:respStmt" />
    </xsl:element>
    <xsl:element name="p">
     <xsl:value-of select="//tei:respStmt[@n='1']" />
    </xsl:element>
  </xsl:template>

</xsl:stylesheet>
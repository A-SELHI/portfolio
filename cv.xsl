<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:foaf="http://xmlns.com/foaf/0.1/"
  xmlns:dc="http://purl.org/dc/elements/1.1/"
  xmlns:schema="http://schema.org/"
  xmlns:vcard="http://www.w3.org/2006/vcard/ns#">

  <xsl:output method="html" encoding="UTF-8" indent="yes"/>
  <xsl:param name="lang" select="'fr'"/>

  <xsl:template match="/">
    <xsl:apply-templates select="portfolio/lang[@code=$lang]"/>
  </xsl:template>

  <xsl:template match="lang">
    <xsl:variable name="rtl" select="@code='ar'"/>
    <div>
      <xsl:attribute name="dir">
        <xsl:choose>
          <xsl:when test="$rtl">rtl</xsl:when>
          <xsl:otherwise>ltr</xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>

      <div class="navbar">
        <div class="navbar__inner">
          <div class="navbar__brand"><a href="#"><xsl:value-of select="titre"/></a></div>
          <div class="nav-list">
            <xsl:for-each select="ui/navbar/item">
              <a href="{@href}" class="nav-link"><xsl:value-of select="."/></a>
            </xsl:for-each>
          </div>
          <div class="navbar__lang">
            <button data-lang="fr">FR</button>
            <button data-lang="en">EN</button>
            <button data-lang="ar">AR</button>
          </div>
        </div>
      </div>

      <section id="home" class="hero">
        <div class="hero__inner container">
          <div>
            <div class="hero__subtitle" property="foaf:name">
              <xsl:value-of select="identite/prenom"/> &#160;<xsl:value-of select="identite/nom"/>
            </div>
            <div class="hero__title"><xsl:value-of select="titre"/></div>
            <div class="hero__role">
              <xsl:value-of select="formation/etape[1]"/>
            </div>
            <a class="btn btn--accent" href="#about">
              <xsl:value-of select="ui/labels/learnmore"/>
            </a>
          </div>
          <div class="hero__image"></div>
        </div>
        <div class="hero__shape hero__shape--1"></div>
        <div class="hero__shape hero__shape--2"></div>
      </section>

      <section id="about" class="section" typeof="foaf:Person" about="#me">
        <div class="container about__inner">
          <div>
            <h2 class="section-title">
              <xsl:value-of select="ui/navbar/item[2]"/>
            </h2>
            <ul>
              <li>
                <strong><xsl:value-of select="ui/labels/email"/> :</strong>
                <a href="mailto:{identite/email}" property="foaf:mbox">
                  <xsl:value-of select="identite/email"/>
                </a>
              </li>
              <li>
                <strong><xsl:value-of select="ui/labels/telephone"/> :</strong>
                <span property="foaf:phone"><xsl:value-of select="identite/telephone"/></span>
              </li>
              <li>
                <strong><xsl:value-of select="ui/labels/adresse"/> :</strong>
                <span property="vcard:adr"><xsl:value-of select="identite/adresse"/></span>
              </li>
              <li>
                <strong><xsl:value-of select="ui/labels/linkedin"/> :</strong>
                <a href="https://www.linkedin.com/in/{identite/linkedin}" property="foaf:account">
                  <xsl:value-of select="identite/linkedin"/>
                </a>
              </li>
            </ul>
          </div>
          <div class="about__image">
            <div class="video-wrapper">
              <iframe src="{identite/video}" allowfullscreen="true"
                property="foaf:depiction" resource="{identite/video}"></iframe>
            </div>
          </div>
        </div>
      </section>

      <section id="formation" class="section">
        <div class="container">
          <h2 class="section-title">
            <xsl:value-of select="ui/navbar/item[3]"/>
          </h2>
          <ul class="formation__list">
            <xsl:for-each select="formation/etape">
              <li typeof="schema:EducationalOccupationalCredential">
                <strong property="schema:dateCreated"><xsl:value-of select="@annee"/></strong>
                <span property="schema:name"> – <xsl:value-of select="."/></span>
              </li>
            </xsl:for-each>
          </ul>
        </div>
      </section>

      <section id="experience" class="section">
        <div class="container">
          <h2 class="section-title">
            <xsl:value-of select="ui/navbar/item[4]"/>
          </h2>
          <div class="experience__item">
            <xsl:for-each select="experience/poste">
              <div typeof="schema:Role">
                <strong property="schema:roleName"><xsl:value-of select="titre"/></strong>
                (<span property="schema:worksFor"><xsl:value-of select="entreprise"/></span>,
                 <span property="schema:location"><xsl:value-of select="lieu"/></span>)<br/>
                <span property="schema:startDate"><xsl:value-of select="periode"/></span>
              </div>
            </xsl:for-each>
          </div>
        </div>
      </section>

      <section id="competences" class="section">
        <div class="container">
          <h2 class="section-title">
            <xsl:value-of select="ui/navbar/item[5]"/>
          </h2>
          <div class="skills__list">
            <xsl:for-each select="competences/categorie">
              <div class="skills__category" typeof="schema:CategoryCode">
                <div class="skills__cat-title" property="schema:name">
                  <xsl:value-of select="@nom"/>
                </div>
                <div class="skills__badges">
                  <xsl:for-each select="skill">
                    <span class="badge" property="schema:description">
                      <xsl:value-of select="."/>
                    </span>
                  </xsl:for-each>
                </div>
              </div>
            </xsl:for-each>
          </div>
        </div>
      </section>

      <section id="projects" class="section">
        <div class="container">
          <h2 class="section-title">
            <xsl:value-of select="ui/navbar/item[6]"/>
          </h2>
          <div class="projects__grid">
            <xsl:for-each select="projets/projet">
              <div class="project-card" typeof="foaf:Project">
                <div class="project-card__body">
                  <h3 property="dc:title"><xsl:value-of select="titre"/></h3>
                  <div property="dc:description"><xsl:value-of select="description"/></div>
                  <div><em property="dc:date"><xsl:value-of select="periode"/></em></div>
                </div>
              </div>
            </xsl:for-each>
          </div>
        </div>
      </section>

      <section id="langues" class="section">
        <div class="container">
          <h2 class="section-title">
            <xsl:value-of select="ui/navbar/item[7]"/>
          </h2>
          <ul>
            <xsl:for-each select="langues/langue">
              <li property="foaf:knows">
                <strong><xsl:value-of select="@nom"/></strong> : <span property="dc:description"><xsl:value-of select="."/></span>
              </li>
            </xsl:for-each>
          </ul>
        </div>
      </section>

      <section id="interets" class="section">
        <div class="container">
          <h2 class="section-title">
            <xsl:value-of select="ui/navbar/item[8]"/>
          </h2>
          <ul>
            <xsl:for-each select="interets/interet">
              <li property="foaf:interest"><xsl:value-of select="."/></li>
            </xsl:for-each>
          </ul>
        </div>
      </section>
    </div>
  </xsl:template>
</xsl:stylesheet>

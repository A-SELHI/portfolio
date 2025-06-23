<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:template match="/">
    <html
      xmlns="http://www.w3.org/1999/xhtml"
      xmlns:dc="http://purl.org/dc/elements/1.1/"
      xmlns:foaf="http://xmlns.com/foaf/0.1/"
      prefix="dc: http://purl.org/dc/elements/1.1/ foaf: http://xmlns.com/foaf/0.1/"
      lang="fr"
    >
      <head>
        <meta charset="UTF-8"/>
        <title property="dc:title">
          <xsl:choose>
            <xsl:when test="portfolio/lang[@code='fr']">CV | <xsl:value-of select="portfolio/lang[@code='fr']/identite/nom"/></xsl:when>
            <xsl:when test="portfolio/lang[@code='en']">CV | <xsl:value-of select="portfolio/lang[@code='en']/identite/nom"/></xsl:when>
            <xsl:otherwise>السيرة الذاتية | <xsl:value-of select="portfolio/lang[@code='ar']/identite/nom"/></xsl:otherwise>
          </xsl:choose>
        </title>
        <link rel="stylesheet" href="style.css"/>
        <script src="script.js" defer="defer"></script>
      </head>
      <body>
        <xsl:for-each select="portfolio/lang">
          <section class="lang-block" data-lang="{@code}">
            <header class="header">
              <nav class="nav container">
                <a href="#" class="nav__logo" property="foaf:name">
                  <xsl:value-of select="identite/prenom"/>
                  <xsl:text> </xsl:text>
                  <xsl:value-of select="identite/nom"/>
                </a>
                <ul class="nav__list">
                  <xsl:choose>
                    <xsl:when test="@code='fr'">
                      <li class="nav__item"><a href="#about" class="nav__link">À propos</a></li>
                      <li class="nav__item"><a href="#education" class="nav__link">Formation</a></li>
                      <li class="nav__item"><a href="#experience" class="nav__link">Expérience</a></li>
                      <li class="nav__item"><a href="#skills" class="nav__link">Compétences</a></li>
                      <li class="nav__item"><a href="#projects" class="nav__link">Projets</a></li>
                      <li class="nav__item"><a href="#languages" class="nav__link">Langues</a></li>
                      <li class="nav__item"><a href="#interests" class="nav__link">Intérêts</a></li>
                    </xsl:when>
                    <xsl:when test="@code='en'">
                      <li class="nav__item"><a href="#about" class="nav__link">About</a></li>
                      <li class="nav__item"><a href="#education" class="nav__link">Education</a></li>
                      <li class="nav__item"><a href="#experience" class="nav__link">Experience</a></li>
                      <li class="nav__item"><a href="#skills" class="nav__link">Skills</a></li>
                      <li class="nav__item"><a href="#projects" class="nav__link">Projects</a></li>
                      <li class="nav__item"><a href="#languages" class="nav__link">Languages</a></li>
                      <li class="nav__item"><a href="#interests" class="nav__link">Interests</a></li>
                    </xsl:when>
                    <xsl:otherwise>
                      <li class="nav__item"><a href="#about" class="nav__link">نبذة</a></li>
                      <li class="nav__item"><a href="#education" class="nav__link">التعليم</a></li>
                      <li class="nav__item"><a href="#experience" class="nav__link">الخبرة</a></li>
                      <li class="nav__item"><a href="#skills" class="nav__link">المهارات</a></li>
                      <li class="nav__item"><a href="#projects" class="nav__link">المشاريع</a></li>
                      <li class="nav__item"><a href="#languages" class="nav__link">اللغات</a></li>
                      <li class="nav__item"><a href="#interests" class="nav__link">الاهتمامات</a></li>
                    </xsl:otherwise>
                  </xsl:choose>
                </ul>
                <div class="nav__lang-switch">
                  <xsl:choose>
                    <xsl:when test="@code='fr'">
                      <button class="lang-btn" data-lang="fr">Français</button>
                      <button class="lang-btn" data-lang="en">Anglais</button>
                      <button class="lang-btn" data-lang="ar">Arabe</button>
                    </xsl:when>
                    <xsl:when test="@code='en'">
                      <button class="lang-btn" data-lang="fr">French</button>
                      <button class="lang-btn" data-lang="en">English</button>
                      <button class="lang-btn" data-lang="ar">Arabic</button>
                    </xsl:when>
                    <xsl:otherwise>
                      <button class="lang-btn" data-lang="fr">فرنسي</button>
                      <button class="lang-btn" data-lang="en">إنجليزي</button>
                      <button class="lang-btn" data-lang="ar">عربي</button>
                    </xsl:otherwise>
                  </xsl:choose>
                </div>
              </nav>
            </header>
            <main class="main">
              <section class="section about" id="about" typeof="foaf:Person">
                <h2 class="section-title" property="dc:title">
                  <xsl:choose>
                    <xsl:when test="@code='fr'">À propos</xsl:when>
                    <xsl:when test="@code='en'">About</xsl:when>
                    <xsl:otherwise>نبذة</xsl:otherwise>
                  </xsl:choose>
                </h2>
                <p>
                  <strong>
                    <xsl:choose>
                      <xsl:when test="@code='fr'">Nom :</xsl:when>
                      <xsl:when test="@code='en'">Last name:</xsl:when>
                      <xsl:otherwise>اللقب:</xsl:otherwise>
                    </xsl:choose>
                  </strong>
                  <span property="foaf:familyName"><xsl:value-of select="identite/nom"/></span>
                </p>
                <p>
                  <strong>
                    <xsl:choose>
                      <xsl:when test="@code='fr'">Prénom :</xsl:when>
                      <xsl:when test="@code='en'">First name:</xsl:when>
                      <xsl:otherwise>الاسم:</xsl:otherwise>
                    </xsl:choose>
                  </strong>
                  <span property="foaf:firstName"><xsl:value-of select="identite/prenom"/></span>
                </p>
                <p>
                  <strong>Email:</strong>
                  <a href="mailto:{identite/email}" property="foaf:mbox">
                    <xsl:value-of select="identite/email"/>
                  </a>
                </p>
                <p>
                  <strong>
                    <xsl:choose>
                      <xsl:when test="@code='fr'">Téléphone :</xsl:when>
                      <xsl:when test="@code='en'">Phone:</xsl:when>
                      <xsl:otherwise>الهاتف:</xsl:otherwise>
                    </xsl:choose>
                  </strong>
                  <span property="foaf:phone"><xsl:value-of select="identite/telephone"/></span>
                </p>
                <p>
                  <strong>
                    <xsl:choose>
                      <xsl:when test="@code='fr'">Adresse :</xsl:when>
                      <xsl:when test="@code='en'">Address:</xsl:when>
                      <xsl:otherwise>العنوان:</xsl:otherwise>
                    </xsl:choose>
                  </strong>
                  <span property="foaf:based_near"><xsl:value-of select="identite/adresse"/></span>
                </p>
                <p>
                  <strong>LinkedIn:</strong>
                  <a href="{identite/linkedin}" property="foaf:homepage">
                    <xsl:value-of select="identite/linkedin"/>
                  </a>
                </p>
                <xsl:if test="identite/video">
                  <div class="about__video">
                    <iframe
                      src="{identite/video}"
                      allowfullscreen="allowfullscreen"
                      loading="lazy"
                      frameborder="0"
                      title="YouTube video"></iframe>
                  </div>
                </xsl:if>
              </section>
              <!-- Les autres sections ci-dessous n’ont pas d’annotations RDFa, mais on peut en ajouter au besoin -->
              <section class="section" id="education">
                <h2 class="section-title">
                  <xsl:choose>
                    <xsl:when test="@code='fr'">Formation</xsl:when>
                    <xsl:when test="@code='en'">Education</xsl:when>
                    <xsl:otherwise>التعليم</xsl:otherwise>
                  </xsl:choose>
                </h2>
                <ul>
                  <xsl:for-each select="formation/etape">
                    <li>
                      <strong><xsl:value-of select="@annee"/> : </strong>
                      <xsl:value-of select="."/>
                    </li>
                  </xsl:for-each>
                </ul>
              </section>
              <section class="section" id="experience">
                <h2 class="section-title">
                  <xsl:choose>
                    <xsl:when test="@code='fr'">Expérience</xsl:when>
                    <xsl:when test="@code='en'">Experience</xsl:when>
                    <xsl:otherwise>الخبرة</xsl:otherwise>
                  </xsl:choose>
                </h2>
                <xsl:for-each select="experience/poste">
                  <div>
                    <p><strong><xsl:value-of select="titre"/></strong></p>
                    <p><xsl:value-of select="entreprise"/> - <xsl:value-of select="lieu"/></p>
                    <p><xsl:value-of select="periode"/></p>
                  </div>
                </xsl:for-each>
              </section>
              <section class="section" id="skills">
                <h2 class="section-title">
                  <xsl:choose>
                    <xsl:when test="@code='fr'">Compétences</xsl:when>
                    <xsl:when test="@code='en'">Skills</xsl:when>
                    <xsl:otherwise>المهارات</xsl:otherwise>
                  </xsl:choose>
                </h2>
                <ul>
                  <xsl:for-each select="competences/categorie">
                    <li><strong><xsl:value-of select="@nom"/> : </strong><xsl:value-of select="."/></li>
                  </xsl:for-each>
                </ul>
              </section>
              <section class="section" id="projects">
                <h2 class="section-title">
                  <xsl:choose>
                    <xsl:when test="@code='fr'">Projets</xsl:when>
                    <xsl:when test="@code='en'">Projects</xsl:when>
                    <xsl:otherwise>المشاريع</xsl:otherwise>
                  </xsl:choose>
                </h2>
                <ul>
                  <xsl:for-each select="projets/projet">
                    <li>
                      <strong><xsl:value-of select="titre"/></strong> (<xsl:value-of select="periode"/>)
                      <br/>
                      <span><xsl:value-of select="description"/></span>
                    </li>
                  </xsl:for-each>
                </ul>
              </section>
              <section class="section" id="languages">
                <h2 class="section-title">
                  <xsl:choose>
                    <xsl:when test="@code='fr'">Langues</xsl:when>
                    <xsl:when test="@code='en'">Languages</xsl:when>
                    <xsl:otherwise>اللغات</xsl:otherwise>
                  </xsl:choose>
                </h2>
                <ul>
                  <xsl:for-each select="langues/langue">
                    <li>
                      <strong><xsl:value-of select="@nom"/> : </strong><xsl:value-of select="."/>
                    </li>
                  </xsl:for-each>
                </ul>
              </section>
              <section class="section" id="interests">
                <h2 class="section-title">
                  <xsl:choose>
                    <xsl:when test="@code='fr'">Intérêts</xsl:when>
                    <xsl:when test="@code='en'">Interests</xsl:when>
                    <xsl:otherwise>الاهتمامات</xsl:otherwise>
                  </xsl:choose>
                </h2>
                <ul>
                  <xsl:for-each select="interets/interet">
                    <li><xsl:value-of select="."/></li>
                  </xsl:for-each>
                </ul>
              </section>
            </main>
          </section>
        </xsl:for-each>
        <footer class="footer">
          <xsl:choose>
            <xsl:when test="portfolio/lang[@code='fr']">CV généré avec XSL et XML - Design moderne</xsl:when>
            <xsl:when test="portfolio/lang[@code='en']">CV generated with XSL and XML - Modern Design</xsl:when>
            <xsl:otherwise>سيرة ذاتية مولدة بـ XSL وXML - تصميم عصري</xsl:otherwise>
          </xsl:choose>
        </footer>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>

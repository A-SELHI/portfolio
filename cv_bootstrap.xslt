<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/portfolio">
    <html lang="fr">
      <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Portfolio - Abdelillah SELHI</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
        <style>
          body { background-color: #f0f2f5; }
          .section { padding: 60px 0; }
          .nav-link { color: white !important; }
          .bg-dark-blue { background-color: #1e2a38; }
          .card { border: none; border-radius: 15px; margin-bottom: 20px; }
          footer { background: #1e2a38; color: white; text-align: center; padding: 20px; }
        </style>
      </head>
      <body>
        <!-- Navigation -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark-blue sticky-top">
          <div class="container">
            <a class="navbar-brand" href="#">Abdelillah SELHI</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
              <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="#profil">Profil</a></li>
                <li class="nav-item"><a class="nav-link" href="#formations">Formations</a></li>
                <li class="nav-item"><a class="nav-link" href="#experience">Expériences</a></li>
                <li class="nav-item"><a class="nav-link" href="#competences">Compétences</a></li>
                <li class="nav-item"><a class="nav-link" href="#projets">Projets</a></li>
                <li class="nav-item"><a class="nav-link" href="#langues">Langues</a></li>
                <li class="nav-item"><a class="nav-link" href="#interets">Intérêts</a></li>
              </ul>
            </div>
          </div>
        </nav>

        <!-- Profil -->
        <section class="section bg-light" id="profil">
          <div class="container text-center">
            <h2>Profil</h2>
            <p><strong>Email:</strong> <xsl:value-of select="identite/email"/></p>
            <p><strong>Téléphone:</strong> <xsl:value-of select="identite/telephone"/></p>
            <p><strong>Adresse:</strong> <xsl:value-of select="identite/adresse"/></p>
            <p><strong>LinkedIn:</strong> <xsl:value-of select="identite/linkedin"/></p>
          </div>
        </section>

        <!-- Formations -->
        <section class="section" id="formations">
          <div class="container">
            <h2>Formations</h2>
            <ul class="list-group">
              <xsl:for-each select="formation/etape">
                <li class="list-group-item">
                  <b><xsl:value-of select="@annee"/>:</b> <xsl:value-of select="."/>
                </li>
              </xsl:for-each>
            </ul>
          </div>
        </section>

        <!-- Expériences -->
        <section class="section bg-light" id="experience">
          <div class="container">
            <h2>Expériences Professionnelles</h2>
            <div class="row">
              <xsl:for-each select="experience/poste">
                <div class="col-md-6">
                  <div class="card p-3">
                    <h5><xsl:value-of select="titre"/></h5>
                    <p><xsl:value-of select="entreprise"/> - <xsl:value-of select="periode"/></p>
                    <xsl:if test="lieu"><p><em><xsl:value-of select="lieu"/></em></p></xsl:if>
                  </div>
                </div>
              </xsl:for-each>
            </div>
          </div>
        </section>

        <!-- Compétences -->
        <section class="section" id="competences">
          <div class="container">
            <h2>Compétences</h2>
            <div class="row">
              <xsl:for-each select="competences/categorie">
                <div class="col-md-6">
                  <h5><xsl:value-of select="@nom"/></h5>
                  <p><xsl:value-of select="."/></p>
                </div>
              </xsl:for-each>
            </div>
          </div>
        </section>

        <!-- Projets -->
        <section class="section bg-light" id="projets">
          <div class="container">
            <h2>Projets</h2>
            <ul class="list-group">
              <xsl:for-each select="projets/projet">
                <li class="list-group-item">
                  <b><xsl:value-of select="titre"/></b> - <xsl:value-of select="description"/> (<xsl:value-of select="periode"/>)
                </li>
              </xsl:for-each>
            </ul>
          </div>
        </section>

        <!-- Langues -->
        <section class="section" id="langues">
          <div class="container">
            <h2>Langues</h2>
            <ul class="list-group">
              <xsl:for-each select="langues/langue">
                <li class="list-group-item"><b><xsl:value-of select="@nom"/>:</b> <xsl:value-of select="."/></li>
              </xsl:for-each>
            </ul>
          </div>
        </section>

        <!-- Intérêts -->
        <section class="section bg-light" id="interets">
          <div class="container">
            <h2>Centres d’intérêt</h2>
            <ul class="list-group">
              <xsl:for-each select="interets/interet">
                <li class="list-group-item"><xsl:value-of select="."/></li>
              </xsl:for-each>
            </ul>
          </div>
        </section>

        <!-- Footer -->
        <footer>
           2025 Abdelillah SELHI
        </footer>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>

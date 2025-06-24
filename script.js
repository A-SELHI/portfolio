let currentLang = "fr";

function updateCV() {
  Promise.all([
    fetch('cv.xml').then(r => r.text()).then(str =>
      new window.DOMParser().parseFromString(str, "text/xml")
    ),
    fetch('cv.xsl').then(r => r.text()).then(str =>
      new window.DOMParser().parseFromString(str, "application/xml")
    )
  ]).then(([xml, xsl]) => {
    const processor = new XSLTProcessor();
    processor.importStylesheet(xsl);
    processor.setParameter(null, "lang", currentLang);
    const fragment = processor.transformToFragment(xml, document);
    document.getElementById('cv-content').innerHTML = '';
    document.getElementById('cv-content').appendChild(fragment);

    document.querySelectorAll('.navbar__lang button').forEach(btn => {
      btn.onclick = () => {
        currentLang = btn.dataset.lang;
        updateCV();
      };
    });

    document.querySelectorAll('.navbar__lang button').forEach(btn =>
      btn.classList.toggle('active', btn.dataset.lang === currentLang)
    );

    document.documentElement.setAttribute('lang', currentLang);

    if (currentLang === "ar") {
      document.documentElement.setAttribute('dir', 'rtl');
    } else {
      document.documentElement.setAttribute('dir', 'ltr');
    }

    // Hamburger menu responsive
    const navToggle = document.querySelector('.navbar__toggle');
    const navList = document.querySelector('.nav-list');
    if (navToggle && navList) {
      navToggle.onclick = () => {
        navList.classList.toggle('active');
        navToggle.classList.toggle('open');
      };
      // Ferme le menu quand on clique sur un lien
      navList.querySelectorAll('a').forEach(link => {
        link.onclick = () => {
          navList.classList.remove('active');
          navToggle.classList.remove('open');
        };
      });
    }
  });
}

document.addEventListener('DOMContentLoaded', function() {
  updateCV();
});

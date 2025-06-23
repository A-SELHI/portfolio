window.addEventListener('DOMContentLoaded', function() {
  function setHtmlLang(lang) {
    document.documentElement.setAttribute('lang', lang);
  }

  function showLang(lang) {
    document.querySelectorAll('.lang-block').forEach(block => {
      block.style.display = (block.dataset.lang === lang) ? 'block' : 'none';
    });
    document.body.setAttribute('dir', lang === 'ar' ? 'rtl' : 'ltr');
    setHtmlLang(lang);
  }

  document.querySelectorAll('.lang-btn').forEach(btn => {
    btn.onclick = function() {
      showLang(this.dataset.lang);
      setTimeout(animateSections, 350); // relance anim après changement de langue
    };
  });

  // Apparition animée des sections au scroll
  function animateSections() {
    document.querySelectorAll('.section').forEach(sec => {
      const rect = sec.getBoundingClientRect();
      if(rect.top < window.innerHeight - 80) {
        sec.classList.add('visible');
      }
    });
  }

  window.addEventListener('scroll', animateSections);
  window.addEventListener('DOMContentLoaded', animateSections);

  // show FR by default
  showLang('fr');
});

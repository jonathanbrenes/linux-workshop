/**
 * i18n.js — Language toggle for Linux Adventure Workshop
 * Stores preference in localStorage; defaults to English.
 */
(function () {
  'use strict';

  var STORAGE_KEY = 'linux-workshop-lang';
  var DEFAULT_LANG = 'en';

  // Inject CSS to hide/show language spans
  var style = document.createElement('style');
  style.textContent =
    'html[data-lang="en"] [lang="es"] { display: none !important; }' +
    'html[data-lang="es"] [lang="en"] { display: none !important; }' +
    '.lang-toggle { display:inline-flex; align-items:center; gap:2px; background:rgba(255,255,255,0.08); border:1px solid rgba(255,255,255,0.15); border-radius:8px; padding:3px 4px; font-size:0.8rem; font-weight:600; cursor:pointer; user-select:none; flex-shrink:0; }' +
    '.lang-toggle .lang-opt { padding:4px 10px; border-radius:6px; color:rgba(255,255,255,0.5); transition:all 0.25s ease; text-decoration:none; }' +
    '.lang-toggle .lang-opt.active { background:rgba(63,185,80,0.25); color:#fff; }' +
    '.lang-toggle .lang-opt:hover:not(.active) { color:rgba(255,255,255,0.8); }' +
    /* Light-theme variant (for student-guide, instructor-guide) */
    '.lang-toggle-light { display:inline-flex; align-items:center; gap:2px; background:#f0f0f0; border:1px solid #ccc; border-radius:8px; padding:3px 4px; font-size:9pt; font-weight:600; cursor:pointer; user-select:none; position:fixed; top:12px; right:16px; z-index:9999; }' +
    '.lang-toggle-light .lang-opt { padding:4px 10px; border-radius:6px; color:#888; transition:all 0.25s ease; text-decoration:none; }' +
    '.lang-toggle-light .lang-opt.active { background:#1a1a1a; color:#fff; }' +
    '.lang-toggle-light .lang-opt:hover:not(.active) { color:#333; }' +
    '@media print { .lang-toggle, .lang-toggle-light { display:none !important; } }';
  document.head.appendChild(style);

  // Read stored language
  var lang;
  try { lang = localStorage.getItem(STORAGE_KEY); } catch (e) { /* private browsing */ }
  if (lang !== 'en' && lang !== 'es') lang = DEFAULT_LANG;

  // Apply immediately
  document.documentElement.setAttribute('data-lang', lang);

  // Update toggle buttons UI
  function updateToggleUI() {
    document.querySelectorAll('[data-lang-btn]').forEach(function (btn) {
      btn.classList.toggle('active', btn.getAttribute('data-lang-btn') === lang);
    });
  }

  // Switch language
  window.switchLang = function (newLang) {
    lang = newLang;
    document.documentElement.setAttribute('data-lang', lang);
    try { localStorage.setItem(STORAGE_KEY, lang); } catch (e) { /* ok */ }
    updateToggleUI();
  };

  // Build toggle HTML (returns a DOM element)
  window.buildLangToggle = function (variant) {
    var cls = variant === 'light' ? 'lang-toggle-light' : 'lang-toggle';
    var div = document.createElement('div');
    div.className = cls;
    div.innerHTML =
      '<span class="lang-opt' + (lang === 'en' ? ' active' : '') + '" data-lang-btn="en" onclick="switchLang(\'en\')">EN</span>' +
      '<span class="lang-opt' + (lang === 'es' ? ' active' : '') + '" data-lang-btn="es" onclick="switchLang(\'es\')">ES</span>';
    return div;
  };

  // Auto-inject toggle when DOM is ready
  document.addEventListener('DOMContentLoaded', function () {
    // For dark pages (index, welcome): look for .nav-inner or .nav
    var navInner = document.querySelector('.nav-inner');
    if (navInner) {
      var toggle = buildLangToggle('dark');
      // Insert before the last hidden link or at the end
      navInner.appendChild(toggle);
      return;
    }
    // For slide-based pages (welcome.html): add to the nav area
    var slideNav = document.querySelector('.nav');
    if (slideNav) {
      var toggle = buildLangToggle('dark');
      toggle.style.marginRight = '8px';
      slideNav.insertBefore(toggle, slideNav.firstChild);
      return;
    }
    // For light pages (student-guide, instructor-guide): add fixed toggle
    var toggle = buildLangToggle('light');
    document.body.appendChild(toggle);
  });
})();

html = document.documentElement

# Global namespace
window.UA = {}

# Touch
UA.IS_TOUCH_DEVICE = window.ontouchend != undefined

# Transitions
UA.HAS_TRANSITIONS = false
prefixes = ['Webkit', 'Moz', 'Ms', 'O', 'webkit', 'moz', 'ms', 'o']
for prefix in prefixes
  if html.style["#{prefix}Transition"] != undefined
    html.className += " #{prefix.toLowerCase()}"
    UA.HAS_TRANSITIONS = true
    UA.BROWSER = prefix.toLowerCase()

# SVG
UA.HAS_SVG = !!document.createElementNS && !!document.createElementNS('http://www.w3.org/2000/svg', 'svg').createSVGRect

# Retina
UA.IS_RETINA = `('devicePixelRatio' in window && devicePixelRatio > 1) || ('matchMedia' in window && matchMedia("(min-resolution:144dpi)").matches)`

# HTML classes
html.className = html.className.replace 'no-js', 'js'
html.className += if UA.IS_TOUCH_DEVICE then ' touch' else ' no-touch'
html.className += if UA.HAS_TRANSITIONS then ' transitions' else ' no-transitions'
html.className += if UA.HAS_SVG then ' svg' else ' no-svg'
html.className += if UA.IS_RETINA then ' retina' else ' no-retina'
html.className += ' ios ipad'   if /\bipad\b/i.test navigator.userAgent
html.className += ' ios iphone' if /\biphone\b/i.test navigator.userAgent
if /safari/i.test navigator.userAgent
  html.className += ' safari-4' if /version\/4/i.test navigator.userAgent
  html.className += ' safari-5' if /version\/5/i.test navigator.userAgent
html.className += ' firefox-3' if /firefox\/3/i.test navigator.userAgent

# HTML5 Shiv
for elem in ['article', 'aside', 'canvas', 'details', 'figcaption', 'figure', 'footer', 'header', 'hgroup', 'main', 'mark', 'menu', 'nav', 'section', 'summary', 'time']
  document.createElement elem

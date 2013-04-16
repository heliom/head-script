html = document.documentElement

# Global namespace
window.App = {}

# Touch
App.IS_TOUCH_DEVICE = window.ontouchend != undefined

# Transitions
App.HAS_TRANSITIONS = false
prefixes = ['webkit', 'Moz', 'Ms', 'O']
for prefix in prefixes
  if html.style["#{prefix}Transition"] != undefined
    html.className += " #{prefix.toLowerCase()}"
    App.HAS_TRANSITIONS = true
    App.BROWSER = prefix.toLowerCase()

# SVG
App.HAS_SVG = !!document.createElementNS && !!document.createElementNS('http://www.w3.org/2000/svg', 'svg').createSVGRect

# Retina
App.IS_RETINA = `('devicePixelRatio' in window && devicePixelRatio > 1) || ('matchMedia' in window && matchMedia("(min-resolution:144dpi)").matches)`

# HTML classes
html.className = html.className.replace 'no-js', 'js'
html.className += if App.IS_TOUCH_DEVICE then ' touch' else ' no-touch'
html.className += if App.HAS_TRANSITIONS then ' transitions' else ' no-transitions'
html.className += if App.HAS_SVG then ' svg' else ' no-svg'
html.className += if App.IS_RETINA then ' retina' else ' no-retina'
html.className += ' ios ipad'   if /\bipad\b/i.test navigator.userAgent
html.className += ' ios iphone' if /\biphone\b/i.test navigator.userAgent
if /safari/i.test navigator.userAgent
  html.className += ' safari-4' if /version\/4/i.test navigator.userAgent
  html.className += ' safari-5' if /version\/5/i.test navigator.userAgent
html.className += ' firefox-3' if /firefox\/3/i.test navigator.userAgent

# HTML5 Shiv
for elem in ['article', 'aside', 'canvas', 'details', 'figcaption', 'figure', 'footer', 'header', 'hgroup', 'mark', 'menu', 'nav', 'section', 'summary', 'time']
  document.createElement elem

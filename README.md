Our own tiny homemade Modernizr.

## Usage
- Use in `<head>`

### Rails / Rack / Sprockets
```rb
<%= javascript_include_tag "head_script" %>
```

### Sinatra
See https://gist.github.com/3912564

## Features
- No dependency
- HTML5 shiv
- Detections (add class to HTML and JavaScript helper)
  - Browser
  - Has transitions?
  - Has svg?
  - Is retina?
  - Is touch device?

![Example](https://raw.github.com/heliom/head-script/master/etc/images/example.png)

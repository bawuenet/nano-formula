---
{% from "nano/map.jinja" import nano with context %}

nano_syntax_highlight_checkout:
  git.cloned:
    - name: https://github.com/scopatz/nanorc.git
    - target: {{ nano.highlight_dir }}
    - user: root

{% for file in salt['file.find'](nano.highlight_dir, type='f', name='*.nanorc') %}
{% basename = file.split('/') | last %}
{% type = basename.split('.') | first %}
nano_syntax_highlight_activate_{{ type }}:
  file.line:
    - name: {{ nanorc }}
    - content: include {{ nano.highlight_dir ~ '/' ~ file }}
    - mode: ensure
    - location: end
    - create: true
{% endfor %}

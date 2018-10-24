{% from "nano/map.jinja" import nano with context %}

nano:
  pkg.purged:
    - name: {{ nano.pkg }}

nano_config:
  file.missing:
    - name: {{ nano.nanorc }}

nano_syntax_highlight:
  file.missing:
    - name: {{ nano.highlight_dir }}

# Include :download:`map file <map.jinja>` of OS-specific package names and
# file paths. Values can be overridden using Pillar.
{% from "ntp/map.jinja" import ntp with context %}

ntp:
  pkg.installed:
    - name: {{ ntp.client }}

{{ ntp.ntp_conf }}:
  file.managed:
    - name: {{ ntp.ntp_conf }}
    - template: jinja
    - source: {{ ntp.ntp_conf_source }}
    - require:
      - pkg: ntp

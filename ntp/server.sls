{% from "ntp/map.jinja" import ntp with context %}

include:
  - ntp

ntpd:
  service.running:
    - name: {{ ntp.service }}
    - enable: True
    - require:
      - pkg: ntp
    - watch:
      - file: {{ ntp.ntp_conf }}

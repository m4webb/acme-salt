/etc/realmd.conf:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://_static/realmd.conf

BYU.LOCAL:
  realm.joined:
    - principal: m4webb
    - keytab_url: salt://_static/m4webb.keytab
    - require:
      - file: /etc/realmd.conf

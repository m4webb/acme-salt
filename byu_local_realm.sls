BYU.LOCAL:
  realm.joined:
    - principal: m4webb
    - keytab_url: salt://_static/m4webb.keytab
    - require:
      - file: /etc/krb5.conf

sssd:
  service.running:
    - enable: True
    - require: 
      - file: /etc/sssd/sssd.conf
      - realm: BYU.LOCAL
      - service: oddjobd

/etc/krb5.conf:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://_static/krb5.conf

/etc/sssd/sssd.conf:
  file.managed:
    - user: root
    - group: root
    - mode: 600
    - source: salt://_static/sssd.conf

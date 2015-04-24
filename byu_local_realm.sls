BYU.LOCAL:
  realm.joined:
    - principal: m4webb
    - keytab_url: salt://_static/m4webb.keytab
    - require:
      - file: /etc/krb5.conf
      - file: /etc/samba/smb.conf
      - file: /etc/sssd/sssd.conf
  sss.enabled:
    - require:
      - file: /etc/krb5.conf
      - file: /etc/samba/smb.conf
      - file: /etc/sssd/sssd.conf

sssd:
  service.running:
    - enable: True
    - require: 
      - file: /etc/krb5.conf
      - file: /etc/samba/smb.conf
      - file: /etc/sssd/sssd.conf
      - service: oddjobd

oddjobd:
  service.running:
    - enable: True

/etc/krb5.conf:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://_static/krb5.conf

/etc/samba/smb.conf:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://_static/smb.conf

/etc/sssd/sssd.conf:
  file.managed:
    - user: root
    - group: root
    - mode: 600
    - source: salt://_static/sssd.conf

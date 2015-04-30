BYU.LOCAL:
  realm.joined:
    - principal: m4webb
    - keytab_url: salt://_static/m4webb.keytab
    - require:
      - mount: /home/byu.local

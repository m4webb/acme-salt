public.xml:
  file.managed:
    - name: /etc/firewalld/zones/public.xml
    - source: salt://_static/firewalld/zones/public.xml
    - user: root
    - group: root
    - mode: 640
    - makedirs: True

trusted.xml:
  file.managed:
    - name: /etc/firewalld/zones/trusted.xml
    - source: salt://_static/firewalld/zones/trusted.xml
    - user: root
    - group: root
    - mode: 640
    - makedirs: True

firewalld-reload:
  cmd.run:
    - name: firewall-cmd --reload
    - order: last

mpi.xml:
  file.managed:
    - name: /etc/firewalld/services/mpi.xml
    - source: salt://_static/firewalld/services/mpi.xml
    - user: root
    - group: root
    - mode: 640
    - makedirs: True

public.xml:
  file.managed:
    - name: /etc/firewalld/zones/public.xml
    - source: salt://_static/firewalld/zones/public.xml
    - user: root
    - group: root
    - mode: 640
    - makedirs: True

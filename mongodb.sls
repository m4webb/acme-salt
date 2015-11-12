pymongo:
  anaconda.installed:
    - require:
      - anaconda: anaconda-distribution

/etc/yum.repos.d/mongodb-org-3.0.repo:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://_static/mongodb-org-3.0.repo

mongodb-org:
  pkg.installed:
    - require:
      - file: /etc/yum.repos.d/mongodb-org-3.0.repo

mongod:
  service.running:
    - enable: True
    - reload: True
    - watch:
      - pkg: mongodb-org
    - require:
      - pkg: mongodb-org

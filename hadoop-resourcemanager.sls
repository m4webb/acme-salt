/etc/systemd/system/hadoop-resourcemanager.service:
  file.managed:
    - source: salt://_static/hadoop/hadoop-resourcemanager.service
    - user: root
    - group: root
    - mode: 644

/etc/systemd/system/multi-user.target.wants/hadoop-resourcemanager.service:
  file.symlink:
    - target: /etc/systemd/system/hadoop-resourcemanager.service

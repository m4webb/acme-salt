/etc/systemd/system/hadoop-nodemanager.service:
  file.managed:
    - source: salt://_static/hadoop/hadoop-nodemanager.service
    - user: root
    - group: root
    - mode: 644

/etc/systemd/system/multi-user.target.wants/hadoop-nodemanager.service:
  file.symlink:
    - target: /etc/systemd/system/hadoop-nodemanager.service

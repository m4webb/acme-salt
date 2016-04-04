/etc/systemd/system/hadoop-datanode.service:
  file.managed:
    - source: salt://_static/hadoop/hadoop-datanode.service
    - user: root
    - group: root
    - mode: 644

/etc/systemd/system/multi-user.target.wants/hadoop-datanode.service:
  file.symlink:
    - target: /etc/systemd/system/hadoop-datanode.service

/hadoop-name:
  file.directory:
    - user: hadoop
    - group: hadoop
    - mode: 700
    - makedirs: True
    
/etc/systemd/system/hadoop-namenode.service:
  file.managed:
    - source: salt://_static/hadoop/hadoop-namenode.service
    - user: root
    - group: root
    - mode: 644

/etc/systemd/system/multi-user.target.wants/hadoop-namenode.service:
  file.symlink:
    - target: /etc/systemd/system/hadoop-namenode.service

hadoop-group:
  group.present:
    - name: hadoop
    - gid: 1101

hadoop-user:
  user.present:
    - name: hadoop
    - home: /home/hadoop
    - shell: /bin/bash
    - uid: 1101
    - gid: 1101
    - empty_password: True
    - require:
        - group: hadoop-group

/hadoop-data:
  file.directory:
    - user: hadoop
    - group: hadoop
    - mode: 700
    - makedirs: True

/home/hadoop/hadoop-2.7.2.tar.gz:
  file.managed:
    - source: http://friedrich.byu.edu/bootstrap/hadoop-2.7.2.tar.gz
    - source_hash: "sha256=49ad740f85d27fa39e744eb9e3b1d9442ae63d62720f0aabdae7aa9a718b03f7"
    - user: hadoop
    - group: hadoop
    - mode: 644

hadoop-unzip:
  cmd.run:
    - name: tar -xvf /home/hadoop/hadoop-2.7.2.tar.gz
    - unless: test -d /home/hadoop/hadoop-2.7.2
    - cwd: /home/hadoop
    - user: hadoop
    - group: hadoop
    - require:
      - file: /home/hadoop/hadoop-2.7.2.tar.gz

/home/hadoop/hadoop-2.7.2/etc/hadoop/hdfs-site.xml:
  file.managed:
    - source: salt://_static/hadoop/hdfs-site.xml
    - user: hadoop
    - group: hadoop
    - mode: 644
    - require:
        - cmd: hadoop-unzip

/home/hadoop/hadoop-2.7.2/etc/hadoop/yarn-site.xml:
  file.managed:
    - source: salt://_static/hadoop/yarn-site.xml
    - user: hadoop
    - group: hadoop
    - mode: 644
    - require:
        - cmd: hadoop-unzip

/home/hadoop/hadoop-2.7.2/etc/hadoop/core-site.xml:
  file.managed:
    - source: salt://_static/hadoop/core-site.xml
    - user: hadoop
    - group: hadoop
    - mode: 644
    - require:
        - cmd: hadoop-unzip

/home/hadoop/hadoop-2.7.2/etc/hadoop/hadoop-env.sh:
  file.managed:
    - source: salt://_static/hadoop/hadoop-env.sh
    - user: hadoop
    - group: hadoop
    - mode: 644
    - require:
        - cmd: hadoop-unzip

/home/byu.local:
  mount.mounted:
    - device: 10.18.32.52:/home/byu.local
    - fstype: nfs4
    - opts: context=unconfined_u:object_r:user_home_t:s0
    - mkmnt: True

/home/local:
  file.directory:
    - user: root
    - group: root
    - mode: 777
    - makedirs: True

/usr/bin/tc-nfs-throttle:
  file.managed:
    - source: salt://_static/tc-nfs-throttle
    - user: root
    - group: root
    - mode: 700

/etc/systemd/system/tc-nfs-throttle.service:
  file.managed:
    - source: salt://_static/tc-nfs-throttle.service
    - user: root
    - group: root
    - mode: 644

/etc/systemd/system/multi-user.target.wants/tc-nfs-throttle.service:
  file.symlink:
    - target: /etc/systemd/system/tc-nfs-throttle.service

/etc/profile.d/local-drive.sh:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://_static/local-drive.sh

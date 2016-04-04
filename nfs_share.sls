/acmeshare:
  mount.mounted:
    - device: 10.18.32.52:/home/byu.local
    - fstype: nfs4
    - opts: context=unconfined_u:object_r:user_home_t:s0
    - mkmnt: True

/home/local:
  file.absent

/usr/bin/tc-nfs-throttle:
  file.absent

/etc/systemd/system/tc-nfs-throttle.service:
  file.absent

/etc/systemd/system/multi-user.target.wants/tc-nfs-throttle.service:
  file.absent

/etc/profile.d/local-drive.sh:
  file.absent

/etc/profile.d/acmeshare.sh:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://_static/acmeshare.sh

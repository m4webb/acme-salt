/home/byu.local:
  mount.mounted:
    - device: 10.18.32.52:/home/byu.local
    - fstype: nfs
    - opts: context=unconfined_u:object_r:user_home_t:s0
    - mkmnt: True

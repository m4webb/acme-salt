base:
  '*':
    - anaconda
    - acme_python_packages
    - acme_system_packages
    - byu_local_realm
    - nfs_share
    - misc
    - firewalld
    - other_users
    - mongodb
    - grub_fix
    - mpiuser
    - hadoop
    - hadoop-datanode
    - hadoop-nodemanager
  'acme01.byu.edu':
    - hadoop-namenode
  'acme02.byu.edu':
    - hadoop-resourcemanager

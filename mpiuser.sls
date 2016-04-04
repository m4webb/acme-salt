mpiuser-group:
  group.present:
    - name: mpiuser
    - gid: 1100

mpiuser-user:
  user.present:
    - name: mpiuser
    - home: /home/mpiuser
    - shell: /bin/bash
    - uid: 1100
    - gid: 1100
    - password: $6$137439afcb86a1a0$3lGmxwta12Or00spvVhFKrQaSC2hDD2ExxZMStWkb/c43T7nOPJeHmI90HsiQSBsFR76rrFKLQoYUn.63Etmy0 
    - enforce_password: True
    - require:
        - group: mpiuser-group

mpiuser-ssh-dir:
  file.directory:
    - name: /home/mpiuser/.ssh
    - user: mpiuser
    - group: mpiuser
    - mode: 700
    - makedirs: True
    - require:
        - user: mpiuser-user

/home/mpiuser/.ssh/authorized_keys:
  file.managed:
    - source: salt://_static/mpiuser.pub
    - user: mpiuser
    - group: mpiuser
    - mode: 600
    - require: 
        - file: mpiuser-ssh-dir

/home/mpiuser/.bash_profile:
  file.managed:
    - source: salt://_static/mpiuser_bash_profile
    - user: mpiuser
    - group: mpiuser
    - mode: 644
    - require: 
        - user: mpiuser-user

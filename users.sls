acmeuser-group:
  group.present:
    - name: acmeuser
    - gid: 1001

acmeuser-user:
  user.present:
    - name: acmeuser
    - home: /home/acmeuser
    - shell: /bin/bash
    - uid: 1001
    - gid: 1001
    - password: $6$aBPIC8a3$a8ZOz3PXmzvRXaMcq1U.2PYKqMFZ/26OLRhDhl08CJ9aC39ofFDHmJChAa6uI7ZKww2uBa4XMS8/ToROAumYo/ 
    - enforce_password: True
    - require:
        - group: acmeuser-group

# user list for gdm is buggy, disable it
/etc/dconf/db/gdm.d/01-acme-custom:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://_static/01-acme-custom

update-dconf:
  cmd.run:
    - name: dconf update
    - require:
      - file: /etc/dconf/db/gdm.d/01-acme-custom

# known selinux issue for sssd/ad
/etc/selinux/targeted/modules/active/modules/sssd-gpo_child.pp:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://_static/sssd-gpo_child.pp

/etc/ssh/ssh_config:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://_static/ssh_config

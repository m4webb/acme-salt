yum-update:
  cmd.run:
    - name: yum -y update
    - order: last

yum-rhscl-repo:
  cmd.run:
    - name: yum-config-manager --enable rhel-workstation-rhscl-7-rpms

vim-enhanced:
  pkg.installed

git:
  pkg.installed

texlive:
  pkg.installed

devtoolset-3:
  pkg.installed:
    - require:
        - cmd: yum-rhscl-repo

google-chrome-stable:
  pkg.installed:
    - skip_verify: True # hosted locally
    - sources:
      - google-chrome-stable: http://10.18.32.52/bootstrap/google-chrome-stable_current_x86_64.rpm

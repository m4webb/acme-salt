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

bluefish:
  pkg.installed

geany:
  pkg.installed

emacs:
  pkg.installed

openmpi:
  pkg.installed

gsl:
  pkg.installed

htop:
  pkg.installed

iptraf-ng:
  pkg.installed

devtoolset-3:
  pkg.installed:
    - require:
      - cmd: yum-rhscl-repo

gcc-c++:
  pkg.installed:
    - require:
      - pkg: devtoolset-3

google-chrome-stable:
  pkg.installed:
    - skip_verify: True # hosted locally
    - sources:
      - google-chrome-stable: http://10.18.32.52/bootstrap/google-chrome-stable_current_x86_64.rpm

google-chrome-selinux:
  cmd.run:
    - name: setsebool -P unconfined_chrome_sandbox_transition 0
    - require:
      - pkg: google-chrome-stable

yum-update:
  cmd.run:
    - name: yum update
    - order: last

vim-enhanced:
  pkg.installed

git:
  pkg.installed

texlive:
  pkg.installed

devtoolset-3:
  pkg.installed

google-chrome-stable:
  pkg.installed:
    - skip_verify: True # hosted locally
    - sources:
      - google-chrome-stable: http://10.18.32.52/bootstrap/google-chrome-stable_current_x86_64.rpm

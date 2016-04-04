# grub menu not updating correctly from 7.1 to 7.2
update-grub:
  cmd.run:
    - name: grub2-mkconfig --output=/boot/grub2/grub.cfg
    - require:
      - cmd: yum-update

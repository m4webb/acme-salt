anaconda-distribution:
  anaconda.distribution:
    - name: /usr/local/anaconda

anaconda-update:
  cmd.run:
    - name: |
        /usr/local/anaconda/bin/conda update --yes conda
        /usr/local/anaconda/bin/conda update --yes anaconda
    - require:
      - anaconda: anaconda-distribution

/etc/profile.d/anaconda.sh:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://_static/anaconda.sh

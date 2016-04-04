anaconda-distribution:
  anaconda.distribution:
    - name: /usr/local/anaconda

anaconda-update-conda:
  cmd.run:
    - name: /usr/local/anaconda/bin/conda update --yes conda
    - require:
      - anaconda: anaconda-distribution
    - order: last

anaconda-update-anaconda:
  cmd.run:
    - name: /usr/local/anaconda/bin/conda update --yes anaconda
    - require:
      - anaconda: anaconda-distribution
      - cmd: anaconda-update-conda
    - order: last

anaconda-update-all:
  cmd.run:
    - name: /usr/local/anaconda/bin/conda update --yes --all 
    - require:
      - anaconda: anaconda-distribution
      - cmd: anaconda-update-conda
    - order: last

/etc/profile.d/anaconda.sh:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://_static/anaconda.sh

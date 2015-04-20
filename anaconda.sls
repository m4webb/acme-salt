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

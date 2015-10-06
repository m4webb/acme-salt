mkl:
  anaconda.installed:
    - require:
      - anaconda: anaconda-distribution
iopro:
  anaconda.installed:
    - require:
      - anaconda: anaconda-distribution

numbapro:
  anaconda.installed:
    - require:
      - anaconda: anaconda-distribution

mayavi:
  anaconda.installed:
    - require:
      - anaconda: anaconda-distribution

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

cvxopt:
  anaconda.installed:
    - require:
      - anaconda: anaconda-distribution

selenium:
  anaconda.installed:
    - pip: True
    - require:
      - anaconda: anaconda-distribution

pytest:
  anaconda.installed:
    - require:
      - anaconda: anaconda-distribution

pytest-cov:
  anaconda.installed:
    - pip: True
    - require:
      - anaconda: anaconda-distribution

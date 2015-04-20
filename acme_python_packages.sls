anaconda-license:
  file.managed:
    - name: /root/.continuum/license_academic_20150312121859.txt
    - source: salt://_static/license_academic_20150312121859.txt
    - user: root
    - group: root
    - mode: 600
    - makedirs: True

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

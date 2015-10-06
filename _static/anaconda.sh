# Academic license for numbapro, mkl, iopro
if ! [ -d ~/.continuum/anaconda_academic_license.txt ];
then
    if ! [ -d ~/.continuum ];
    then
        mkdir ~/.continuum
    fi
    curl -s friedrich.byu.edu/bootstrap/license_academic.txt\
        > ~/.continuum/license_academic.txt
fi

PATH=/usr/local/anaconda/bin:${PATH}
export PATH


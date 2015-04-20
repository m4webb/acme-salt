import os
import urllib2
import tempfile
import subprocess

ANACONDA_INSTALLER_URL = \
        'http://10.18.32.52/bootstrap/Anaconda-2.1.0-Linux-x86_64.sh'

def installed(name, pip=False, **kwargs):
    ret = {'name' : name, 'comment' : '', 'changes' : ''} 
    if pip:
        ret['result'] = __salt__['anaconda.pip_install'](name)
    else:
        ret['result'] = __salt__['anaconda.install'](name)
    return ret

def removed(name, pip=False, **kwargs):
    ret = {'name' : name, 'comment' : '', 'changes' : ''} 
    if pip:
        ret['result'] = __salt__['anaconda.pip_remove'](name)
    else:
        ret['result'] = __salt__['anaconda.remove'](name)
    return ret

def distribution(name, **kwargs):
    ret = {}
    ret['name'] = name
    if os.path.exists(name):
        ret['comment'] = 'Anaconda distribution already installed'
        ret['changes'] = ''
        ret['result'] = True
    else:
        try:
            req = urllib2.urlopen(ANACONDA_INSTALLER_URL)
        except urllib2.HTTPError:
            ret['comment'] = 'Could not retrieve url ' \
                    '{}'.format(ANACONDA_INSTALLER_URL)
            ret['changes'] = ''
            ret['result'] = False
        with tempfile.NamedTemporaryFile(suffix='.sh') as tf:
            chunk = req.read(1024*100)
            while chunk:
                tf.write(chunk)
                chunk = req.read(1024*100)
            req.close()
            tf.file.flush()
            retcode = subprocess.call(['bash', tf.name, '-b', '-p', name])
        if retcode == 0:
            ret['comment'] = 'Anaconda distribution installed.'
            ret['changes'] = ''
            ret['result'] = True
        else:
            ret['comment'] = 'Failure on installation'
            ret['changes'] = ''
            ret['result'] = False
    return ret

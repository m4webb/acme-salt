'''
Anaconda package management.

'''

CONDA = "/usr/local/anaconda/bin/conda"
PIP = "/usr/local/anaconda/bin/pip"

def install(name, **kwargs):
    cmd = [CONDA, 'install', '--yes', name]
    return _cmd_run(cmd) == 0

def remove(name, **kwargs):
    cmd = [CONDA, 'remove', '--yes', name]
    return _cmd_run(cmd) == 0

def update(name, **kwargs):
    cmd = [CONDA, 'update', name]
    return _cmd_run(cmd) == 0

def pip_install(name, **kwargs):
    cmd = [PIP, 'install', '--update', name]
    return _cmd_run(cmd) == 0

def pip_remove(name, **kwargs):
    cmd = [PIP, 'uninstall', '--yes', name]
    return _cmd_run(cmd) == 0

def _cmd_run(cmd):
    ret = __salt__['cmd.run_all'](' '.join(cmd))
    return ret['retcode']

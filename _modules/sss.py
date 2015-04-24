import subprocess

def enabled():
    proc = subprocess.Popen(['authconfig', '--test'], stdout=subprocess.PIPE)
    out, err = proc.communicate()
    return 'nss_sss is enabled' in out

def enable():
    proc = subprocess.Popen(['authconfig', '--enablesssdauth', '--update'],
            stdout=subprocess.PIPE)
    out, err = proc.communicate()
    return err == 0

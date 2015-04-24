import tempfile
import subprocess

def join(name, principal, keytab_url):
    keytab_contents = __salt__['cp.get_file_str'](keytab_url)
    with tempfile.NamedTemporaryFile(suffix='.keytab') as tf:
        tf.write(keytab_contents)
        tf.file.flush()
        retcode = subprocess.call(['kinit', '{}@{}'.format(principal, name),
                '-k', '-t', tf.name])
        if retcode:
            return False
        retcode = subprocess.call(['net', 'ads', 'join', '-k'])
        if retcode:
            return False
    return True

def is_joined(name, principal, keytab_url):
    keytab_contents = __salt__['cp.get_file_str'](keytab_url)
    with tempfile.NamedTemporaryFile(suffix='.keytab') as tf:
        tf.write(keytab_contents)
        tf.file.flush()
        retcode = subprocess.call(['kinit', '{}@{}'.format(principal, name),
                '-k', '-t', tf.name])
        if retcode:
            return False
        proc = subprocess.Popen(['net', 'ads', 'status'],
                stdout=subprocess.PIPE)
        out, err = proc.communicate()
        if retcode:
            return False
    return True

def sss_enabled():
    proc = subprocess.Popen(['authconfig', '--test'], stdout=subprocess.PIPE)
    out, err = proc.communicate()
    return 'nss_sss is enabled' in out

def sss_enable():
    proc = subprocess.Popen(['authconfig', '--enablesssdauth', '--update'],
            stdout=subprocess.PIPE)
    out, err = proc.communicate()
    return err == 0

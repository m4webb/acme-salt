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
        retcode = subprocess.call(['realm', 'join', name])
        if retcode:
            return False
    return True

def is_joined(name):
    proc = subprocess.Popen(['realm', 'list'], stdout=subprocess.PIPE)
    out, err = proc.communicate()
    return name in out

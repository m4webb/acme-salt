def joined(name, principal='admin', keytab_url='salt://_static/admin.keytab',
        **kwargs):
    ret = {}
    ret['name'] = name
    ret['changes'] = ''
    if not __salt__['realm.is_joined'](name):
        ret['result'] = __salt__['realm.join'](name, principal, keytab_url)
        if ret['result'] and __salt__['realm.is_joined'](name):
            ret['comment'] = 'Successfully joined {}'.format(name)
        else:
            ret['result'] = False
            ret['comment'] = 'Could not join {}'.format(name)
    else:
        ret['result'] = True
        ret['comment'] = 'Already joined to {}'.format(name)
    return ret

def sss_enabled(name, **kwargs):
    ret = {}
    ret['name'] = name
    ret['changes'] = ''
    if not __salt__['realm.sss_enabled']():
        ret['result'] = __salt__['realm.sss_enable']()
        if ret['result'] and __salt__['realm.sss_enabled']():
            ret['comment'] = 'Successfully enabled sss'
        else:
            ret['result'] = False
            ret['comment'] = 'Could not enable sss'
    else:
        ret['result'] = True
        ret['comment'] = 'Already enabled sss'

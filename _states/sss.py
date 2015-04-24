def enabled(name, **kwargs):
    ret = {}
    ret['name'] = name
    ret['changes'] = ''
    if not __salt__['sss.enabled']():
        ret['result'] = __salt__['sss.enable']()
        if ret['result'] and __salt__['sss.enabled']():
            ret['comment'] = 'Successfully enabled sss'
        else:
            ret['result'] = False
            ret['comment'] = 'Could not enable sss'
    else:
        ret['result'] = True
        ret['comment'] = 'Already enabled sss'
    return ret

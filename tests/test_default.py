import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    '.molecule/ansible_inventory').get_hosts('all')


def test_prosody_running_and_enabled(Service):
    prosody = Service("prosody")
    assert prosody.is_running
    assert prosody.is_enabled

ansible-role-prosody
=========
[![Build Status](https://github.com/systemli/ansible-role-prosody/workflows/Integration/badge.svg?branch=main)](https://github.com/systemli/ansible-role-prosody/actions?query=workflow%3AIntegration)
[![Ansible Galaxy](http://img.shields.io/badge/ansible--galaxy-prosody-blue.svg)](https://galaxy.ansible.com/systemli/prosody/)
[![IM observatory](https://check.messaging.one/badge.php?domain=jabber.systemli.org)](https://check.messaging.one/result.php?domain=jabber.systemli.org&amp;type=client)
<a href='https://compliance.conversations.im/server/jabber.systemli.org'><img src='https://compliance.conversations.im/badge/jabber.systemli.org'></a>


Install and maintain [Prosody](http://prosody.im/) from official repo with Ansible.
Per default, this role also installs munin-node to monitor Prosody.
Tested with Molecule, Docker, Vagrant and TravisCI.

Requirements
------------

Debian 10. Other versions of Debian/Ubuntu might be supported as well, but aren't tested.

Role Variables
--------------

see `defaults/main.yml`

Dependencies
------------

 - [systemli.apt_repositories](https://galaxy.ansible.com/systemli/apt_repositories)

Download
--------

Download latest release with `ansible-galaxy`

	ansible-galaxy install systemli.prosody

Example Playbook
----------------

```
- hosts: servers
  roles:
    - systemli.prosody
  vars:
    prosody_virtual_hosts:
      - name: example.net
        key: |
          -----BEGIN PRIVATE KEY-----
            ...
          -----END PRIVATE KEY-----
        cert: |
            -----BEGIN CERTIFICATE-----
              ...
            -----END CERTIFICATE-----
      - name: x5tno6mwkncu4m2h.onion
        admins: ["admin@x5tno6mwkncu4m2h.onion"]
```

You would need a configured Tor onion service for this.
Look at [systemli.onion](https://github.com/systemli/ansible-role-onion).

You can also combine it with [systemli.letsencrypt](https://github.com/systemli/ansible-role-letsencrypt/) to automatically configure certs.

```
- hosts: servers
  roles:
    - systemli.letsencrypt
    - systemli.prosody
  vars:
    prosody_vhost: example.net
    letsencrypt_cert:
      name: example.net
      domains:
        - example.net
        - conference.example.net
        - proxy.example.net
        - pubsub.example.net
      challenge: dns
      renew_hook: "/usr/bin/prosodyctl --root cert import /etc/letsencrypt/live/"
```

Tests
-----

Run local tests with
```
molecule test
```
Requires Molecule, Vagrant and `python-vagrant` to be installed.

License
-------

GPL

Author Information
------------------

https://www.systemli.org

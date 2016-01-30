ansible-role-prosody
=========
[![Build Status](https://travis-ci.org/systemli/ansible-role-prosody.svg?branch=master)](https://travis-ci.org/systemli/ansible-role-prosody)
[![xmpp.net score](https://xmpp.net/badge.php?domain=jabber.systemli.org)](https://xmpp.net/result.php?domain=jabber.systemli.org&type=client)


Install and maintain [Prosody](http://prosody.im/) from offical repo with Ansible.
Contains tests for Travis CI and Vagrant.

Requirements
------------

Debian or Ubuntu.
Vagrant for testing.

Role Variables
--------------

```
prosody_vhost: localhost

prosody_admins: ['admin',]
prosody_debug_mode: False
prosody_authentication: internal_hashed

prosody_ssl_cert: /etc/prosody/certs/localhost.crt
prosody_ssl_key: /etc/prosody/certs/localhost.key
prosody_dhparam_length: 2048

prosody_welcome_msg:  "Hello $username, welcome to the $host IM server!" 

prosody_motd: False

prosody_mod_register_redirect_registration_whitelist: ""
prosody_mod_register_redirect_registration_url: "https://localhost:5281/register_web"
prosody_mod_register_redirect_text: "To register please visit {{ prosody_mod_register_redirect_registration_url}}"

prosody_external_modules:
  - smacks
  - register_web
  - reload_modules
  - s2s_auth_compat
  - lastlog
  - list_inactive
  - register_redirect
  - motd_once
  - c2s_limit_sessions
  - log_sasl_mech
  - query_client_ver
  - csi
  - throttle_presence
  - filter_chatstates
  - host_guard
  - carbons

prosody_s2s_blacklist:
  - buycc.me
  - validcc-notifier.su

prosody_blacklist: []
```

Example Playbook
----------------

    - hosts: servers
      roles:
        - systemli.prosody
      vars:
        prosody_vhost: example.net
        prosody_ssl_key: |
          -----BEGIN PRIVATE KEY-----
            ...
          -----END PRIVATE KEY-----
        prosody_ssl_cert: |
          -----BEGIN CERTIFICATE-----
            ...
          -----END CERTIFICATE-----
        prosody_onion_vhost: x5tno6mwkncu4m2h.onion


You would need a configured Tor onion service for this.
Look at https://github.com/systemli/ansible-role-hidden-service


License
-------

GPL

Author Information
------------------

https://www.systemli.org

ansible-role-prosody
=========
[![Build Status](https://travis-ci.org/systemli/ansible-role-prosody.svg?branch=master)](https://travis-ci.org/systemli/ansible-role-prosody) [![Ansible Galaxy](http://img.shields.io/badge/ansible--galaxy-prosody-blue.svg)](https://galaxy.ansible.com/systemli/prosody/) [![xmpp.net score](https://xmpp.net/badge.php?domain=jabber.systemli.org)](https://xmpp.net/result.php?domain=jabber.systemli.org&type=client)


Install and maintain [Prosody](http://prosody.im/) from offical repo with Ansible.
Per default, this role also installs monit and munin-node to monitor Prosody. 
Contains tests for Travis CI and Molecule.

Requirements
------------

Debian or Ubuntu.
Molecule, Tox and Docker for testing.

Role Variables
--------------

```
prosody_vhost: localhost

prosody_admins: ['admin',]
prosody_debug_mode: False
prosody_authentication: internal_hashed
prosody_dhparam_length: 2048
prosody_monitoring: True
prosody_welcome_msg:  "Hello $username, welcome to the $host IM server!"
prosody_test: False
prosody_motd: False

prosody_custom_registration_theme: False
prosody_custom_registration_theme_repo: "https://github.com/beli3ver/Prosody-Web-Registration-Theme.git"
prosody_custom_registration_theme_path: "/etc/prosody/register-templates/Prosody-Web-Registration-Theme"

prosody_mod_register_redirect_registration_whitelist: ""
prosody_mod_register_redirect_registration_url: "https://localhost:5281/register_web"
prosody_mod_register_redirect_text: "To register please visit {{ prosody_mod_register_redirect_registration_url}}"

prosody_external_modules:
  - auto_activate_hosts
  - blocking
  - c2s_conn_throttle
  - c2s_limit_sessions
  - carbons
  - cloud_notify
  - csi
  - filter_chatstates
  - host_guard
  - http_upload
  - lastlog
  - limit_auth
  - limits
  - list_inactive
  - log_sasl_mech
  - mam
  - motd_once
  - reload_modules
  - register_redirect
  - register_web
  - s2s_auth_compat
  - smacks
  - throttle_presence

prosody_external_modules_dir: /usr/share/prosody-modules

prosody_s2s_blacklist:
  - buycc.me
  - validcc-notifier.su

prosody_blacklist: []

prosody_limits_c2s_rate: "3kb/s"
prosody_limits_c2s_burst: "2s"

prosody_mam_default_archive_policy: "false"

prosody_http_upload_file_size_limit: 1048576 # 1MB
prosody_http_upload_expire_after: 2592000 # 30 days in seconds
prosody_http_upload_quota: 52428800 # 50MB
```

Download
--------

Download latest release with `ansible-galaxy`

	ansible-galaxy install systemli.prosody

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

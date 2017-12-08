Role Name
=========

This role is used for adding some CA certificates on system. All certificates must be placed in the files folder of this role. They will be copied in /usr/local/share/ca-certificates of the remote host and executes simply update-ca-certificates command.

Requirements
------------

N/A

Role Variables
--------------

N/A

Dependencies
------------

N/A

Example Playbook
----------------

    - hosts: servers
      become: yes
      roles:
         - { role: "ca-certificates" }

License
-------

BSD

Author Information
------------------
N/A

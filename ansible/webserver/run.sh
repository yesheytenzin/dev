!/bin/bash
ansible-playbook -i hosts.ini setup_web_env.yml --ask-pass --ask-become-pass


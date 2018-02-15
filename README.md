# ansible-debian

Docker image for Ansible on Debian

## usage

ansible-debian contains no playbooks or configuration. Everything must be passed in.

### SSH connections

SSH users for hosts should be configured in the invertory or playbooks.

`ssh-agent` should be running on (or forwarded to) the host running docker. All necessary SSH keys should be added. This can then be forwarded into the ansible-debian container with the command args `-v "$SSH_AUTH_SOCK:/tmp/ssh_auth_sock" -e "SSH_AUTH_SOCK=/tmp/ssh_auth_sock"`

To skip the prompt to check the host key on first use, add the option `ansible_ssh_common_args='-o StrictHostKeyChecking=no'` to the inventory or group_vars.

### Ansible inventory and playbooks

Set up a volume or use a bind mount containing the inventory and playbooks. This can be mounted into the container with `-v` or `--mount`

### Putting it all together

Assume a named volume `playbooks` with the Ansible inventory and a `site.yml` playbook. This can be run with the following command:

```console
docker run \
    -v playbooks:/playbooks \
    -v "$SSH_AUTH_SOCK:/tmp/ssh_auth_sock" \
    -e "SSH_AUTH_SOCK=/tmp/ssh_auth_sock" \
    bobfraser1/ansible-debian \
    ansible-playbook -i /playbooks/hosts /playbooks/site.yml
```

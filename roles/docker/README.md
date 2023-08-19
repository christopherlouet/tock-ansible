# Ansible Role: Docker

Installs docker and docker-compose for Debian/Ubuntu linux servers.

## Requirements

None.

## Role Variables

Set the version of docker-compose to install.

    docker_compose_version: ""

## Dependencies

None.

## Example Playbook

    - hosts: servers
      roles:
        - role: docker
          become: yes

## License

MIT / BSD

## Author Information

This role was created in 2023 by Christopher LOUËT.

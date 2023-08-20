<a name="readme-top"></a>

[//]: # ([![MIT License][license-shield]][license-url])

<br />
<div align="center">
<h3 align="center">Tock-ansible</h3>
  <p align="center">
    An ansible project for installing tock - The Open Conversation Kit - with docker-compose.
  </p>
</div>

## About The Project

The goal of this project is to facilitate the deployment of Tock - The Open Conversation Kit - with the docker-compose method.

This project relies on this repository to fetch docker images and docker-compose files:
https://github.com/theopenconversationkit/tock-docker

### Built With

[![Ansible][Ansible]][Ansible-url]
[![Poetry][Poetry]][Poetry-url]
[![Docker][Docker]][Docker-url]

## Getting Started

### Prerequisites

A linux machine with:

* Docker: https://docs.docker.com/engine/install/
* Poetry for a local installation of the playbook: ```curl -sSL https://install.python-poetry.org | python3 -```

### Installation

In the inventory folder, copy the hosts.dist file to hosts file. Then adapt the host configuration.

### Usage

To start components deployment on a remote machine:

```bash
./run.sh
```

Or on the local machine:

```bash
poetry shell
ansible-playbook main.yml
```

[//]: # (## License)

[//]: # ()
[//]: # (Distributed under the MIT License.)

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://shields.io/ -->

[license-shield]: https://img.shields.io/badge/license-MIT-green?style=for-the-badge
[license-url]: https://img.shields.io/badge/license-MIT-green?style=for-the-badge

[Ansible]: https://img.shields.io/badge/ansible-black?style=for-the-badge&logo=ansible&logoColor=white
[Ansible-url]: https://www.ansible.com/

[Poetry]: https://img.shields.io/badge/poetry-cyan?style=for-the-badge&logo=poetry
[Poetry-url]: https://python-poetry.org/

[Docker]: https://img.shields.io/badge/docker-blue?style=for-the-badge&logo=docker&logoColor=white
[Docker-url]: https://www.docker.com/

# Ansible Lab

A learning environment for exploring configuration management and automation with Ansible, focusing on user management and system configuration in containerized environments.

## Current State

### Environment Setup
- Docker-based testing environment using Ubuntu/Arch Linux containers
- SSH access configured for secure connections
- Basic Ansible structure implemented

### Implemented Features
- Base user management system
- Group management and permissions
- SSH key management structure
- Shell configuration management (aliases, dotfiles)
- Persistent storage configuration

### Project Structure
```
.
├── README.md
├── ansible.cfg
├── docker/
│   ├── Dockerfile
│   ├── docker-compose.yml
│   └── setup.sh
├── group_vars/
│   └── all.yml
├── inventory/
│   └── dev.yml
├── playbooks/
│   └── manage_users.yml
└── roles/
    ├── dotfiles/
    │   └── tasks/
    └── user_management/
        └── tasks/
```

## End Goals

### Learning Objectives
1. Master Ansible best practices for:
   - Role-based configuration management
   - User and group management
   - System configuration
   - Security hardening

2. Understand DevOps principles:
   - Infrastructure as Code (IaC)
   - Configuration management
   - Container orchestration
   - Version control best practices

### Planned Features
- [ ] Advanced user management capabilities
  - [ ] Dynamic user creation with varied permissions
  - [ ] Automated SSH key distribution
  - [ ] User-specific environment configuration

- [ ] System Configuration
  - [ ] Package management automation
  - [ ] Service configuration
  - [ ] Security baseline implementation

- [ ] Environment Expansion
  - [ ] Multi-container setup
  - [ ] Network configuration
  - [ ] Service dependencies

- [ ] Testing and Validation
  - [ ] Playbook testing framework
  - [ ] Role validation
  - [ ] Security compliance checking

## Getting Started

### Prerequisites
- Docker
- Docker Compose
- Ansible

### Quick Start
1. Clone the repository:
```bash
git clone https://github.com/borttappat/ansible-lab.git
cd ansible-lab
```

2. Set up the environment:
```bash
cd docker
./setup.sh
```

3. Run the playbook:
```bash
ansible-playbook -i inventory/dev.yml playbooks/manage_users.yml
```

## Contributing
This is a personal learning project, but suggestions and discussions are welcome! Feel free to:
- Open issues for questions or suggestions
- Submit pull requests for improvements
- Share your own learning experiences

## License
This project is open source and available under the [MIT License](LICENSE).

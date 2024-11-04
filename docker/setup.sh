#!/bin/bash
set -e

# Create SSH directory if it doesn't exist
mkdir -p ssh

# Set directory permissions first
chmod 700 ssh

# Generate SSH key pair if it doesn't exist
if [ ! -f ssh/id_rsa ]; then
    ssh-keygen -t rsa -b 4096 -f ssh/id_rsa -N ""
fi

# Set file permissions before copying
chmod 600 ssh/id_rsa
chmod 644 ssh/id_rsa.pub

# Copy public key to authorized_keys and set its permissions
cp ssh/id_rsa.pub ssh/authorized_keys
chmod 644 ssh/authorized_keys

# Create persistent directories
mkdir -p ~/docker-persist/{arch,ubuntu}

# Build and start the containers
docker compose up --build -d

# Wait a moment for containers to start
sleep 2

# Fix permissions inside the containers
docker exec docker-arch-1 /bin/bash -c "chmod 700 /root/.ssh && chmod 600 /root/.ssh/authorized_keys && chown root:root /root/.ssh/authorized_keys"
docker exec docker-ubuntu-1 /bin/bash -c "chmod 700 /root/.ssh && chmod 600 /root/.ssh/authorized_keys && chown root:root /root/.ssh/authorized_keys"

# Wait for SSH to be available
echo "Waiting for Arch container SSH..."
until ssh -o StrictHostKeyChecking=no -p 2222 -i ssh/id_rsa root@localhost echo "Arch SSH is ready"; do
    sleep 1
done

echo "Waiting for Ubuntu container SSH..."
until ssh -o StrictHostKeyChecking=no -p 2223 -i ssh/id_rsa root@localhost echo "Ubuntu SSH is ready"; do
    sleep 1
done

echo "Both containers are ready for Ansible!"

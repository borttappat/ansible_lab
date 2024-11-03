FROM archlinux:latest

# Install required packages
RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm \
    openssh \
    python \
    python-pip \
    sudo \
    zsh \
    base-devel \
    git \
    fastfetch \
    vim && \
    pacman -Scc --noconfirm

# SSH Server setup
RUN mkdir /var/run/sshd
RUN echo 'PermitRootLogin prohibit-password' >> /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config

# Create required directories
RUN mkdir -p /root/.ssh

# Generate SSH host keys
RUN ssh-keygen -A

# Expose SSH port
EXPOSE 22

# Start SSH server
CMD ["/usr/sbin/sshd", "-D"]

FROM jenkins/jenkins:lts

USER root

# Install Docker CLI
RUN apt-get update && \
    apt-get install -y \
        ca-certificates \
        curl \
        gnupg \
        lsb-release \
        sudo && \
    mkdir -p /etc/apt/keyrings && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null && \
    apt-get update && \
    apt-get install -y docker-ce-cli && \
    apt-get clean

RUN groupadd -for -g 999 docker \
    && usermod -aG docker jenkins

# Add GitHub to system-wide known hosts
RUN mkdir -p /etc/ssh && \
    ssh-keyscan -t rsa,ecdsa,ed25519 github.com >> /etc/ssh/ssh_known_hosts && \
    chmod 644 /etc/ssh/ssh_known_hosts

# Also add to jenkins user's known hosts
RUN mkdir -p /var/jenkins_home/.ssh && \
    ssh-keyscan -t rsa,ecdsa,ed25519 github.com >> /var/jenkins_home/.ssh/known_hosts && \
    chown -R jenkins:jenkins /var/jenkins_home/.ssh && \
    chmod 700 /var/jenkins_home/.ssh && \
    chmod 644 /var/jenkins_home/.ssh/known_hosts

USER jenkins

# Copy and install plugins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli --plugin-file /usr/share/jenkins/ref/plugins.txt

# Skip initial setup wizard
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"

# Set JCasC config location
ENV CASC_JENKINS_CONFIG=/var/jenkins_home/casc.yaml

# Genenerate Signing Keys
ssh-keygen -f /workspace/data/server_ca -q -P ""
ssh-keygen -f /workspace/data/users_ca -q -P ""
ssh-keygen -t rsa -f /workspace/data/id_rsa -q -P ""

# Sign Auth Server Host Key
ssh-keygen -s /workspace/data/server_ca -I host_honeypot -h -n honeypot -V +52w /etc/ssh/ssh_host_rsa_key.pub

cp /etc/ssh/ssh_host_rsa_key.pub /workspace/data/ssh_host_rsa_key.pub
cp /etc/ssh/ssh_host_rsa_key-cert.pub /workspace/data/ssh_host_rsa_key-cert.pub
cp /workspace/data/users_ca.pub /etc/ssh/users_ca.pub

# Copy the cert to every host that will connect
# Example:
# scp ssh_host_rsa_key-cert.pub root@client.example.com:/etc/ssh/

# Configure HostCertificate 
# echo "HostCertificate /etc/ssh/ssh_host_rsa_key-cert.pub" >> /etc/ssh/sshd_config

ssh-keygen -s /workspace/data/users_ca -I user_orie -n orie -V +52w /workspace/data/id_rsa.pub

# copy back to the client
# scp id_rsa-cert.pub username@client.example.com:/home/username/.ssh/
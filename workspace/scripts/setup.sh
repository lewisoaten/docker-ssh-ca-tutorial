# Reset the environment
echo "Deleting all previous keys..."
rm -rf /workspace/data
mkdir /workspace/data

# User setup
echo "Generating CA user keys..."
ssh-keygen -f /workspace/data/ca_user -q -P ""

echo "Generating user keys..."
ssh-keygen -f /workspace/data/user -q -P ""

echo "Signing the user's public key with the CA's private key"
ssh-keygen -s /workspace/data/ca_user -I user_certificate -t rsa-sha2-256 -n root /workspace/data/user.pub

echo "Adding user CA's public key to host's ssh config"
echo "TrustedUserCAKeys /workspace/data/ca_user.pub" >> /etc/ssh/sshd_config

# Host setup
echo "Generating CA host keys..."
ssh-keygen -f /workspace/data/ca_host -q -P ""

echo "Signing the host's public key with the CA's private key"
ssh-keygen -s /workspace/data/ca_host -I host_certificate -t rsa-sha2-256 -h /etc/ssh/ssh_host_rsa_key

echo "Adding host CA's public key to host's ssh config"
echo "HostCertificate /etc/ssh/ssh_host_rsa_key-cert.pub" >> /etc/ssh/sshd_config

echo "Add this to your ~/.ssh/known_hosts file"
echo "@cert-authority * $(cat /workspace/data/ca_host.pub)"

# Run ssh server
/usr/sbin/sshd

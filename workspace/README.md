For visibility...


/workspace/scripts/create_ca.sh 

cp ./workspace/data/id_rsa* ~/.ssh/

sudo launchctl stop com.openssh.sshd
sudo launchctl start com.openssh.sshd
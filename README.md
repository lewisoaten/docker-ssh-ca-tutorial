# Docker ssh ca tutorial

Build the docker image
```
npm run docker:build
```

Run the script to generate all certificate and ssh config to make the ca setup work
```
npm run docker:shell
/workspace/scripts/setup.sh
```

/!\ Don't forget to add the ca host's public key (the last line of the output of the script) in your `~/.ssh/known_hosts`, or you'll have to trust the fingerprint manually

Ssh into the docker instance
```
# In another terminal
npm run ssh
```

To debug:
```
npm run debug
```

# CA certificates
In this tutorial, we use two CA keypairs:
- `ca_user` that the host will have to trust to accept the incoming ssh connection
- `ca_host` that the user will have to trust so that they don't have to verify the fingerprint manually during the first connection

However it is also possible to use a single `ca` keypair for both usage.

# Warning

In this tutorial we will be creating SSH CA to Validate Hosts and Clients.

Normally, the signing keys would not be stored on the ssh server or in a git repo like this. This is for demonstration purposes. 

For a more production ready approach see [this](https://eng.lyft.com/blessing-your-ssh-at-lyft-a1b38f81629d).


# What we want...

We want a simple docker setup, where we create an ssh server from a docker file, provide some keys and certs, and can ssh to it using SSH CA, and not provide a password.

- https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/html/deployment_guide/sec-support_for_openssh_certificates
- https://docs.docker.com/engine/examples/running_ssh_service/#run-a-test_sshd-container
- https://www.digitalocean.com/community/tutorials/how-to-create-an-ssh-ca-to-validate-hosts-and-clients-with-ubuntu
- https://jameshfisher.com/2018/03/16/how-to-create-an-ssh-certificate-authority.html
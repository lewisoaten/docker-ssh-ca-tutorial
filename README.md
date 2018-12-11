
# poobear

```
npm run docker:build
npm run docker:shell
/workspace/scripts/create_ca.sh 

npm run docker:ssh:start
npm run docker:ssh:connect
```

# Warning

In this tutorial we will be creating SSH CA to Validate Hosts and Clients.

Normally, the signing keys would not be stored on the ssh server or in a git repo like this. This is for demonstration purposes. 

For a more production ready approach see [this](https://eng.lyft.com/blessing-your-ssh-at-lyft-a1b38f81629d).


# What we want...

We want a simple docker setup, where we create an ssh server from a docker file, provide some keys and certs, and can ssh to it using SSH CA, and not provide a password.

- https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/html/deployment_guide/sec-support_for_openssh_certificates
- https://docs.docker.com/engine/examples/running_ssh_service/#run-a-test_sshd-container
- https://www.digitalocean.com/community/tutorials/how-to-create-an-ssh-ca-to-validate-hosts-and-clients-with-ubuntu
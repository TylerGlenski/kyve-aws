### Terraform
- setup your ENV vars AWS_ACCESS_KEY & AWS_SECRET_KEY
- If using bastion.dockerfile it will install ansible and terraform and create a ansible-ssh user called ansible-user
    - Requires you to make your own ssh key with this command: BEFORE docker build. TLDR below
        - ``` ssh-keygen -t ed25519 -a 150 -C "ansible.user@fake.com" -f ./ansible-ssh ``` from root of the git repo. same directory as dockerfile.
- Creates a vpc with 3 subnets: public, private, protected.
- Also creates 3x EC2 instances (not tested) 
    - 2 sentry nodes 1 validator node
- Creates IAM role deployed for nodes to assume.

### Docker setup TLDR:
- From Root of the Repo:  Fill in your values for commands.
    - Windows: Hit enter for no password:
        - ``` ssh-keygen -t ed25519 -a 150 -C "ansible.user@fake.com" -f ./ansible-ssh ```
    - Everything else:
        - ``` ssh-keygen -t ed25519 -a 150 -C "ansible.user@fake.com" -f /home/ansible_user/.ssh/ansible-ssh -q -N "" ```
    - ``` docker build --build-arg AWS_SECRET_KEY="" --build-arg AWS_ACCESS_KEY="" --build-arg AWS_DEFAULT_REGION="" -f bastion.dockerfile -t bastion_ansible . ```
    - ``` docker run -d --name bastion_ansible bastion_ansible ```

- To remove container:
    - ``` docker rm -f bastion_ansible ```
    - Then Rebuild with steps above minus the ssh key part. it should be gitignored , if not who cares jsut make a new one. lol

## TODO
- need to integrate ec2 autopopulate ansible hosts plugin.
- Start building out ansible for node management and install
- Add security playbooks as needed
- cleanup the ansible and terraform dockerfile its messy
- Use packer to bake a image of the node, and EC2 autoscaling group to make sure we have 100% uptime? min: 1 target: 1 max : 2 for ec2 ASG
    - on node start, validator services start.
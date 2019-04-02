Ansible is used to orchestrate the deployment in AWS

Assumptions:

1. Launcher machine is already created in aws with boto, ansible installed
2. AWS ACCESS KEY and SECRET KEY is already procured
3. VPC and subnets are already configured
4. The image chosen has Java preinstalled(as developers' choice can differ and installation modules differe for different OS)
5. Ansible playbook, keypair and the scripts are part of the infra-problem project and the directory location is exported to $INFRA_ROOT

Future work:

1. Application code can be pulled from git, jar generation can be done on the fly or CI tool like Jenkins can be configured to create jars and push them to repository and then fetching them for installation( Continuous integration )
2. IAM roles, vpcs, subnets can be created on the go( Idempotency to be taken care)
3. Front end can be installed in launcher for cost reduction, also aws_cli can be used to call directly from local, so no need to login to launcher
4. Tags can be used to tag use different configurations for the prod/dev deployments


Security measures taken:

1. Only Frontend server will have public ip, other instances are not assigned public ip addresses
2. Security groups for each of the instances are created individually with access opened only for the configured port and ssh port
3. NEWSFEED_SERVICE_TOKEN is encrypted with ansible vault


Usage of scripts:

1. ansible-playbook quotesPlaybook.yml --syntax-check --ask-vault-pass(password - 911)
2. running transfer.sh script will push the jars into the launcher machine and will start the deployment

Issues faced:

1. The code is not properly tested because of timing constraints. Only syntax checked
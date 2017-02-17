
# add the IP address of the target host here
IP=192.168.0.x
USERNAME=gpadmin
HOSTNAME=change-me



all:
	@echo ""
	@echo "Available targets:"
	@echo ""
	@echo "init: will install basic requirements (will ask several times for a password)"
	@echo "install: will install the host with what is defined in install-host.yml"
	@echo "update: run OS updates"
	@echo "ssh: jump ssh to host"
	@echo ""
	@echo ""
	@echo "      current used IP: ${IP}"
	@echo "    current used user: ${USERNAME}"
	@echo "current used hostname: ${HOSTNAME}"
	@echo ""


init:
	@echo "will init host ${IP}, install ssh key and basic packages"
	@echo ""
	@echo "Note: NEVER use this step to init a host in an untrusted network!"
	@echo "Note: this will OVERWRITE any existing keys on the host!"
	@echo ""
	@echo "5 seconds to abort ..."
	@echo ""
	@sleep 5
	./init_host.sh "${IP}" "${USERNAME}"


install:
	ansible-playbook --ssh-common-args='-o UserKnownHostsFile=./known_hosts' -i ${IP}, -u ${USERNAME} install-host.yml --extra-vars "hostname=${HOSTNAME}"


update:
	ansible-playbook --ssh-common-args='-o UserKnownHostsFile=./known_hosts' -i ${IP}, -u ${USERNAME} update-host.yml


ssh:
	#ssh -o UserKnownHostsFile=./known_hosts ${USERNAME}@${IP} "/usr/bin/sudo /bin/bash --login"
	ssh -o UserKnownHostsFile=./known_hosts ${USERNAME}@${IP}

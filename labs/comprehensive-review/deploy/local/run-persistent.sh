#/bin/bash

#create the directory to persist nexus data
mkdir -p /tmp/nexus/sonatype-work

#change the owner of the directory to nexus and use the nexus group
podman unshare chown 1001:1001 /tmp/nexus/sonatype-work

#add SELinux context for the directory and its contents
sudo semanage fcontext -a -t container_file_t '/tmp/nexus/sonatype-work(/.*)?'

#apply the SELinux policy
sudo restorecon -Rv /tmp/nexus/sonatype-work

#run the pod in background created from the local image
podman run --name nexus -d -v /tmp/nexus/sonatype-work:/opt/nexus/sonatype-work -p 8081:8081 localhost/nexus

# create the bundle
mkdir -p mycontainer/rootfs

# [ab]use Docker to copy a root fs into the bundle
docker export $(docker create busybox) | tar -C mycontainer/rootfs -xvf -

# create the specification, by default sh will be the entrypoint of the container
cd mycontainer
runc spec

# launch the container
sudo -i
cd mycontainer
runc run mycontainerid

# list containers
runc list

# stop the container
runc kill mycontainerid

# cleanup
runc delete mycontainerid

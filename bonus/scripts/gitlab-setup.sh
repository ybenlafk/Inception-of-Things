sudo apt-get update -y
sudo apt-get install -y curl openssh-server ca-certificates tzdata perl

curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.deb.sh | sudo bash

sudo apt-get install gitlab-ee

sudo gitlab-ctl reconfigure
sudo /opt/gitlab/embedded/bin/runsvdir-start& disown



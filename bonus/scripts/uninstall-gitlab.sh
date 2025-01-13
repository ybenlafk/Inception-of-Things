sudo gitlab-ctl stop

sudo apt-get remove gitlab-ee
sudo apt-get purge gitlab-ee

sudo rm -rf /opt/gitlab
sudo rm -rf /var/opt/gitlab
sudo rm -rf /etc/gitlab

sudo rm /etc/apt/sources.list.d/gitlab*

sudo apt-get update -y


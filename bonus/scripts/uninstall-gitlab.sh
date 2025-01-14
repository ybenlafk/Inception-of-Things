sudo gitlab-ctl stop

sudo apt-get remove gitlab-ee -y
sudo apt-get purge gitlab-ee -y

sudo rm -rf /opt/gitlab
sudo rm -rf /var/opt/gitlab
sudo rm -rf /etc/gitlab

sudo rm /etc/apt/sources.list.d/gitlab*

sudo apt-get update -y


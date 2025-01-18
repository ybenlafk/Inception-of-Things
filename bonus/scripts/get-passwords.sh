echo "argocd pass:"
argocd admin initial-password -n argocd

echo "gitalb pass:"
sudo cat /etc/gitlab/initial_root_password

# Steps to execute bonus

1) Run the `install.sh` script (Installs all tools needed to run a kubernetes cluster)
2) Run the `gitlab-runner.sh` script
4) Once gitlab is running and the website is up, run `gitlab-configure.sh` (once)
5) Run `argocd-runner.sh`

# TODO: add port forwarding command

6) Open localhost:9091 and connect to the argocd application (with the password from `get-passwords.sh`) to monitor changes
7) Open gitlab and use the password from `get-passwords.sh` to update the version in the repository

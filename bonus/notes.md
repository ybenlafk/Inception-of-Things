# Steps to create the bonus

- use the official gitlab-ee docker image
- set hostname to localhost
- set up persistent volumes for the three folders mentioned here: https://docs.gitlab.com/ee/install/docker/installation.html 
- create deployment and service files for gitlab pod
- use the scripts that create a token and create the project
- Need ingress or portforwarding to access the gitlab website
- Get admin password from the kubernetes pod

# Make it work with part3
- run argocd

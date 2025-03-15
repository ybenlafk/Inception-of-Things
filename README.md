# Inception-of-Things (IoT)

## Overview

This project is designed to deepen your understanding of Kubernetes by utilizing K3s and K3d with Vagrant. You will learn how to set up a personal virtual machine, use K3s and its Ingress, and explore K3d to simplify your workflow. This project serves as a minimal introduction to Kubernetes, focusing on key concepts and practical applications.

## Table of Contents

1. [Introduction](#introduction)
2. [General Guidelines](#general-guidelines)
3. [Mandatory Part](#mandatory-part)
    - [Part 1: K3s and Vagrant](#part-1-k3s-and-vagrant)
    - [Part 2: K3s and Three Simple Applications](#part-2-k3s-and-three-simple-applications)
    - [Part 3: K3d and Argo CD](#part-3-k3d-and-argo-cd)
4. [Bonus Part](#bonus-part)
5. [Submission and Peer-Evaluation](#submission-and-peer-evaluation)

## Introduction

The goal of this project is to familiarize you with Kubernetes using K3s and K3d. You will set up virtual machines, deploy applications, and configure continuous integration using Argo CD. This hands-on experience will help you understand the basics of Kubernetes and its ecosystem.

## General Guidelines

- All tasks must be completed within a virtual machine.
- Configuration files should be organized in folders named `p1`, `p2`, `p3`, and `bonus` at the root of your repository.
- Feel free to use any tools necessary to set up your virtual machines and providers in Vagrant.

## Mandatory Part

### Part 1: K3s and Vagrant

1. **Setup**: Configure two virtual machines using Vagrant with minimal resources.
2. **Networking**: Assign dedicated IPs to each machine.
3. **SSH Access**: Ensure password-less SSH access.
4. **K3s Installation**: Install K3s in controller mode on the first machine and agent mode on the second.
5. **Kubectl**: Install and use kubectl for cluster management.

### Part 2: K3s and Three Simple Applications

1. **Setup**: Use one virtual machine with K3s in server mode.
2. **Applications**: Deploy three web applications accessible via different HOST names.
3. **Replicas**: Configure replicas for one of the applications.

### Part 3: K3d and Argo CD

1. **K3d Installation**: Install K3d on your virtual machine.
2. **Namespaces**: Create two namespaces, one for Argo CD and one for development.
3. **CI/CD**: Set up continuous integration to deploy an application from a GitHub repository using Argo CD.
4. **Versioning**: Ensure the application can be updated to different versions via GitHub.

## Bonus Part

- **GitLab Integration**: Add GitLab to the setup from Part 3.
- **Local Instance**: Run GitLab locally and configure it to work with your cluster.
- **Namespace**: Create a dedicated namespace for GitLab.

## Submission and Peer-Evaluation

- **Repository Structure**: Organize your work in folders named `p1`, `p2`, `p3`, and `bonus` at the root of your repository.
- **Scripts and Configurations**: Place scripts in a `scripts` folder and configuration files in a `confs` folder.
- **Evaluation**: The evaluation will be conducted on the computer of the evaluated group.

## Directory Structure

```
project-root/
│
├── p1/
│   ├── Vagrantfile
│   ├── scripts/
│   └── confs/
│
├── p2/
│   ├── Vagrantfile
│   ├── scripts/
│   └── confs/
│
├── p3/
│   ├── scripts/
│   └── confs/
│
└── bonus/
    ├── Vagrantfile
    ├── scripts/
    └── confs/
```

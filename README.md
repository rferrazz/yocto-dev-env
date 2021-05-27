# Yocto Development Environment

_A dockerized environment to develop and deploy yocto based BSPs_

It is a single bash script that given a well defined configuration folder creates a Docker machine with [code-server](https://github.com/cdr/code-server) and a ready made yocto host environment based on a specific Ubuntu version.

The environment works on Linux, MAC-OS and Windows (tested with dockre for windows and WSL1/2). It requires the bash shell, Docker and [jq](https://stedolan.github.io/jq/).

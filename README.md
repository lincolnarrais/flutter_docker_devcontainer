# flutter_docker_devcontainer

## Instructions

1. Install Docker:
    - on Ubuntu based distros ([link](https://docs.docker.com/engine/install/ubuntu/))
        - also do the post install configuration ([link](https://docs.docker.com/engine/install/linux-postinstall))
2. Install VS Code:
    - on Ubuntu based distros:  
        `sudo apt update && sudo apt install code -y`
4. On VS Code, install these extensions:
    - [Docker](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker)
    - [Remote Development](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack)
5. Clone the git repo `git clone https://github.com/lincolnarrais/flutter_docker_devcontainer.git` anywhere.
6. Create a new directory, e.g. "/home/<user_name>/dev/flutter_docker", then copy "workspace" and ".devcontainer" from the git repo to it.
`git clone https://github.com/lincolnarrais/flutter_docker_devcontainer.git`  
`code .`
7. On VS Code, now there should be a button on the bottom left corner that says "" when you hover over it.  
Click on it, then click on "Reopen in Container".
8. When the container is ready, you can create your flutter project.  
The source code will be stored in the **workspace** directory.

## Issues

- I couldn't get linux desktop to work, but web and usb work fine.
- For usb to work, you need to set USB connection on your phone to "File transfer", otherwise it might give an insufficient permissions error.

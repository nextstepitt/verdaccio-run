![GitHub Dark](./.assets/nsbanner-light.png#gh-light-mode-only)
![GitHub Light](./.assets/nsbanner-dark.png#gh-dark-mode-only)

# Verdaccio-Run

## Overview

The problem is working with a large group of programmers using Node.js onsite with poor Internet connectivity.
The goal of this project is to minimize the use of the Internet for Node.js packages, especially when everyone present
is trying to install large numbers of packages simultaneously.

Verdaccio (https://github.com/verdaccio/verdaccio) is a local npm package server, designed to both serve private
packages locally *and* proxy and cache packages from other servers including https://registry.npmjs.org.
This project wraps Verdaccio so that it doesn't have to be installed locally, it is installed in the project
folder and run via *npx*.
The storage is configured to be in the project folder.
The project space can be primed with the packages required for other projects, and then
will be available offline or with limited connectivity.

## Setup

Each computer where the package server will be used should have installed:
* Git
* Node.js (preferrably install nvm-windows and then Node.js)
* Visual Studio Code is the preferred IDE, of course others may be substituted.

The steps to setting this up are:
1. Clone this repository from GitHub onto the local computer: git clone https://github.com/nextstepitt/verdaccio-run.
1. In the repository (project) folder run *npm install* to install Verdaccio in the local project.
1. Start the server with the appropriate *npm run \<command>*.
1. Prime the package server cache by running *npm install package ...* for each package that will be used during development.

The package.json file in this project provides commands to change npm locally to use this local package server,
set it back to https://registry.npmjs.org, and start the
server for Microsoft Windows, Apple Mac, and Linux:

```
"scripts": {
    "register": "npm set registry http://localhost:4873",
    "start-linux": "bash ./launch.sh",
    "start-mac": "zsh ./launch.sh",
    "start-windows": "@powershell -NoProfile -ExecutionPolicy Unrestricted -Command ./launch.ps1",
    "unregister": "npm set registry https://registry.npmjs.org/"
}
```

## Distribution

### Option 1: Copy the project folder to each computer

After priming the project folder with the necessary packages the
the folder may be copied (usb, network, etc.) to a large number of computers working in a group (class?) where
network connectivity is limited.
Then each computer has its owned primed copy of the local cache of packages.

Make sure that each computer also has Git, Node.js, and the IDE for development.

### Options 2: Run a local server on the network

If the local network is good (just poor Internet), then an
alternative is to place this on one computer on a local network and have everyone point to it for the
local package server.
The command to change the npm package server on the machines in the group is:

```
$ npm set registry <the local server URL and port>
```

## License

The project is licensed under the MIT license. You may use and modify all or part of it as you choose, as long as attribution to the source is provided per the license. See the details in the [license file](./.assets/LICENSE.md) or at the [Open Source Initiative](https://opensource.org/licenses/MIT)

The Verdaccio project is distributed under the MIT license, this is our attribution.
See https://github.com/verdaccio/verdaccio for details.
# Yocto Development Environment

_A dockerized environment to develop and deploy yocto based BSPs_

A self contained bash script that given a configuration folder creates a Docker machine with [code-server](https://github.com/cdr/code-server) and a ready made yocto host development environment based on a specific Ubuntu version.

<img src="https://github.com/rferrazz/yocto-dev-env/raw/main/screen.gif">

## Usage

Here an example of a project using it: https://github.com/GoChik/yocto-env

### Dependencies

The environment works on Linux, MAC-OS and Windows (tested with Docker for windows and WSL1/2). It requires the bash shell, Docker and [jq](https://stedolan.github.io/jq/).

### Setup your first project

Let's suppose you are going to work on a yocto based project named `foo`. Download the [released script](https://github.com/rferrazz/yocto-dev-env/releases/latest) and put it alongside your environment folder. At this point your setup should look like this:

```
.
└── dev-env_1.0.sh
└── foo
    └── manifest.json
    └── defconfig
        ├── bblayers.conf.sample
        └── local.conf.sample
```

`bblayers.conf.sample` and `local.conf.sample` are respectively the default `bblayers.conf` file and the `local.conf` file.

`manifest.json` Is the file describing which host machine, extra host packages, the default yocto maachine to use and where to fetch your layers from. It looks like this:

```json
{
    "host_ubuntu_version": "18.04",
    "extra_pkgs": ["cvs", "gdb", "device-tree-compiler"],
    "machine": "raspberrypi0-wifi",
    "layers": [
        {
            "method": "checkout",
            "path": "poky",
            "args":["https://git.yoctoproject.org/git/poky", "dunfell"]
        },
        {
            "method": "checkout",
            "path": "meta-openembedded",
            "args": ["https://github.com/openembedded/meta-openembedded.git", "dunfell"]
        },
        {
            "method": "checkout",
            "path": "meta-raspberrypi",
            "args": ["https://github.com/agherzan/meta-raspberrypi.git", "dunfell", "67baec35a3cabb0b92dea31d71c59752ae8123f7"]
        }
    ]
}
```

Nou you should be all set. execute the script as following to build your development machine:

```bash
$ ./dev-env_1.0.sh foo
```

Once completed setup your ssh keys if needed and then start the yocto environment with:

```bash
$ yocto-env
```

The `yocto-env` script will fetch layers you have specified in the manifest to the version or branch specified. If the layer folders are already populated it will not fetch the repo even if the version you are using is not the same one as the manifest one.

Once you are done with the current session close the vm terminal. Your work is saved in a docker volume named like your environment name (`foo` in this case)

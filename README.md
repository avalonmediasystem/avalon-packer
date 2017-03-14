# avalon-packer
This project contains a set of [Packer](http://packer.io) templates and support files for the creation of [Avalon Media System](https://github.com/avalonmediasystem/avalon) virtual machine images.

## Usage
1. Make sure you have [Packer](http://packer.io) installed in your command path.
1. Clone this repository.
2. `cd avalon-packer`
3. Build a target:
  * `packer build avalon-ova-scratch.json` to build an Avalon OVA from bare metal. Packer will provision a Docker host and pull the Avalon images from dockerhub to the OVA. When the OVA starts up, Docker will automatically stand up the containers for you.

## Options
There are some user variables defined in the templates. See the `vars` directory for examples.


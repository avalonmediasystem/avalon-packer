# avalon-packer
This project contains a set of [Packer](http://packer.io) templates and support files for the creation of [Avalon Media System](https://github.com/avalonmediasystem/avalon) virtual machine images.

## Usage
1. Make sure you have [Packer](http://packer.io) installed in your command path.
1. Clone this repository and the [avalon-installer](https://github.com/avalonmediasystem/avalon-installer) repository side by side in the same directory. Packer uses the puppet manifests and modules from `avalon-installer` to provision the Avalon VM.
2. `cd avalon-packer`
3. Build a target:
  * `packer build avalon-ova-scratch.json` to build an Avalon OVA from bare metal.
  * `packer build avalon-ova.json` to build an Avalon OVA from an existing base box.
  * `packer build centos-minimal-desktop.json` to build a CentOS base box.
  
## Options
There are some user variables defined in the templates. See the `vars` directory for examples.

## Notes
The CentOS 7 base box builds, but Avalon cannot yet install on it successfully.

# Packer boxes

## Requirements

[Packer](http://www.packer.io/) is needed to build those images and an Openstack account and follow [the documentation](https://www.packer.io/docs/builders/openstack) to set ip up. In my case, it has been tested with packer `v1.7.0` and [OVHcloud's Openstack](https://www.ovhcloud.com/en/public-cloud/).

## Usage

```
packer build .
```

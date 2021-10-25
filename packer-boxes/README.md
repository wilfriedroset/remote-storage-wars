# Packer boxes

## Requirements

[Packer](http://www.packer.io/) is needed to build those images and an Openstack account and follow [the documentation](https://www.packer.io/docs/builders/openstack) to set ip up. In my case, it has been tested with packer `v1.7.0` and [OVHcloud's Openstack](https://www.ovhcloud.com/en/public-cloud/).

## Usage

```
export OS_REGION_NAME=<your_region_name>
```

Identify the flavor id and the network id
```
openstack flavor list | grep <flavor-name>
openstack network list | grep <public-network-name>
```

Either pass them as variables

```
packer build -var "flavor_id=<abc-def>" -var "network_id=<123-456> ."
```

Or create a `.pkrvars.hcl`

```
packer build -var-file="variables.pkrvars.hcl ."
```

Or simply create a `.auto.pkrvars.hcl` and Packer will automatically load it.

```
packer build .
```

See: https://www.packer.io/guides/hcl/variables#assigning-variables

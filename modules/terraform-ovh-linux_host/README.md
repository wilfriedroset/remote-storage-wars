# module-linuxhost

It is easy to reuse again and again the same pattern to deploy a Linux
instance, let's try to factorize this in a single module.

As such, this module will create:
* `openstack_compute_instance_v2`, linked to public and/or private network with
  metadata. Terraform will wait for the instance to be completely up, running
  and done with `cloud-init`.
* `ovh_domain_zone_record` associated to the public ip of the instance.

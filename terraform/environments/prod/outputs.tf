output "network" {
  value = module.vpc.network
}

output "subnet" {
  value = module.vpc.subnet
}

output "firewall_rules" {
  value = module.firewall.firewall_rules
}

output "instance_name" {
  value = module.http_server.instance_name
}

output "external_ip" {
  value = module.http_server.external_ip
}

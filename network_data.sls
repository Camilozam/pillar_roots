## Contains infos about all networks and hosts
##
## Each network contains of a type
##	- switched: Physical wired network not belonging to a VLAN
##	- p2p: Physical peer to peer network of 2 hosts connected back to back
##	- bridged: dummy network holding interfaces without an own ip, but beeing part of a bridge
##	- vlan: Virtual network
## and some network wide settings like gateway, domain etc.
## It also has a list of hosts that are part of the network.
## Each host contains of 
##	- hostname: the hostname (not fqdn)
##	- ip: the ip in this network
##	- interface: the interface definition of the used interface
##	- host_entry [true/false]: setting whether to add a /etc/hosts entry for this host in all other hosts of this network
## The interface definition is as follows:
## Mandatory:
##	- name: The name of the interface
##	- type: the interface type as in stalt state.network
##	- enabled [true/false]: setting whether the interface is active
## Optional:
##	- bridge: the name of the bridge if this interface belongs to a bridge (see state.network)
##	- ports: a list of interfaces this bridge interface uses (only for bridges)

networks:
  # network for interfaces used in bridges, no ip or host entries assigned
  bridged:
    type: bridged
    hosts:
      vmaster1:
        interface:
          name: eno49
          type: eth
          bridge: br0
          enabled: false
        hosts_entry: false
      vmaster2:
        interface:
          name: eno49
          type: eth
          bridge: br0
          enabled: false
        hosts_entry: false
      vhost1:
        interface:
          name: ens1f1
          type: eth
          bridge: br0
          enabled: false
        hosts_entry: false
      vhost2:
        interface:
          name: ens1f1
          type: eth
          bridge: br0
          enabled: false
        hosts_entry: false
  # The default service network
  default:
    type: switched
    network: 192.168.1.0
    subnet: 255.255.255.0
    gateway: 192.168.1.1
    dnsservers: [192.168.1.1]
    domain: otto-schneider.de
    subdomain: local
    smtp: mail.otto-schneider.de
    hosts:
      vmaster1:
        ip: 192.168.1.12
        interface: 
          name: br0
          type: bridge
          enabled: true
          ports: ["eno49"]
        hosts_entry: true
      vmaster2:
        ip: 192.168.1.13
        interface:
          name: br0
          type: bridge
          enabled: true
          ports: ["eno49"]
        hosts_entry: true
      vhost1:
        ip: 192.168.1.14
        interface:
          name: br0
          type: bridge
          enabled: true
          ports: ["ens1f0"]
        hosts_entry: true
      vhost2:
        ip: 192.168.1.15
        interface:
          name: br0
          type: bridge
          enabled: true
          ports: ["ens1f0"]
        hosts_entry: true
      fifa_schneider:
        ip: 192.168.1.100
        hosts_entry: true
      backup_schneider:
        ip: 192.168.1.110
        hosts_entry: true
      db_schneider:
        ip: 192.168.1.120
        hosts_entry: true
      db2:
        ip: 192.168.1.121
        hosts_entry: true
      oa1:
        ip: 192.168.1.102
        hosts_entry: true
      salt:
        ip: 192.158.1.31
        host_entry: true
      zeiterfassung:
        ip: 192.168.1.30
        host_entry: true
      davical:
        ip: 192.168.1.34
        host_entry: true
  # The storage cluster ring0 network
  master_cluster_0:
    type: p2p
    network: 10.0.1.0
    subnet: 255.255.255.0
    domain: otto-schneider.de
    subdomain: ring0
    hosts:
      vmaster1:
        ip: 10.0.1.1
        interface:
          name: eno4
          type: eth
          enabled: true
        hosts_entry: true
      vmaster2:
        ip: 10.0.1.2
        interface:
          name: eno4
          type: eth
          enabled: true
        hosts_entry: true
  # The storage cluster ring1 network, also for drbd replication
  master_cluster_1:
    type: p2p
    network: 10.0.2.0
    subnet: 255.255.255.0
    domain: otto-schneider.de
    subdomain: ring1
    hosts:
      vmaster1:
        ip: 10.0.2.1
        interface:
          name: eno50
          type: eth
          enabled: true
        hosts_entry: true
      vmaster2:
        ip: 10.0.2.2
        interface:
          name: eno50
          type: eth
          enabled: true
        hosts_entry: true

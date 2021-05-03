master:
  bind_int.erface: 192.169.10.203
  pillar_roots:
    base:
      - /srv/salt/pillar_roots
  file_roots:
    base:
      - /srv/salt/file_roots

minion:
  master: 192.168.10.203
  master_finger: "2f:7c:51:72:02:24:d1:f2:94:72:02:3f:42:17:a6:fa:46:35:cf:5b:11:5c:ff:c8:4d:40:73:15:05:6c:da:59"
  file_client: remote
  pillar_roots:
    base:
      - /srv/salt/pillar_roots
  file_roots:
    base:
      - /srv/salt/file_roots


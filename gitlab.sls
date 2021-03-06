gitlab:
  # Specify edition: "gitlab-ce" (default) or "gitlab-ee"
  edition: gitlab-ce

  config: |
    # Configure Gitlab to use SSL
    #external_url 'https://gitlab.example.com'
    nginx['enable'] = false
    web_server['external_users'] = [www-data]
    gitlab_rails['trusted_proxies'] = [192.168.10.204]
    gitlab_workhorse['listen_network'] = tcp
    gitlab_workhorse['listen_addr'] = 127.0.0.1:8181
    unicorn['port'] = 8082

    #letsencrypt['enable'] = true
    #letsencrypt['contact_emails'] = ['hostmaster@example.com']

    # Listen on ipv4 and ipv6
    #nginx['listen_addresses'] = ['0.0.0.0', '[::]']

    # Use modern ciphers (See https://wiki.mozilla.org/Security/Server_Side_TLS)
    #nginx['ssl_protocols'] = 'TLSv1.2'
    #nginx['ssl_ciphers'] = 'ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA256'
    #nginx['ssl_prefer_server_ciphers'] = 'on'

    # Enable HSTS
    #nginx['hsts_max_age'] = 31536000
    #nginx['hsts_include_subdomains'] = false

    # Change default theme to light
    gitlab_rails['gitlab_default_theme'] = 3

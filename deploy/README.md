1. Find NPM's network: `docker inspect <npm-container> --format '{{json .NetworkSettings.Networks}}'` and set stack env NPM_NET to that name.
2. Portainer: add the stack from the Git repo (compose path deploy/docker-compose.yml). Deploy.
3. NPM: Proxy Host > domain (e.g. map.yourdomain.com) > Forward Hostname `affinity-map`, port 80, scheme http. Enable SSL.
4. Cloudflare: add a DNS record for that subdomain (proxied) pointing where your other sites point.

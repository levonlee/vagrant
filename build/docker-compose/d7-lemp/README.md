Vagrantfile
- Go to vagrant host web browser localhost:8080


Container Network
- Gateway 172.18.0.1

Container IP
- db: 172.18.0.2
- php: 172.18.0.3
- nginx: 172.18.0.4

Container Ports (host:container)
- db
- php 
  - 9000:9000
  - 9001:9001 
- nginx
  - 80:80

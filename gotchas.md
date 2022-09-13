# Setup Gotchas

- For kind installs as we forward the ports to localhost make sure the NodePort and Service port of Drone and Gitea matches. 

With current setup,

- For Gitea the node port is `30950` and same is set as `HTTP_PORT` to make sure the routing happens correctly.
- For Drone the node port is `30980` and same is set as its `service.port` in helm values
- Finally the Drone Docker runner is updated to value `DRONE_RPC_HOST` to `drone:30980`
- Nexus takes a bit of time to start and deploy
  
Happy GitOpsing with Drone!
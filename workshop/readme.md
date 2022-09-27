# Workshop: Build your own open-source GitOps software delivery platform with Argo CD, Drone CI & LitmusChaos

In this workshop you’ll learn how to set up, configure and run a full-stack, open-source GitOps delivery platform including continuous integration with Drone CI, continuous delivery with Argo CD, and chaos engineering with LitmusChaos. You will be provided with a preconfigured stack with Gitea and Nexus Docker Registry, but the workshop is intended to work with any Git repository (GitHub/GitLab) and container registry (Harbor, etc.). Also included is the open-source tooling you’ll need to deploy and operate this stack afterwards. 

# Upcoming Virtual Workshops
- [Monday Oct 17th 9:00 am - 12:00 pm Pacific time](https://www.meetup.com/harness/events/288739672/) - virtually taught by Jim Sheldon
- [Wednesday Nov  9th 11:30 am - 2:30 pm India time](https://www.meetup.com/harness-india/events/288747851/) - virtual tought by Kamesh Sampath

# Workshop Agenda 

In this workshop, you will learn how to use:
- Drone CI to declaratively build, test and publish images to a container registry.
- Argo CD Image Updater to automatically update the container images in your Kubernetes workloads
- LitmusChaos to run experiments on that environment to determine your application's level of resilience. 
- Your repo to create an excellent Full-Stack GitOps experience for your developers

You’ll also receive access to a Slack Channel where we can continue working together. 

# Agenda:
- 0:00 Introductions 
- 0:15 Deploy Argo CD from Helm charts
- 0:45 Install "DRAG Stack" following the "App of Apps" pattern 
- 1:05 Modify components of the DRAG Stack App of Apps and see them deployed 
- 1:25 Making the registry available inside the cluster 
- 2:00 Create a full-stack pipeline for apps managed by Argo CD following GitOps workflow 
- 2:30 Implement Chaos Engineering with LitmusChaos
- 3:00 Continue discussion (optional)

We hope you will continue working with us to improve the DRAG Stack as an open-source project we can all learn from.

More details at https://github.com/harness-apps/drag-stack/

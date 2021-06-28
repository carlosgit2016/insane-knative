## Insane Knative
This repo is a demo for using Knative resources with kind cluster and Google Cloud resources.

### What is Knative Serverless Capatibilities
Kubernetes-based platform to deploy and manage modern serverless workloads.

- Take care of networking
- Autoscaling 
- Revision tracking
- Focus on core logic

> Note: Also offer Universal subscription, delivery, and management of events.


Advantages:

- Cloud agnostic, run it anywhere Kubernetes runs, never worry about vendor lock-in.
- Supporting common patterns such as GitOps, DockerOps, ManualOps
- Logging and monitoring, networking, and service mesh
- tools and frameworks such as Django, Ruby on Rails, Spring, and many more.

Using the knative API it will create automatic the following resources:

- A new immutable revision for this version of the app.
- Network programming to create a route, ingress, service, and load balance for your app.
- Automatically scale your pods up and down (including to zero active pods).

In a nutshell
A developer just need to care about his code and the operations side do not necessary need to touch in cluster configuration if do not want to. It is possible to scale up/down the pods in the cluster once the Knative API already do the work.

### Knative components from google

Build
- Configurable and flexible approach to building source code into containers
- Pluggable approach leveraging Dockerfiles or built templates
- No cross-compiling or need for local build tools
- Support for cached artifacts for faster builds
- Allow your organization to utilize spare capacity for better resource usage

Serving
- Higher level abstraction, easy to reason about the object model
- Seamless autoscaling based on HTTP requests
- Gradual rollouts for new revisions
- Integrates networking and service mesh automatically
- Pluggable: connect your own logging and monitoring platform

Eventing
- Universal subscription, delivery, and management of events
- Build loosely coupled, event-driven systems with high-level objects
- Declarative binding between event producers and event consuming services
- Scalable from just a few events to live streams
- Custom event pipelines to connect with your own existing systems

### Some Glossary
- gcloud IAM Policy, IAM policies are attached to the resource to control the access to it and contains the roles and the users/service accounts that are associated with.

### Use case
This repo focus on creating a Knative resource on an kind cluster to publish a topic on Gcloud Pub/Sub and trigger a function (service) when the topic is published.

### Pre requisites
- [golang](https://golang.org/)
- [Gcloud CLI](https://cloud.google.com/sdk/gcloud)
- [kind](https://kind.sigs.k8s.io/docs/user/quick-start/#installation)
- [kubectl](https://kubernetes.io/docs/tasks/tools/)
- [knative](https://knative.dev/docs/install/)
# Kuberntes Port Test

- 0.0.0.0 bind to all the available IP address available to the pod.
  - Does not matter whether it's declared in the Deployment spec `containerPort` or not.
- localhost bind only to the link local address, not accessible to other pod.

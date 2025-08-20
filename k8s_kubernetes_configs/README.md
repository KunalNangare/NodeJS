# Kubernetes Configuration Files for Node.js CI/CD & Deployment

This archive contains Kubernetes manifests and configuration files to deploy:
- A sample Node.js application
- Jenkins (as an in-cluster deployment)
- Ingress configuration to use cert-manager and Let's Encrypt (staging by default)
- Helm values for Prometheus (recommend Helm install)
- Jenkins pipeline `Jenkinsfile` example
- Placeholder Secrets and ConfigMaps
- Horizontal Pod Autoscaler example

**Important notes (read first)**:
1. **Domain & DNS**
   - The sample `Ingress` assumes your application's DNS name is **devlogin.nextastra.com**.
   - Make sure this domain points to your cluster's ingress controller public IP (or use DuckDNS to map a domain you control to that IP).
2. **Ingress Controller & Cert-Manager**
   - You must install an ingress controller (e.g., ingress-nginx) and cert-manager in the cluster prior to applying the Ingress/ClusterIssuer manifests.
   - The `cluster-issuer-staging.yaml` included uses Let's Encrypt **staging** (safe for testing). Switch to `cluster-issuer-prod.yaml` after testing for real certificates.
3. **Secrets**
   - Files named `*-secret-template.yaml` contain placeholder values. Replace them before `kubectl apply`.
4. **Prometheus / Monitoring**
   - For production-grade monitoring, install `kube-prometheus-stack` (Helm) or Prometheus operator. A `prometheus-values.yaml` is included as a starting point.
5. **Jenkins Security**
   - Jenkins matrix-based security and user/role setup is performed inside Jenkins (UI or Configuration as Code). The manifests deploy Jenkins; you still need to configure security and create credentials.
6. **Persistent Volumes**
   - PVCs use a generic `storageClassName: standard`. Adjust to your cluster's storage class.

---

## Files included
- namespace.yaml
- app-deployment.yaml
- app-service.yaml
- app-hpa.yaml
- app-configmap.yaml
- app-secret-template.yaml
- ingress.yaml
- cluster-issuer-staging.yaml
- cluster-issuer-prod.yaml
- jenkins-deployment.yaml
- jenkins-service.yaml
- jenkins-pvc.yaml
- jenkins-rbac.yaml
- Jenkinsfile
- prometheus-values.yaml
- README.md (this file)

---

## Quick apply order (suggested)
1. `kubectl apply -f namespace.yaml`
2. Install ingress controller (ingress-nginx) and cert-manager (follow their docs).
3. `kubectl apply -f cluster-issuer-staging.yaml` (for testing)
4. `kubectl apply -f app-configmap.yaml`
5. Create secrets from the template after filling values.
6. `kubectl apply -f app-deployment.yaml`
7. `kubectl apply -f app-service.yaml`
8. `kubectl apply -f ingress.yaml`
9. `kubectl apply -f jenkins-pvc.yaml && kubectl apply -f jenkins-deployment.yaml && kubectl apply -f jenkins-service.yaml`
10. Use the included `Jenkinsfile` as a starting pipeline.

See the inline comments inside each YAML for details.

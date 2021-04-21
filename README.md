# D-SCOPE
Hughes Systique's D-SCOPE is an application which provides network service orchestration for deploying computation and bandwidth intensive multi-tier applications, end-to-end, from the edge cloud to backend high performance datacenters.

## Deploy D-SCOPE on K8s cluster
Helm chart in this repository can be used to deploy D-SCOPE on K8s cluster. These Helm charts pull the following docker images from Docker Hub.
1. hspl/d-scope-opennessmgr
2. hspl/d-scope-openstackmgr
3. hspl/d-scope-sdncmgr
4. hspl/d-scope-nsmgr
5. hspl/d-scope-sitemgr

In case, your K8s deployment does not have internet access, you can download D-SCOPE images from docker hub and then add them on you K8s worker nodes or you can push the downloaded images in your local docker registery (if K8s cluster is pointing to it). 

### Pre-requisites
#### Install Istio on K8s Cluster
- Kubernetes cluster must have Istio deployed. If it is not already deployed, then following link can be used for deploying Istio:
  * https://istio.io/latest/docs/setup/install/helm/

### Deployment Steps
1. Clone this repo on your machine.
2. Change directory to 'helm-charts'
3. Pull dependencies.
   ```
   helm dep build
   ```
4. Create 'dscope' namespace in K8s cluster.
   ```
   kubectl create namespace dscope
   ```
5. Install D-SCOPE chart.
   ```
   helm install dscope-orch . -n dscope
   ```

### Verify D-SCOPE Installation
- Before testing REST endpoints exposed by D-SCOPE application, retrieve Ingress IP and Port. Following link can be used to find the steps for exporting INGRESS_HOST and INGRESS_PORT.
  * https://istio.io/latest/docs/setup/getting-started/#determining-the-ingress-ip-and-ports

- Following commands should return 200 OK with empty array in JSON payload.
  ```
  curl -i -X GET -H "Accept: application/json" "http://$INGRESS_HOST:$INGRESS_PORT/site"
  curl -i -X GET -H "Accept: application/json" "http://$INGRESS_HOST:$INGRESS_PORT/ns"
  curl -i -X GET -H "Accept: application/json" "http://$INGRESS_HOST:$INGRESS_PORT/device"
  curl -i -X GET -H "Accept: application/json" "http://$INGRESS_HOST:$INGRESS_PORT/tunnel"
  ```
- On checking  SDN Controller registered with D-SCOPE using following command, it will return 404 response code.
  ```
  curl -i -X GET -H "Accept: application/json" "http://$INGRESS_HOST:$INGRESS_PORT/sdn-c/sdn"
  ```

### Delete D-SCOPE from the K8s Cluster
- Delete D-SCOPE chart from K8s cluster.
  ```
  helm delete dscope-orch -n dscope
  ```
- Delete D-SCOPE namespace.
  ```
  kubectl delete namespace dscope
  ```
  
To find more about how to use D-SCOPE to orchetestrate workloads across different sites, please contact HSC sales.

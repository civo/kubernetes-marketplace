kubectl create ns litmus
helm repo add litmuschaos https://litmuschaos.github.io/litmus-helm
helm search repo litmuschaos --devel
helm install chaos litmuschaos/litmus-2-0-0-beta --devel --namespace=litmus

version=$(curl -s "https://api.github.com/repos/kubernetes/ingress-nginx/releases/latest" | awk -F '"' '/tag_name/{print $4}')

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/${version}/deploy/static/provider/cloud/deploy.yaml

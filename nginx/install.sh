version=$(curl -s "https://api.github.com/repos/kubernetes/ingress-nginx/releases" | grep tag_name | grep controller | sort -r | awk -F'"' 'NR==1 {print $4}')

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/${version}/deploy/static/provider/cloud/deploy.yaml

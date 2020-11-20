
## Keptn

### Start using Keptn

1. Download the Keptn CLI: 
  ```
  curl -sL https://get.keptn.sh | sudo -E bash
  ```

1. Before you connect your CLI to your Keptn installation in Civo, make sure that Keptn is ready.

  ```
  kubectl get deploy -n keptn
  ```

  If all deployments are ready and available, please proceed to the next step.


1. Connect the CLI to the Keptn installation
  ```
  KEPTN_ENDPOINT=http://$(kubectl get ingress api-keptn-ingress -n keptn -o jsonpath='{.spec.rules[0].host}')/api
  KEPTN_API_TOKEN=$(kubectl get secret keptn-api-token -n keptn -ojsonpath={.data.keptn-api-token} | base64 --decode)

  keptn auth --endpoint=$KEPTN_ENDPOINT --api-token=$KEPTN_API_TOKEN
  ```

1. Access the bridge via:
  ```
  echo http://$(kubectl get ingress api-keptn-ingress -n keptn -o jsonpath='{.spec.rules[0].host}')/bridge
  ```
  
  Get the credentials with the following command:
  ```
  keptn configure bridge -o
  ```

1. Follow the [tutorials](https://tutorials.keptn.sh/?cat=quality-gates) to get started! Please note that Keptn is already installed and these parts of the tutorials can be skipped :)



## Documentation and tutorials

- Find more information in the [Keptn documentation](https://keptn.sh/docs).
- Check out the [Keptn tutorials](https://tutorials.keptn.sh/?cat=quality-gates) that help you get started with different use-cases.

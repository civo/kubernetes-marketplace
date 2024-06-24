## Cerbos

Cerbos enhances your authorization setup by enabling the creation of context-sensitive access control policies for your application resources. You can define access rules with an easy-to-use YAML configuration language, leverage your Git-ops infrastructure for testing and deployment, and utilize straightforward API calls to the Cerbos Policy Decision Point (PDP) to assess the policies and make real-time access determinations.

Once installed, the Cerbos instance [configuration properties](https://docs.cerbos.dev/cerbos/latest/configuration/) are stored in a ConfigMap called `config` in namespace `cerbos`. If you with to change any Cerbos configuration, update the ConfigMap and bounce the cerbos pod.

For more information about Cerbos, feel free to checkout [https://cerbos.dev/](https://www.cerbos.dev/) and [https://docs.cerbos.dev/](https://docs.cerbos.dev/cerbos/latest/index.html).

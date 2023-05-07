# Cloud toolbox

Switch context commands
```sh
kubectl config get-contexts 
kubectl config current-context 
kubectl config use-context my-cluster-name
```


Flux commands
```sh
flux check --pre
```


Setup flux
```sh
flux bootstrap github \\
    --owner=$GITHUB_USER \\
    --repository=cloud-toolbox \\
    --branch=main \\
    --path=./clusters/contabo-personal-k3s \\
    --personal
```
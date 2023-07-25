kind create cluster --name cls-02
kind get kubeconfig --name cls-02 --internal > prepare/cls-02-kc.yaml

kind create cluster --config prepare/kind-config.yaml --name kapp-ctrl-demo
kapp deploy -a kc -f prepare/release.yml -y
kubectl apply -f prepare/rbac.yaml
kubectl create secret generic cls-02-kubeconfig --from-file=value=prepare/cls-02-kc.yaml
sudo -E kwt net start

# Kapp Controller Demo
This repo contains a setup for a kapp controller demo of its App CR functionality
  
## Preperation
For this script you will need a linux machine with:  
1. [Kind](https://kind.sigs.k8s.io/docs/user/quick-start/)
2. [Slides](https://github.com/maaslalani/slides)
3. [kubectl](https://kubernetes.io/docs/tasks/tools/)
4. [kwt](https://github.com/carvel-dev/kwt)
5. [kapp](https://github.com/carvel-dev/kapp)
6. [bat](https://github.com/sharkdp/bat)
7. [tidy](http://www.html-tidy.org/)

## The Demo environment
The demo environment will deploy 2 kind clusters:
* **kapp-ctrl-demo** - 2 node with port forwarding for port 80 and 443
* **cls-02** - 1 node
  
On the **kapp-ctrl-demo** cluster we install kapp controller.
  
Apps get deployed all on the **kapp-ctrl-demo** cluster except one, to show multi cluster management.
  
The demo apps include:
* Contour - using an http source and kbld
* Nginx - using git source and helm + ytt for templating
* Redis - using helm source and templating with custom kapp flags
* Cert-Manager - using git source and CUE for templating
* Simple Web App (Deployed on both clusters) - using git source and ytt + downwardAPI for templating
  
## Running The Demo
1. Run the preperation script
```bash
./scripts/prepare.sh
```  
2. Once you see output similar to the following open a new terminal without closing the previous one
```bash
08:47:12AM: info: KubeEntryPoint: Creating networking client secret 'kwt-net-ssh-key' in namespace 'default'...
08:47:12AM: info: KubeEntryPoint: Creating networking host secret 'kwt-net-host-key' in namespace 'default'...
08:47:13AM: info: KubeEntryPoint: Creating networking pod 'kwt-net' in namespace 'default'
08:47:14AM: info: KubeEntryPoint: Waiting for networking pod 'kwt-net' in namespace 'default' to start...
08:47:29AM: info: dns.FailoverRecursorPool: Starting with '127.0.0.53:53'
08:47:29AM: info: dns.DomainsMux: Registering cluster.local.->kube-dns
08:47:29AM: info: TCPProxy: Started proxy on 127.0.0.1:34223
08:47:29AM: info: UDPProxy: Started proxy on 127.0.0.1:38042
08:47:29AM: info: dns.Server: Started DNS server on 127.0.0.1:45399 (TCP) and 127.0.0.1:56921 (UDP)
08:47:29AM: info: ForwardingProxy: Forwarding subnets: 10.244.0.3/14, 10.96.0.1/14
08:47:29AM: info: ForwardingProxy: Ready!
```  
3. In the new terminal run the demo script
```bash
./scripts/demo.sh
```  
4. To clean up the environment run the teardown script
```bash
./scripts/teardown.sh
```

# An ansible playbook script to build kubernetes using kubeadm
完全使用国内网络
# reference
 http://tonybai.com/2017/05/15/setup-a-ha-kubernetes-cluster-based-on-kubeadm-part2/
## edit config files
 k8s.hosts and group_vars/k8s.yml
## run
 ansible-playbook -i k8s.hosts -s k8s_init.yml
 please use a normal user to get ssh connection and the user with sudo privilege
## rerun
 before you run the playbook, please run the script as follow
```
# for example
for i in {1..6}
do
ssh kube$i 'sudo kubeadm reset;sudo docker stop etcd ;sudo docker rm etcd;sudo rm -rf /opt/etcd/;sudo rm -fr /var/lib/etcd;sudo rm -rf /opt/k8s_init'
done
```
## todo:
# todo: docker  direct_lvm
# --storage-opt dm.thinpooldev
apiserver loadbalance
kube-proxy
glusterfs

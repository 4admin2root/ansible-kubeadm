# An ansible playbook script to build kubernetes using kubeadm
完全使用国内网络
# reference
 http://tonybai.com/2017/05/15/setup-a-ha-kubernetes-cluster-based-on-kubeadm-part2/
## get ready
   please to check disk devices for docker direct-lvm(default: /dev/vdb) and glusterfs(default: /dev/vdc)
## edit config files
 k8s.hosts and group_vars/k8s.yml
## run
 ansible-playbook -i k8s.hosts -s k8s_init.yml
 please use a normal user to get ssh connection and the user with sudo privilege
## rerun
 before you run the playbook, please run the script as follow
```
# for example
###################### for k8s configure
for i in {1..6}
do
ssh k8sprod$i 'sudo kubeadm reset;sudo docker stop etcd ;sudo docker rm etcd;sudo rm -rf /opt/etcd/;sudo rm -fr /var/lib/etcd;sudo rm -rf /opt/k8s_init;sudo service nginx stop;sudo service keepalived stop;sudo ip addr del 10.9.5.243/32 dev eth0'
done
###################### for kube packages
for i in {1..6}
do
ssh k8sprod$i 'sudo yum remove kubectl kubeadm kubelet kubernetes-cni -y'
done
###################### for docker 
for i in {1..6}
do
ssh k8sprod$i 'sudo systemctl stop docker ; sudo yum remove docker-engine docker-engine-selinux -y; sudo vgremove -f docker ;sudo pvremove /dev/vdb;sudo rm /etc/lvm/profile/docker-thinpool.profile'
done
```
rerun create gluster
```
for i in {3..6}
do
ssh k8sprod$i 'sudo systemctl stop heketi;sudo systemctl stop glusterd;sudo vgdisplay -v|grep vg_ ;sudo yum remove heketi heketi-client -y; sudo yum remove glusterfs* -y'
done

# please check vgdisplay and vgremove -f in manual
```
## todo:
ceph
why simplehttpserver not work sometimes
loadbalance

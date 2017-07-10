# An ansible playbook script to build kubernetes using kubeadm
完全使用国内网络
## edit k8s.hosts
## run
ansible-playbook -i k8s.hosts -s k8s_init.yml
 please use a normal user to get ssh connection and the user with sudo privilege
## todo:
changed single etcd to cluster etcd

apiserver

controller scheduler

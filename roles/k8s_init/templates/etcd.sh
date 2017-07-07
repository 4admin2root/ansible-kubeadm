#!/bin/bash
export ETCDCTL_API=3
/bin/etcdctl make-mirror --no-dest-prefix=true  --endpoints=127.0.0.1:2379 --insecure-skip-tls-verify=true 127.0.0.1:{{ etcd_port }}

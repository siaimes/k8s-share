# k8s-share for OpenPAI

## 1. Select any host that is reachable by any node in the cluster (assuming the IP is 10.10.10.10).

## 2. Choose a port (e.g. `10000`) and start a container

```
sudo docker run -itd -p 0.0.0.0:10000:80 --name k8s_share siaimes/k8s-share:v1.8.0
```

## 3. Use the following configuration file

```
user: username
password: password
docker_image_tag: v1.8.0

openpai_kubespray_extra_var:
  kube_image_repo: "gcr4cn"
  gcr_image_repo: "gcr4cn"
  pod_infra_image_repo: "gcr4cn/pause-{{ image_arch }}"
  dnsautoscaler_image_repo: "gcr4cn/cluster-proportional-autoscaler-{{ image_arch }}"
  kubeadm_download_url: "http://10.10.10.10:10000/k8s-share/kubernetes-release/release/{{ kubeadm_version }}/bin/linux/{{ image_arch }}/kubeadm"
  hyperkube_download_url: "http://10.10.10.10:10000/k8s-share/kubernetes-release/release/{{ kube_version }}/bin/linux/{{ image_arch }}/hyperkube"
  cni_download_url: "http://10.10.10.10:10000/k8s-share/containernetworking/plugins/releases/download/{{ cni_version }}/cni-plugins-linux-{{ image_arch }}-{{ cni_version }}.tgz"
  calicoctl_download_url: "http://10.10.10.10:10000/k8s-share/projectcalico/calicoctl/releases/download/{{ calico_ctl_version }}/calicoctl-linux-{{ image_arch }}"
```

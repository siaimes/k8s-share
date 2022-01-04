# k8s-share for OpenPAI

## 1. Select any host that is reachable by any node in the cluster

Assuming the IP is `10.10.10.10` here, a static IP is required, which can be run on the dev-box machine.

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
  kube_image_repo: "siaimes"
  gcr_image_repo: "siaimes"
  pod_infra_image_repo: "siaimes/pause-{{ image_arch }}"
  dnsautoscaler_image_repo: "siaimes/cluster-proportional-autoscaler-{{ image_arch }}"
  kubeadm_download_url: "http://10.10.10.10:10000/k8s-share/kubernetes-release/release/{{ kubeadm_version }}/bin/linux/{{ image_arch }}/kubeadm"
  hyperkube_download_url: "http://10.10.10.10:10000/k8s-share/kubernetes-release/release/{{ kube_version }}/bin/linux/{{ image_arch }}/hyperkube"
  cni_download_url: "http://10.10.10.10:10000/k8s-share/containernetworking/plugins/releases/download/{{ cni_version }}/cni-plugins-linux-{{ image_arch }}-{{ cni_version }}.tgz"
  calicoctl_download_url: "http://10.10.10.10:10000/k8s-share/projectcalico/calicoctl/releases/download/{{ calico_ctl_version }}/calicoctl-linux-{{ image_arch }}"
```

## 4. If the device-plugin service starts slowly or fails to start

Change [this](https://github.com/microsoft/pai/blob/529db900c351c7922c3c6c81c4798f4f1bd000e1/src/device-plugin/deploy/start.sh.template#L32)
```
svn cat https://github.com/NVIDIA/k8s-device-plugin.git/tags/1.0.0-beta4/nvidia-device-plugin.yml \
```

to 

```
curl "http://10.10.10.10:10000/k8s-share/NVIDIA/k8s-device-plugin/1.0.0-beta4/nvidia-device-plugin.yml" \
```

FROM nginx AS builder

RUN apt-get update -y && apt-get install wget -y

RUN mkdir -p /usr/share/nginx/html/k8s-share/containernetworking/plugins/releases/download/v0.8.6
RUN wget https://github.com/containernetworking/plugins/releases/download/v0.8.6/cni-plugins-linux-amd64-v0.8.6.tgz \
    -O /usr/share/nginx/html/k8s-share/containernetworking/plugins/releases/download/v0.8.6/cni-plugins-linux-amd64-v0.8.6.tgz

RUN mkdir -p /usr/share/nginx/html/k8s-share/kubernetes-release/release/v1.16.15/bin/linux/amd64
RUN wget https://storage.googleapis.com/kubernetes-release/release/v1.16.15/bin/linux/amd64/hyperkube \
    -O /usr/share/nginx/html/k8s-share/kubernetes-release/release/v1.16.15/bin/linux/amd64/hyperkube
RUN wget https://storage.googleapis.com/kubernetes-release/release/v1.16.15/bin/linux/amd64/kubeadm \
    -O /usr/share/nginx/html/k8s-share/kubernetes-release/release/v1.16.15/bin/linux/amd64/kubeadm

RUN mkdir -p /usr/share/nginx/html/k8s-share/projectcalico/calicoctl/releases/download/v3.7.3
RUN wget https://github.com/projectcalico/calicoctl/releases/download/v3.7.3/calicoctl-linux-amd64 \
    -O /usr/share/nginx/html/k8s-share/projectcalico/calicoctl/releases/download/v3.7.3/calicoctl-linux-amd64

RUN mkdir -p /usr/share/nginx/html/k8s-share/NVIDIA/k8s-device-plugin/1.0.0-beta4
RUN wget https://raw.githubusercontent.com/NVIDIA/k8s-device-plugin/1.0.0-beta4/nvidia-device-plugin.yml \
    -O /usr/share/nginx/html/k8s-share/NVIDIA/k8s-device-plugin/1.0.0-beta4/nvidia-device-plugin.yml

FROM nginx

COPY --from=builder /usr/share/nginx/html/k8s-share /usr/share/nginx/html/k8s-share

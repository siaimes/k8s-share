FROM nginx AS builder

RUN mkdir -p /usr/share/nginx/html/k8s-share/containernetworking/plugins/releases/download/v0.8.1
RUN curl https://github.com/containernetworking/plugins/releases/download/v0.8.1/cni-plugins-linux-amd64-v0.8.1.tgz \
    -o /usr/share/nginx/html/k8s-share/containernetworking/plugins/releases/download/v0.8.1/cni-plugins-linux-amd64-v0.8.1.tgz

RUN mkdir -p /usr/share/nginx/html/k8s-share/kubernetes-release/release/v1.15.11/bin/linux/amd64
RUN curl https://storage.googleapis.com/kubernetes-release/release/v1.15.11/bin/linux/amd64/hyperkube \
    -o /usr/share/nginx/html/k8s-share/kubernetes-release/release/v1.15.11/bin/linux/amd64/hyperkube
RUN curl https://storage.googleapis.com/kubernetes-release/release/v1.15.11/bin/linux/amd64/kubeadm \
    -o /usr/share/nginx/html/k8s-share/kubernetes-release/release/v1.15.11/bin/linux/amd64/kubeadm

RUN mkdir -p /usr/share/nginx/html/k8s-share/projectcalico/calicoctl/releases/download/v3.7.3
RUN curl https://github.com/projectcalico/calicoctl/releases/download/v3.7.3/calicoctl-linux-amd64 \
    -o /usr/share/nginx/html/k8s-share/projectcalico/calicoctl/releases/download/v3.7.3/calicoctl-linux-amd64

RUN mkdir -p /usr/share/nginx/html/k8s-share/NVIDIA/k8s-device-plugin/1.0.0-beta4
RUN curl https://raw.githubusercontent.com/NVIDIA/k8s-device-plugin/1.0.0-beta4/nvidia-device-plugin.yml \
    -o /usr/share/nginx/html/k8s-share/NVIDIA/k8s-device-plugin/1.0.0-beta4/nvidia-device-plugin.yml

FROM nginx

COPY --from=builder /usr/share/nginx/html/k8s-share /usr/share/nginx/html

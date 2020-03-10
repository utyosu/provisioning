# command:
# docker build -t plain .
# docker run --name docker-test -d -p 2222:22 plain
# docker rm -f docker-test

FROM ubuntu:18.04

COPY id_rsa.pub /root/.ssh/authorized_keys

RUN apt update \
  && apt install -y openssh-server vim sudo passwd \
  && mkdir /run/sshd \
  && useradd -m -d /home/ops -s /bin/bash ops \
  && echo "ops:ops" | chpasswd \
  && mkdir /home/ops/.ssh \
  && chmod 700 /home/ops/.ssh \
  && cp /root/.ssh/authorized_keys /home/ops/.ssh \
  && chmod 600 /home/ops/.ssh/authorized_keys \
  && chown -R ops:ops /home/ops/.ssh \
  && echo "ops ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

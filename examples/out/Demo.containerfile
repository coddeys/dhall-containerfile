FROM fedora

# Install emacs
RUN dnf update -y && dnf install -y emacs-nox && dnf clean all

VOLUME ["/data"]
LABEL description="a text editor"
LABEL maintainer="tdecacqu@redhat.com"

ENTRYPOINT ["emacs"]

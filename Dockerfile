FROM quay.io/ukhomeofficedigital/openjdk11

ENV USER user_hocs_docs
ENV USER_ID 1000
ENV GROUP group_hocs_docs
ENV NAME hocs-docs
ENV JAR_PATH build/libs

RUN yum update -y glibc && \
    yum update -y nss && \
    yum update -y bind-license && \
    yum install -y libreoffice-headless

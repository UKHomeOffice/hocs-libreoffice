FROM quay.io/ukhomeofficedigital/openjdk11

ENV USER user_hocs_docs
ENV USER_ID 1000
ENV GROUP group_hocs_docs
ENV NAME hocs-docs
ENV JAR_PATH build/libs

RUN yum update -y glibc && \
    yum update -y nss && \
    yum update -y bind-license && \
    yum install -y cairo && \
    yum install -y cups

# set up libreOffice
RUN curl -O http://mirrors.coreix.net/thedocumentfoundation/libreoffice/stable/6.2.5/rpm/x86_64/LibreOffice_6.2.5_Linux_x86-64_rpm.tar.gz
RUN tar zxvf  LibreOffice_6.2.5_Linux_x86-64_rpm.tar.gz
RUN su -c 'yum install -y LibreOffice_6.2.5.2_Linux_x86-64_rpm/RPMS/*.rpm'

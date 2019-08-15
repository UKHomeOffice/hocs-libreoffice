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
    yum install -y cups-libs && \
    yum install -y libSM

# set up libreOffice
RUN curl -O https://downloadarchive.documentfoundation.org/libreoffice/old/5.4.7.2/rpm/x86_64/LibreOffice_5.4.7.2_Linux_x86-64_rpm.tar.gz
RUN tar zxvf LibreOffice_5.4.7.2_Linux_x86-64_rpm.tar.gz
RUN su -c 'yum install -y LibreOffice_5.4.7.2_Linux_x86-64_rpm/RPMS/*.rpm'
RUN mv /bin/libreoffice5.4 /bin/libreoffice

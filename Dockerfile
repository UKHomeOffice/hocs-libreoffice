FROM quay.io/ukhomeofficedigital/openjdk11:v11.0.5_10

ENV USER user_hocs_docs
ENV USER_ID 1000
ENV GROUP group_hocs_docs
ENV NAME hocs-docs
ENV JAR_PATH build/libs


# yum update -y glibc nss bind-license
# yum install -y cairo cups-libs libSM
RUN yum update -y glibc && \
    yum update -y nss && \
    yum update -y bind-license && \
    yum install -y cairo && \
    yum install -y cups-libs && \
    yum install -y libSM && \
    yum install -y libreoffice

# set up libreOffice
RUN curl -O http://mirrors.coreix.net/thedocumentfoundation/libreoffice/stable/6.4.7/rpm/x86_64/LibreOffice_6.4.7_Linux_x86-64_rpm.tar.gz
RUN tar zxvf LibreOffice_6.4.7_Linux_x86-64_rpm.tar.gz
RUN su -c 'yum localinstall -y LibreOffice_6.4.7.2_Linux_x86-64_rpm/RPMS/*.rpm'
RUN /bin/cp -P /bin/libreoffice6.4 /bin/libreoffice
RUN /bin/cp -P /bin/libreoffice6.4 /bin/openoffice.org

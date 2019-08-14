FROM quay.io/ukhomeofficedigital/openjdk11

ENV USER user_hocs_docs
ENV USER_ID 1000
ENV GROUP group_hocs_docs
ENV NAME hocs-docs
ENV JAR_PATH build/libs

# set up enviroment
RUN cd /home
RUN curl -O http://mirrors.coreix.net/thedocumentfoundation/libreoffice/stable/6.2.5/rpm/x86_64/LibreOffice_6.2.5_Linux_x86-64_rpm.tar.gz
RUN tar zxvf  LibreOffice_6.2.5_Linux_x86-64_rpm.tar.gz
RUN cd LibreOffice_6.2.5.2_Linux_x86-64_rpm/RPMS
RUN su -c 'yum install -y *.rpm'
RUN mv /bin/libreoffice6.2 /bin/libreoffice

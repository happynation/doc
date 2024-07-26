FROM centos:latest
RUN yum install wget unzip -y
RUN wget https://releases.hashicorp.com/terraform/0.11.14/terraform_0.11.14_linux_amd64.zip
RUN unzip terraform_0.11.15_linux_amd64.zip
RUN mv terraform /bin
test1
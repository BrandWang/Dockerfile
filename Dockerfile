FROM centos:7

MAINTAINER Brand Idasound "haowang@idasound.com"


RUN rm -rf /etc/localtime && ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime #修改时区 
RUN yum -y install kde-l10n-Chinese && yum -y install glibc-common #安装中文支持  
ENV LC_ALL zh_CN.utf8 #设置环境变量
RUN localedef -c -f UTF-8 -i zh_CN zh_CN.utf8 #配置显示中文

ENV JAVA_VERSION="1.8.0_65"

ENV JAVA_HOME="/opt/jdk${JAVA_VERSION}"

ENV PATH="${PATH}:${JAVA_HOME}/bin"

# Do not use alias cp
RUN   yum install -y zip unzip tar curl wget 

WORKDIR /opt
# ADD resources/jdk*.tar.gz /usr/local/
RUN wget http://qx24.cn/jdk1.8.0_65.zip
RUN unzip  jdk1.8.0_65.zip  
RUN rm -f  jdk1.8.0_65.zip

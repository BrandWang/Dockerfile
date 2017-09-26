FROM centos:7

MAINTAINER Brand Idasound "haowang@idasound.com"


RUN rm -rf /etc/localtime && ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime #修改时区 
RUN yum -y install kde-l10n-Chinese && yum -y install glibc-common #安装中文支持 
RUN localedef -c -f UTF-8 -i zh_CN zh_CN.utf8 #配置显示中文 
ENV LC_ALL zh_CN.utf8 #设置环境变量

ENV JAVA_VERSION="1.8.0_144"

ENV JAVA_HOME="/usr/local/jdk${JAVA_VERSION}"

ENV PATH="${PATH}:${JAVA_HOME}/bin"

# Do not use alias cp
RUN   yum install -y zip unzip tar curl wget 


# ADD resources/jdk*.tar.gz /usr/local/
RUN wget --tries=3 \
        --header "Cookie: oraclelicense=accept-securebackup-cookie" \
        http://download.oracle.com/otn-pub/java/jdk/8u144-b01/090f390dda5b47b9b721c7dfaa008135/jdk-8u144-linux-x64.tar.gz \
        -O /tmp/jdk.tar.gz \
    && tar -zxf /tmp/jdk.tar.gz -C /usr/local/ \
    && \rm -f /tmp/jdk.tar.gz ${JAVA_HOME}/src.zip ${JAVA_HOME}/javafx-src.zip

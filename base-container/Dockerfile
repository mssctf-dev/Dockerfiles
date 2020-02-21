FROM alpine
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories

RUN apk update && \
    apk add cmake linux-headers libffi-dev\
            gcc g++ make git openjdk8 openssl-dev\
            libseccomp-dev

RUN git clone https://github.com/QingdaoU/Judger /opt/libjudger --depth=1

WORKDIR /opt/libjudger
RUN cmake .
RUN make; make install

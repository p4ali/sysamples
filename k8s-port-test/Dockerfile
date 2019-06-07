FROM ubuntu:bionic

RUN apt-get update
RUN apt-get install curl wget -y
ADD ./port-test /
CMD ["./port-test"]
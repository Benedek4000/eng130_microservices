FROM mongo:latest
LABEL MAINTAINER=eng130_benedek
EXPOSE 27017
WORKDIR /usr/src/db/
COPY ./mongod.conf /etc/
CMD ["mongod"]
#RUN systemctl restart mongod

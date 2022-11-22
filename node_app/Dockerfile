FROM nginx
LABEL MAINTAINER=eng130_benedek
COPY app /home/
COPY environment /home/
EXPOSE 80
EXPOSE 3000
RUN apt-get update 
RUN apt-get install -y 
RUN apt-get install software-properties-common -y 
RUN apt-get install npm -y
#RUN npm install npm@latest -g -y
#RUN n latest
CMD ["nginx", "-g", "daemon off;"]
WORKDIR /home/app
RUN npm install
CMD ["npm", "start"]


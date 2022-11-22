# docker pull nginx
FROM nginx

# who is creating this
LABEL MAINTAINER=eng130_benedek

# copy index.html
COPY index.html /usr/share/nginx/html/

# docker run -d -p 80:80 name


# port number
EXPOSE 80

#launch the server
CMD ["nginx", "-g", "daemon off;"]

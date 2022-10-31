ARG VER=18.04
FROM ubuntu:${VER}
LABEL creator="Vamsi"
RUN apt-get update && apt-get install curl nginx -y
RUN mkdir /content
VOLUME /content
ENV EDITOR /usr/bin/nano
WORKDIR /var/www
COPY /index.html /var/www/html
EXPOSE 80
HEALTHCHECK --interval=10s --timeout=5s CMD curl --fail http://localhost:80/ || exit 1 
ENTRYPOINT ["nginx","-g"]
CMD ["daemon off;"]



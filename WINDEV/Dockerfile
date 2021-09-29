FROM windev/webdev:FR260100j
COPY mariadb_install64 /tmp
COPY mariadb_install.zip /tmp
COPY init.sh /tmp
WORKDIR /tmp
RUN apt -y update
RUN apt -y install mariadb-client libmariadb-dev
RUN chmod +x /tmp/mariadb_install64
RUN chmod +x /tmp/init.sh
RUN /tmp/mariadb_install64
ENTRYPOINT ["/tmp/init.sh",""]

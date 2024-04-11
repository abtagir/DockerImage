FROM amazonlinux

RUN yum -y update
RUN yum -y install httpd
RUN yum -y install php

COPY ./index.php /var/www/html/index.php

##CMD ["/usr/sbin/httpd","-D","FOREGROUND"]

RUN mkdir /run/php-fpm
CMD ["/bin/sh", "-c", "/usr/sbin/php-fpm && /usr/sbin/httpd -D FOREGROUND"]

EXPOSE 80

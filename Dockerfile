FROM visiblevc/wordpress:latest
MAINTAINER Jan Čejka <posta@jancejka.cz>

LABEL Description="Latest WordPress on with activated xdebug module on port 9000 and with IDEKEY phpstorm" Vendor="Jan Čejka" Version="1.0"

ENV XDEBUG_PORT 9000

RUN apt-get update && \
	yes | apt-get install php5-dev && \
	yes | pecl install xdebug && \
    echo "zend_extension=$(find /usr/lib/php5 -name xdebug.so)" > /etc/php5/apache2/conf.d/xdebug.ini && \
	echo "xdebug.remote_enable=on" >> /etc/php5/apache2/conf.d/xdebug.ini && \
	echo "xdebug.idekey=phpstorm" >> /etc/php5/apache2/conf.d/xdebug.ini && \
	echo "xdebug.remote_autostart=off" >> /etc/php5/apache2/conf.d/xdebug.ini && \
	echo "66.155.40.202 api.wordpress.org" >> /etc/hosts

EXPOSE 9000

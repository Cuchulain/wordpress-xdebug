FROM visiblevc/wordpress:latest-php5.6
MAINTAINER Jan Čejka <posta@jancejka.cz>

LABEL Description="Latest WordPress on PHP 5.6 with activated xdebug module on port 9000 and with IDEKEY phpstorm" Vendor="Jan Čejka" Version="1.0"

ENV XDEBUG_PORT 9000

RUN apt-get update && \
	yes | apt-get install php5-dev && \
	yes | apt-get install php5-xdebug && \
    echo "zend_extension=$(find /usr/lib/php5 -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini && \
	echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/xdebug.ini && \
	echo "xdebug.idekey=phpstorm" >> /usr/local/etc/php/conf.d/xdebug.ini && \
	echo "xdebug.remote_autostart=off" >> /usr/local/etc/php/conf.d/xdebug.ini

EXPOSE 9000
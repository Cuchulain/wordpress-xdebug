# WordPress with xdebug

**WordPress** with installed PHP **xdebug** module.

xdebug settings:
* xdebug port: **9000**
* IDEKEY: **phpstorm**

You can use this image with **docker-compose** for example.

Example of **docker-compose.yml** file:

```
version: '2'
services:
  wordpress:
    image: cuchulain/wordpress-xdebug
    links:
      - db_wp
    ports:
      - 8080:80
      - 443:443
    volumes:
      - ./data:/data # Required if importing an existing database
      - ./wp-content/uploads:/app/wp-content/uploads
      - ./wp-content/plugins/myplugin:/app/wp-content/plugins/myplugin # Plugin development
    environment:
      DB_HOST: db_wp
      DB_NAME: wordpress
      DB_PASS: root # must match below
      # PLUGINS: >-
      #   academic-bloggers-toolkit,
      #   co-authors-plus
      SEARCH_REPLACE: yoursite.com,localhost:8080
      WP_DEBUG: 'true'
  db_wp:
    image: mysql:5.7
    ports:
      - 3306:3306
    volumes:
      - data:/var/lib/mysql
    environment:
      MYSQL_ROOT_PASSWORD: root
volumes:
  data: {}
```

For next informations look at primary repository [visiblevc/wordpress-starter](https://github.com/visiblevc/wordpress-starter).
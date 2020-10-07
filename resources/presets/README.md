# Presets

##### 1. env-example-preset1.txt

- PHP 7.4 + Phalcon 4 + Apache + Varnish + BCmath + OPC + RDKafka + Redis + XDebug
- automatic install Yarn, Bower, Composer, Pip dependencies

    Compose:
    
        docker-compose up -d --force-recreate proxy apache2 php-fpm mongo graylog zookeeper beanstalkd portainer redis redis-webui elasticsearch mysql phpmyadmin


redist
=====

An OTP library

Build
-----

    $ rebar3 compile


Docker
-----

`docker-compose.yml`

```yaml
version: "2"
services:
#  postgres:
#    image: "postgres:9.6"
#    ports:
#      - "5432:5432"
#    environment:
#      - POSTGRES_DB=kalki
#      - POSTGRES_USER=kalki
#      - POSTGRES_PASSWORD=kalki
#      - PGDATA=/var/lib/postgresql/data/pgdata
#  mongo:
#    image: "mongo:3.0.14"
#    ports:
#      - "27017:27017"
#  elasticsearch:
#    image: "elasticsearch:1.7.5"
#    ports:
#      - "9300:9300"
#      - "9200:9200"
#    volumes:
#      - ./config/elastic/elasticsearch.yml:/usr/share/elasticsearch/config/elasticsearch.yml
#  activemq:
#    image: "webcenter/activemq:5.13.2"
#    ports:
#      - "61616:61616"
#      - "8161:8161"
#    volumes:
#      - ./config/activemq/credentials.properties:/opt/activemq/conf/credentials.properties
#  greenmail:
#    image: "greenmail/standalone:1.5.2"
#    ports:
#      - "3025:3025"
#      - "3110:3110"
#      - "3143:3143"
#      - "3465:3465"
#      - "3993:3993"
#      - "3995:3995"
#    environment:
#      - GREENMAIL_OPTS=-Dgreenmail.auth.disabled -Dgreenmail.users=test:pwd@example.com
  redis:
    image: "redis:3.0.7"
    ports:
      - "6379:6379"
```
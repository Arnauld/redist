redist
=====

Redis experiment in Erlang.

Build
-----

    $ rebar3 do clean, compile, eunit, shell
    ...
    Erlang/OTP 19 [erts-8.2] [source] [64-bit] [smp:4:4] [async-threads:0] [kernel-poll:false]

    Eshell V8.2  (abort with ^G)
    1> use
    usecase     user        user_drv    user_sup
    1> usecase:sc().
    CFG: <<"OK">>
    >> {ok,<<"10">>}
    >> {subscribed,<<"__key*__:*">>,<0.169.0>}
    >> {ok,<<"9">>}
    >> {ok,<<"8">>}
    >> {ok,<<"7">>}
    >> {ok,<<"6">>}
    >> {ok,<<"5">>}
    >> {ok,<<"4">>}
    >> {ok,<<"3">>}
    >> {ok,<<"2">>}
    >> {ok,<<"1">>}
    >> Expired!!
    >> {pmessage,<<"__key*__:*">>,<<"__keyspace@0__:foo">>,<<"expired">>,
                 <0.169.0>}
    >> {pmessage,<<"__key*__:*">>,<<"__keyevent@0__:expired">>,<<"foo">>,
                 <0.169.0>}
    ok
    2>



Links
-----

* [Erlang Redis Client](https://github.com/wooga/eredis)
* Redis
  * [PSUBSCRIBE](https://redis.io/commands/psubscribe)
  * [EXPIRE](https://redis.io/commands/expire)
  * [Redis Keyspace Notifications](https://redis.io/topics/notifications)
  * [Stackoverflow: Redis, session expiration, and reverse lookup](http://stackoverflow.com/a/16747795)


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
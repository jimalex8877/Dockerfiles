FROM changmingjiang/redis:latest

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["redis-sentinel", "/opt/redis/sentinel.conf"]
FROM docker:18

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh
RUN apk add openssh

ENTRYPOINT ["sh", "/entrypoint.sh"]

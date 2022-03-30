FROM docker:18


COPY "script.sh" "/script.sh"

RUN chmod +x /script.sh
RUN apk add openssh

ENTRYPOINT ["/script.sh"]

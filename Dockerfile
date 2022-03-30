FROM docker:18

COPY entrypoint.sh /entrypoint.sh

RUN ls -a -l
RUN chmod +x /entrypoint.sh
RUN apk add openssh

ENTRYPOINT ["sh", "/entrypoint.sh"]
#ENTRYPOINT ["sh", "-c", "echo $GITHUB_SHA"]

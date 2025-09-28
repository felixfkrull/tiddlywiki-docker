FROM node:alpine

ENV TIDDLYWIKI_VERSION=5.3.8

# ARG SOURCE_COMMIT
# LABEL source-commit="${SOURCE_COMMIT:-unknown}"

# https://github.com/nodejs/docker-node/blob/master/docs/BestPractices.md#handling-kernel-signals
RUN apk add --no-cache tini
RUN npm install -g tiddlywiki@${TIDDLYWIKI_VERSION}

EXPOSE 8080

VOLUME /tiddlywiki
WORKDIR /tiddlywiki

ENTRYPOINT ["/sbin/tini", "--", "tiddlywiki"]
CMD ["--help"]

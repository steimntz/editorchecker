FROM node:10.14.1-alpine
RUN apk add -U --no-cache git
RUN npm install -g editorconfig-checker
COPY src/editorconfig-check.sh /usr/bin/check

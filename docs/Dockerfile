FROM node:latest
LABEL description="Compiler Docs"
WORKDIR /docs
RUN npm install -g docsify-cli@latest --registry=https://registry.npm.taobao.org
EXPOSE 8081/tcp
ENTRYPOINT docsify serve --port 8081 .
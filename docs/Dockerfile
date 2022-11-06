FROM node:latest
LABEL description="Compiler Docs"
WORKDIR /docs
RUN npm install -g docsify-cli@latest
EXPOSE 8081/tcp
ENTRYPOINT docsify serve --port 8081 .
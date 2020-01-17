FROM node:10-alpine
# setup proxies
RUN npm config set strict-ssl=false && \
    npm config set registry=http://registry.npmjs.org/ && \
    npm config set proxy=http://210.245.31.16:80/ && \
    npm config set https-proxy=http://210.245.31.16:80/
RUN mkdir /app
COPY index.js /app
WORKDIR /app
RUN npm install express
EXPOSE 4444

CMD ["node", "index.js"]
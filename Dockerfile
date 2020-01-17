FROM node:10-alpine
ENV http_proxy http://210.245.31.16:80/
ENV https_proxy http://210.245.31.16:80/
RUN mkdir /app
COPY index.js /app
WORKDIR /app
RUN npm install express
EXPOSE 4444

CMD ["node", "index.js"]
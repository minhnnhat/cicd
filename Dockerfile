FROM node:10-alpine
ENV http_proxy http://proxy.hcm.fpt.vn:80/
ENV https_proxy http://proxy.hcm.fpt.vn:80/
RUN mkdir /app
COPY index.js /app
WORKDIR /app
RUN npm install express
EXPOSE 4444

CMD ["node", "index.js"]
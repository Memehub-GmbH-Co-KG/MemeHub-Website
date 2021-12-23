FROM node:current-alpine
WORKDIR /usr/src/memehub-website
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 80
CMD [ "npm", "run", "prod" ]

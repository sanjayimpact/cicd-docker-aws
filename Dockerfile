#step first
FROM node:22 AS build

WORKDIR /app

#Copy package.json

COPY package*.json ./

#Run npm install

RUN npm install


#Copy all the files

COPY . .

RUN npm run build



#step-2: use nginx for server

FROM nginx:alpine

COPY --from=build /app/dist  /usr/share/nginx/html

EXPOSE 80

CMD ["nginx","-g","daemon off;"]
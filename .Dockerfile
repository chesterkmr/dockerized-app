FROM node:12

WORKDIR /app

COPY . ./

RUN npm install
RUN npm run build


EXPOSE 3000

CMD ["npm" , "start"]


FROM nginx:alpine
COPY /build /usr/share/nginx/html
COPY /nginx/nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD [“nginx”, “-g”, “daemon off;”]
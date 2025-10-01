FROM node:alpine AS first-build
WORKDIR /app
COPY package*.json /app/
RUN npm install
COPY . .

FROM node:alpine AS second-build
WORKDIR /app
COPY --from=first-build /app .
EXPOSE 3000
CMD npm start
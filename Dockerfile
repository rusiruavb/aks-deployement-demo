FROM node:14.17
WORKDIR /app
COPY . /app 
RUN npm install
ENTRYPOINT ["npm", "run"]
CMD ["start"]
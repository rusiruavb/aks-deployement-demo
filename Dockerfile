FROM node:14.17
WORKDIR /app
COPY . /app 
RUN npm install
EXPOSE 8045
ENTRYPOINT ["npm", "run"]
CMD ["start"]

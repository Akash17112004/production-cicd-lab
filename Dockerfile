FROM node:18

WORKDIR /app

COPY . .

# Install ALL dependencies (not production only)
RUN npm install

COPY . .

EXPOSE 3000

CMD ["node", "server.js"]
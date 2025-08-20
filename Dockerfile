# Use the official Node.js LTS image
FROM node:20

# Set working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json first to leverage Docker cache
COPY package*.json ./

# Install dependencies
RUN npm install --production

# Copy the rest of the application code
COPY . .

# Expose the port your app runs on (adjust if different)
EXPOSE 3000

# Start the application
CMD ["node", "app.js"]

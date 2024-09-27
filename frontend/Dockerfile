# Use the official Node.js image
FROM node:16

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json first
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code and the .env file
COPY . .

# Build the React app for production
RUN npm run build

# Use a lightweight server to serve the built app
FROM nginx:alpine

# Copy built files to Nginx
COPY --from=0 /app/build /usr/share/nginx/html

# Expose the port that Nginx runs on
EXPOSE 80

# Command to run Nginx
CMD ["nginx", "-g", "daemon off;"]

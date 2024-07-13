# Use a specific version of the Node.js Alpine image
FROM node:12.2.0-alpine

# Set the working directory
WORKDIR /app

# Copy only package.json and package-lock.json first to leverage Docker's cache
COPY package*.json ./

# Install dependencies
RUN npm ci --only=production

# Copy the rest of the application code
COPY . .

# Expose the application port
EXPOSE 8000

# Start the application
CMD ["node", "app.js"]

FROM node:alpine

# Install necessary packages
RUN apk add --no-cache npm
RUN npm install -g @angular/cli
RUN npm install -g json

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json if applicable
COPY package.json .
COPY package-lock.json .

# Install dependencies
RUN npm install

# Copy the rest of the application
COPY . .

# Expose port
EXPOSE 4200

# Command to run the application
CMD ["ng", "serve", "--host", "0.0.0.0"]


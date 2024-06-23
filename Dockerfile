# Stage 1: Build Angular application
FROM node:18.19 AS build

WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Run Angular Compatibility Compiler (ngcc)
RUN npx ngcc --properties es2024 browser module main --first-only --create-ivy-entry-points

# Copy the rest of the application
COPY . .

# Build the Angular app
RUN npm run build --prod

# Stage 2: Serve Angular application with nginx
FROM nginx:stable

# Copy the build output from Stage 1
COPY --from=build /app/dist/my-angular-app/browser/ /usr/share/nginx/html

# Copy the server-side files if needed
# COPY --from=build /app/dist/my-angular-app/server /app/server

# Remove default nginx configuration
RUN rm /etc/nginx/conf.d/default.conf

# Copy custom nginx configuration
COPY nginx/nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80

# Start nginx server
CMD ["nginx", "-g", "daemon off;"]

# # Start the server using a shell script
# CMD ["sh", "-c", "node /app/server/server.mjs & nginx -g 'daemon off;'"]

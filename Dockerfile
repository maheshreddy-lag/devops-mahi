# Step 1: Use the official Nginx image from Docker Hub
FROM nginx:latest

# Step 2: Copy the custom nginx.conf file (optional)
# This step is only needed if you want to use a custom Nginx config file
COPY nginx.conf /etc/nginx/nginx.conf

# Step 3: Copy the static files (HTML, CSS, JS) to the appropriate Nginx directory
COPY . /usr/share/nginx/html

# Step 4: Expose the default HTTP port (80)
EXPOSE 80

# Step 5: Start Nginx (Nginx will start automatically with the base image)
CMD ["nginx", "-g", "daemon off;"]

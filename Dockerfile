# Use the nginx image
FROM nginx:latest

# Copy the Nginx configuration file
COPY nginx/nginx.conf /etc/nginx/nginx.conf

# Copy images to the appropriate directory
COPY images /usr/share/nginx/html/images

# Copy the purge_cache.sh script to the appropriate directory
COPY script/purge_cache.sh /var/cache/nginx/purge_cache.sh

# Create the cache directory and make the script executable
RUN mkdir -p /var/cache/nginx && \
    chmod +x /var/cache/nginx/purge_cache.sh

# Expose ports for both services
EXPOSE 3000 3001

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]

# Use the OpenResty image
FROM openresty/openresty:latest

# Copy the Nginx configuration file
COPY nginx/nginx.conf /usr/local/openresty/nginx/conf/nginx.conf

# Copy images to the appropriate directory
COPY images /usr/local/openresty/nginx/html/images

# Create the cache directory
RUN mkdir -p /var/cache/nginx

# Expose ports for both services
EXPOSE 3000 3001

# Start OpenResty
CMD ["openresty", "-g", "daemon off;"]

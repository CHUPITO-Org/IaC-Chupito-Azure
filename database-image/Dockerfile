# Use official MongoDB image as the base image
FROM mongo:6.0.6

# Copy the initialization script into the container
COPY mongo-init.js /docker-entrypoint-initdb.d/

# Set permissions for the initialization script
RUN chmod 755 /docker-entrypoint-initdb.d/mongo-init.js

EXPOSE 27017
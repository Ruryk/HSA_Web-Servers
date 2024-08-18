# HSA12  8. Web Servers

## Nginx Fine Tuning
- Configure nginx that will cache only images, that were requested at least twice.
- Add ability to drop nginx cache by request.
- You should drop cache for specific file only (not all cache).

## How to start a server?

### 1. Building a Docker image:
````
docker-compose build
````

### 2. Launching the container:
If you are using docker-compose:
````
docker-compose up -d
````

## Checking image caching

### 1. Initial request:
Make an initial request to the image:
````bash
curl -i http://localhost:3000/images/1.jpg
````
The X-Proxy-Cache header should be MISS, indicating that the image was not cached.

### 2. Subsequent request:
Make the same request again:
````bash
curl -i http://localhost:3000/images/1.jpg
````
The X-Proxy-Cache header should be HIT, indicating that the image is now cached.

### 3. Purge cache (optional):
To clear the cache for a specific image:
````bash
curl -X PURGE http://localhost:3000/purge/images/1.jpg
````

### 4. Verify cache clearing:
After purging, make the request again to ensure that the cache has been cleared and the image is fetched fresh:
````bash
curl -i http://localhost:3000/images/1.jpg
````
The X-Proxy-Cache header should be MISS again, indicating that the cache was cleared and the image is re-cached.

## How to stop server?

### 1. Stopping the Docker service:
````bash
docker-compose down
````

### 2. Clean up all inactive resources:
````bash
docker system prune -a --volumes
````
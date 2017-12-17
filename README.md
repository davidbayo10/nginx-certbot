# NGINX Certbot

You need nginx installed in your local machine

```bash
docker run -d -it --name certbot -v $HOME/certificates:/etc/letsencrypt/live --net host nginx-certbot
```

## How to generate certificates?
```bash
docker exec -it certbot generate-cert example.com
```

## How it works with NGINX as docker container?

```bash
docker network create nginx-certbot
docker run -d --name nginx --net nginx-certbot -p 80:80 nginx
docker run -d -it --name certbot -v $HOME/certificates:/etc/letsencrypt/live --net nginx-certbot nginx-certbot
docker exec -it certbot generate-cert example.com
```

FROM mongo:4.4

EXPOSE 27017

ENV MONGO_INITDB_ROOT_USER=root \
    MONGO_INITDB_ROOT_PASSWORD=111111 \
    MONGO_INITDB_DATABASE=amasona_clone \
    MONGO_INITDB_USERNAME=admin \
    MONGO_INITDB_PASSWOR=123456


COPY ./init-mongo.sh /docker-extrypoint-initdb.d
COPY . /data/db


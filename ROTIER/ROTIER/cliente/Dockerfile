# Use a imagem base Alpine
FROM alpine:latest

# Atualize a lista de pacotes e instale iputils (para ping) e curl
RUN apk update && apk add --no-cache iputils curl

# Comando para manter o container ativo (conforme já definimos no docker-compose.yml)
CMD ["sleep", "infinity"]
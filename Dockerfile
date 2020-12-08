	# Setar a imagem do nginx
FROM nginx

	# Autor/Mantenedor
MAINTAINER Gabriel Yamauti

	# Copiar configurações customizadas do diretório atual
#COPY nginx.conf /etc/nginx/nginx.conf
COPY _book/ /usr/share/nginx/html
#COPY certificado/certificado.crt  /etc/ssl/certificado.crt
#COPY certificado/certificado.key  /etc/ssl/certificado.key

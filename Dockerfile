FROM nginx:latest
MAINTAINER Gabriel B Yamauti <gabriel.brody@gmail.com>
copy _book/ /usr/share/nginx/html
EXPOSE 80
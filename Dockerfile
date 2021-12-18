FROM klakegg/hugo as build

COPY ./ /site
WORKDIR /site
RUN hugo -t hugo-resume --gc --minify

#Copy static files to Nginx
FROM nginx:alpine
COPY --from=build /site/public /usr/share/nginx/html

WORKDIR /usr/share/nginx/html
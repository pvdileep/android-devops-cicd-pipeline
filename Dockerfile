FROM nginx:latest
COPY cicd-dashboard/index.html /usr/share/nginx/html/index.html
EXPOSE 80

#!/bin/sh
docker-compose exec work bash -c "
rm -f bootstrap/cache/config.php &&
php artisan cache:clear &&
php artisan config:clear &&
php artisan route:clear &&
php artisan view:clear" 

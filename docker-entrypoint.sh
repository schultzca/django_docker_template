#!/bin/sh
set -e

python manage.py collectstatic
python manage.py makemigrations
python manage.py migrate

uwsgi --http :8000 --module django_docker_template.wsgi

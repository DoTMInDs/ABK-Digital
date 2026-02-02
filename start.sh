#!/bin/bash
set -o errexit

python manage.py collectstatic --no-input
python manage.py migrate

if [ "$DJANGO_CREATEUSER" == "1" ]; then 
    python manage.py createsuperuser --noinput
fi

python manage.py runserver 0.0.0.0:$PORT
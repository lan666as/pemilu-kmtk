#!/bin/sh

# if [ "$DATABASE" = "postgres" ]
# then
#     echo "Waiting for postgres..."

#     while ! nc -z $SQL_HOST $SQL_PORT; do
#       sleep 0.1
#     done

#     echo "PostgreSQL started"
# fi

python manage.py flush --no-input
python manage.py makemigrations
python manage.py migrate --noinput

# echo "from helios_auth.models import User; User.objects.create(user_type='password',user_id='${ADMIN_EMAIL}', info={'name':'${ADMIN_NAME}','password':'${ADMIN_PASS}'}, admin_p=True)" | python manage.py shell
# echo "from helios_auth.models import User; User.objects.create(user_type='password',user_id='${ADMIN_EMAIL}', info={'name':'${ADMIN_NAME}','password':'${ADMIN_PASS}'}, admin_p=True)"
echo "from helios_auth.models import User; User.objects.create(user_type='google',user_id='${ADMIN_EMAIL}', info={'name':'${ADMIN_NAME}'}, admin_p=True)" | python manage.py shell

exec "$@"
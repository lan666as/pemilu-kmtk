#!/bin/sh

python manage.py flush --no-input
python manage.py makemigrations
python manage.py migrate
# python manage.py collectstatic --no-input --clear

# echo "from helios_auth.models import User; User.objects.create(user_type='password',user_id='${ADMIN_EMAIL}', info={'name':'${ADMIN_NAME}','password':'${ADMIN_PASS}'}, admin_p=True)" | python manage.py shell
echo "from helios_auth.models import User; User.objects.create(user_type='password',user_id='load_testing', info={'name':'Load Testing','password':'kuatberapalur'})" | python manage.py shell
echo "from helios_auth.models import User; User.objects.create(user_type='google',user_id='${ADMIN_EMAIL}', info={'name':'${ADMIN_NAME}'}, admin_p=True)" | python manage.py shell

exec "$@"
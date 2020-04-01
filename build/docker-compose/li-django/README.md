# For existing project
- Copy these files to your Django project where project `manage.py` is located
    - `Dockerfile`
    - `requirements.txt`
    - `docker-compose.yml`
        - Database: postgres
        - In container run on port 8000, exposed to Docker host is 80
- `docker-compose up -d --build`
    - Image `li-django_web` is built. Need to rebuild or remove it if `Dockerfile` is modified
- `docker-compose down -v --rmi local`
    
# For new project
- `sudo docker-compose run web django-admin startproject composeexample .`
    - A new Django project called `composeexample` is created
    - This folder and the `manage.py` might have root permissions, change it `sudo chown -R $USER:$USER .`
- `docker-compose up`

# Connect to database

`myproject/settings.py`
```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'postgres',
        'USER': 'postgres',
        'HOST': 'db',
        'PORT': 5432,
    }
}
```

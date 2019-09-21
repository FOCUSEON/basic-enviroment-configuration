# Django basic enviroment configuration

## ```settings.py```

### time & language

|Item|Value|Remarks|
|-|-|-|
|LANGUAGE|LANGUAGE_CODE = 'zh-Hans'|-|
|TIME_ZONE|TIME_ZONE = 'Asia/Shanghai'|-|
|USE_TZ|USE_TZ = False|不使用时区|

### Database

#### Sqlite

```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
    }
}
```

#### Mysql

```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'sends',
        'USER': 'sends',
        'PASSWORD': 'Database@sends',
        'HOST': 'rm-wz9z2w12238s762pnxo.mysql.rds.aliyuncs.com',
        'PORT': '3306',
        'OPTIONS': {'init_command': "SET sql_mode='STRICT_TRANS_TABLES'"},
        'AUTOCOMMIT': True
    }
}
```

#### 参考链接

1. [Django documents](https://docs.djangoproject.com/en/2.2/)
2. [Django database](https://docs.djangoproject.com/en/2.2/ref/databases/)
3. [Time zones](https://docs.djangoproject.com/en/2.2/topics/i18n/timezones/)

## Djangorestframework

### installization

```cmd
(env)# pip install djangorestframework
```

### configuration in ```settings.py```

```python
INSTALLED_APPS = [
    'rest_framework'
]
```

### configuration in ```urls.py```

## Deploy

### requirement.txt

```pip freeze > requirements.txt```

### docker-compose

#### Dockerfile

```Dockerfile
FROM python:3
ENV PYTHONUNBUFFERED 1
RUN mkdir /www
WORKDIR /www
COPY . /www/
RUN pip install -r requirements.txt
```

#### docker-compose.yml

```yml
version: '3'

services:
  web:
    build: .
    command: python manage.py runserver 0.0.0.0:8000
    volumes:
      - .:/www
    ports:
      - "80:8000"
```
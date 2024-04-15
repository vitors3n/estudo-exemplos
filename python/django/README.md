
## Iniciando projeto em Django Rest Framework (DRF)

<!-- 

Bases:

https://docs.djangoproject.com/en/5.0/intro/tutorial01/
https://www.django-rest-framework.org/tutorial/quickstart/

-->

```

python -m venv venv

```

> use -m para acessar o modulo venv e criar o ambiente virtual na pasta venv

---
Entre no ambiente virtual com 

Linux:
```

source venv\bin\activate

```

Windows:
```

venv\Script\activate.bat

```

Instale Django e DRF
```

pip install django
pip install djangorestframework

```

continua...


Como gerar nova SECRET KEY 

```

python manage.py shell -c "from django.core.management.utils import get_random_secret_key; print(get_random_secret_key())"


```



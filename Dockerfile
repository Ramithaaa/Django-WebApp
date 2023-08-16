FROM python:3.11.4
RUN pip install Django==4.2.4 django-crispy-forms Pillow
RUN pip install crispy-bootstrap4
COPY . .
RUN python django_web_app/manage.py makemigrations
RUN python django_web_app/manage.py migrate

CMD ["python", "django_web_app/manage.py", "runserver","0.0.0.0:8000"]

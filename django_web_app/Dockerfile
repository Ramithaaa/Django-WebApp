FROM python:3
RUN pip install Django django-crispy-forms Pillow
#RUN pip install requirements.txt
COPY . .
RUN python django_web_app/manage.py makemigrations
RUN python django_web_app/manage.py migrate

CMD ["python", "django_web_app/manage.py", "runserver","0.0.0.0:8000"]

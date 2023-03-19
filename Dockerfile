FROM python:3.8.16-slim-buster

ENV PYTHONUNBUFFERED=1

WORKDIR /app
COPY ./ /app

RUN pip install --upgrade pip --no-cache-dir

RUN pip install -r /app/requirements.txt --no-cache-dir

# CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
CMD ["gunicorn", "mysite.wsgi:application", "--bind", "0.0.0.0:8000"]
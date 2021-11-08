FROM python:3.9
WORKDIR /home/movies
COPY ./movies_admin/ /home/movies

RUN apt-get update \
    && apt-get -y install postgresql-client \
    && pip3 install --no-cache-dir -r requirements.txt

EXPOSE 8000
CMD ["gunicorn", "-b", "0.0.0.0:8000", "config.wsgi", "app:movies"]

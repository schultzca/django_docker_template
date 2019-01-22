FROM python:3.6-alpine

# Install build dependencies needed for scientific computing packages.
RUN apk add --no-cache --virtual .build-deps \
        gcc \
        make \
        libc-dev \
        musl-dev \
        linux-headers \
        pcre-dev \
        postgresql-dev

# Copy in the requirements file.
ADD requirements.txt /requirements.txt

# Install python dependencies from requirements.txt
RUN pip install -r requirements.txt

# Copy application code ot the container.
RUN mkdir /code/
WORKDIR /code/
ADD . /code/

# uWSGI will listen on this port
EXPOSE 8000

ENTRYPOINT ["/code/docker-entrypoint.sh"]

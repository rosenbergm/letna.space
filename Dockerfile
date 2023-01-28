FROM python:3.10

EXPOSE 80

WORKDIR /app

RUN pip install poetry

COPY . /app

RUN poetry install --no-root

VOLUME [ "/static" ]
CMD [ "poetry", "run", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80", "--proxy-headers" ]
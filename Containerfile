FROM python:3.7-alpine
COPY . /app
WORKDIR /app
RUN pip install .
RUN model_api create-db
RUN model_api populate-db
RUN model_api add-user -u admin -p admin
EXPOSE 5000
CMD ["model_api", "run"]

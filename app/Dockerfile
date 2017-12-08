FROM python:3.6-alpine
RUN mkdir /webapp
WORKDIR /webapp
VOLUME /webapp
COPY requirements.txt /webapp/
RUN pip install -r requirements.txt
COPY . /webapp/
CMD ["python", "app.py"]

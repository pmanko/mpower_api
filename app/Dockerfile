FROM python:3.6-alpine
RUN mkdir /webapp
VOLUME /webapp
WORKDIR /webapp
RUN pip install -r requirements.txt
CMD ["python", "app.py"]

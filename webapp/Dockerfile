FROM python:3.6-alpine

ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.0.0/wait /wait
RUN chmod +x /wait

RUN mkdir /webapp
WORKDIR /webapp
VOLUME /webapp
COPY requirements.txt /webapp/
RUN pip install -r requirements.txt
COPY . /webapp/
CMD /wait && python app.py

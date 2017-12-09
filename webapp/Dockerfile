FROM python:3.6-alpine

ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.0.0/wait /wait
RUN chmod +x /wait

RUN mkdir /webapp
WORKDIR /webapp
VOLUME /webapp
# COPY wait-for-db.sh /
COPY requirements.txt /webapp/
# RUN chmod +x /wait-for-db.sh
RUN pip install -r requirements.txt
# RUN ["/wait-for-db.sh", "db:3306"]
COPY . /webapp/
CMD ["/wait", "python", "run.py"]

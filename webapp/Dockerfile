FROM python:3.6-onbuild

ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.0.0/wait /wait
RUN chmod +x /wait

# CMD /wait && python app.py

# CMD /wait && python -m flask run --host=0.0.0.0

CMD /wait && gunicorn --config=gunicorn.py app:app

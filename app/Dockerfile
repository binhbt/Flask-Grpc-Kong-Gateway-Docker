FROM python:3.8

LABEL MAINTAINER="Faizan Bashir <faizan.ibn.bashir@gmail.com"

# ENV GROUP_ID=1000 \
#     USER_ID=1000


WORKDIR /app

ADD requirements.txt /app/requirements.txt
RUN pip3 install -r requirements.txt
RUN pip3 install gunicorn

ADD . /app

# Installing supervisor service and creating directories for copy supervisor configurations
RUN apt-get update && apt-get -y install supervisor && mkdir -p /var/log/supervisor && mkdir -p /etc/supervisor/conf.d
ADD supervisor.conf /etc/supervisor.conf



EXPOSE 5000
EXPOSE 1020

# OPT1 - RUN gunicorn server
# CMD [ "gunicorn", "-w", "4", "--bind", "0.0.0.0:5000", "wsgi"]

# OPT2 - RUN http and grpc concurrent by script bash
# CMD [ "bash", "multiple_process.sh" ]

# OPT3 - Run http and grpc with multiuple processor by supervisor
CMD ["supervisord", "-c", "/etc/supervisor.conf"]
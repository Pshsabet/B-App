FROM ubuntu:bionic
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get -y install \
    python3.7 python3.7-dev python3-pip python3.7-venv 
  
ARG USER=root
USER $USER
RUN python3.7 -m venv venv
WORKDIR /app

COPY requirements.txt ./requirements.txt
RUN pip3 install -r requirements.txt
COPY start.sh start.sh
COPY app.py app.py

EXPOSE 5000
RUN chmod +x /app/start.sh
ENTRYPOINT ["./start.sh"]
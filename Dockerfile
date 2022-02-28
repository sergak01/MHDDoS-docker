FROM python:3-alpine

MAINTAINER Serhii Shpak <sergak.shpak@gmail.com>

RUN apk add git bash g++ linux-headers libffi-dev

WORKDIR /home/MHDDoS

RUN /usr/local/bin/python -m pip install --upgrade pip

RUN git clone https://github.com/MHProDev/MHDDoS.git .

RUN pip3 install psutil

RUN pip3 install -r requirements.txt

ENTRYPOINT ["python3", "start.py"]

CMD ["help"]

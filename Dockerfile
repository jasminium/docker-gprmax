FROM python:3
WORKDIR /app
COPY . .
RUN apt-get update
RUN apt-get -y install build-essential
RUN apt-get -y install git
RUN pip install --no-cache-dir -r requirements.txt
RUN git clone https://github.com/gprMax/gprMax.git
WORKDIR /app/gprMax
RUN python setup.py build
RUN python setup.py install
WORKDIR /app
CMD ["python", "-m", "gprMax", "model.in"]

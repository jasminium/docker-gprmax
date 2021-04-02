FROM python:3.8-slim-buster

LABEL maintainer="johnmatthewhartley@gmail.com"

# Require a compiler to build gprMax
RUN apt-get update && \
  apt-get install -y --no-install-recommends \
  build-essential \
  git

WORKDIR /app
# Copy the requirements.txt first to leverage the Docker cache
COPY requirements.txt .
RUN pip install -r requirements.txt

# We build gprMax from source because the simulation optimised for
# different architectures.
RUN git clone https://github.com/gprMax/gprMax.git
WORKDIR /app/gprMax
# We should fix this to a specific version as its the dev branch!
RUN git checkout devel
RUN python setup.py build
RUN python setup.py install

WORKDIR /app

# Copy app files last to prevent cache busting
COPY . .

CMD [ "model.in" ]
ENTRYPOINT [ "python", "-m", "gprMax"]

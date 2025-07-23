FROM python:3.9-slim

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

RUN apt update
RUN apt install -y curl
RUN pip3 install flask
CMD ["flask", "--app", "main", "run"]

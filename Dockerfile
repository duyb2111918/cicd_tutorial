FROM ubuntu:latest

MAINTAINER Tuan Thai "tuanthai@example.com"

# Cài đặt các gói cần thiết
RUN apt update -y && \
    apt install -y python3-pip python3-dev build-essential python3-venv

# Tạo thư mục cho ứng dụng và sao chép mã nguồn vào container
ADD . /flask_app
WORKDIR /flask_app

# Tạo và kích hoạt virtual environment, cài đặt các gói Python
RUN python3 -m venv venv
RUN ./venv/bin/pip install --upgrade pip
RUN ./venv/bin/pip install -r requirements.txt

# Thiết lập biến PATH để sử dụng virtual environment
ENV PATH="/flask_app/venv/bin:$PATH"

ENTRYPOINT ["python3"]
CMD ["flask_docker.py"]


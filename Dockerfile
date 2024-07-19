FROM python:3.11-slim

RUN apt-get update && \
    apt-get install -y \
    build-essential \
    pkg-config \
    libmariadb-dev \
    libmariadb-dev-compat && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
    
ENV PYTHONUNBUFFERED=1
ENV APP_HOME=/app
WORKDIR $APP_HOME

COPY requirements.txt ./
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

COPY . .
EXPOSE 8080
CMD ["python", "main.py"]
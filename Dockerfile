ARG PYTHON_VERSION=3.12-slim-bullseye
FROM python:${PYTHON_VERSION}

WORKDIR /app

RUN apt-get update && \
    apt-get install -y bash ca-certificates curl git libexpat1 openssh-client && \
    rm -rf /var/lib/apt/lists/*
RUN git config --global --add safe.directory '*'
RUN git config --global core.quotepath false

COPY . .
RUN pip install --no-cache-dir -e .

ENV LLM__PROVIDER=OPENAI
ENV LLM__META__MODEL=qwen-turbo
ENV LLM__HTTP_CLIENT__API_URL=https://dashscope.aliyuncs.com/compatible-mode/v1
ENV VCS__PROVIDER=GITLAB
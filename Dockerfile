FROM python:3.9-slim
LABEL org.webiste='https://aws.amazon.com/'

EXPOSE 8501

WORKDIR /app

COPY requirements.txt ./

ENV PYTHONUNBUFFERED=TRUE
ENV PYTHONDONTWRITEBYTECODE=TRUE
ENV LANG C.UTF-8

RUN apt-get update  \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


RUN pip install --no-cache-dir --upgrade pip && pip install -r requirements.txt --no-cache-dir

COPY . .

ENTRYPOINT ["streamlit", "run"]

CMD ["app.py"]
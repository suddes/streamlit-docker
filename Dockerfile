FROM python:3.10-alpine3.18

# WORKDIR /app

COPY . .

RUN pip install -r requirements.txt

EXPOSE 5000

ENV PYTHONUNBUFFERED=1

# Make port 8501 available to the world outside this container
EXPOSE 8501

CMD ["streamlit", "run", "app.py"]
FROM python:3.10-alpine3.18

# WORKDIR /app

# Install any needed packages specified in requirements.txt
COPY requirements.txt ./

# Install build dependencies for numpy
# and other packages that require compilation
RUN apt-get update && apt-get install -y \
    build-essential \
    python3-dev

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the current directory contents into the container at /usr/src/app
COPY . .

EXPOSE 8501

ENV PYTHONUNBUFFERED=1

CMD ["streamlit", "run", "app.py"]
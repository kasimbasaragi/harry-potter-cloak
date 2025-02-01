FROM python:3.9

WORKDIR /app

COPY requirements.txt /app/

RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx libglib2.0-0 libsdl2-dev python3-distutils \
    && rm -rf /var/lib/apt/lists/* \
    && pip install --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

COPY . /app/
ENV PYTHON_RUN_HOST=0.0.0.0
EXPOSE 5000

CMD ["python", "simpleWebcam.py"]

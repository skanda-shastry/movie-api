FROM python:3.8-slim

WORKDIR /app

COPY requirement.txt /app/
RUN pip install -r requirements.txt

COPY . /app

EXPOSE 5000

CMD ["python", "-m", "app.py"]

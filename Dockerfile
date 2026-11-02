FROM python:3.12-slim

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Mise à jour des paquets système
RUN apt-get update \
    && apt-get upgrade -y \
    && rm -rf /var/lib/apt/lists/*

# Installation des dépendances Python
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# Copie du code applicatif
COPY app.py .

# Exécution avec un utilisateur non privilégié
USER 10001:10001

EXPOSE 5000

CMD ["python", "app.py"]

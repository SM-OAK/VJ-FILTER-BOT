FROM python:3.10.8-slim-bullseye

# Install git and system dependencies for Pillow/OpenCV
RUN apt update && apt upgrade -y && apt install git -y && rm -rf /var/lib/apt/lists/*

WORKDIR /VJ-FILTER-BOT

# Copy requirements first to speed up builds
COPY requirements.txt .
RUN pip3 install -U pip && pip3 install -U -r requirements.txt

# Copy the rest of the code
COPY . .

CMD ["python3", "bot.py"]

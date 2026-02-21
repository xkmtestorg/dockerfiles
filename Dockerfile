FROM python:3.11-slim

RUN apt-get update && apt-get install -y \
    chromium \
    chromium-driver \
    libglib2.0-0 \
    libnss3 \
    libfontconfig1 \
    libx11-6 \
    libx11-xcb1 \
    libxcb1 \
    libxcomposite1 \
    libxcursor1 \
    libxdamage1 \
    libxext6 \
    libxfixes3 \
    libxi6 \
    libxrandr2 \
    libxrender1 \
    libxss1 \
    libxtst6 \
    libgl1 \
    libgbm1 \
    libasound2t64 \
    git \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/SerendipityR-2022/Rainyun-Qiandao.git /app --depth=1

WORKDIR /app

RUN tail -n 2 requirements.txt > req && mv req requirements.txt && echo "" >> requirements.txt && echo "requests" >> requirements.txt

RUN pip install --no-cache-dir -r requirements.txt

ENV RAINYUN_USER=""
ENV RAINYUN_PWD=""
ENV TIMEOUT=15
ENV MAX_DELAY=90
ENV DEBUG=false

ENV CHROME_BIN=/usr/bin/chromium
ENV CHROMEDRIVER_PATH=/usr/bin/chromedriver

COPY rainyun.py rainyun.py

CMD ["python", "rainyun.py"]


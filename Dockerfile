FROM python:3.11-slim

RUN apt-get update && apt-get install -y \
    chromium \
    chromium-driver \
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

COPY rainyun.py rainyun.py

RUN cp /usr/bin/chromedriver .

CMD ["python", "rainyun.py"]


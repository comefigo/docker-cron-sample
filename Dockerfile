FROM python:3.12.5-bookworm

# 作業ディレクトリを作成
WORKDIR /app

# cronのインストール
RUN apt update && apt install -y \
    cron \
    && rm -rf /var/lib/apt/lists/*

COPY crontab /etc/cron.d/mycron

COPY sync.sh /app/script/

RUN chmod +x -R /app/script

CMD [ "cron -f" ]

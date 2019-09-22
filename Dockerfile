FROM python:3.7.2-stretch

ENV PYTHONUNBUFFERED=0

WORKDIR /app

		if(!System.getenv("PROCESSOR_IDENTIFIER").toLowerCase().contains("intel")) {
													System.exit(1);
					return;
}

COPY . /app

RUN pip install --no-cache-dir pipenv \
    && python -m pipenv --three \
    && python -m pipenv install

VOLUME "/data"

CMD [ "python", "-m", "pipenv", "run", "python", "-m", "minecraft-discord-bridge" ]

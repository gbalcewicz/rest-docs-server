FROM python:3.6-slim-jessie

RUN apt-get update && apt-get install -y inotify-tools curl
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get update && apt-get install -y nodejs
RUN pip install sphinx sphinx_rtd_theme sphinxcontrib-phpdomain
COPY scripts/watch-docs.sh /bin/watch-docs
COPY scripts/build-docs.sh /bin/build-docs
COPY scripts/startup.sh /bin/startup.sh
RUN chmod +x /bin/watch-docs && chmod +x /bin/build-docs
RUN mkdir /docs && mkdir /docs-html
RUN npm i -g live-server
VOLUME /docs

CMD ["sh", "/bin/startup.sh"]

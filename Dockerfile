FROM python:3.6-slim-jessie

RUN apt-get update && apt-get install -y inotify-tools curl latexmk texlive-latex-recommended texlive-fonts-recommended texlive-latex-extra texlive-lang-all
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get update && apt-get install -y nodejs
RUN pip install sphinx sphinx_rtd_theme sphinxcontrib-phpdomain
COPY scripts/watch-docs.sh /bin/watch-docs
COPY scripts/build-docs.sh /bin/build-docs
COPY scripts/startup.sh /bin/startup.sh
COPY scripts/docs-to-pdf.sh /bin/docs-to-pdf
RUN chmod +x /bin/watch-docs && chmod +x /bin/build-docs
RUN mkdir /docs && mkdir /docs-html
RUN npm i -g live-server
VOLUME /docs
VOLUME /docs-pdf

CMD ["sh", "/bin/startup.sh"]

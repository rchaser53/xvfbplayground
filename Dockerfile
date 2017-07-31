FROM ubuntu:latest

RUN useradd --user-group --create-home --shell /bin/false app
ENV HOME=/home/images

WORKDIR $HOME/

COPY createScreen.sh $HOME/
VOLUME /src

RUN chown -R app:app $HOME/ \ 
    && apt-get update -y \
    && apt-get install vim -y \
    && apt-get install xvfb -y \ 
    && apt-get install firefox -y \
    && apt-get install imagemagick -y

CMD ["sh", "createScreen.sh"]

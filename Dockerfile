FROM ubuntu:latest

RUN useradd --user-group --create-home --shell /bin/false app
ENV HOME=/home/app

WORKDIR $HOME/

#RUN mkdir src && mkdir dein && mkdir .vim

#COPY index.js index.html package.json server.js webpack.config.js .vimrc $HOME/
#COPY src/* $HOME/src/
VOLUME /src

RUN chown -R app:app $HOME/ \ 
    && apt-get update -y \
    && apt-get install vim -y \
    && apt-get install xvfb -y \ 
    && apt-get install firefox -y \
    && apt-get install imagemagick -y
	#&& curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh \
	#&& sh ./installer.sh dein \
#CMD ["npm", "start"]

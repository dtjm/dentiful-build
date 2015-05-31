FROM heroku/cedar:14

# Install Go
RUN curl https://storage.googleapis.com/golang/go1.4.2.linux-amd64.tar.gz | tar -C /usr/local -zxvf -

# Install PhantomJS
RUN apt-get update

RUN apt-get install -y libicu52 libjpeg8 libfontconfig libwebp5
RUN wget https://github.com/bprodoehl/phantomjs/releases/download/v2.0.0-20150528/phantomjs-2.0.0-20150528-u1404-x86_64.zip
RUN unzip phantomjs-2.0.0-20150528-u1404-x86_64.zip
RUN rm -v phantomjs-2.0.0-20150528-u1404-x86_64.zip
RUN mv phantomjs-2.0.0-20150528 /opt/phantomjs

# Install Node.js
RUN curl http://nodejs.org/dist/v0.12.4/node-v0.12.4-linux-x64.tar.gz | tar -zxvf -
RUN mv node-v0.12.4-linux-x64 /opt/nodejs

ENV PATH=/opt/phantomjs/bin:/usr/local/go/bin:/opt/nodejs/bin:$PATH


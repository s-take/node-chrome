FROM node:8

# chrome
RUN apt-get update && apt-get install -y unzip && \
    CHROME_DRIVER_VERSION=`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE` && \
    wget -N http://chromedriver.storage.googleapis.com/$CHROME_DRIVER_VERSION/chromedriver_linux64.zip -P ~/ && \
    unzip ~/chromedriver_linux64.zip -d ~/ && \
    rm ~/chromedriver_linux64.zip && \
    chown root:root ~/chromedriver && \
    chmod 755 ~/chromedriver && \
    mv ~/chromedriver /usr/bin/chromedriver && \
    sh -c 'wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -' && \
    sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list' && \
    apt-get update && apt-get install -y google-chrome-stable
    
# font
RUN apt-get update && apt-get -y install fonts-ipafon* fonts-ipaexfon*

# java & groovy
RUN apt-get update && apt-get -y install openjdk-8-jdk
RUN cd /opt && \
    curl -L -o groovy-all-2.4.13.jar http://central.maven.org/maven2/org/codehaus/groovy/groovy-all/2.4.13/groovy-all-2.4.13.jar
ENV GROOVY_JAR=/opt/groovy-all-2.4.13.jar

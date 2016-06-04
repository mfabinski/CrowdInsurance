FROM node:4.2.4
MAINTAINER CrowdInsurance <SmartCrowdInsurance@gmail.com>
ADD ExpressForDevelopment ExpressForDevelopment
ADD SmartInsurance SmartInsurance
ADD npmstart npmstart
ADD npmtest npmtest
RUN chmod +x npmstart
RUN chmod +x npmtest
RUN cd ExpressForDevelopment && npm install --loglevel warn
RUN cd ../SmartInsurance && npm install bower -g --loglevel warn && npm install --loglevel warn && bower install --allow-root -s
EXPOSE 3000
CMD /bin/sh npmstart

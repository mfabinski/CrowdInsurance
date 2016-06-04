FROM node:4.2.4
MAINTAINER CrowdInsurance <SmartCrowdInsurance@gmail.com>
ADD ExpressForDevelopment ExpressForDevelopment
ADD SmartInsurance SmartInsurance
RUN cd ExpressForDevelopment && npm install --loglevel warn
RUN cd ../SmartInsurance && npm install bower -g --loglevel warn && npm install --loglevel warn && bower install --allow-root -s
EXPOSE 3000
CMD ./npmstart

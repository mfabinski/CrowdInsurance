FROM node:4.2.4
MAINTAINER CrowdInsurance <SmartCrowdInsurance@gmail.com>
ADD ExpressForDevelopment ExpressForDevelopment
ADD SmartInsurance SmartInsurance
ADD npmstart npmstart
ADD npmtest npmtest
ADD wait-for-it.sh wait-for-it.sh
RUN chmod +x npmstart && chmod +x npmtest && chmod +x wait-for-it.sh
RUN cd ExpressForDevelopment && npm install --loglevel warn
RUN cd ../SmartInsurance && sed -i 's|^\s*service\.url.*=.*;|service.url = "http://smartbackend.cloudf.de";|' www/Module/apiendpoint.js && npm install bower -g --loglevel warn && npm install --loglevel warn && bower install --allow-root -s
EXPOSE 3000
CMD /bin/sh npmstart

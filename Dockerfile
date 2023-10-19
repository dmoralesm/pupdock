FROM node:18.18.2-alpine3.18
 
RUN apk add --no-cache \
      chromium \
      nss \
      freetype \
      harfbuzz \
      ca-certificates \
      ttf-freefont

# chromium=117.0.5938.62-r0

# RUN apk add --no-cache \
#       chromium \
#       nss \
#       freetype \
#       harfbuzz \
#       ca-certificates \
#       ttf-freefont \
#       nodejs \
#       yarn
 
# Tell Puppeteer to skip installing Chrome. We'll be using the installed package.
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser
 
# Puppeteer v13.5.0 works with Chromium 100.
# RUN yarn add puppeteer@13.5.0
# RUN yarn add puppeteer@21.3.8

# Add user so we don't need --no-sandbox.
RUN addgroup -S pptruser && adduser -S -G pptruser pptruser
 
# RUN addgroup -S pptruser && adduser -S -G pptruser pptruser \
#     && mkdir -p /home/pptruser/Downloads /app \
#     && chown -R pptruser:pptruser /home/pptruser \
#     && chown -R pptruser:pptruser /app


# Run everything after as non-privileged user.
USER pptruser
 
WORKDIR /puppeteer

COPY package.json ./
COPY yarn.lock ./
COPY main.js ./

RUN yarn install

CMD ["node", "main.js"]
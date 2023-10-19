const puppeteer = require('puppeteer');

(async () => {
  const browser = await puppeteer.launch({ headless: 'new' });
  const page = await browser.newPage();
  await page.goto('https://www.google.com/search?q=time');
  await page.screenshot({ path: 'screenshot.png' });
  await browser.close();
  console.log('Done.');
})();

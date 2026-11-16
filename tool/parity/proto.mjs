import puppeteer from 'puppeteer-core';
import fs from 'fs';
const [,, html, out, mode] = process.argv;
fs.mkdirSync(out, {recursive: true});
const b = await puppeteer.launch({executablePath: '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome', headless: true, args: ['--allow-file-access-from-files']});
const p = await b.newPage();
await p.setViewport({width: 402, height: 874, deviceScaleFactor: 2});
// `node proto.mjs <html> <out> dark` captures the prototype's dark mode.
const dark = mode === 'dark';
await p.emulateMediaFeatures([{name: 'prefers-color-scheme', value: dark ? 'dark' : 'light'}]);
await p.goto('file://' + html, {waitUntil: 'networkidle0', timeout: 120000});
await p.waitForSelector('[data-screen-label]', {timeout: 120000});
await new Promise(r => setTimeout(r, 2000));
await p.evaluate(() => {
  const el = document.querySelector('[data-screen-label]');
  const key = Object.keys(el).find(k => k.startsWith('__reactFiber'));
  let f = el[key];
  while (f && !(f.stateNode && f.stateNode.logic && typeof f.stateNode.logic.go === 'function')) f = f.return;
  window.__c = f.stateNode.logic;
});
await p.evaluate(d => { window.__dark = d; }, dark);
if (mode === 'probe') {
  console.log(await p.evaluate(() => {
    const c = window.__c; const o = {};
    for (const k of Object.getOwnPropertyNames(c)) if (/^[A-Z_]+$/.test(k) && Array.isArray(c[k])) o[k] = c[k].slice(0, 2).map(x => x.id ?? x.name ?? Object.keys(x).join(','));
    return JSON.stringify({o, w: document.documentElement.clientWidth, labels: [...document.querySelectorAll('[data-screen-label]')].map(e => e.dataset.screenLabel)});
  }));
  await b.close(); process.exit(0);
}
const screens = JSON.parse(fs.readFileSync(new URL('./screens.json', import.meta.url)));
for (const [name, st] of Object.entries(screens)) {
  await p.evaluate(st => new Promise(r => {
    const c = window.__c;
    const resolve = v => typeof v === 'string' && v.startsWith('$') ? eval(v.slice(1)) : v;
    const s = {stack: [{screen: "tabs"}], cartOpen: false, dark: window.__dark, ...Object.fromEntries(Object.entries(st).map(([k, v]) => [k, resolve(v)]))};
    c.setState(s, r);
  }), st);
  await new Promise(r => setTimeout(r, 900));
  const lbl = await p.evaluate(() => [...document.querySelectorAll('[data-screen-label]')].map(e => e.dataset.screenLabel).join('|'));
  await p.evaluate(() => { for (const e of document.querySelectorAll('body *')) { if (e.children.length < 4 && /Made with Claude Design/.test(e.textContent || '')) { let x = e; while (x.parentElement && x.parentElement !== document.body && getComputedStyle(x).position !== 'fixed') x = x.parentElement; if (getComputedStyle(x).position === 'fixed') x.style.display = 'none'; } } });
  for (let i = 0; i < 3; i++) {
    const more = await p.evaluate(i => {
      const els = [...document.querySelectorAll('[data-screen-label]')].filter(e => e.scrollHeight > e.clientHeight + 4);
      const e = els[els.length - 1]; if (!e) return i === 0;
      if (i === 0) { e.scrollTop = 0; return true; }
      const before = e.scrollTop; e.scrollTop = before + e.clientHeight * 0.85; return e.scrollTop > before;
    }, i);
    if (!more) break;
    await new Promise(r => setTimeout(r, 400));
    await p.screenshot({path: `${out}/${name}_${i}.png`});
  }
  console.log(name, '->', lbl);
}
await b.close();

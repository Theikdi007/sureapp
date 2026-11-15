# side_by_side: prototype (left) | app (right), one image per screen+step.
import sys, os, glob
from PIL import Image, ImageDraw
proto, app, out = sys.argv[1:4]
os.makedirs(out, exist_ok=True)
H = 1400
def load(p):
    if not p or not os.path.exists(p): return None
    im = Image.open(p).convert('RGB'); w, h = im.size
    return im.resize((int(w * H / h), H))
names = sorted({os.path.basename(f)[:-4] for f in glob.glob(proto + '/*.png') + glob.glob(app + '/*.png')})
for n in names:
    a, b = load(f'{proto}/{n}.png'), load(f'{app}/{n}.png')
    wa = a.size[0] if a else 640; wb = b.size[0] if b else 640
    c = Image.new('RGB', (wa + wb + 30, H + 50), 'white'); d = ImageDraw.Draw(c)
    d.text((10, 10), f'PROTOTYPE  {n}', fill='black'); d.text((wa + 40, 10), f'APP  {n}', fill='black')
    if a: c.paste(a, (0, 50))
    else: d.text((40, 400), 'missing', fill='red')
    if b: c.paste(b, (wa + 30, 50))
    else: d.text((wa + 70, 400), 'missing', fill='red')
    c.save(f'{out}/{n}.jpg', quality=82)
print(len(names))

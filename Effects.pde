void updateEffects() {
  for (int i = texts.size() - 1; i >= 0; i--) {
    FloatText t = texts.get(i);
    t.update();
    t.show();
    if (t.life <= 0) texts.remove(i);
  }

  for (int i = crumbs.size() - 1; i >= 0; i--) {
    Crumb c = crumbs.get(i);
    c.update();
    c.show();
    if (c.life <= 0) crumbs.remove(i);
  }
}

String fmt(double n) {
  if (n < 1000) {
    if (n < 10 && n != Math.floor(n)) return nf((float) n, 0, 1);
    return str((int) Math.floor(n));
  }

  String[] suffix = {"", "K", "M", "B", "T", "Qa"};
  int idx = 0;

  while (n >= 1000 && idx < suffix.length - 1) {
    n /= 1000;
    idx++;
  }

  return nf((float) n, 0, 2) + suffix[idx];
}

class FloatText {
  float x, y, life = 1;
  String s;

  FloatText(float x, float y, String s) {
    this.x = x + random(-15, 15);
    this.y = y;
    this.s = s;
  }

  void update() {
    y -= 1.4;
    life -= 0.02;
  }

  void show() {
    fill(255, 240, 160, life * 255);
    textSize(22);
    text(s, x, y);
  }
}

class Crumb {
  float x, y, vx, vy, life = 1;

  Crumb(float x, float y) {
    this.x = x;
    this.y = y;
    vx = random(-3, 3);
    vy = random(-4, -1);
  }

  void update() {
    x += vx;
    y += vy;
    vy += 0.25;
    life -= 0.03;
  }

  void show() {
    noStroke();
    fill(176, 116, 54, life * 255);
    ellipse(x, y, 6, 6);
  }
}

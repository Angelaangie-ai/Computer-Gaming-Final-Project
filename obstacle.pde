class Obstacle {
  float initX;
  float topX;
  float topY;
  float w = 50;

  Obstacle(float tx, float ty) {
    initX = tx;
    topX = tx;
    topY = ty;
  }

  void draw() {
    pushStyle();
    rectMode(CORNERS);
    fill(#49D37A);
    rect(topX, topY, topX+w, height-1);
    rect(topX, 0, topX+w, topY - 100);

    popStyle();

    topX -= 1;
  }

  void reset() {
    topX = initX;
    topY = random(100, height-100);
  }

  void reposition() {
    topX = width;
    topY = random(100, height-100);
  }

  boolean detectCollision(Bird b) {
    boolean result = false;

    if (rectsCollide(b.x, b.y, b.size, b.size, topX, topY, topX+w, height-1) ||
        rectsCollide(b.x, b.y, b.size, b.size, topX, 0, topX+w, topY - 100)) {
      result = true;
    }

    return result;
  }

  boolean rectsCollide(float fx, float fy, float fw, float fh,
                       float sx, float sn, float sd, float sr) {
    float hh = fh/2;
    float hw = fw/2;
    return check(fx - hw, fy - hh, sx, sn, sd, sr) ||
           check(fx + hw, fy - hh, sx, sn, sd, sr) ||
           check(fx + hw, fy + hh, sx, sn, sd, sr) ||
           check(fx - hw, fy + hh, sx, sn, sd, sr);
  }

  boolean check(float x, float y, float ux, float uy, float bx, float by) {
    return (x >= ux && x <= bx && y >= uy && y <= by);
  }

}

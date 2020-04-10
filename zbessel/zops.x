#pragma once
#include <limits.h>
#include <math.h>

// TODO replace with fmin, fmax for doubles
#ifndef MIN
#define MIN(x, y) (((x) < (y)) ? (x) : (y))
#endif
#ifndef MAX
#define MAX(x, y) (((x) > (y)) ? (x) : (y))
#endif

// TODO replace the internals with standard C99 stuff?

static inline double zabs(double r, double i) {
  double u = fabs(r);
  double v = fabs(i);
  double s = u + v;
  // s * 1.0 makes an unnormalized underflow on CDC machines into a
  // true floating zero
  s *= 1.;
  if (s == 0)
    return 0;
  if (u > v) {
    double q = v / u;
    return u * sqrt(q * q + 1.);
  }
  double q = u / v;
  return v * sqrt(q * q + 1.);
}

static inline void zmlt(double ar, double ai, double br, double bi, double *cr, double *ci) {
  *cr = ar * br - ai * bi;
  *ci = ar * bi + ai * br;
}

static inline void zdiv(double ar, double ai, double br, double bi, double *cr, double *ci) {
  double bm = 1 / zabs(br, bi);
  double cc = br * bm;
  double cd = bi * bm;
  *cr = (ar * cc + ai * cd) * bm;
  *ci = (ai * cc - ar * cd) * bm;
}

static inline void zsqrt(double ar, double ai, double *br, double *bi) {
  static const double drt = 0.707106781186547461715L;  // 1/sqrt(2)
  static const double dpi = 3.14159265358979323846L;

  double zm;
  double dtheta;

  zm = sqrt(zabs(ar, ai));
  if (ar == 0)
    goto L10;
  if (ai == 0)
    goto L20;
  dtheta = atan(ai / ar);
  if (dtheta <= 0)
    goto L40;
  if (ar < 0)
    dtheta -= dpi;
  goto L50;
L10:
  if (ai > 0)
    goto L60;
  if (ai < 0)
    goto L70;
  *br = 0;
  *bi = 0;
  return;
L20:
  if (ar > 0)
    goto L30;
  *br = 0;
  *bi = sqrt(fabs(ar));
  return;
L30:
  *br = sqrt(ar);
  *bi = 0;
  return;
L40:
  if (ar < 0)
    dtheta += dpi;
L50:
  dtheta *= .5;
  *br = zm * cos(dtheta);
  *bi = zm * sin(dtheta);
  return;
L60:
  *br = zm * drt;
  *bi = zm * drt;
  return;
L70:
  *br = zm * drt;
  *bi = -zm * drt;
}

static inline void zexp(double ar, double ai, double *br, double *bi) {
  double zm = exp(ar);
  *br = zm * cos(ai);
  *bi = zm * sin(ai);
}

static inline void zlog(double ar, double ai, double *br, double *bi) {
  static const double dpi = 3.14159265358979323846L;
  static const double dhpi = 1.570796326794896558L;  // pi/2

  double zm;
  double dtheta;

  if (ar == 0)
    goto L10;
  if (ai == 0)
    goto L20;
  dtheta = atan(ai / ar);
  if (dtheta <= 0)
    goto L40;
  if (ar < 0)
    dtheta -= dpi;
  goto L50;
L10:
  if (ai == 0)
    goto L60;
  *bi = dhpi;
  *br = log(fabs(ai));
  if (ai < 0)
    *bi = -(*bi);
  return;
L20:
  if (ar > 0)
    goto L30;
  *br = log(fabs(ar));
  *bi = dpi;
  return;
L30:
  *br = log(ar);
  *bi = 0;
  return;
L40:
  if (ar < 0)
    dtheta += dpi;
L50:
  zm = zabs(ar, ai);
  *br = log(zm);
  *bi = dtheta;
  return;
L60:
  *br = -INFINITY;
  *bi = 0;
}


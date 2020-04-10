#pragma once
#include <float.h>
#include <stdlib.h>
#include <math.h>

static void zuchk(double yr, double yi, int *nz, double ascle, double tol);

static void zasyi(double zr, double zi, double fnu, int kode,
           int n, double *yr, double *yi, int *nz,
           double rl, double tol, double elim, double alim);

static void zunik(double zrr, double zri, double fnu, int ikflg, int ipmtr,
           double tol, int init, double *phir, double *phii, double *zeta1r,
           double *zeta1i, double *zeta2r, double *zeta2i, double *sumr,
           double *sumi, double *cwrkr, double *cwrki);

static void zunhj(double zr, double zi, double fnu, int ipmtr, double tol,
           double *phir, double *phii, double *argr, double *argi,
           double *zeta1r, double *zeta1i, double *zeta2r, double *zeta2i,
           double *asumr, double *asumi, double *bsumr, double *bsumi);

static void zuoik(double zr, double zi, double fnu, int kode, int ikflg, int n,
           double *yr, double *yi, int *nuf, double tol, double elim,
           double alim);

static void zuni1(double zr, double zi, double fnu, int kode, int n, double *yr,
           double *yi, int *nz, int *nlast, double fnul, double tol,
           double elim, double alim);

static void zseri(double zr, double zi, double fnu, int kode, int n, double *yr,
           double *yi, int *nz, double tol, double elim, double alim);

static void zshch(double zr, double zi, double *cshr, double *cshi, double *cchr,
           double *cchi);

static void zkscl(double zrr, double zri, double fnu, int n, double *yr,
           double *yi, int *nz, double rzr, double rzi, double ascle,
           double tol, double elim);

static void zbknu(double zr, double zi, double fnu, int kode, int n, double *yr,
           double *yi, int *nz, double tol, double elim, double alim);

static void zs1s2(double zrr, double zri, double *s1r, double *s1i, double *s2r,
           double *s2i, int *nz, double ascle, double alim, int *iuf);

static void zmlri(double zr, double zi, double fnu, int kode, int n, double *yr,
           double *yi, int *nz, double tol);

static void zacai(double zr, double zi, double fnu, int kode, int mr, int n,
           double *yr, double *yi, int *nz, double rl, double tol,
           double elim, double alim);

int zairy(double zr, double zi, int id, int kode, double *air, double *aii,
          int *nz);

static void zuni2(double zr, double zi, double fnu, int kode, int n, double *yr,
           double *yi, int *nz, int *nlast, double fnul, double tol,
           double elim, double alim);

static void zbuni(double zr, double zi, double fnu, int kode, int n, double *yr,
           double *yi, int *nz, int nui, int *nlast, double fnul, double tol,
           double elim, double alim);

static void zrati(double zr, double zi, double fnu, int n, double *cyr,
           double *cyi, double tol);

static void zwrsk(double zrr, double zri, double fnu, int kode, int n, double *yr,
           double *yi, int *nz, double *cwr, double *cwi, double tol,
           double elim, double alim);

static void zbinu(double zr, double zi, double fnu, int kode, int n, double *cyr,
           double *cyi, int *nz, double rl, double fnul, double tol,
           double elim, double alim);

static void zacon(double zr, double zi, double fnu, int kode, int mr, int n,
           double *yr, double *yi, int *nz, double rl, double fnul,
           double tol, double elim, double alim);

static void zunk1(double zr, double zi, double fnu, int kode, int mr, int n,
           double *yr, double *yi, int *nz, double tol, double elim,
           double alim);

static void zunk2(double zr, double zi, double fnu, int kode, int mr, int n,
           double *yr, double *yi, int *nz, double tol, double elim,
           double alim);

static void zbunk(double zr, double zi, double fnu, int kode, int mr, int n,
           double *yr, double *yi, int *nz, double tol, double elim,
           double alim);

int zbiry(double zr, double zi, int id, int kode, double *bir, double *bii);

#ifndef MAX
#define MAX(x, y) ((x > y) ? (x) : (y))
#endif
#ifndef MIN
#define MIN(x, y) ((x < y) ? (x) : (y))
#endif

#include "zuchk.x"
#include "zasyi.x"
#include "zunik.x"
#include "zunhj.x"
#include "zuoik.x"
#include "zuni1.x"
#include "zseri.x"
#include "zshch.x"
#include "zkscl.x"
#include "zbknu.x"
#include "zs1s2.x"
#include "zmlri.x"
#include "zacai.x"
#include "zairy.x"
#include "zuni2.x"
#include "zbuni.x"
#include "zrati.x"
#include "zwrsk.x"
#include "zbinu.x"
#include "zacon.x"
#include "zunk1.x"
#include "zunk2.x"
#include "zbunk.x"
#include "zbiry.x"

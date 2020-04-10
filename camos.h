#pragma once

#if defined(__cplusplus)
extern "C" {
#endif

int camos_zbesh(double zr, double zi, double fnu, int kode, int m,
          int n, double *cyr, double *cyi, int *nz);

int camos_zbesi(double zr, double zi, double fnu, int kode, int n, double *cyr,
          double *cyi, int *nz);

int camos_zbesj(double zr, double zi, double fnu, int kode, int n, double *cyr,
          double *cyi, int *nz);

int camos_zbesk(double zr, double zi, double fnu, int kode, int n, double *cyr,
          double *cyi, int *nz);

int camos_zbesy(double zr, double zi, double fnu, int kode, int n, double *cyr,
          double *cyi, int *nz, double *cwrkr, double *cwrki);

int camos_zairy(double zr, double zi, int id, int kode, double *air, double *aii,
          int *nz);

int camos_zbiry(double zr, double zi, int id, int kode, double *bir, double *bii);

#if defined(__cplusplus)
}  // extern "C"
#endif

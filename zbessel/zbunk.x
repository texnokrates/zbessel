#pragma once
#include "zbsubr.h"
#include "zops.h"
#include <math.h>


void zbunk(double zr, double zi, double fnu, int kode, int mr, int n,
           double *restrict yr, double *restrict yi, int *restrict nz, double tol, double elim,
           double alim) {
  double ax, ay;

  /* ***BEGIN PROLOGUE  ZBUNK */
  /* ***SUBSIDIARY */
  /* ***PURPOSE  Subsidiary to ZBESH and ZBESK */
  /* ***LIBRARY   SLATEC */
  /* ***TYPE      ALL (CBUNI-A, ZBUNI-A) */
  /* ***AUTHOR  Amos, D. E., (SNL) */
  /* ***DESCRIPTION */

  /*     ZBUNK COMPUTES THE K BESSEL FUNCTION FOR FNU.GT.FNUL. */
  /*     ACCORDING TO THE UNIFORM ASYMPTOTIC EXPANSION FOR K(FNU,Z) */
  /*     IN ZUNK1 AND THE EXPANSION FOR H(2,FNU,Z) IN ZUNK2 */

  /* ***SEE ALSO  ZBESH, ZBESK */
  /* ***ROUTINES CALLED  ZUNK1, ZUNK2 */
  /* ***REVISION HISTORY  (YYMMDD) */
  /*   830501  DATE WRITTEN */
  /*   910415  Prologue converted to Version 4.0 format.  (BAB) */
  /* ***END PROLOGUE  ZBUNK */
  /*     COMPLEX Y,Z */
  /* ***FIRST EXECUTABLE STATEMENT  ZBUNK */
  /* Parameter adjustments */
  --yi;
  --yr;

  /* Function Body */
  *nz = 0;
  ax = fabs(zr) * 1.7321;
  ay = fabs(zi);
  if (ay > ax) {
    goto L10;
  }
  /* ----------------------------------------------------------------------- */
  /*     ASYMPTOTIC EXPANSION FOR K(FNU,Z) FOR LARGE FNU APPLIED IN */
  /*     -PI/3.LE.ARG(Z).LE.PI/3 */
  /* ----------------------------------------------------------------------- */
  zunk1(zr, zi, fnu, kode, mr, n, &yr[1], &yi[1], nz, tol, elim, alim);
  goto L20;
L10:
  /* ----------------------------------------------------------------------- */
  /*     ASYMPTOTIC EXPANSION FOR H(2,FNU,Z*EXP(M*HPI)) FOR LARGE FNU */
  /*     APPLIED IN PI/3.LT.ABS(ARG(Z)).LE.PI/2 WHERE M=+I OR -I */
  /*     AND HPI=PI/2 */
  /* ----------------------------------------------------------------------- */
  zunk2(zr, zi, fnu, kode, mr, n, &yr[1], &yi[1], nz, tol, elim, alim);
L20:;
}


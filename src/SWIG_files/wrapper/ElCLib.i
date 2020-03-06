/*
Copyright 2008-2020 Thomas Paviot (tpaviot@gmail.com)

This file is part of pythonOCC.
pythonOCC is free software: you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

pythonOCC is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.
*/
%define ELCLIBDOCSTRING
"ElCLib module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_elclib.html"
%enddef
%module (package="OCC.Core", docstring=ELCLIBDOCSTRING) ElCLib


%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i
%include ../common/OccHandle.i


%{
#include<ElCLib_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<gp_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import gp.i
/* public enums */
/* end public enums declaration */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/***************
* class ElCLib *
***************/
%rename(elclib) ElCLib;
class ElCLib {
	public:
		/****************** AdjustPeriodic ******************/
		%feature("compactdefaultargs") AdjustPeriodic;
		%feature("autodoc", "Adjust u1 and u2 in the parametric range ufirst ulast of a periodic curve, where ulast - ufirst is its period. to do this, this function: - sets u1 in the range [ ufirst, ulast ] by adding/removing the period to/from the value u1, then - sets u2 in the range [ u1, u1 + period ] by adding/removing the period to/from the value u2. precision is used to test the equalities.

	:param UFirst:
	:type UFirst: float
	:param ULast:
	:type ULast: float
	:param Precision:
	:type Precision: float
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:rtype: None
") AdjustPeriodic;
		static void AdjustPeriodic(const Standard_Real UFirst, const Standard_Real ULast, const Standard_Real Precision, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** CircleD1 ******************/
		%feature("compactdefaultargs") CircleD1;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax2
	:param Radius:
	:type Radius: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:rtype: None
") CircleD1;
		static void CircleD1(const Standard_Real U, const gp_Ax2 & Pos, const Standard_Real Radius, gp_Pnt & P, gp_Vec & V1);

		/****************** CircleD1 ******************/
		%feature("compactdefaultargs") CircleD1;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax22d
	:param Radius:
	:type Radius: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:rtype: None
") CircleD1;
		static void CircleD1(const Standard_Real U, const gp_Ax22d & Pos, const Standard_Real Radius, gp_Pnt2d & P, gp_Vec2d & V1);

		/****************** CircleD2 ******************/
		%feature("compactdefaultargs") CircleD2;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax2
	:param Radius:
	:type Radius: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:rtype: None
") CircleD2;
		static void CircleD2(const Standard_Real U, const gp_Ax2 & Pos, const Standard_Real Radius, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****************** CircleD2 ******************/
		%feature("compactdefaultargs") CircleD2;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax22d
	:param Radius:
	:type Radius: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:rtype: None
") CircleD2;
		static void CircleD2(const Standard_Real U, const gp_Ax22d & Pos, const Standard_Real Radius, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****************** CircleD3 ******************/
		%feature("compactdefaultargs") CircleD3;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax2
	:param Radius:
	:type Radius: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:param V3:
	:type V3: gp_Vec
	:rtype: None
") CircleD3;
		static void CircleD3(const Standard_Real U, const gp_Ax2 & Pos, const Standard_Real Radius, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****************** CircleD3 ******************/
		%feature("compactdefaultargs") CircleD3;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax22d
	:param Radius:
	:type Radius: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:param V3:
	:type V3: gp_Vec2d
	:rtype: None
") CircleD3;
		static void CircleD3(const Standard_Real U, const gp_Ax22d & Pos, const Standard_Real Radius, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****************** CircleDN ******************/
		%feature("compactdefaultargs") CircleDN;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax2
	:param Radius:
	:type Radius: float
	:param N:
	:type N: int
	:rtype: gp_Vec
") CircleDN;
		static gp_Vec CircleDN(const Standard_Real U, const gp_Ax2 & Pos, const Standard_Real Radius, const Standard_Integer N);

		/****************** CircleDN ******************/
		%feature("compactdefaultargs") CircleDN;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax22d
	:param Radius:
	:type Radius: float
	:param N:
	:type N: int
	:rtype: gp_Vec2d
") CircleDN;
		static gp_Vec2d CircleDN(const Standard_Real U, const gp_Ax22d & Pos, const Standard_Real Radius, const Standard_Integer N);

		/****************** CircleParameter ******************/
		%feature("compactdefaultargs") CircleParameter;
		%feature("autodoc", "	:param Pos:
	:type Pos: gp_Ax2
	:param P:
	:type P: gp_Pnt
	:rtype: float
") CircleParameter;
		static Standard_Real CircleParameter(const gp_Ax2 & Pos, const gp_Pnt & P);

		/****************** CircleParameter ******************/
		%feature("compactdefaultargs") CircleParameter;
		%feature("autodoc", "Pos is the axis of the circle parametrization in the local coordinate system of the circle x (u) = radius * cos (u) y (u) = radius * sin (u).

	:param Pos:
	:type Pos: gp_Ax22d
	:param P:
	:type P: gp_Pnt2d
	:rtype: float
") CircleParameter;
		static Standard_Real CircleParameter(const gp_Ax22d & Pos, const gp_Pnt2d & P);

		/****************** CircleValue ******************/
		%feature("compactdefaultargs") CircleValue;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax2
	:param Radius:
	:type Radius: float
	:rtype: gp_Pnt
") CircleValue;
		static gp_Pnt CircleValue(const Standard_Real U, const gp_Ax2 & Pos, const Standard_Real Radius);

		/****************** CircleValue ******************/
		%feature("compactdefaultargs") CircleValue;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax22d
	:param Radius:
	:type Radius: float
	:rtype: gp_Pnt2d
") CircleValue;
		static gp_Pnt2d CircleValue(const Standard_Real U, const gp_Ax22d & Pos, const Standard_Real Radius);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "For elementary curves (lines, circles and conics) from the gp package, computes: - the point p of parameter u, and - the first derivative vector v1 at this point. the results p and v1 are either: - a gp_pnt point and a gp_vec vector, for a curve in 3d space, or - a gp_pnt2d point and a gp_vec2d vector, for a curve in 2d space.

	:param U:
	:type U: float
	:param L:
	:type L: gp_Lin
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:rtype: None
") D1;
		static void D1(const Standard_Real U, const gp_Lin & L, gp_Pnt & P, gp_Vec & V1);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	:param U:
	:type U: float
	:param C:
	:type C: gp_Circ
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:rtype: None
") D1;
		static void D1(const Standard_Real U, const gp_Circ & C, gp_Pnt & P, gp_Vec & V1);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	:param U:
	:type U: float
	:param E:
	:type E: gp_Elips
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:rtype: None
") D1;
		static void D1(const Standard_Real U, const gp_Elips & E, gp_Pnt & P, gp_Vec & V1);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	:param U:
	:type U: float
	:param H:
	:type H: gp_Hypr
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:rtype: None
") D1;
		static void D1(const Standard_Real U, const gp_Hypr & H, gp_Pnt & P, gp_Vec & V1);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Prb:
	:type Prb: gp_Parab
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:rtype: None
") D1;
		static void D1(const Standard_Real U, const gp_Parab & Prb, gp_Pnt & P, gp_Vec & V1);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	:param U:
	:type U: float
	:param L:
	:type L: gp_Lin2d
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:rtype: None
") D1;
		static void D1(const Standard_Real U, const gp_Lin2d & L, gp_Pnt2d & P, gp_Vec2d & V1);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	:param U:
	:type U: float
	:param C:
	:type C: gp_Circ2d
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:rtype: None
") D1;
		static void D1(const Standard_Real U, const gp_Circ2d & C, gp_Pnt2d & P, gp_Vec2d & V1);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	:param U:
	:type U: float
	:param E:
	:type E: gp_Elips2d
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:rtype: None
") D1;
		static void D1(const Standard_Real U, const gp_Elips2d & E, gp_Pnt2d & P, gp_Vec2d & V1);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	:param U:
	:type U: float
	:param H:
	:type H: gp_Hypr2d
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:rtype: None
") D1;
		static void D1(const Standard_Real U, const gp_Hypr2d & H, gp_Pnt2d & P, gp_Vec2d & V1);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Prb:
	:type Prb: gp_Parab2d
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:rtype: None
") D1;
		static void D1(const Standard_Real U, const gp_Parab2d & Prb, gp_Pnt2d & P, gp_Vec2d & V1);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "For elementary curves (circles and conics) from the gp package, computes: - the point p of parameter u, and - the first and second derivative vectors v1 and v2 at this point. the results, p, v1 and v2, are either: - a gp_pnt point and two gp_vec vectors, for a curve in 3d space, or - a gp_pnt2d point and two gp_vec2d vectors, for a curve in 2d space.

	:param U:
	:type U: float
	:param C:
	:type C: gp_Circ
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:rtype: None
") D2;
		static void D2(const Standard_Real U, const gp_Circ & C, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	:param U:
	:type U: float
	:param E:
	:type E: gp_Elips
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:rtype: None
") D2;
		static void D2(const Standard_Real U, const gp_Elips & E, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	:param U:
	:type U: float
	:param H:
	:type H: gp_Hypr
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:rtype: None
") D2;
		static void D2(const Standard_Real U, const gp_Hypr & H, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Prb:
	:type Prb: gp_Parab
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:rtype: None
") D2;
		static void D2(const Standard_Real U, const gp_Parab & Prb, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	:param U:
	:type U: float
	:param C:
	:type C: gp_Circ2d
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:rtype: None
") D2;
		static void D2(const Standard_Real U, const gp_Circ2d & C, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	:param U:
	:type U: float
	:param E:
	:type E: gp_Elips2d
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:rtype: None
") D2;
		static void D2(const Standard_Real U, const gp_Elips2d & E, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	:param U:
	:type U: float
	:param H:
	:type H: gp_Hypr2d
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:rtype: None
") D2;
		static void D2(const Standard_Real U, const gp_Hypr2d & H, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Prb:
	:type Prb: gp_Parab2d
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:rtype: None
") D2;
		static void D2(const Standard_Real U, const gp_Parab2d & Prb, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "For elementary curves (circles, ellipses and hyperbolae) from the gp package, computes: - the point p of parameter u, and - the first, second and third derivative vectors v1, v2 and v3 at this point. the results, p, v1, v2 and v3, are either: - a gp_pnt point and three gp_vec vectors, for a curve in 3d space, or - a gp_pnt2d point and three gp_vec2d vectors, for a curve in 2d space.

	:param U:
	:type U: float
	:param C:
	:type C: gp_Circ
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:param V3:
	:type V3: gp_Vec
	:rtype: None
") D3;
		static void D3(const Standard_Real U, const gp_Circ & C, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "	:param U:
	:type U: float
	:param E:
	:type E: gp_Elips
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:param V3:
	:type V3: gp_Vec
	:rtype: None
") D3;
		static void D3(const Standard_Real U, const gp_Elips & E, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "	:param U:
	:type U: float
	:param H:
	:type H: gp_Hypr
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:param V3:
	:type V3: gp_Vec
	:rtype: None
") D3;
		static void D3(const Standard_Real U, const gp_Hypr & H, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "	:param U:
	:type U: float
	:param C:
	:type C: gp_Circ2d
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:param V3:
	:type V3: gp_Vec2d
	:rtype: None
") D3;
		static void D3(const Standard_Real U, const gp_Circ2d & C, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "	:param U:
	:type U: float
	:param E:
	:type E: gp_Elips2d
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:param V3:
	:type V3: gp_Vec2d
	:rtype: None
") D3;
		static void D3(const Standard_Real U, const gp_Elips2d & E, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "In the following functions n is the order of derivation and should be greater than 0.

	:param U:
	:type U: float
	:param H:
	:type H: gp_Hypr2d
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:param V3:
	:type V3: gp_Vec2d
	:rtype: None
") D3;
		static void D3(const Standard_Real U, const gp_Hypr2d & H, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "For elementary curves (lines, circles and conics) from the gp package, computes the vector corresponding to the nth derivative at the point of parameter u. the result is either: - a gp_vec vector for a curve in 3d space, or - a gp_vec2d vector for a curve in 2d space. in the following functions n is the order of derivation and should be greater than 0.

	:param U:
	:type U: float
	:param L:
	:type L: gp_Lin
	:param N:
	:type N: int
	:rtype: gp_Vec
") DN;
		static gp_Vec DN(const Standard_Real U, const gp_Lin & L, const Standard_Integer N);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "	:param U:
	:type U: float
	:param C:
	:type C: gp_Circ
	:param N:
	:type N: int
	:rtype: gp_Vec
") DN;
		static gp_Vec DN(const Standard_Real U, const gp_Circ & C, const Standard_Integer N);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "	:param U:
	:type U: float
	:param E:
	:type E: gp_Elips
	:param N:
	:type N: int
	:rtype: gp_Vec
") DN;
		static gp_Vec DN(const Standard_Real U, const gp_Elips & E, const Standard_Integer N);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "	:param U:
	:type U: float
	:param H:
	:type H: gp_Hypr
	:param N:
	:type N: int
	:rtype: gp_Vec
") DN;
		static gp_Vec DN(const Standard_Real U, const gp_Hypr & H, const Standard_Integer N);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Prb:
	:type Prb: gp_Parab
	:param N:
	:type N: int
	:rtype: gp_Vec
") DN;
		static gp_Vec DN(const Standard_Real U, const gp_Parab & Prb, const Standard_Integer N);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "	:param U:
	:type U: float
	:param L:
	:type L: gp_Lin2d
	:param N:
	:type N: int
	:rtype: gp_Vec2d
") DN;
		static gp_Vec2d DN(const Standard_Real U, const gp_Lin2d & L, const Standard_Integer N);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "	:param U:
	:type U: float
	:param C:
	:type C: gp_Circ2d
	:param N:
	:type N: int
	:rtype: gp_Vec2d
") DN;
		static gp_Vec2d DN(const Standard_Real U, const gp_Circ2d & C, const Standard_Integer N);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "	:param U:
	:type U: float
	:param E:
	:type E: gp_Elips2d
	:param N:
	:type N: int
	:rtype: gp_Vec2d
") DN;
		static gp_Vec2d DN(const Standard_Real U, const gp_Elips2d & E, const Standard_Integer N);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "	:param U:
	:type U: float
	:param H:
	:type H: gp_Hypr2d
	:param N:
	:type N: int
	:rtype: gp_Vec2d
") DN;
		static gp_Vec2d DN(const Standard_Real U, const gp_Hypr2d & H, const Standard_Integer N);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Prb:
	:type Prb: gp_Parab2d
	:param N:
	:type N: int
	:rtype: gp_Vec2d
") DN;
		static gp_Vec2d DN(const Standard_Real U, const gp_Parab2d & Prb, const Standard_Integer N);

		/****************** EllipseD1 ******************/
		%feature("compactdefaultargs") EllipseD1;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax2
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:rtype: None
") EllipseD1;
		static void EllipseD1(const Standard_Real U, const gp_Ax2 & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius, gp_Pnt & P, gp_Vec & V1);

		/****************** EllipseD1 ******************/
		%feature("compactdefaultargs") EllipseD1;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax22d
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:rtype: None
") EllipseD1;
		static void EllipseD1(const Standard_Real U, const gp_Ax22d & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius, gp_Pnt2d & P, gp_Vec2d & V1);

		/****************** EllipseD2 ******************/
		%feature("compactdefaultargs") EllipseD2;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax2
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:rtype: None
") EllipseD2;
		static void EllipseD2(const Standard_Real U, const gp_Ax2 & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****************** EllipseD2 ******************/
		%feature("compactdefaultargs") EllipseD2;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax22d
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:rtype: None
") EllipseD2;
		static void EllipseD2(const Standard_Real U, const gp_Ax22d & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****************** EllipseD3 ******************/
		%feature("compactdefaultargs") EllipseD3;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax2
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:param V3:
	:type V3: gp_Vec
	:rtype: None
") EllipseD3;
		static void EllipseD3(const Standard_Real U, const gp_Ax2 & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****************** EllipseD3 ******************/
		%feature("compactdefaultargs") EllipseD3;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax22d
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:param V3:
	:type V3: gp_Vec2d
	:rtype: None
") EllipseD3;
		static void EllipseD3(const Standard_Real U, const gp_Ax22d & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****************** EllipseDN ******************/
		%feature("compactdefaultargs") EllipseDN;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax2
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:param N:
	:type N: int
	:rtype: gp_Vec
") EllipseDN;
		static gp_Vec EllipseDN(const Standard_Real U, const gp_Ax2 & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius, const Standard_Integer N);

		/****************** EllipseDN ******************/
		%feature("compactdefaultargs") EllipseDN;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax22d
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:param N:
	:type N: int
	:rtype: gp_Vec2d
") EllipseDN;
		static gp_Vec2d EllipseDN(const Standard_Real U, const gp_Ax22d & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius, const Standard_Integer N);

		/****************** EllipseParameter ******************/
		%feature("compactdefaultargs") EllipseParameter;
		%feature("autodoc", "	:param Pos:
	:type Pos: gp_Ax2
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:param P:
	:type P: gp_Pnt
	:rtype: float
") EllipseParameter;
		static Standard_Real EllipseParameter(const gp_Ax2 & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius, const gp_Pnt & P);

		/****************** EllipseParameter ******************/
		%feature("compactdefaultargs") EllipseParameter;
		%feature("autodoc", "Pos is the axis of the ellipse parametrization in the local coordinate system of the ellipse x (u) = majorradius * cos (u) y (u) = minorradius * sin (u).

	:param Pos:
	:type Pos: gp_Ax22d
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:param P:
	:type P: gp_Pnt2d
	:rtype: float
") EllipseParameter;
		static Standard_Real EllipseParameter(const gp_Ax22d & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius, const gp_Pnt2d & P);

		/****************** EllipseValue ******************/
		%feature("compactdefaultargs") EllipseValue;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax2
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:rtype: gp_Pnt
") EllipseValue;
		static gp_Pnt EllipseValue(const Standard_Real U, const gp_Ax2 & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius);

		/****************** EllipseValue ******************/
		%feature("compactdefaultargs") EllipseValue;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax22d
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:rtype: gp_Pnt2d
") EllipseValue;
		static gp_Pnt2d EllipseValue(const Standard_Real U, const gp_Ax22d & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius);

		/****************** HyperbolaD1 ******************/
		%feature("compactdefaultargs") HyperbolaD1;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax2
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:rtype: None
") HyperbolaD1;
		static void HyperbolaD1(const Standard_Real U, const gp_Ax2 & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius, gp_Pnt & P, gp_Vec & V1);

		/****************** HyperbolaD1 ******************/
		%feature("compactdefaultargs") HyperbolaD1;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax22d
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:rtype: None
") HyperbolaD1;
		static void HyperbolaD1(const Standard_Real U, const gp_Ax22d & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius, gp_Pnt2d & P, gp_Vec2d & V1);

		/****************** HyperbolaD2 ******************/
		%feature("compactdefaultargs") HyperbolaD2;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax2
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:rtype: None
") HyperbolaD2;
		static void HyperbolaD2(const Standard_Real U, const gp_Ax2 & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****************** HyperbolaD2 ******************/
		%feature("compactdefaultargs") HyperbolaD2;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax22d
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:rtype: None
") HyperbolaD2;
		static void HyperbolaD2(const Standard_Real U, const gp_Ax22d & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****************** HyperbolaD3 ******************/
		%feature("compactdefaultargs") HyperbolaD3;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax2
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:param V3:
	:type V3: gp_Vec
	:rtype: None
") HyperbolaD3;
		static void HyperbolaD3(const Standard_Real U, const gp_Ax2 & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****************** HyperbolaD3 ******************/
		%feature("compactdefaultargs") HyperbolaD3;
		%feature("autodoc", "In the following functions n is the order of derivation and should be greater than 0.

	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax22d
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:param V3:
	:type V3: gp_Vec2d
	:rtype: None
") HyperbolaD3;
		static void HyperbolaD3(const Standard_Real U, const gp_Ax22d & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****************** HyperbolaDN ******************/
		%feature("compactdefaultargs") HyperbolaDN;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax2
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:param N:
	:type N: int
	:rtype: gp_Vec
") HyperbolaDN;
		static gp_Vec HyperbolaDN(const Standard_Real U, const gp_Ax2 & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius, const Standard_Integer N);

		/****************** HyperbolaDN ******************/
		%feature("compactdefaultargs") HyperbolaDN;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax22d
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:param N:
	:type N: int
	:rtype: gp_Vec2d
") HyperbolaDN;
		static gp_Vec2d HyperbolaDN(const Standard_Real U, const gp_Ax22d & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius, const Standard_Integer N);

		/****************** HyperbolaParameter ******************/
		%feature("compactdefaultargs") HyperbolaParameter;
		%feature("autodoc", "	:param Pos:
	:type Pos: gp_Ax2
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:param P:
	:type P: gp_Pnt
	:rtype: float
") HyperbolaParameter;
		static Standard_Real HyperbolaParameter(const gp_Ax2 & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius, const gp_Pnt & P);

		/****************** HyperbolaParameter ******************/
		%feature("compactdefaultargs") HyperbolaParameter;
		%feature("autodoc", "Pos is the axis of the hyperbola parametrization in the local coordinate system of the hyperbola x (u) = majorradius * ch (u) y (u) = minorradius * sh (u).

	:param Pos:
	:type Pos: gp_Ax22d
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:param P:
	:type P: gp_Pnt2d
	:rtype: float
") HyperbolaParameter;
		static Standard_Real HyperbolaParameter(const gp_Ax22d & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius, const gp_Pnt2d & P);

		/****************** HyperbolaValue ******************/
		%feature("compactdefaultargs") HyperbolaValue;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax2
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:rtype: gp_Pnt
") HyperbolaValue;
		static gp_Pnt HyperbolaValue(const Standard_Real U, const gp_Ax2 & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius);

		/****************** HyperbolaValue ******************/
		%feature("compactdefaultargs") HyperbolaValue;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax22d
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:rtype: gp_Pnt2d
") HyperbolaValue;
		static gp_Pnt2d HyperbolaValue(const Standard_Real U, const gp_Ax22d & Pos, const Standard_Real MajorRadius, const Standard_Real MinorRadius);

		/****************** InPeriod ******************/
		%feature("compactdefaultargs") InPeriod;
		%feature("autodoc", "Return a value in the range <ufirst, ulast> by adding or removing the period <ulast - ufirst> to <u>. attention!!! it is expected but not checked that (ulast > ufirst).

	:param U:
	:type U: float
	:param UFirst:
	:type UFirst: float
	:param ULast:
	:type ULast: float
	:rtype: float
") InPeriod;
		static Standard_Real InPeriod(const Standard_Real U, const Standard_Real UFirst, const Standard_Real ULast);

		/****************** LineD1 ******************/
		%feature("compactdefaultargs") LineD1;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax1
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:rtype: None
") LineD1;
		static void LineD1(const Standard_Real U, const gp_Ax1 & Pos, gp_Pnt & P, gp_Vec & V1);

		/****************** LineD1 ******************/
		%feature("compactdefaultargs") LineD1;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax2d
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:rtype: None
") LineD1;
		static void LineD1(const Standard_Real U, const gp_Ax2d & Pos, gp_Pnt2d & P, gp_Vec2d & V1);

		/****************** LineDN ******************/
		%feature("compactdefaultargs") LineDN;
		%feature("autodoc", "In the following functions n is the order of derivation and should be greater than 0.

	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax1
	:param N:
	:type N: int
	:rtype: gp_Vec
") LineDN;
		static gp_Vec LineDN(const Standard_Real U, const gp_Ax1 & Pos, const Standard_Integer N);

		/****************** LineDN ******************/
		%feature("compactdefaultargs") LineDN;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax2d
	:param N:
	:type N: int
	:rtype: gp_Vec2d
") LineDN;
		static gp_Vec2d LineDN(const Standard_Real U, const gp_Ax2d & Pos, const Standard_Integer N);

		/****************** LineParameter ******************/
		%feature("compactdefaultargs") LineParameter;
		%feature("autodoc", "	:param Pos:
	:type Pos: gp_Ax1
	:param P:
	:type P: gp_Pnt
	:rtype: float
") LineParameter;
		static Standard_Real LineParameter(const gp_Ax1 & Pos, const gp_Pnt & P);

		/****************** LineParameter ******************/
		%feature("compactdefaultargs") LineParameter;
		%feature("autodoc", "Parametrization p (u) = l.location() + u * l.direction().

	:param Pos:
	:type Pos: gp_Ax2d
	:param P:
	:type P: gp_Pnt2d
	:rtype: float
") LineParameter;
		static Standard_Real LineParameter(const gp_Ax2d & Pos, const gp_Pnt2d & P);

		/****************** LineValue ******************/
		%feature("compactdefaultargs") LineValue;
		%feature("autodoc", "Curve evaluation the following basis functions compute the derivatives on elementary curves defined by their geometric characteristics. these functions can be called without constructing a conic from package gp. they are called by the previous functions. example : a circle is defined by its position and its radius.

	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax1
	:rtype: gp_Pnt
") LineValue;
		static gp_Pnt LineValue(const Standard_Real U, const gp_Ax1 & Pos);

		/****************** LineValue ******************/
		%feature("compactdefaultargs") LineValue;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax2d
	:rtype: gp_Pnt2d
") LineValue;
		static gp_Pnt2d LineValue(const Standard_Real U, const gp_Ax2d & Pos);

		/****************** ParabolaD1 ******************/
		%feature("compactdefaultargs") ParabolaD1;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax2
	:param Focal:
	:type Focal: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:rtype: None
") ParabolaD1;
		static void ParabolaD1(const Standard_Real U, const gp_Ax2 & Pos, const Standard_Real Focal, gp_Pnt & P, gp_Vec & V1);

		/****************** ParabolaD1 ******************/
		%feature("compactdefaultargs") ParabolaD1;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax22d
	:param Focal:
	:type Focal: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:rtype: None
") ParabolaD1;
		static void ParabolaD1(const Standard_Real U, const gp_Ax22d & Pos, const Standard_Real Focal, gp_Pnt2d & P, gp_Vec2d & V1);

		/****************** ParabolaD2 ******************/
		%feature("compactdefaultargs") ParabolaD2;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax2
	:param Focal:
	:type Focal: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:rtype: None
") ParabolaD2;
		static void ParabolaD2(const Standard_Real U, const gp_Ax2 & Pos, const Standard_Real Focal, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****************** ParabolaD2 ******************/
		%feature("compactdefaultargs") ParabolaD2;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax22d
	:param Focal:
	:type Focal: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:rtype: None
") ParabolaD2;
		static void ParabolaD2(const Standard_Real U, const gp_Ax22d & Pos, const Standard_Real Focal, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****************** ParabolaDN ******************/
		%feature("compactdefaultargs") ParabolaDN;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax2
	:param Focal:
	:type Focal: float
	:param N:
	:type N: int
	:rtype: gp_Vec
") ParabolaDN;
		static gp_Vec ParabolaDN(const Standard_Real U, const gp_Ax2 & Pos, const Standard_Real Focal, const Standard_Integer N);

		/****************** ParabolaDN ******************/
		%feature("compactdefaultargs") ParabolaDN;
		%feature("autodoc", "The following functions compute the parametric value corresponding to a given point on a elementary curve. the point should be on the curve.

	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax22d
	:param Focal:
	:type Focal: float
	:param N:
	:type N: int
	:rtype: gp_Vec2d
") ParabolaDN;
		static gp_Vec2d ParabolaDN(const Standard_Real U, const gp_Ax22d & Pos, const Standard_Real Focal, const Standard_Integer N);

		/****************** ParabolaParameter ******************/
		%feature("compactdefaultargs") ParabolaParameter;
		%feature("autodoc", "	:param Pos:
	:type Pos: gp_Ax2
	:param P:
	:type P: gp_Pnt
	:rtype: float
") ParabolaParameter;
		static Standard_Real ParabolaParameter(const gp_Ax2 & Pos, const gp_Pnt & P);

		/****************** ParabolaParameter ******************/
		%feature("compactdefaultargs") ParabolaParameter;
		%feature("autodoc", "Pos is the mirror axis of the parabola parametrization in the local coordinate system of the parabola y**2 = (2*p) * x where p is the distance between the focus and the directrix. the following functions build a 3d curve from a 2d curve at a given position defined with an ax2.

	:param Pos:
	:type Pos: gp_Ax22d
	:param P:
	:type P: gp_Pnt2d
	:rtype: float
") ParabolaParameter;
		static Standard_Real ParabolaParameter(const gp_Ax22d & Pos, const gp_Pnt2d & P);

		/****************** ParabolaValue ******************/
		%feature("compactdefaultargs") ParabolaValue;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax2
	:param Focal:
	:type Focal: float
	:rtype: gp_Pnt
") ParabolaValue;
		static gp_Pnt ParabolaValue(const Standard_Real U, const gp_Ax2 & Pos, const Standard_Real Focal);

		/****************** ParabolaValue ******************/
		%feature("compactdefaultargs") ParabolaValue;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Pos:
	:type Pos: gp_Ax22d
	:param Focal:
	:type Focal: float
	:rtype: gp_Pnt2d
") ParabolaValue;
		static gp_Pnt2d ParabolaValue(const Standard_Real U, const gp_Ax22d & Pos, const Standard_Real Focal);

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Computes the parameter value of the point p on the given curve. note: in its local coordinate system, the parametric equation of the curve is given by the following: - for the line l: p(u) = po + u*vo where po is the origin and vo the unit vector of its positioning axis. - for the circle c: x(u) = radius*cos(u), y(u) = radius*sin(u) - for the ellipse e: x(u) = majorradius*cos(u). y(u) = minorradius*sin(u) - for the hyperbola h: x(u) = majorradius*ch(u), y(u) = minorradius*sh(u) - for the parabola prb: x(u) = u**2 / (2*p) y(u) = u where p is the distance between the focus and the directrix. warning the point p must be on the curve. these functions are not protected, however, and if point p is not on the curve, an exception may be raised.

	:param L:
	:type L: gp_Lin
	:param P:
	:type P: gp_Pnt
	:rtype: float
") Parameter;
		static Standard_Real Parameter(const gp_Lin & L, const gp_Pnt & P);

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Parametrization p (u) = l.location() + u * l.direction().

	:param L:
	:type L: gp_Lin2d
	:param P:
	:type P: gp_Pnt2d
	:rtype: float
") Parameter;
		static Standard_Real Parameter(const gp_Lin2d & L, const gp_Pnt2d & P);

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	:param C:
	:type C: gp_Circ
	:param P:
	:type P: gp_Pnt
	:rtype: float
") Parameter;
		static Standard_Real Parameter(const gp_Circ & C, const gp_Pnt & P);

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Parametrization in the local coordinate system of the circle x (u) = radius * cos (u) y (u) = radius * sin (u).

	:param C:
	:type C: gp_Circ2d
	:param P:
	:type P: gp_Pnt2d
	:rtype: float
") Parameter;
		static Standard_Real Parameter(const gp_Circ2d & C, const gp_Pnt2d & P);

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	:param E:
	:type E: gp_Elips
	:param P:
	:type P: gp_Pnt
	:rtype: float
") Parameter;
		static Standard_Real Parameter(const gp_Elips & E, const gp_Pnt & P);

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Parametrization in the local coordinate system of the ellipse x (u) = majorradius * cos (u) y (u) = minorradius * sin (u).

	:param E:
	:type E: gp_Elips2d
	:param P:
	:type P: gp_Pnt2d
	:rtype: float
") Parameter;
		static Standard_Real Parameter(const gp_Elips2d & E, const gp_Pnt2d & P);

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	:param H:
	:type H: gp_Hypr
	:param P:
	:type P: gp_Pnt
	:rtype: float
") Parameter;
		static Standard_Real Parameter(const gp_Hypr & H, const gp_Pnt & P);

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Parametrization in the local coordinate system of the hyperbola x (u) = majorradius * ch (u) y (u) = minorradius * sh (u).

	:param H:
	:type H: gp_Hypr2d
	:param P:
	:type P: gp_Pnt2d
	:rtype: float
") Parameter;
		static Standard_Real Parameter(const gp_Hypr2d & H, const gp_Pnt2d & P);

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	:param Prb:
	:type Prb: gp_Parab
	:param P:
	:type P: gp_Pnt
	:rtype: float
") Parameter;
		static Standard_Real Parameter(const gp_Parab & Prb, const gp_Pnt & P);

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Parametrization in the local coordinate system of the parabola y**2 = (2*p) * x where p is the distance between the focus and the directrix.

	:param Prb:
	:type Prb: gp_Parab2d
	:param P:
	:type P: gp_Pnt2d
	:rtype: float
") Parameter;
		static Standard_Real Parameter(const gp_Parab2d & Prb, const gp_Pnt2d & P);

		/****************** To3d ******************/
		%feature("compactdefaultargs") To3d;
		%feature("autodoc", "	:param Pos:
	:type Pos: gp_Ax2
	:param P:
	:type P: gp_Pnt2d
	:rtype: gp_Pnt
") To3d;
		static gp_Pnt To3d(const gp_Ax2 & Pos, const gp_Pnt2d & P);

		/****************** To3d ******************/
		%feature("compactdefaultargs") To3d;
		%feature("autodoc", "	:param Pos:
	:type Pos: gp_Ax2
	:param V:
	:type V: gp_Vec2d
	:rtype: gp_Vec
") To3d;
		static gp_Vec To3d(const gp_Ax2 & Pos, const gp_Vec2d & V);

		/****************** To3d ******************/
		%feature("compactdefaultargs") To3d;
		%feature("autodoc", "	:param Pos:
	:type Pos: gp_Ax2
	:param V:
	:type V: gp_Dir2d
	:rtype: gp_Dir
") To3d;
		static gp_Dir To3d(const gp_Ax2 & Pos, const gp_Dir2d & V);

		/****************** To3d ******************/
		%feature("compactdefaultargs") To3d;
		%feature("autodoc", "	:param Pos:
	:type Pos: gp_Ax2
	:param A:
	:type A: gp_Ax2d
	:rtype: gp_Ax1
") To3d;
		static gp_Ax1 To3d(const gp_Ax2 & Pos, const gp_Ax2d & A);

		/****************** To3d ******************/
		%feature("compactdefaultargs") To3d;
		%feature("autodoc", "	:param Pos:
	:type Pos: gp_Ax2
	:param A:
	:type A: gp_Ax22d
	:rtype: gp_Ax2
") To3d;
		static gp_Ax2 To3d(const gp_Ax2 & Pos, const gp_Ax22d & A);

		/****************** To3d ******************/
		%feature("compactdefaultargs") To3d;
		%feature("autodoc", "	:param Pos:
	:type Pos: gp_Ax2
	:param L:
	:type L: gp_Lin2d
	:rtype: gp_Lin
") To3d;
		static gp_Lin To3d(const gp_Ax2 & Pos, const gp_Lin2d & L);

		/****************** To3d ******************/
		%feature("compactdefaultargs") To3d;
		%feature("autodoc", "	:param Pos:
	:type Pos: gp_Ax2
	:param C:
	:type C: gp_Circ2d
	:rtype: gp_Circ
") To3d;
		static gp_Circ To3d(const gp_Ax2 & Pos, const gp_Circ2d & C);

		/****************** To3d ******************/
		%feature("compactdefaultargs") To3d;
		%feature("autodoc", "	:param Pos:
	:type Pos: gp_Ax2
	:param E:
	:type E: gp_Elips2d
	:rtype: gp_Elips
") To3d;
		static gp_Elips To3d(const gp_Ax2 & Pos, const gp_Elips2d & E);

		/****************** To3d ******************/
		%feature("compactdefaultargs") To3d;
		%feature("autodoc", "	:param Pos:
	:type Pos: gp_Ax2
	:param H:
	:type H: gp_Hypr2d
	:rtype: gp_Hypr
") To3d;
		static gp_Hypr To3d(const gp_Ax2 & Pos, const gp_Hypr2d & H);

		/****************** To3d ******************/
		%feature("compactdefaultargs") To3d;
		%feature("autodoc", "These functions build a 3d geometric entity from a 2d geometric entity. the 'x axis' and the 'y axis' of the global coordinate system (i.e. 2d space) are lined up respectively with the 'x axis' and 'y axis' of the 3d coordinate system, pos.

	:param Pos:
	:type Pos: gp_Ax2
	:param Prb:
	:type Prb: gp_Parab2d
	:rtype: gp_Parab
") To3d;
		static gp_Parab To3d(const gp_Ax2 & Pos, const gp_Parab2d & Prb);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "For elementary curves (lines, circles and conics) from the gp package, computes the point of parameter u. the result is either: - a gp_pnt point for a curve in 3d space, or - a gp_pnt2d point for a curve in 2d space.

	:param U:
	:type U: float
	:param L:
	:type L: gp_Lin
	:rtype: gp_Pnt
") Value;
		static gp_Pnt Value(const Standard_Real U, const gp_Lin & L);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param U:
	:type U: float
	:param C:
	:type C: gp_Circ
	:rtype: gp_Pnt
") Value;
		static gp_Pnt Value(const Standard_Real U, const gp_Circ & C);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param U:
	:type U: float
	:param E:
	:type E: gp_Elips
	:rtype: gp_Pnt
") Value;
		static gp_Pnt Value(const Standard_Real U, const gp_Elips & E);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param U:
	:type U: float
	:param H:
	:type H: gp_Hypr
	:rtype: gp_Pnt
") Value;
		static gp_Pnt Value(const Standard_Real U, const gp_Hypr & H);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Prb:
	:type Prb: gp_Parab
	:rtype: gp_Pnt
") Value;
		static gp_Pnt Value(const Standard_Real U, const gp_Parab & Prb);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param U:
	:type U: float
	:param L:
	:type L: gp_Lin2d
	:rtype: gp_Pnt2d
") Value;
		static gp_Pnt2d Value(const Standard_Real U, const gp_Lin2d & L);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param U:
	:type U: float
	:param C:
	:type C: gp_Circ2d
	:rtype: gp_Pnt2d
") Value;
		static gp_Pnt2d Value(const Standard_Real U, const gp_Circ2d & C);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param U:
	:type U: float
	:param E:
	:type E: gp_Elips2d
	:rtype: gp_Pnt2d
") Value;
		static gp_Pnt2d Value(const Standard_Real U, const gp_Elips2d & E);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param U:
	:type U: float
	:param H:
	:type H: gp_Hypr2d
	:rtype: gp_Pnt2d
") Value;
		static gp_Pnt2d Value(const Standard_Real U, const gp_Hypr2d & H);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param U:
	:type U: float
	:param Prb:
	:type Prb: gp_Parab2d
	:rtype: gp_Pnt2d
") Value;
		static gp_Pnt2d Value(const Standard_Real U, const gp_Parab2d & Prb);

};


%extend ElCLib {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */

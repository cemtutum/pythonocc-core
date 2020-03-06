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
%define BNDLIBDOCSTRING
"BndLib module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_bndlib.html"
%enddef
%module (package="OCC.Core", docstring=BNDLIBDOCSTRING) BndLib


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
#include<BndLib_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<gp_module.hxx>
#include<Bnd_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Geom2d_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Geom_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import gp.i
%import Bnd.i
%import Adaptor2d.i
%import Geom2d.i
%import Adaptor3d.i
/* public enums */
/* end public enums declaration */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/***************
* class BndLib *
***************/
%rename(bndlib) BndLib;
class BndLib {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Bounding box for a surface trimmed or not adds the segment of the line l limited by the two parameter values p1 and p2, to the bounding box b, and then enlarges b by the tolerance value tol. tol is the tolerance value to enlarge the minimun and maximum dimension p1 and p2 may represent infinite values. exceptions standard_failure if p1 and p2 are either two negative infinite real numbers, or two positive infinite real numbers.

	:param L:
	:type L: gp_Lin
	:param P1:
	:type P1: float
	:param P2:
	:type P2: float
	:param Tol:
	:type Tol: float
	:param B:
	:type B: Bnd_Box
	:rtype: None
") Add;
		static void Add(const gp_Lin & L, const Standard_Real P1, const Standard_Real P2, const Standard_Real Tol, Bnd_Box & B);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param L:
	:type L: gp_Lin2d
	:param P1:
	:type P1: float
	:param P2:
	:type P2: float
	:param Tol:
	:type Tol: float
	:param B:
	:type B: Bnd_Box2d
	:rtype: None
") Add;
		static void Add(const gp_Lin2d & L, const Standard_Real P1, const Standard_Real P2, const Standard_Real Tol, Bnd_Box2d & B);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param C:
	:type C: gp_Circ
	:param Tol:
	:type Tol: float
	:param B:
	:type B: Bnd_Box
	:rtype: None
") Add;
		static void Add(const gp_Circ & C, const Standard_Real Tol, Bnd_Box & B);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "P2-p1 can be in [0,2*pi].

	:param C:
	:type C: gp_Circ
	:param P1:
	:type P1: float
	:param P2:
	:type P2: float
	:param Tol:
	:type Tol: float
	:param B:
	:type B: Bnd_Box
	:rtype: None
") Add;
		static void Add(const gp_Circ & C, const Standard_Real P1, const Standard_Real P2, const Standard_Real Tol, Bnd_Box & B);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param C:
	:type C: gp_Circ2d
	:param Tol:
	:type Tol: float
	:param B:
	:type B: Bnd_Box2d
	:rtype: None
") Add;
		static void Add(const gp_Circ2d & C, const Standard_Real Tol, Bnd_Box2d & B);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds the circle c, or the arc of the circle c limited by the two parameter values p1 and p2, to the bounding box b, and then enlarges b by the tolerance value tol. p2-p1 can be in [0,2*pi].

	:param C:
	:type C: gp_Circ2d
	:param P1:
	:type P1: float
	:param P2:
	:type P2: float
	:param Tol:
	:type Tol: float
	:param B:
	:type B: Bnd_Box2d
	:rtype: None
") Add;
		static void Add(const gp_Circ2d & C, const Standard_Real P1, const Standard_Real P2, const Standard_Real Tol, Bnd_Box2d & B);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param C:
	:type C: gp_Elips
	:param Tol:
	:type Tol: float
	:param B:
	:type B: Bnd_Box
	:rtype: None
") Add;
		static void Add(const gp_Elips & C, const Standard_Real Tol, Bnd_Box & B);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "P2-p1 can be in [0,2*pi].

	:param C:
	:type C: gp_Elips
	:param P1:
	:type P1: float
	:param P2:
	:type P2: float
	:param Tol:
	:type Tol: float
	:param B:
	:type B: Bnd_Box
	:rtype: None
") Add;
		static void Add(const gp_Elips & C, const Standard_Real P1, const Standard_Real P2, const Standard_Real Tol, Bnd_Box & B);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param C:
	:type C: gp_Elips2d
	:param Tol:
	:type Tol: float
	:param B:
	:type B: Bnd_Box2d
	:rtype: None
") Add;
		static void Add(const gp_Elips2d & C, const Standard_Real Tol, Bnd_Box2d & B);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds the ellipse e, or the arc of the ellipse e limited by the two parameter values p1 and p2, to the bounding box b, and then enlarges b by the tolerance value tol. p2-p1 can be in [0,2*pi].

	:param C:
	:type C: gp_Elips2d
	:param P1:
	:type P1: float
	:param P2:
	:type P2: float
	:param Tol:
	:type Tol: float
	:param B:
	:type B: Bnd_Box2d
	:rtype: None
") Add;
		static void Add(const gp_Elips2d & C, const Standard_Real P1, const Standard_Real P2, const Standard_Real Tol, Bnd_Box2d & B);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param P:
	:type P: gp_Parab
	:param P1:
	:type P1: float
	:param P2:
	:type P2: float
	:param Tol:
	:type Tol: float
	:param B:
	:type B: Bnd_Box
	:rtype: None
") Add;
		static void Add(const gp_Parab & P, const Standard_Real P1, const Standard_Real P2, const Standard_Real Tol, Bnd_Box & B);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds the arc of the parabola p limited by the two parameter values p1 and p2, to the bounding box b, and then enlarges b by the tolerance value tol. p1 and p2 may represent infinite values. exceptions standard_failure if p1 and p2 are either two negative infinite real numbers, or two positive infinite real numbers.

	:param P:
	:type P: gp_Parab2d
	:param P1:
	:type P1: float
	:param P2:
	:type P2: float
	:param Tol:
	:type Tol: float
	:param B:
	:type B: Bnd_Box2d
	:rtype: None
") Add;
		static void Add(const gp_Parab2d & P, const Standard_Real P1, const Standard_Real P2, const Standard_Real Tol, Bnd_Box2d & B);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param H:
	:type H: gp_Hypr
	:param P1:
	:type P1: float
	:param P2:
	:type P2: float
	:param Tol:
	:type Tol: float
	:param B:
	:type B: Bnd_Box
	:rtype: None
") Add;
		static void Add(const gp_Hypr & H, const Standard_Real P1, const Standard_Real P2, const Standard_Real Tol, Bnd_Box & B);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds the arc of the branch of hyperbola h limited by the two parameter values p1 and p2, to the bounding box b, and then enlarges b by the tolerance value tol. p1 and p2 may represent infinite values. exceptions standard_failure if p1 and p2 are either two negative infinite real numbers, or two positive infinite real numbers.

	:param H:
	:type H: gp_Hypr2d
	:param P1:
	:type P1: float
	:param P2:
	:type P2: float
	:param Tol:
	:type Tol: float
	:param B:
	:type B: Bnd_Box2d
	:rtype: None
") Add;
		static void Add(const gp_Hypr2d & H, const Standard_Real P1, const Standard_Real P2, const Standard_Real Tol, Bnd_Box2d & B);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Umax -umin can be in [0,2*pi].

	:param S:
	:type S: gp_Cylinder
	:param UMin:
	:type UMin: float
	:param UMax:
	:type UMax: float
	:param VMin:
	:type VMin: float
	:param VMax:
	:type VMax: float
	:param Tol:
	:type Tol: float
	:param B:
	:type B: Bnd_Box
	:rtype: None
") Add;
		static void Add(const gp_Cylinder & S, const Standard_Real UMin, const Standard_Real UMax, const Standard_Real VMin, const Standard_Real VMax, const Standard_Real Tol, Bnd_Box & B);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds to the bounding box b, the patch of the cylinder s limited - in the v parametric direction, by the two parameter values vmin and vmax - and optionally in the u parametric direction, by the two parameter values umin and umax. b is then enlarged by the tolerance value tol. vmin and vmax may represent infinite values. exceptions standard_failure if vmin and vmax are either two negative infinite real numbers, or two positive infinite real numbers.

	:param S:
	:type S: gp_Cylinder
	:param VMin:
	:type VMin: float
	:param VMax:
	:type VMax: float
	:param Tol:
	:type Tol: float
	:param B:
	:type B: Bnd_Box
	:rtype: None
") Add;
		static void Add(const gp_Cylinder & S, const Standard_Real VMin, const Standard_Real VMax, const Standard_Real Tol, Bnd_Box & B);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Umax-umin can be in [0,2*pi].

	:param S:
	:type S: gp_Cone
	:param UMin:
	:type UMin: float
	:param UMax:
	:type UMax: float
	:param VMin:
	:type VMin: float
	:param VMax:
	:type VMax: float
	:param Tol:
	:type Tol: float
	:param B:
	:type B: Bnd_Box
	:rtype: None
") Add;
		static void Add(const gp_Cone & S, const Standard_Real UMin, const Standard_Real UMax, const Standard_Real VMin, const Standard_Real VMax, const Standard_Real Tol, Bnd_Box & B);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds to the bounding box b, the patch of the cone s limited - in the v parametric direction, by the two parameter values vmin and vmax - and optionally in the u parametric direction, by the two parameter values umin and umax, b is then enlarged by the tolerance value tol. vmin and vmax may represent infinite values. exceptions standard_failure if vmin and vmax are either two negative infinite real numbers, or two positive infinite real numbers.

	:param S:
	:type S: gp_Cone
	:param VMin:
	:type VMin: float
	:param VMax:
	:type VMax: float
	:param Tol:
	:type Tol: float
	:param B:
	:type B: Bnd_Box
	:rtype: None
") Add;
		static void Add(const gp_Cone & S, const Standard_Real VMin, const Standard_Real VMax, const Standard_Real Tol, Bnd_Box & B);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param S:
	:type S: gp_Sphere
	:param Tol:
	:type Tol: float
	:param B:
	:type B: Bnd_Box
	:rtype: None
") Add;
		static void Add(const gp_Sphere & S, const Standard_Real Tol, Bnd_Box & B);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds to the bounding box b the sphere s, or - the patch of the sphere s, limited in the u parametric direction, by the two parameter values umin and umax, and in the v parametric direction, by the two parameter values vmin and vmax. b is then enlarged by the tolerance value tol. umax-umin can be in [0,2*pi] vmin,vmax can be [-pi/2,pi/2].

	:param S:
	:type S: gp_Sphere
	:param UMin:
	:type UMin: float
	:param UMax:
	:type UMax: float
	:param VMin:
	:type VMin: float
	:param VMax:
	:type VMax: float
	:param Tol:
	:type Tol: float
	:param B:
	:type B: Bnd_Box
	:rtype: None
") Add;
		static void Add(const gp_Sphere & S, const Standard_Real UMin, const Standard_Real UMax, const Standard_Real VMin, const Standard_Real VMax, const Standard_Real Tol, Bnd_Box & B);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param P:
	:type P: gp_Torus
	:param Tol:
	:type Tol: float
	:param B:
	:type B: Bnd_Box
	:rtype: None
") Add;
		static void Add(const gp_Torus & P, const Standard_Real Tol, Bnd_Box & B);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds to the bounding box b - the torus s, or - the patch of the torus s, limited in the u parametric direction, by the two parameter values umin and umax, and in the v parametric direction, by the two parameter values vmin and vmax. b is then enlarged by the tolerance value tol. umax-umin can be in [0,2*pi], vmin,vmax can be [-pi/2,pi/2].

	:param P:
	:type P: gp_Torus
	:param UMin:
	:type UMin: float
	:param UMax:
	:type UMax: float
	:param VMin:
	:type VMin: float
	:param VMax:
	:type VMax: float
	:param Tol:
	:type Tol: float
	:param B:
	:type B: Bnd_Box
	:rtype: None
") Add;
		static void Add(const gp_Torus & P, const Standard_Real UMin, const Standard_Real UMax, const Standard_Real VMin, const Standard_Real VMax, const Standard_Real Tol, Bnd_Box & B);

};


%extend BndLib {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class BndLib_Add2dCurve *
**************************/
class BndLib_Add2dCurve {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds to the bounding box b the curve c b is then enlarged by the tolerance value tol. note: depending on the type of curve, one of the following representations of the curve c is used to include it in the bounding box b: - an exact representation if c is built from a line, a circle or a conic curve, - the poles of the curve if c is built from a bezier curve or a bspline curve, - if not, the points of an approximation of the curve c. warning c is an adapted curve, that is, an object which is an interface between: - the services provided by a 2d curve from the package geom2d - and those required of the curve by the computation algorithm. the adapted curve is created in the following way: opencascade::handle<geom2d_curve> mycurve = ... ; geom2dadaptor_curve c(mycurve); the bounding box b is then enlarged by adding it: bnd_box2d b; // ... standard_real tol = ... ; add2dcurve::add ( c, tol, b ); exceptions standard_failure if the curve is built from: - a geom_line, or - a geom_parabola, or - a geom_hyperbola, and p1 and p2 are either two negative infinite real numbers, or two positive infinite real numbers.

	:param C:
	:type C: Adaptor2d_Curve2d
	:param Tol:
	:type Tol: float
	:param B:
	:type B: Bnd_Box2d
	:rtype: None
") Add;
		static void Add(const Adaptor2d_Curve2d & C, const Standard_Real Tol, Bnd_Box2d & B);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds to the bounding box bthe arc of the curve c limited by the two parameter values p1 and p2. b is then enlarged by the tolerance value tol. note: depending on the type of curve, one of the following representations of the curve c is used to include it in the bounding box b: - an exact representation if c is built from a line, a circle or a conic curve, - the poles of the curve if c is built from a bezier curve or a bspline curve, - if not, the points of an approximation of the curve c. warning c is an adapted curve, that is, an object which is an interface between: - the services provided by a 2d curve from the package geom2d - and those required of the curve by the computation algorithm. the adapted curve is created in the following way: opencascade::handle<geom2d_curve> mycurve = ... ; geom2dadaptor_curve c(mycurve); the bounding box b is then enlarged by adding it: bnd_box2d b; // ... standard_real tol = ... ; add2dcurve::add ( c, tol, b ); exceptions standard_failure if the curve is built from: - a geom_line, or - a geom_parabola, or - a geom_hyperbola, and p1 and p2 are either two negative infinite real numbers, or two positive infinite real numbers.

	:param C:
	:type C: Adaptor2d_Curve2d
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param Tol:
	:type Tol: float
	:param B:
	:type B: Bnd_Box2d
	:rtype: None
") Add;
		static void Add(const Adaptor2d_Curve2d & C, const Standard_Real U1, const Standard_Real U2, const Standard_Real Tol, Bnd_Box2d & B);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds to the bounding box b the curve c b is then enlarged by the tolerance value tol. note: depending on the type of curve, one of the following representations of the curve c is used to include it in the bounding box b: - an exact representation if c is built from a line, a circle or a conic curve, - the poles of the curve if c is built from a bezier curve or a bspline curve, - if not, the points of an approximation of the curve c.

	:param C:
	:type C: Geom2d_Curve
	:param Tol:
	:type Tol: float
	:param Box:
	:type Box: Bnd_Box2d
	:rtype: None
") Add;
		static void Add(const opencascade::handle<Geom2d_Curve> & C, const Standard_Real Tol, Bnd_Box2d & Box);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds to the bounding box b the part of curve c b is then enlarged by the tolerance value tol. u1, u2 - the parametric range to comute the bounding box; note: depending on the type of curve, one of the following representations of the curve c is used to include it in the bounding box b: - an exact representation if c is built from a line, a circle or a conic curve, - the poles of the curve if c is built from a bezier curve or a bspline curve, - if not, the points of an approximation of the curve c.

	:param C:
	:type C: Geom2d_Curve
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param Tol:
	:type Tol: float
	:param B:
	:type B: Bnd_Box2d
	:rtype: None
") Add;
		static void Add(const opencascade::handle<Geom2d_Curve> & C, const Standard_Real U1, const Standard_Real U2, const Standard_Real Tol, Bnd_Box2d & B);

		/****************** AddOptimal ******************/
		%feature("compactdefaultargs") AddOptimal;
		%feature("autodoc", "Adds to the bounding box b the part of curve c b is then enlarged by the tolerance value tol. u1, u2 - the parametric range to comute the bounding box; note: depending on the type of curve, one of the following algorithms is used to include it in the bounding box b: - an exact analytical if c is built from a line, a circle or a conic curve, - numerical calculation of bounding box sizes, based on minimization algorithm, for other types of curve if tol = < precision::pconfusion(), precision::pconfusion is used as tolerance for calculation.

	:param C:
	:type C: Geom2d_Curve
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param Tol:
	:type Tol: float
	:param B:
	:type B: Bnd_Box2d
	:rtype: None
") AddOptimal;
		static void AddOptimal(const opencascade::handle<Geom2d_Curve> & C, const Standard_Real U1, const Standard_Real U2, const Standard_Real Tol, Bnd_Box2d & B);

};


%extend BndLib_Add2dCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class BndLib_Add3dCurve *
**************************/
class BndLib_Add3dCurve {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds to the bounding box b the curve c b is then enlarged by the tolerance value tol. note: depending on the type of curve, one of the following representations of the curve c is used to include it in the bounding box b: - an exact representation if c is built from a line, a circle or a conic curve, - the poles of the curve if c is built from a bezier curve or a bspline curve, if not, the points of an approximation of the curve c. warning c is an adapted curve, that is, an object which is an interface between: - the services provided by a 3d curve from the package geom - and those required of the curve by the computation algorithm. the adapted curve is created in the following way: opencascade::handle<geom_curve> mycurve = ... ; geomadaptor_curve c(mycurve); the bounding box b is then enlarged by adding it: bnd_box b; // ... standard_real tol = ... ; add3dcurve::add ( c, tol, b ); exceptions standard_failure if the curve is built from: - a geom_line, or - a geom_parabola, or - a geom_hyperbola, and p1 and p2 are either two negative infinite real numbers, or two positive infinite real numbers.

	:param C:
	:type C: Adaptor3d_Curve
	:param Tol:
	:type Tol: float
	:param B:
	:type B: Bnd_Box
	:rtype: None
") Add;
		static void Add(const Adaptor3d_Curve & C, const Standard_Real Tol, Bnd_Box & B);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds to the bounding box b the curve c the arc of the curve c limited by the two parameter values p1 and p2. note: depending on the type of curve, one of the following representations of the curve c is used to include it in the bounding box b: - an exact representation if c is built from a line, a circle or a conic curve, - the poles of the curve if c is built from a bezier curve or a bspline curve, if not, the points of an approximation of the curve c. warning c is an adapted curve, that is, an object which is an interface between: - the services provided by a 3d curve from the package geom - and those required of the curve by the computation algorithm. the adapted curve is created in the following way: opencascade::handle<geom_curve> mycurve = ... ; geomadaptor_curve c(mycurve); the bounding box b is then enlarged by adding it: bnd_box b; // ... standard_real tol = ... ; add3dcurve::add ( c, tol, b ); exceptions standard_failure if the curve is built from: - a geom_line, or - a geom_parabola, or - a geom_hyperbola, and p1 and p2 are either two negative infinite real numbers, or two positive infinite real numbers.

	:param C:
	:type C: Adaptor3d_Curve
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param Tol:
	:type Tol: float
	:param B:
	:type B: Bnd_Box
	:rtype: None
") Add;
		static void Add(const Adaptor3d_Curve & C, const Standard_Real U1, const Standard_Real U2, const Standard_Real Tol, Bnd_Box & B);

		/****************** AddGenCurv ******************/
		%feature("compactdefaultargs") AddGenCurv;
		%feature("autodoc", "Adds to the bounding box b the curve c using numerical minimization algorithms this method is used in addoptimal for not analytical curves. if tol < precision::confusion(), precision:;confusion is used as computation tolerance.

	:param C:
	:type C: Adaptor3d_Curve
	:param UMin:
	:type UMin: float
	:param UMax:
	:type UMax: float
	:param Tol:
	:type Tol: float
	:param B:
	:type B: Bnd_Box
	:rtype: None
") AddGenCurv;
		static void AddGenCurv(const Adaptor3d_Curve & C, const Standard_Real UMin, const Standard_Real UMax, const Standard_Real Tol, Bnd_Box & B);

		/****************** AddOptimal ******************/
		%feature("compactdefaultargs") AddOptimal;
		%feature("autodoc", "Adds to the bounding box b the curve c these methods use more precise algorithms for building bnd box then methods add(...).

	:param C:
	:type C: Adaptor3d_Curve
	:param Tol:
	:type Tol: float
	:param B:
	:type B: Bnd_Box
	:rtype: None
") AddOptimal;
		static void AddOptimal(const Adaptor3d_Curve & C, const Standard_Real Tol, Bnd_Box & B);

		/****************** AddOptimal ******************/
		%feature("compactdefaultargs") AddOptimal;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_Curve
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param Tol:
	:type Tol: float
	:param B:
	:type B: Bnd_Box
	:rtype: None
") AddOptimal;
		static void AddOptimal(const Adaptor3d_Curve & C, const Standard_Real U1, const Standard_Real U2, const Standard_Real Tol, Bnd_Box & B);

};


%extend BndLib_Add3dCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class BndLib_AddSurface *
**************************/
class BndLib_AddSurface {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds to the bounding box b the surface s b is then enlarged by the tolerance value tol. note: depending on the type of curve, one of the following representations of the surface s is used to include it in the bounding box b: - an exact representation if s is built from a plane, a cylinder, a cone, a sphere or a torus, - the poles of the surface if s is built from a bezier surface or a bspline surface, - the points of an approximation of the surface s in cases other than offset surfaces; - in the case of an offset surface, the basis surface is first included according to the previous rules; then the bounding box is enlarged by the offset value. warning do not use these functions to add a non-finite surface to the bounding box b. if umin, umax, vmin or vmax is an infinite value b will become wholespace. s is an adapted surface, that is, an object which is an interface between: - the services provided by a surface from the package geom - and those required of the surface by the computation algorithm. the adapted surface is created in the following way: opencascade::handle<geom_surface> mysurface = ... ; geomadaptor_surface s(mysurface); the bounding box b is then enlarged by adding this surface: bnd_box b; // ... standard_real tol = ... ; addsurface::add ( s, tol, b );.

	:param S:
	:type S: Adaptor3d_Surface
	:param Tol:
	:type Tol: float
	:param B:
	:type B: Bnd_Box
	:rtype: None
") Add;
		static void Add(const Adaptor3d_Surface & S, const Standard_Real Tol, Bnd_Box & B);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds to the bounding box b the surface s the patch of the surface s limited in the u parametric direction by the two parameter values umin, umax, and in the v parametric direction by the two parameter values vmin, vmax. note: depending on the type of curve, one of the following representations of the surface s is used to include it in the bounding box b: - an exact representation if s is built from a plane, a cylinder, a cone, a sphere or a torus, - the poles of the surface if s is built from a bezier surface or a bspline surface, - the points of an approximation of the surface s in cases other than offset surfaces; - in the case of an offset surface, the basis surface is first included according to the previous rules; then the bounding box is enlarged by the offset value. warning do not use these functions to add a non-finite surface to the bounding box b. if umin, umax, vmin or vmax is an infinite value b will become wholespace. s is an adapted surface, that is, an object which is an interface between: - the services provided by a surface from the package geom - and those required of the surface by the computation algorithm. the adapted surface is created in the following way: opencascade::handle<geom_surface> mysurface = ... ; geomadaptor_surface s(mysurface); the bounding box b is then enlarged by adding this surface: bnd_box b; // ... standard_real tol = ... ; addsurface::add ( s, tol, b );.

	:param S:
	:type S: Adaptor3d_Surface
	:param UMin:
	:type UMin: float
	:param UMax:
	:type UMax: float
	:param VMin:
	:type VMin: float
	:param VMax:
	:type VMax: float
	:param Tol:
	:type Tol: float
	:param B:
	:type B: Bnd_Box
	:rtype: None
") Add;
		static void Add(const Adaptor3d_Surface & S, const Standard_Real UMin, const Standard_Real UMax, const Standard_Real VMin, const Standard_Real VMax, const Standard_Real Tol, Bnd_Box & B);

		/****************** AddGenSurf ******************/
		%feature("compactdefaultargs") AddGenSurf;
		%feature("autodoc", "Adds to the bounding box b the surface s using numerical minimization algorithms this method is used in addoptimal for not analytical surfaces and torus. if tol < precision::confusion(), precision::confusion is used as computation tolerance.

	:param S:
	:type S: Adaptor3d_Surface
	:param UMin:
	:type UMin: float
	:param UMax:
	:type UMax: float
	:param VMin:
	:type VMin: float
	:param VMax:
	:type VMax: float
	:param Tol:
	:type Tol: float
	:param B:
	:type B: Bnd_Box
	:rtype: None
") AddGenSurf;
		static void AddGenSurf(const Adaptor3d_Surface & S, const Standard_Real UMin, const Standard_Real UMax, const Standard_Real VMin, const Standard_Real VMax, const Standard_Real Tol, Bnd_Box & B);

		/****************** AddOptimal ******************/
		%feature("compactdefaultargs") AddOptimal;
		%feature("autodoc", "	:param S:
	:type S: Adaptor3d_Surface
	:param Tol:
	:type Tol: float
	:param B:
	:type B: Bnd_Box
	:rtype: None
") AddOptimal;
		static void AddOptimal(const Adaptor3d_Surface & S, const Standard_Real Tol, Bnd_Box & B);

		/****************** AddOptimal ******************/
		%feature("compactdefaultargs") AddOptimal;
		%feature("autodoc", "	:param S:
	:type S: Adaptor3d_Surface
	:param UMin:
	:type UMin: float
	:param UMax:
	:type UMax: float
	:param VMin:
	:type VMin: float
	:param VMax:
	:type VMax: float
	:param Tol:
	:type Tol: float
	:param B:
	:type B: Bnd_Box
	:rtype: None
") AddOptimal;
		static void AddOptimal(const Adaptor3d_Surface & S, const Standard_Real UMin, const Standard_Real UMax, const Standard_Real VMin, const Standard_Real VMax, const Standard_Real Tol, Bnd_Box & B);

};


%extend BndLib_AddSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */

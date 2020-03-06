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
%define GEOM2DINTDOCSTRING
"Geom2dInt module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_geom2dint.html"
%enddef
%module (package="OCC.Core", docstring=GEOM2DINTDOCSTRING) Geom2dInt


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
#include<Geom2dInt_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Adaptor2d_module.hxx>
#include<IntRes2d_module.hxx>
#include<gp_module.hxx>
#include<TColStd_module.hxx>
#include<GeomAbs_module.hxx>
#include<math_module.hxx>
#include<IntCurve_module.hxx>
#include<Extrema_module.hxx>
#include<Intf_module.hxx>
#include<Bnd_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Adaptor2d.i
%import IntRes2d.i
%import gp.i
%import TColStd.i
%import GeomAbs.i
%import math.i
%import IntCurve.i
%import Extrema.i
%import Intf.i
%import Bnd.i
/* public enums */
/* end public enums declaration */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/*********************************************************************
* class Geom2dInt_ExactIntersectionPointOfTheIntPCurvePCurveOfGInter *
*********************************************************************/
class Geom2dInt_ExactIntersectionPointOfTheIntPCurvePCurveOfGInter {
	public:
		/****************** AnErrorOccurred ******************/
		%feature("compactdefaultargs") AnErrorOccurred;
		%feature("autodoc", "	:rtype: bool
") AnErrorOccurred;
		Standard_Boolean AnErrorOccurred();

		/****************** Geom2dInt_ExactIntersectionPointOfTheIntPCurvePCurveOfGInter ******************/
		%feature("compactdefaultargs") Geom2dInt_ExactIntersectionPointOfTheIntPCurvePCurveOfGInter;
		%feature("autodoc", "	:param C1:
	:type C1: Adaptor2d_Curve2d
	:param C2:
	:type C2: Adaptor2d_Curve2d
	:param Tol:
	:type Tol: float
	:rtype: None
") Geom2dInt_ExactIntersectionPointOfTheIntPCurvePCurveOfGInter;
		 Geom2dInt_ExactIntersectionPointOfTheIntPCurvePCurveOfGInter(const Adaptor2d_Curve2d & C1, const Adaptor2d_Curve2d & C2, const Standard_Real Tol);

		/****************** NbRoots ******************/
		%feature("compactdefaultargs") NbRoots;
		%feature("autodoc", "	:rtype: int
") NbRoots;
		Standard_Integer NbRoots();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param Poly1:
	:type Poly1: Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter
	:param Poly2:
	:type Poly2: Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter
	:param NumSegOn1:
	:type NumSegOn1: int
	:param NumSegOn2:
	:type NumSegOn2: int
	:param ParamOnSeg1:
	:type ParamOnSeg1: float
	:param ParamOnSeg2:
	:type ParamOnSeg2: float
	:rtype: None
") Perform;
		void Perform(const Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter & Poly1, const Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter & Poly2, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param Uo:
	:type Uo: float
	:param Vo:
	:type Vo: float
	:param UInf:
	:type UInf: float
	:param VInf:
	:type VInf: float
	:param USup:
	:type USup: float
	:param VSup:
	:type VSup: float
	:rtype: None
") Perform;
		void Perform(const Standard_Real Uo, const Standard_Real Vo, const Standard_Real UInf, const Standard_Real VInf, const Standard_Real USup, const Standard_Real VSup);

		/****************** Roots ******************/
		%feature("compactdefaultargs") Roots;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: None
") Roots;
		void Roots(Standard_Real &OutValue, Standard_Real &OutValue);

};


%extend Geom2dInt_ExactIntersectionPointOfTheIntPCurvePCurveOfGInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Geom2dInt_GInter *
*************************/
class Geom2dInt_GInter : public IntRes2d_Intersection {
	public:
		/****************** ComputeDomain ******************/
		%feature("compactdefaultargs") ComputeDomain;
		%feature("autodoc", "Create a domain from a curve.

	:param C1:
	:type C1: Adaptor2d_Curve2d
	:param TolDomain:
	:type TolDomain: float
	:rtype: IntRes2d_Domain
") ComputeDomain;
		IntRes2d_Domain ComputeDomain(const Adaptor2d_Curve2d & C1, const Standard_Real TolDomain);

		/****************** Geom2dInt_GInter ******************/
		%feature("compactdefaultargs") Geom2dInt_GInter;
		%feature("autodoc", "Empty constructor.

	:rtype: None
") Geom2dInt_GInter;
		 Geom2dInt_GInter();

		/****************** Geom2dInt_GInter ******************/
		%feature("compactdefaultargs") Geom2dInt_GInter;
		%feature("autodoc", "Self intersection of a curve.

	:param C:
	:type C: Adaptor2d_Curve2d
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Geom2dInt_GInter;
		 Geom2dInt_GInter(const Adaptor2d_Curve2d & C, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Geom2dInt_GInter ******************/
		%feature("compactdefaultargs") Geom2dInt_GInter;
		%feature("autodoc", "Self intersection of a curve with a domain.

	:param C:
	:type C: Adaptor2d_Curve2d
	:param D:
	:type D: IntRes2d_Domain
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Geom2dInt_GInter;
		 Geom2dInt_GInter(const Adaptor2d_Curve2d & C, const IntRes2d_Domain & D, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Geom2dInt_GInter ******************/
		%feature("compactdefaultargs") Geom2dInt_GInter;
		%feature("autodoc", "Intersection between 2 curves.

	:param C1:
	:type C1: Adaptor2d_Curve2d
	:param C2:
	:type C2: Adaptor2d_Curve2d
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Geom2dInt_GInter;
		 Geom2dInt_GInter(const Adaptor2d_Curve2d & C1, const Adaptor2d_Curve2d & C2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Geom2dInt_GInter ******************/
		%feature("compactdefaultargs") Geom2dInt_GInter;
		%feature("autodoc", "Intersection between 2 curves.

	:param C1:
	:type C1: Adaptor2d_Curve2d
	:param D1:
	:type D1: IntRes2d_Domain
	:param C2:
	:type C2: Adaptor2d_Curve2d
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Geom2dInt_GInter;
		 Geom2dInt_GInter(const Adaptor2d_Curve2d & C1, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & C2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Geom2dInt_GInter ******************/
		%feature("compactdefaultargs") Geom2dInt_GInter;
		%feature("autodoc", "Intersection between 2 curves.

	:param C1:
	:type C1: Adaptor2d_Curve2d
	:param C2:
	:type C2: Adaptor2d_Curve2d
	:param D2:
	:type D2: IntRes2d_Domain
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Geom2dInt_GInter;
		 Geom2dInt_GInter(const Adaptor2d_Curve2d & C1, const Adaptor2d_Curve2d & C2, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Geom2dInt_GInter ******************/
		%feature("compactdefaultargs") Geom2dInt_GInter;
		%feature("autodoc", "Intersection between 2 curves.

	:param C1:
	:type C1: Adaptor2d_Curve2d
	:param D1:
	:type D1: IntRes2d_Domain
	:param C2:
	:type C2: Adaptor2d_Curve2d
	:param D2:
	:type D2: IntRes2d_Domain
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Geom2dInt_GInter;
		 Geom2dInt_GInter(const Adaptor2d_Curve2d & C1, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & C2, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** GetMinNbSamples ******************/
		%feature("compactdefaultargs") GetMinNbSamples;
		%feature("autodoc", "	:rtype: int
") GetMinNbSamples;
		Standard_Integer GetMinNbSamples();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between 2 curves.

	:param C1:
	:type C1: Adaptor2d_Curve2d
	:param D1:
	:type D1: IntRes2d_Domain
	:param C2:
	:type C2: Adaptor2d_Curve2d
	:param D2:
	:type D2: IntRes2d_Domain
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform(const Adaptor2d_Curve2d & C1, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & C2, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between 2 curves.

	:param C1:
	:type C1: Adaptor2d_Curve2d
	:param C2:
	:type C2: Adaptor2d_Curve2d
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform(const Adaptor2d_Curve2d & C1, const Adaptor2d_Curve2d & C2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between 2 curves.

	:param C1:
	:type C1: Adaptor2d_Curve2d
	:param D1:
	:type D1: IntRes2d_Domain
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform(const Adaptor2d_Curve2d & C1, const IntRes2d_Domain & D1, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between 2 curves.

	:param C1:
	:type C1: Adaptor2d_Curve2d
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform(const Adaptor2d_Curve2d & C1, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between 2 curves.

	:param C1:
	:type C1: Adaptor2d_Curve2d
	:param D1:
	:type D1: IntRes2d_Domain
	:param C2:
	:type C2: Adaptor2d_Curve2d
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform(const Adaptor2d_Curve2d & C1, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & C2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between 2 curves.

	:param C1:
	:type C1: Adaptor2d_Curve2d
	:param C2:
	:type C2: Adaptor2d_Curve2d
	:param D2:
	:type D2: IntRes2d_Domain
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform(const Adaptor2d_Curve2d & C1, const Adaptor2d_Curve2d & C2, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** SetMinNbSamples ******************/
		%feature("compactdefaultargs") SetMinNbSamples;
		%feature("autodoc", "Set / get minimum number of points in polygon intersection.

	:param theMinNbSamples:
	:type theMinNbSamples: int
	:rtype: None
") SetMinNbSamples;
		void SetMinNbSamples(const Standard_Integer theMinNbSamples);

};


%extend Geom2dInt_GInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class Geom2dInt_Geom2dCurveTool *
**********************************/
class Geom2dInt_Geom2dCurveTool {
	public:
		/****************** Circle ******************/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "Returns the circ2d from gp corresponding to the curve c. this method is called only when thetype returns geomabs_circle.

	:param C:
	:type C: Adaptor2d_Curve2d
	:rtype: gp_Circ2d
") Circle;
		static gp_Circ2d Circle(const Adaptor2d_Curve2d & C);

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") D0;
		static void D0(const Adaptor2d_Curve2d & C, const Standard_Real U, gp_Pnt2d & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param T:
	:type T: gp_Vec2d
	:rtype: None
") D1;
		static void D1(const Adaptor2d_Curve2d & C, const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & T);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param T:
	:type T: gp_Vec2d
	:param N:
	:type N: gp_Vec2d
	:rtype: None
") D2;
		static void D2(const Adaptor2d_Curve2d & C, const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & T, gp_Vec2d & N);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param T:
	:type T: gp_Vec2d
	:param N:
	:type N: gp_Vec2d
	:param V:
	:type V: gp_Vec2d
	:rtype: None
") D3;
		static void D3(const Adaptor2d_Curve2d & C, const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & T, gp_Vec2d & N, gp_Vec2d & V);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d
	:param U:
	:type U: float
	:param N:
	:type N: int
	:rtype: gp_Vec2d
") DN;
		static gp_Vec2d DN(const Adaptor2d_Curve2d & C, const Standard_Real U, const Standard_Integer N);

		/****************** Degree ******************/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d
	:rtype: int
") Degree;
		static Standard_Integer Degree(const Adaptor2d_Curve2d & C);

		/****************** Ellipse ******************/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "Returns the elips2d from gp corresponding to the curve c. this method is called only when thetype returns geomabs_ellipse.

	:param C:
	:type C: Adaptor2d_Curve2d
	:rtype: gp_Elips2d
") Ellipse;
		static gp_Elips2d Ellipse(const Adaptor2d_Curve2d & C);

		/****************** EpsX ******************/
		%feature("compactdefaultargs") EpsX;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d
	:rtype: float
") EpsX;
		static Standard_Real EpsX(const Adaptor2d_Curve2d & C);

		/****************** EpsX ******************/
		%feature("compactdefaultargs") EpsX;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d
	:param Eps_XYZ:
	:type Eps_XYZ: float
	:rtype: float
") EpsX;
		static Standard_Real EpsX(const Adaptor2d_Curve2d & C, const Standard_Real Eps_XYZ);

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d
	:rtype: float
") FirstParameter;
		static Standard_Real FirstParameter(const Adaptor2d_Curve2d & C);

		/****************** GetInterval ******************/
		%feature("compactdefaultargs") GetInterval;
		%feature("autodoc", "Output the bounds of interval of index <index> used if type == composite.

	:param C:
	:type C: Adaptor2d_Curve2d
	:param Index:
	:type Index: int
	:param Tab:
	:type Tab: TColStd_Array1OfReal
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:rtype: None
") GetInterval;
		static void GetInterval(const Adaptor2d_Curve2d & C, const Standard_Integer Index, const TColStd_Array1OfReal & Tab, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** GetType ******************/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d
	:rtype: GeomAbs_CurveType
") GetType;
		static GeomAbs_CurveType GetType(const Adaptor2d_Curve2d & C);

		/****************** Hyperbola ******************/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "Returns the hypr2d from gp corresponding to the curve c. this method is called only when thetype returns geomabs_hyperbola.

	:param C:
	:type C: Adaptor2d_Curve2d
	:rtype: gp_Hypr2d
") Hyperbola;
		static gp_Hypr2d Hyperbola(const Adaptor2d_Curve2d & C);

		/****************** Intervals ******************/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "Compute tab.

	:param C:
	:type C: Adaptor2d_Curve2d
	:param Tab:
	:type Tab: TColStd_Array1OfReal
	:rtype: None
") Intervals;
		static void Intervals(const Adaptor2d_Curve2d & C, TColStd_Array1OfReal & Tab);

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d
	:rtype: float
") LastParameter;
		static Standard_Real LastParameter(const Adaptor2d_Curve2d & C);

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Returns the lin2d from gp corresponding to the curve c. this method is called only when thetype returns geomabs_line.

	:param C:
	:type C: Adaptor2d_Curve2d
	:rtype: gp_Lin2d
") Line;
		static gp_Lin2d Line(const Adaptor2d_Curve2d & C);

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Output the number of interval of continuity c2 of the curve.

	:param C:
	:type C: Adaptor2d_Curve2d
	:rtype: int
") NbIntervals;
		static Standard_Integer NbIntervals(const Adaptor2d_Curve2d & C);

		/****************** NbSamples ******************/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d
	:rtype: int
") NbSamples;
		static Standard_Integer NbSamples(const Adaptor2d_Curve2d & C);

		/****************** NbSamples ******************/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d
	:param U0:
	:type U0: float
	:param U1:
	:type U1: float
	:rtype: int
") NbSamples;
		static Standard_Integer NbSamples(const Adaptor2d_Curve2d & C, const Standard_Real U0, const Standard_Real U1);

		/****************** Parabola ******************/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "Returns the parab2d from gp corresponding to the curve c. this method is called only when thetype returns geomabs_parabola.

	:param C:
	:type C: Adaptor2d_Curve2d
	:rtype: gp_Parab2d
") Parabola;
		static gp_Parab2d Parabola(const Adaptor2d_Curve2d & C);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Curve2d
	:param X:
	:type X: float
	:rtype: gp_Pnt2d
") Value;
		static gp_Pnt2d Value(const Adaptor2d_Curve2d & C, const Standard_Real X);

};


%extend Geom2dInt_Geom2dCurveTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class Geom2dInt_IntConicCurveOfGInter *
****************************************/
class Geom2dInt_IntConicCurveOfGInter : public IntRes2d_Intersection {
	public:
		/****************** Geom2dInt_IntConicCurveOfGInter ******************/
		%feature("compactdefaultargs") Geom2dInt_IntConicCurveOfGInter;
		%feature("autodoc", "Empty constructor.

	:rtype: None
") Geom2dInt_IntConicCurveOfGInter;
		 Geom2dInt_IntConicCurveOfGInter();

		/****************** Geom2dInt_IntConicCurveOfGInter ******************/
		%feature("compactdefaultargs") Geom2dInt_IntConicCurveOfGInter;
		%feature("autodoc", "Intersection between a line and a parametric curve.

	:param L:
	:type L: gp_Lin2d
	:param D1:
	:type D1: IntRes2d_Domain
	:param PCurve:
	:type PCurve: Adaptor2d_Curve2d
	:param D2:
	:type D2: IntRes2d_Domain
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Geom2dInt_IntConicCurveOfGInter;
		 Geom2dInt_IntConicCurveOfGInter(const gp_Lin2d & L, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Geom2dInt_IntConicCurveOfGInter ******************/
		%feature("compactdefaultargs") Geom2dInt_IntConicCurveOfGInter;
		%feature("autodoc", "Intersection between a line and a parametric curve.

	:param C:
	:type C: gp_Circ2d
	:param D1:
	:type D1: IntRes2d_Domain
	:param PCurve:
	:type PCurve: Adaptor2d_Curve2d
	:param D2:
	:type D2: IntRes2d_Domain
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Geom2dInt_IntConicCurveOfGInter;
		 Geom2dInt_IntConicCurveOfGInter(const gp_Circ2d & C, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Geom2dInt_IntConicCurveOfGInter ******************/
		%feature("compactdefaultargs") Geom2dInt_IntConicCurveOfGInter;
		%feature("autodoc", "Intersection between an ellipse and a parametric curve.

	:param E:
	:type E: gp_Elips2d
	:param D1:
	:type D1: IntRes2d_Domain
	:param PCurve:
	:type PCurve: Adaptor2d_Curve2d
	:param D2:
	:type D2: IntRes2d_Domain
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Geom2dInt_IntConicCurveOfGInter;
		 Geom2dInt_IntConicCurveOfGInter(const gp_Elips2d & E, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Geom2dInt_IntConicCurveOfGInter ******************/
		%feature("compactdefaultargs") Geom2dInt_IntConicCurveOfGInter;
		%feature("autodoc", "Intersection between a parabola and a parametric curve.

	:param Prb:
	:type Prb: gp_Parab2d
	:param D1:
	:type D1: IntRes2d_Domain
	:param PCurve:
	:type PCurve: Adaptor2d_Curve2d
	:param D2:
	:type D2: IntRes2d_Domain
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Geom2dInt_IntConicCurveOfGInter;
		 Geom2dInt_IntConicCurveOfGInter(const gp_Parab2d & Prb, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Geom2dInt_IntConicCurveOfGInter ******************/
		%feature("compactdefaultargs") Geom2dInt_IntConicCurveOfGInter;
		%feature("autodoc", "Intersection between the main branch of an hyperbola and a parametric curve.

	:param H:
	:type H: gp_Hypr2d
	:param D1:
	:type D1: IntRes2d_Domain
	:param PCurve:
	:type PCurve: Adaptor2d_Curve2d
	:param D2:
	:type D2: IntRes2d_Domain
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Geom2dInt_IntConicCurveOfGInter;
		 Geom2dInt_IntConicCurveOfGInter(const gp_Hypr2d & H, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between a line and a parametric curve.

	:param L:
	:type L: gp_Lin2d
	:param D1:
	:type D1: IntRes2d_Domain
	:param PCurve:
	:type PCurve: Adaptor2d_Curve2d
	:param D2:
	:type D2: IntRes2d_Domain
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform(const gp_Lin2d & L, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between a line and a parametric curve.

	:param C:
	:type C: gp_Circ2d
	:param D1:
	:type D1: IntRes2d_Domain
	:param PCurve:
	:type PCurve: Adaptor2d_Curve2d
	:param D2:
	:type D2: IntRes2d_Domain
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform(const gp_Circ2d & C, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between an ellipse and a parametric curve.

	:param E:
	:type E: gp_Elips2d
	:param D1:
	:type D1: IntRes2d_Domain
	:param PCurve:
	:type PCurve: Adaptor2d_Curve2d
	:param D2:
	:type D2: IntRes2d_Domain
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform(const gp_Elips2d & E, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between a parabola and a parametric curve.

	:param Prb:
	:type Prb: gp_Parab2d
	:param D1:
	:type D1: IntRes2d_Domain
	:param PCurve:
	:type PCurve: Adaptor2d_Curve2d
	:param D2:
	:type D2: IntRes2d_Domain
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform(const gp_Parab2d & Prb, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between the main branch of an hyperbola and a parametric curve.

	:param H:
	:type H: gp_Hypr2d
	:param D1:
	:type D1: IntRes2d_Domain
	:param PCurve:
	:type PCurve: Adaptor2d_Curve2d
	:param D2:
	:type D2: IntRes2d_Domain
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform(const gp_Hypr2d & H, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

};


%extend Geom2dInt_IntConicCurveOfGInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************************************
* class Geom2dInt_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfGInter *
*************************************************************************/
class Geom2dInt_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfGInter : public math_FunctionWithDerivative {
	public:
		/****************** Derivative ******************/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Computes the derivative of the previous function at parameter param.

	:param Param:
	:type Param: float
	:param D:
	:type D: float
	:rtype: bool
") Derivative;
		Standard_Boolean Derivative(const Standard_Real Param, Standard_Real &OutValue);

		/****************** Geom2dInt_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfGInter ******************/
		%feature("compactdefaultargs") Geom2dInt_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfGInter;
		%feature("autodoc", "Constructor of the class.

	:param IT:
	:type IT: IntCurve_IConicTool
	:param PC:
	:type PC: Adaptor2d_Curve2d
	:rtype: None
") Geom2dInt_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfGInter;
		 Geom2dInt_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfGInter(const IntCurve_IConicTool & IT, const Adaptor2d_Curve2d & PC);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the value of the signed distance between the implicit curve and the point at parameter param on the parametrised curve.

	:param Param:
	:type Param: float
	:param F:
	:type F: float
	:rtype: bool
") Value;
		Standard_Boolean Value(const Standard_Real Param, Standard_Real &OutValue);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Computes the value and the derivative of the function.

	:param Param:
	:type Param: float
	:param F:
	:type F: float
	:param D:
	:type D: float
	:rtype: bool
") Values;
		Standard_Boolean Values(const Standard_Real Param, Standard_Real &OutValue, Standard_Real &OutValue);

};


%extend Geom2dInt_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfGInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************************
* class Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter *
**************************************************************/
class Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter : public math_FunctionWithDerivative {
	public:
		/****************** Derivative ******************/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Calculation of f'(u).

	:param U:
	:type U: float
	:param DF:
	:type DF: float
	:rtype: bool
") Derivative;
		Standard_Boolean Derivative(const Standard_Real U, Standard_Real &OutValue);

		/****************** Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter ******************/
		%feature("compactdefaultargs") Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter;
		%feature("autodoc", "	:rtype: None
") Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter;
		 Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter();

		/****************** Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter ******************/
		%feature("compactdefaultargs") Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: Adaptor2d_Curve2d
	:rtype: None
") Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter;
		 Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter(const gp_Pnt2d & P, const Adaptor2d_Curve2d & C);

		/****************** GetStateNumber ******************/
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "Save the found extremum.

	:rtype: int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber();

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets the field mycurve of the function.

	:param C:
	:type C: Adaptor2d_Curve2d
	:rtype: None
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & C);

		/****************** IsMin ******************/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "Shows if the nth distance is a minimum.

	:param N:
	:type N: int
	:rtype: bool
") IsMin;
		Standard_Boolean IsMin(const Standard_Integer N);

		/****************** NbExt ******************/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return the nunber of found extrema.

	:rtype: int
") NbExt;
		Standard_Integer NbExt();

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the nth extremum.

	:param N:
	:type N: int
	:rtype: Extrema_POnCurv2d
") Point;
		const Extrema_POnCurv2d & Point(const Standard_Integer N);

		/****************** SearchOfTolerance ******************/
		%feature("compactdefaultargs") SearchOfTolerance;
		%feature("autodoc", "Computes a tol value. if 1st derivative of curve |d1|<tol, it is considered d1=0.

	:rtype: float
") SearchOfTolerance;
		Standard_Real SearchOfTolerance();

		/****************** SetPoint ******************/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "Sets the field p of the function.

	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") SetPoint;
		void SetPoint(const gp_Pnt2d & P);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the nth distance.

	:param N:
	:type N: int
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

		/****************** SubIntervalInitialize ******************/
		%feature("compactdefaultargs") SubIntervalInitialize;
		%feature("autodoc", "Determines boundaries of subinterval for find of root.

	:param theUfirst:
	:type theUfirst: float
	:param theUlast:
	:type theUlast: float
	:rtype: None
") SubIntervalInitialize;
		void SubIntervalInitialize(const Standard_Real theUfirst, const Standard_Real theUlast);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Calculation of f(u).

	:param U:
	:type U: float
	:param F:
	:type F: float
	:rtype: bool
") Value;
		Standard_Boolean Value(const Standard_Real U, Standard_Real &OutValue);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Calculation of f(u) and f'(u).

	:param U:
	:type U: float
	:param F:
	:type F: float
	:param DF:
	:type DF: float
	:rtype: bool
") Values;
		Standard_Boolean Values(const Standard_Real U, Standard_Real &OutValue, Standard_Real &OutValue);

};


%extend Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************************
* class Geom2dInt_TheCurveLocatorOfTheProjPCurOfGInter *
*******************************************************/
class Geom2dInt_TheCurveLocatorOfTheProjPCurOfGInter {
	public:
};


%extend Geom2dInt_TheCurveLocatorOfTheProjPCurOfGInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************************************
* class Geom2dInt_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfGInter *
********************************************************************/
class Geom2dInt_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfGInter : public math_FunctionSetWithDerivatives {
	public:
		/****************** Derivatives ******************/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "Returns the values <d> of the derivatives for the variable <x>. returns true if the computation was done successfully, false otherwise.

	:param X:
	:type X: math_Vector
	:param D:
	:type D: math_Matrix
	:rtype: bool
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****************** Geom2dInt_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfGInter ******************/
		%feature("compactdefaultargs") Geom2dInt_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfGInter;
		%feature("autodoc", "	:param curve1:
	:type curve1: Adaptor2d_Curve2d
	:param curve2:
	:type curve2: Adaptor2d_Curve2d
	:rtype: None
") Geom2dInt_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfGInter;
		 Geom2dInt_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfGInter(const Adaptor2d_Curve2d & curve1, const Adaptor2d_Curve2d & curve2);

		/****************** NbEquations ******************/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns 2.

	:rtype: int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** NbVariables ******************/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Returns 2.

	:rtype: int
") NbVariables;
		Standard_Integer NbVariables();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the values <f> of the functions for the variable <x>. returns true if the computation was done successfully, false otherwise.

	:param X:
	:type X: math_Vector
	:param F:
	:type F: math_Vector
	:rtype: bool
") Value;
		Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Returns the values <f> of the functions and the derivatives <d> for the variable <x>. returns true if the computation was done successfully, false otherwise.

	:param X:
	:type X: math_Vector
	:param F:
	:type F: math_Vector
	:param D:
	:type D: math_Matrix
	:rtype: bool
") Values;
		Standard_Boolean Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

};


%extend Geom2dInt_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfGInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class Geom2dInt_TheIntConicCurveOfGInter *
*******************************************/
class Geom2dInt_TheIntConicCurveOfGInter : public IntRes2d_Intersection {
	public:
		/****************** Geom2dInt_TheIntConicCurveOfGInter ******************/
		%feature("compactdefaultargs") Geom2dInt_TheIntConicCurveOfGInter;
		%feature("autodoc", "Empty constructor.

	:rtype: None
") Geom2dInt_TheIntConicCurveOfGInter;
		 Geom2dInt_TheIntConicCurveOfGInter();

		/****************** Geom2dInt_TheIntConicCurveOfGInter ******************/
		%feature("compactdefaultargs") Geom2dInt_TheIntConicCurveOfGInter;
		%feature("autodoc", "Intersection between a line and a parametric curve.

	:param L:
	:type L: gp_Lin2d
	:param D1:
	:type D1: IntRes2d_Domain
	:param PCurve:
	:type PCurve: Adaptor2d_Curve2d
	:param D2:
	:type D2: IntRes2d_Domain
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Geom2dInt_TheIntConicCurveOfGInter;
		 Geom2dInt_TheIntConicCurveOfGInter(const gp_Lin2d & L, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Geom2dInt_TheIntConicCurveOfGInter ******************/
		%feature("compactdefaultargs") Geom2dInt_TheIntConicCurveOfGInter;
		%feature("autodoc", "Intersection between a line and a parametric curve.

	:param C:
	:type C: gp_Circ2d
	:param D1:
	:type D1: IntRes2d_Domain
	:param PCurve:
	:type PCurve: Adaptor2d_Curve2d
	:param D2:
	:type D2: IntRes2d_Domain
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Geom2dInt_TheIntConicCurveOfGInter;
		 Geom2dInt_TheIntConicCurveOfGInter(const gp_Circ2d & C, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Geom2dInt_TheIntConicCurveOfGInter ******************/
		%feature("compactdefaultargs") Geom2dInt_TheIntConicCurveOfGInter;
		%feature("autodoc", "Intersection between an ellipse and a parametric curve.

	:param E:
	:type E: gp_Elips2d
	:param D1:
	:type D1: IntRes2d_Domain
	:param PCurve:
	:type PCurve: Adaptor2d_Curve2d
	:param D2:
	:type D2: IntRes2d_Domain
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Geom2dInt_TheIntConicCurveOfGInter;
		 Geom2dInt_TheIntConicCurveOfGInter(const gp_Elips2d & E, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Geom2dInt_TheIntConicCurveOfGInter ******************/
		%feature("compactdefaultargs") Geom2dInt_TheIntConicCurveOfGInter;
		%feature("autodoc", "Intersection between a parabola and a parametric curve.

	:param Prb:
	:type Prb: gp_Parab2d
	:param D1:
	:type D1: IntRes2d_Domain
	:param PCurve:
	:type PCurve: Adaptor2d_Curve2d
	:param D2:
	:type D2: IntRes2d_Domain
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Geom2dInt_TheIntConicCurveOfGInter;
		 Geom2dInt_TheIntConicCurveOfGInter(const gp_Parab2d & Prb, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Geom2dInt_TheIntConicCurveOfGInter ******************/
		%feature("compactdefaultargs") Geom2dInt_TheIntConicCurveOfGInter;
		%feature("autodoc", "Intersection between the main branch of an hyperbola and a parametric curve.

	:param H:
	:type H: gp_Hypr2d
	:param D1:
	:type D1: IntRes2d_Domain
	:param PCurve:
	:type PCurve: Adaptor2d_Curve2d
	:param D2:
	:type D2: IntRes2d_Domain
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Geom2dInt_TheIntConicCurveOfGInter;
		 Geom2dInt_TheIntConicCurveOfGInter(const gp_Hypr2d & H, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between a line and a parametric curve.

	:param L:
	:type L: gp_Lin2d
	:param D1:
	:type D1: IntRes2d_Domain
	:param PCurve:
	:type PCurve: Adaptor2d_Curve2d
	:param D2:
	:type D2: IntRes2d_Domain
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform(const gp_Lin2d & L, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between a line and a parametric curve.

	:param C:
	:type C: gp_Circ2d
	:param D1:
	:type D1: IntRes2d_Domain
	:param PCurve:
	:type PCurve: Adaptor2d_Curve2d
	:param D2:
	:type D2: IntRes2d_Domain
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform(const gp_Circ2d & C, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between an ellipse and a parametric curve.

	:param E:
	:type E: gp_Elips2d
	:param D1:
	:type D1: IntRes2d_Domain
	:param PCurve:
	:type PCurve: Adaptor2d_Curve2d
	:param D2:
	:type D2: IntRes2d_Domain
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform(const gp_Elips2d & E, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between a parabola and a parametric curve.

	:param Prb:
	:type Prb: gp_Parab2d
	:param D1:
	:type D1: IntRes2d_Domain
	:param PCurve:
	:type PCurve: Adaptor2d_Curve2d
	:param D2:
	:type D2: IntRes2d_Domain
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform(const gp_Parab2d & Prb, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between the main branch of an hyperbola and a parametric curve.

	:param H:
	:type H: gp_Hypr2d
	:param D1:
	:type D1: IntRes2d_Domain
	:param PCurve:
	:type PCurve: Adaptor2d_Curve2d
	:param D2:
	:type D2: IntRes2d_Domain
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform(const gp_Hypr2d & H, const IntRes2d_Domain & D1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

};


%extend Geom2dInt_TheIntConicCurveOfGInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class Geom2dInt_TheIntPCurvePCurveOfGInter *
*********************************************/
class Geom2dInt_TheIntPCurvePCurveOfGInter : public IntRes2d_Intersection {
	public:
		/****************** Geom2dInt_TheIntPCurvePCurveOfGInter ******************/
		%feature("compactdefaultargs") Geom2dInt_TheIntPCurvePCurveOfGInter;
		%feature("autodoc", "	:rtype: None
") Geom2dInt_TheIntPCurvePCurveOfGInter;
		 Geom2dInt_TheIntPCurvePCurveOfGInter();

		/****************** GetMinNbSamples ******************/
		%feature("compactdefaultargs") GetMinNbSamples;
		%feature("autodoc", "	:rtype: int
") GetMinNbSamples;
		Standard_Integer GetMinNbSamples();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param Curve1:
	:type Curve1: Adaptor2d_Curve2d
	:param Domain1:
	:type Domain1: IntRes2d_Domain
	:param Curve2:
	:type Curve2: Adaptor2d_Curve2d
	:param Domain2:
	:type Domain2: IntRes2d_Domain
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform(const Adaptor2d_Curve2d & Curve1, const IntRes2d_Domain & Domain1, const Adaptor2d_Curve2d & Curve2, const IntRes2d_Domain & Domain2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param Curve1:
	:type Curve1: Adaptor2d_Curve2d
	:param Domain1:
	:type Domain1: IntRes2d_Domain
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform(const Adaptor2d_Curve2d & Curve1, const IntRes2d_Domain & Domain1, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** SetMinNbSamples ******************/
		%feature("compactdefaultargs") SetMinNbSamples;
		%feature("autodoc", "Set / get minimum number of points in polygon for intersection.

	:param theMinNbSamples:
	:type theMinNbSamples: int
	:rtype: None
") SetMinNbSamples;
		void SetMinNbSamples(const Standard_Integer theMinNbSamples);

};


%extend Geom2dInt_TheIntPCurvePCurveOfGInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************************
* class Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter *
***********************************************************/
class Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter : public IntRes2d_Intersection {
	public:
		/****************** And_Domaine_Objet1_Intersections ******************/
		%feature("compactdefaultargs") And_Domaine_Objet1_Intersections;
		%feature("autodoc", "	:param TheImpTool:
	:type TheImpTool: IntCurve_IConicTool
	:param TheParCurve:
	:type TheParCurve: Adaptor2d_Curve2d
	:param TheImpCurveDomain:
	:type TheImpCurveDomain: IntRes2d_Domain
	:param TheParCurveDomain:
	:type TheParCurveDomain: IntRes2d_Domain
	:param NbResultats:
	:type NbResultats: int
	:param Inter2_And_Domain2:
	:type Inter2_And_Domain2: TColStd_Array1OfReal
	:param Inter1:
	:type Inter1: TColStd_Array1OfReal
	:param Resultat1:
	:type Resultat1: TColStd_Array1OfReal
	:param Resultat2:
	:type Resultat2: TColStd_Array1OfReal
	:param EpsNul:
	:type EpsNul: float
	:rtype: None
") And_Domaine_Objet1_Intersections;
		void And_Domaine_Objet1_Intersections(const IntCurve_IConicTool & TheImpTool, const Adaptor2d_Curve2d & TheParCurve, const IntRes2d_Domain & TheImpCurveDomain, const IntRes2d_Domain & TheParCurveDomain, Standard_Integer &OutValue, TColStd_Array1OfReal & Inter2_And_Domain2, TColStd_Array1OfReal & Inter1, TColStd_Array1OfReal & Resultat1, TColStd_Array1OfReal & Resultat2, const Standard_Real EpsNul);

		/****************** FindU ******************/
		%feature("compactdefaultargs") FindU;
		%feature("autodoc", "	:param parameter:
	:type parameter: float
	:param point:
	:type point: gp_Pnt2d
	:param TheParCurev:
	:type TheParCurev: Adaptor2d_Curve2d
	:param TheImpTool:
	:type TheImpTool: IntCurve_IConicTool
	:rtype: float
") FindU;
		Standard_Real FindU(const Standard_Real parameter, gp_Pnt2d & point, const Adaptor2d_Curve2d & TheParCurev, const IntCurve_IConicTool & TheImpTool);

		/****************** FindV ******************/
		%feature("compactdefaultargs") FindV;
		%feature("autodoc", "	:param parameter:
	:type parameter: float
	:param point:
	:type point: gp_Pnt2d
	:param TheImpTool:
	:type TheImpTool: IntCurve_IConicTool
	:param ParCurve:
	:type ParCurve: Adaptor2d_Curve2d
	:param TheParCurveDomain:
	:type TheParCurveDomain: IntRes2d_Domain
	:param V0:
	:type V0: float
	:param V1:
	:type V1: float
	:param Tolerance:
	:type Tolerance: float
	:rtype: float
") FindV;
		Standard_Real FindV(const Standard_Real parameter, gp_Pnt2d & point, const IntCurve_IConicTool & TheImpTool, const Adaptor2d_Curve2d & ParCurve, const IntRes2d_Domain & TheParCurveDomain, const Standard_Real V0, const Standard_Real V1, const Standard_Real Tolerance);

		/****************** Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter ******************/
		%feature("compactdefaultargs") Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter;
		%feature("autodoc", "Empty constructor.

	:rtype: None
") Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter;
		 Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter();

		/****************** Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter ******************/
		%feature("compactdefaultargs") Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter;
		%feature("autodoc", "Intersection between an implicit curve and a parametrised curve. the exception constructionerror is raised if the domain of the parametrised curve does not verify hasfirstpoint and haslastpoint return true.

	:param ITool:
	:type ITool: IntCurve_IConicTool
	:param Dom1:
	:type Dom1: IntRes2d_Domain
	:param PCurve:
	:type PCurve: Adaptor2d_Curve2d
	:param Dom2:
	:type Dom2: IntRes2d_Domain
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter;
		 Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter(const IntCurve_IConicTool & ITool, const IntRes2d_Domain & Dom1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & Dom2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between an implicit curve and a parametrised curve. the exception constructionerror is raised if the domain of the parametrised curve does not verify hasfirstpoint and haslastpoint return true.

	:param ITool:
	:type ITool: IntCurve_IConicTool
	:param Dom1:
	:type Dom1: IntRes2d_Domain
	:param PCurve:
	:type PCurve: Adaptor2d_Curve2d
	:param Dom2:
	:type Dom2: IntRes2d_Domain
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform(const IntCurve_IConicTool & ITool, const IntRes2d_Domain & Dom1, const Adaptor2d_Curve2d & PCurve, const IntRes2d_Domain & Dom2, const Standard_Real TolConf, const Standard_Real Tol);

};


%extend Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************************
* class Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter *
******************************************************/
class Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter {
	public:
		/****************** Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter ******************/
		%feature("compactdefaultargs") Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter;
		%feature("autodoc", "	:rtype: None
") Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter;
		 Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter();

		/****************** Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter ******************/
		%feature("compactdefaultargs") Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter;
		%feature("autodoc", "Calculates the distance with a close point. the close point is defined by the parameter value u0. the function f(u)=distance(p,c(u)) has an extremum when g(u)=df/du=0. the algorithm searchs a zero near the close point. tolu is used to decide to stop the iterations. at the nth iteration, the criteria is: abs(un - un-1) < tolu.

	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: Adaptor2d_Curve2d
	:param U0:
	:type U0: float
	:param TolU:
	:type TolU: float
	:rtype: None
") Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter;
		 Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter(const gp_Pnt2d & P, const Adaptor2d_Curve2d & C, const Standard_Real U0, const Standard_Real TolU);

		/****************** Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter ******************/
		%feature("compactdefaultargs") Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter;
		%feature("autodoc", "Calculates the distance with a close point. the close point is defined by the parameter value u0. the function f(u)=distance(p,c(u)) has an extremum when g(u)=df/du=0. the algorithm searchs a zero near the close point. zeros are searched between umin et usup. tolu is used to decide to stop the iterations. at the nth iteration, the criteria is: abs(un - un-1) < tolu.

	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: Adaptor2d_Curve2d
	:param U0:
	:type U0: float
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param TolU:
	:type TolU: float
	:rtype: None
") Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter;
		 Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter(const gp_Pnt2d & P, const Adaptor2d_Curve2d & C, const Standard_Real U0, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolU);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets the fields of the algorithm.

	:param C:
	:type C: Adaptor2d_Curve2d
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param TolU:
	:type TolU: float
	:rtype: None
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & C, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolU);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the distance is found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsMin ******************/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "Returns true if the extremum distance is a minimum.

	:rtype: bool
") IsMin;
		Standard_Boolean IsMin();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "The algorithm is done with the point p. an exception is raised if the fields have not been initialized.

	:param P:
	:type P: gp_Pnt2d
	:param U0:
	:type U0: float
	:rtype: None
") Perform;
		void Perform(const gp_Pnt2d & P, const Standard_Real U0);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the point of the extremum distance.

	:rtype: Extrema_POnCurv2d
") Point;
		const Extrema_POnCurv2d & Point();

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the extremum square distance.

	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance();

};


%extend Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************************
* class Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter *
***********************************************************/
class Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter : public Intf_Polygon2d {
	public:
		/****************** ApproxParamOnCurve ******************/
		%feature("compactdefaultargs") ApproxParamOnCurve;
		%feature("autodoc", "Give an approximation of the parameter on the curve according to the discretization of the curve.

	:param Index:
	:type Index: int
	:param ParamOnLine:
	:type ParamOnLine: float
	:rtype: float
") ApproxParamOnCurve;
		Standard_Real ApproxParamOnCurve(const Standard_Integer Index, const Standard_Real ParamOnLine);

		/****************** AutoIntersectionIsPossible ******************/
		%feature("compactdefaultargs") AutoIntersectionIsPossible;
		%feature("autodoc", "	:rtype: bool
") AutoIntersectionIsPossible;
		Standard_Boolean AutoIntersectionIsPossible();

		/****************** CalculRegion ******************/
		%feature("compactdefaultargs") CalculRegion;
		%feature("autodoc", "	:param x:
	:type x: float
	:param y:
	:type y: float
	:param x1:
	:type x1: float
	:param x2:
	:type x2: float
	:param y1:
	:type y1: float
	:param y2:
	:type y2: float
	:rtype: int
") CalculRegion;
		Standard_Integer CalculRegion(const Standard_Real x, const Standard_Real y, const Standard_Real x1, const Standard_Real x2, const Standard_Real y1, const Standard_Real y2);

		/****************** Closed ******************/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "	:param clos:
	:type clos: bool
	:rtype: None
") Closed;
		void Closed(const Standard_Boolean clos);

		/****************** Closed ******************/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "Returns true if the polyline is closed.

	:rtype: bool
") Closed;
		virtual Standard_Boolean Closed();

		/****************** ComputeWithBox ******************/
		%feature("compactdefaultargs") ComputeWithBox;
		%feature("autodoc", "The current polygon is modified if most of the points of the polygon are are outside the box <otherbox>. in this situation, bounds are computed to build a polygon inside or near the otherbox.

	:param Curve:
	:type Curve: Adaptor2d_Curve2d
	:param OtherBox:
	:type OtherBox: Bnd_Box2d
	:rtype: None
") ComputeWithBox;
		void ComputeWithBox(const Adaptor2d_Curve2d & Curve, const Bnd_Box2d & OtherBox);

		/****************** DeflectionOverEstimation ******************/
		%feature("compactdefaultargs") DeflectionOverEstimation;
		%feature("autodoc", "	:rtype: float
") DeflectionOverEstimation;
		virtual Standard_Real DeflectionOverEstimation();

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	:rtype: None
") Dump;
		void Dump();

		/****************** Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter ******************/
		%feature("compactdefaultargs") Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter;
		%feature("autodoc", "Compute a polygon on the domain of the curve.

	:param Curve:
	:type Curve: Adaptor2d_Curve2d
	:param NbPnt:
	:type NbPnt: int
	:param Domain:
	:type Domain: IntRes2d_Domain
	:param Tol:
	:type Tol: float
	:rtype: None
") Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter;
		 Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter(const Adaptor2d_Curve2d & Curve, const Standard_Integer NbPnt, const IntRes2d_Domain & Domain, const Standard_Real Tol);

		/****************** InfParameter ******************/
		%feature("compactdefaultargs") InfParameter;
		%feature("autodoc", "Returns the parameter (on the curve) of the first point of the polygon.

	:rtype: float
") InfParameter;
		Standard_Real InfParameter();

		/****************** NbSegments ******************/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "Give the number of segments in the polyline.

	:rtype: int
") NbSegments;
		virtual Standard_Integer NbSegments();

		/****************** Segment ******************/
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "Returns the points of the segment <index> in the polygon.

	:param theIndex:
	:type theIndex: int
	:param theBegin:
	:type theBegin: gp_Pnt2d
	:param theEnd:
	:type theEnd: gp_Pnt2d
	:rtype: None
") Segment;
		virtual void Segment(const Standard_Integer theIndex, gp_Pnt2d & theBegin, gp_Pnt2d & theEnd);

		/****************** SetDeflectionOverEstimation ******************/
		%feature("compactdefaultargs") SetDeflectionOverEstimation;
		%feature("autodoc", "	:param x:
	:type x: float
	:rtype: None
") SetDeflectionOverEstimation;
		void SetDeflectionOverEstimation(const Standard_Real x);

		/****************** SupParameter ******************/
		%feature("compactdefaultargs") SupParameter;
		%feature("autodoc", "Returns the parameter (on the curve) of the last point of the polygon.

	:rtype: float
") SupParameter;
		Standard_Real SupParameter();

};


%extend Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class Geom2dInt_TheProjPCurOfGInter *
**************************************/
class Geom2dInt_TheProjPCurOfGInter {
	public:
		/****************** FindParameter ******************/
		%feature("compactdefaultargs") FindParameter;
		%feature("autodoc", "Returns the parameter v of the point on the parametric curve corresponding to the point pnt. the correspondance between pnt and the point p(v) on the parametric curve must be coherent with the way of determination of the signed distance between a point and the implicit curve. tol is the tolerance on the distance between a point and the parametrised curve. in that case, no bounds are given. the research of the rigth parameter has to be made on the natural parametric domain of the curve.

	:param C:
	:type C: Adaptor2d_Curve2d
	:param Pnt:
	:type Pnt: gp_Pnt2d
	:param Tol:
	:type Tol: float
	:rtype: float
") FindParameter;
		static Standard_Real FindParameter(const Adaptor2d_Curve2d & C, const gp_Pnt2d & Pnt, const Standard_Real Tol);

		/****************** FindParameter ******************/
		%feature("compactdefaultargs") FindParameter;
		%feature("autodoc", "Returns the parameter v of the point on the parametric curve corresponding to the point pnt. the correspondance between pnt and the point p(v) on the parametric curve must be coherent with the way of determination of the signed distance between a point and the implicit curve. tol is the tolerance on the distance between a point and the parametrised curve. lowparameter and highparameter give the boundaries of the interval in wich the parameter certainly lies. these parameters are given to implement a more efficient algoritm. so, it is not necessary to check that the returned value verifies lowparameter <= value <= highparameter.

	:param C:
	:type C: Adaptor2d_Curve2d
	:param Pnt:
	:type Pnt: gp_Pnt2d
	:param LowParameter:
	:type LowParameter: float
	:param HighParameter:
	:type HighParameter: float
	:param Tol:
	:type Tol: float
	:rtype: float
") FindParameter;
		static Standard_Real FindParameter(const Adaptor2d_Curve2d & C, const gp_Pnt2d & Pnt, const Standard_Real LowParameter, const Standard_Real HighParameter, const Standard_Real Tol);

};


%extend Geom2dInt_TheProjPCurOfGInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */

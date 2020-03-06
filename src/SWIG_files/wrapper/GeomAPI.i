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
%define GEOMAPIDOCSTRING
"GeomAPI module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_geomapi.html"
%enddef
%module (package="OCC.Core", docstring=GEOMAPIDOCSTRING) GeomAPI


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
#include<GeomAPI_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Geom_module.hxx>
#include<gp_module.hxx>
#include<Geom2d_module.hxx>
#include<Extrema_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<GeomAbs_module.hxx>
#include<Approx_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Adaptor2d_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<AppParCurves_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Geom.i
%import gp.i
%import Geom2d.i
%import Extrema.i
%import TColgp.i
%import TColStd.i
%import GeomAbs.i
%import Approx.i
/* public enums */
/* end public enums declaration */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/****************
* class GeomAPI *
****************/
%rename(geomapi) GeomAPI;
class GeomAPI {
	public:
		/****************** To2d ******************/
		%feature("compactdefaultargs") To2d;
		%feature("autodoc", "This function builds (in the parametric space of the plane p) a 2d curve equivalent to the 3d curve c. the 3d curve c is considered to be located in the plane p. warning the 3d curve c must be of one of the following types: - a line - a circle - an ellipse - a hyperbola - a parabola - a bezier curve - a bspline curve exceptions standard_nosuchobject if c is not a defined type curve.

	:param C:
	:type C: Geom_Curve
	:param P:
	:type P: gp_Pln
	:rtype: opencascade::handle<Geom2d_Curve>
") To2d;
		static opencascade::handle<Geom2d_Curve> To2d(const opencascade::handle<Geom_Curve> & C, const gp_Pln & P);

		/****************** To3d ******************/
		%feature("compactdefaultargs") To3d;
		%feature("autodoc", "Builds a 3d curve equivalent to the 2d curve c described in the parametric space defined by the local coordinate system of plane p. the resulting 3d curve is of the same nature as that of the curve c.

	:param C:
	:type C: Geom2d_Curve
	:param P:
	:type P: gp_Pln
	:rtype: opencascade::handle<Geom_Curve>
") To3d;
		static opencascade::handle<Geom_Curve> To3d(const opencascade::handle<Geom2d_Curve> & C, const gp_Pln & P);

};


%extend GeomAPI {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class GeomAPI_ExtremaCurveCurve *
**********************************/
class GeomAPI_ExtremaCurveCurve {
	public:
		/****************** Distance ******************/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "Computes the distance between the end points of the extremum of index index computed by this algorithm. exceptions standard_outofrange if index is not in the range [ 1,nbextrema ], where nbextrema is the number of extrema computed by this algorithm.

	:param Index:
	:type Index: int
	:rtype: float
") Distance;
		Standard_Real Distance(const Standard_Integer Index);

		/****************** Extrema ******************/
		%feature("compactdefaultargs") Extrema;
		%feature("autodoc", "Return the algorithmic object from extrema.

	:rtype: Extrema_ExtCC
") Extrema;
		const Extrema_ExtCC & Extrema();

		/****************** GeomAPI_ExtremaCurveCurve ******************/
		%feature("compactdefaultargs") GeomAPI_ExtremaCurveCurve;
		%feature("autodoc", "Constructs an empty algorithm for computing extrema between two curves. use an init function to define the curves on which it is going to work.

	:rtype: None
") GeomAPI_ExtremaCurveCurve;
		 GeomAPI_ExtremaCurveCurve();

		/****************** GeomAPI_ExtremaCurveCurve ******************/
		%feature("compactdefaultargs") GeomAPI_ExtremaCurveCurve;
		%feature("autodoc", "Computes the extrema between the curves c1 and c2.

	:param C1:
	:type C1: Geom_Curve
	:param C2:
	:type C2: Geom_Curve
	:rtype: None
") GeomAPI_ExtremaCurveCurve;
		 GeomAPI_ExtremaCurveCurve(const opencascade::handle<Geom_Curve> & C1, const opencascade::handle<Geom_Curve> & C2);

		/****************** GeomAPI_ExtremaCurveCurve ******************/
		%feature("compactdefaultargs") GeomAPI_ExtremaCurveCurve;
		%feature("autodoc", "Computes the portion of the curve c1 limited by the two points of parameter (u1min,u1max), and - the portion of the curve c2 limited by the two points of parameter (u2min,u2max). warning use the function nbextrema to obtain the number of solutions. if this algorithm fails, nbextrema returns 0.

	:param C1:
	:type C1: Geom_Curve
	:param C2:
	:type C2: Geom_Curve
	:param U1min:
	:type U1min: float
	:param U1max:
	:type U1max: float
	:param U2min:
	:type U2min: float
	:param U2max:
	:type U2max: float
	:rtype: None
") GeomAPI_ExtremaCurveCurve;
		 GeomAPI_ExtremaCurveCurve(const opencascade::handle<Geom_Curve> & C1, const opencascade::handle<Geom_Curve> & C2, const Standard_Real U1min, const Standard_Real U1max, const Standard_Real U2min, const Standard_Real U2max);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes this algorithm with the given arguments and computes the extrema between the curves c1 and c2.

	:param C1:
	:type C1: Geom_Curve
	:param C2:
	:type C2: Geom_Curve
	:rtype: None
") Init;
		void Init(const opencascade::handle<Geom_Curve> & C1, const opencascade::handle<Geom_Curve> & C2);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes this algorithm with the given arguments and computes the extrema between : - the portion of the curve c1 limited by the two points of parameter (u1min,u1max), and - the portion of the curve c2 limited by the two points of parameter (u2min,u2max). warning use the function nbextrema to obtain the number of solutions. if this algorithm fails, nbextrema returns 0.

	:param C1:
	:type C1: Geom_Curve
	:param C2:
	:type C2: Geom_Curve
	:param U1min:
	:type U1min: float
	:param U1max:
	:type U1max: float
	:param U2min:
	:type U2min: float
	:param U2max:
	:type U2max: float
	:rtype: None
") Init;
		void Init(const opencascade::handle<Geom_Curve> & C1, const opencascade::handle<Geom_Curve> & C2, const Standard_Real U1min, const Standard_Real U1max, const Standard_Real U2min, const Standard_Real U2max);

		/****************** LowerDistance ******************/
		%feature("compactdefaultargs") LowerDistance;
		%feature("autodoc", "Computes the distance between the end points of the shortest extremum computed by this algorithm. exceptions stdfail_notdone if this algorithm fails.

	:rtype: float
") LowerDistance;
		Standard_Real LowerDistance();

		/****************** LowerDistanceParameters ******************/
		%feature("compactdefaultargs") LowerDistanceParameters;
		%feature("autodoc", "Returns the parameters u1 of the point on the first curve and u2 of the point on the second curve, which are the ends of the shortest extremum computed by this algorithm. exceptions stdfail_notdone if this algorithm fails.

	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:rtype: None
") LowerDistanceParameters;
		void LowerDistanceParameters(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** NbExtrema ******************/
		%feature("compactdefaultargs") NbExtrema;
		%feature("autodoc", "Returns the number of extrema computed by this algorithm. note: if this algorithm fails, nbextrema returns 0.

	:rtype: int
") NbExtrema;
		Standard_Integer NbExtrema();

		/****************** NearestPoints ******************/
		%feature("compactdefaultargs") NearestPoints;
		%feature("autodoc", "Returns the points p1 on the first curve and p2 on the second curve, which are the ends of the shortest extremum computed by this algorithm. exceptions stdfail_notdone if this algorithm fails.

	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") NearestPoints;
		void NearestPoints(gp_Pnt & P1, gp_Pnt & P2);

		/****************** Parameters ******************/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "Returns the parameters u1 of the point on the first curve and u2 of the point on the second curve, which are the ends of the extremum of index index computed by this algorithm. exceptions standard_outofrange if index is not in the range [ 1,nbextrema ], where nbextrema is the number of extrema computed by this algorithm.

	:param Index:
	:type Index: int
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:rtype: None
") Parameters;
		void Parameters(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Points ******************/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "Returns the points p1 on the first curve and p2 on the second curve, which are the ends of the extremum of index index computed by this algorithm. exceptions standard_outofrange if index is not in the range [ 1,nbextrema ], where nbextrema is the number of extrema computed by this algorithm.

	:param Index:
	:type Index: int
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") Points;
		void Points(const Standard_Integer Index, gp_Pnt & P1, gp_Pnt & P2);

		/****************** TotalLowerDistance ******************/
		%feature("compactdefaultargs") TotalLowerDistance;
		%feature("autodoc", "Return the distance of the total nearest couple solution point. if <myextcc> is not done.

	:rtype: float
") TotalLowerDistance;
		Standard_Real TotalLowerDistance();

		/****************** TotalLowerDistanceParameters ******************/
		%feature("compactdefaultargs") TotalLowerDistanceParameters;
		%feature("autodoc", "Set in <u1> and <u2> the parameters of the couple solution points which represents the total nearest solution.

	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:rtype: bool
") TotalLowerDistanceParameters;
		Standard_Boolean TotalLowerDistanceParameters(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** TotalNearestPoints ******************/
		%feature("compactdefaultargs") TotalNearestPoints;
		%feature("autodoc", "Set in <p1> and <p2> the couple solution points such a the distance [p1,p2] is the minimum. taking in account extremity points of curves.

	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: bool
") TotalNearestPoints;
		Standard_Boolean TotalNearestPoints(gp_Pnt & P1, gp_Pnt & P2);

};


%extend GeomAPI_ExtremaCurveCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class GeomAPI_ExtremaCurveSurface *
************************************/
class GeomAPI_ExtremaCurveSurface {
	public:
		/****************** Distance ******************/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "Computes the distance between the end points of the extremum of index index computed by this algorithm. exceptions standard_outofrange if index is not in the range [ 1,nbextrema ], where nbextrema is the number of extrema computed by this algorithm.

	:param Index:
	:type Index: int
	:rtype: float
") Distance;
		Standard_Real Distance(const Standard_Integer Index);

		/****************** Extrema ******************/
		%feature("compactdefaultargs") Extrema;
		%feature("autodoc", "Returns the algorithmic object from extrema.

	:rtype: Extrema_ExtCS
") Extrema;
		const Extrema_ExtCS & Extrema();

		/****************** GeomAPI_ExtremaCurveSurface ******************/
		%feature("compactdefaultargs") GeomAPI_ExtremaCurveSurface;
		%feature("autodoc", "Constructs an empty algorithm for computing extrema between a curve and a surface. use an init function to define the curve and the surface on which it is going to work.

	:rtype: None
") GeomAPI_ExtremaCurveSurface;
		 GeomAPI_ExtremaCurveSurface();

		/****************** GeomAPI_ExtremaCurveSurface ******************/
		%feature("compactdefaultargs") GeomAPI_ExtremaCurveSurface;
		%feature("autodoc", "Computes the extrema distances between the curve <c> and the surface <s>.

	:param Curve:
	:type Curve: Geom_Curve
	:param Surface:
	:type Surface: Geom_Surface
	:rtype: None
") GeomAPI_ExtremaCurveSurface;
		 GeomAPI_ExtremaCurveSurface(const opencascade::handle<Geom_Curve> & Curve, const opencascade::handle<Geom_Surface> & Surface);

		/****************** GeomAPI_ExtremaCurveSurface ******************/
		%feature("compactdefaultargs") GeomAPI_ExtremaCurveSurface;
		%feature("autodoc", "Computes the extrema distances between the curve <c> and the surface <s>. the solution point are computed in the domain [wmin,wmax] of the curve and in the domain [umin,umax] [vmin,vmax] of the surface. warning use the function nbextrema to obtain the number of solutions. if this algorithm fails, nbextrema returns 0.

	:param Curve:
	:type Curve: Geom_Curve
	:param Surface:
	:type Surface: Geom_Surface
	:param Wmin:
	:type Wmin: float
	:param Wmax:
	:type Wmax: float
	:param Umin:
	:type Umin: float
	:param Umax:
	:type Umax: float
	:param Vmin:
	:type Vmin: float
	:param Vmax:
	:type Vmax: float
	:rtype: None
") GeomAPI_ExtremaCurveSurface;
		 GeomAPI_ExtremaCurveSurface(const opencascade::handle<Geom_Curve> & Curve, const opencascade::handle<Geom_Surface> & Surface, const Standard_Real Wmin, const Standard_Real Wmax, const Standard_Real Umin, const Standard_Real Umax, const Standard_Real Vmin, const Standard_Real Vmax);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Computes the extrema distances between the curve <c> and the surface <s>.

	:param Curve:
	:type Curve: Geom_Curve
	:param Surface:
	:type Surface: Geom_Surface
	:rtype: None
") Init;
		void Init(const opencascade::handle<Geom_Curve> & Curve, const opencascade::handle<Geom_Surface> & Surface);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Computes the extrema distances between the curve <c> and the surface <s>. the solution point are computed in the domain [wmin,wmax] of the curve and in the domain [umin,umax] [vmin,vmax] of the surface. warning use the function nbextrema to obtain the number of solutions. if this algorithm fails, nbextrema returns 0.

	:param Curve:
	:type Curve: Geom_Curve
	:param Surface:
	:type Surface: Geom_Surface
	:param Wmin:
	:type Wmin: float
	:param Wmax:
	:type Wmax: float
	:param Umin:
	:type Umin: float
	:param Umax:
	:type Umax: float
	:param Vmin:
	:type Vmin: float
	:param Vmax:
	:type Vmax: float
	:rtype: None
") Init;
		void Init(const opencascade::handle<Geom_Curve> & Curve, const opencascade::handle<Geom_Surface> & Surface, const Standard_Real Wmin, const Standard_Real Wmax, const Standard_Real Umin, const Standard_Real Umax, const Standard_Real Vmin, const Standard_Real Vmax);

		/****************** LowerDistance ******************/
		%feature("compactdefaultargs") LowerDistance;
		%feature("autodoc", "Computes the distance between the end points of the shortest extremum computed by this algorithm. exceptions - stdfail_notdone if this algorithm fails.

	:rtype: float
") LowerDistance;
		Standard_Real LowerDistance();

		/****************** LowerDistanceParameters ******************/
		%feature("compactdefaultargs") LowerDistanceParameters;
		%feature("autodoc", "Returns the parameters w of the point on the curve and (u,v) of the point on the surface, which are the ends of the shortest extremum computed by this algorithm. exceptions - stdfail_notdone if this algorithm fails.

	:param W:
	:type W: float
	:param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: None
") LowerDistanceParameters;
		void LowerDistanceParameters(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** NbExtrema ******************/
		%feature("compactdefaultargs") NbExtrema;
		%feature("autodoc", "Returns the number of extrema computed by this algorithm. note: if this algorithm fails, nbextrema returns 0.

	:rtype: int
") NbExtrema;
		Standard_Integer NbExtrema();

		/****************** NearestPoints ******************/
		%feature("compactdefaultargs") NearestPoints;
		%feature("autodoc", "Returns the points pc on the curve and ps on the surface, which are the ends of the shortest extremum computed by this algorithm. exceptions - stdfail_notdone if this algorithm fails.

	:param PC:
	:type PC: gp_Pnt
	:param PS:
	:type PS: gp_Pnt
	:rtype: None
") NearestPoints;
		void NearestPoints(gp_Pnt & PC, gp_Pnt & PS);

		/****************** Parameters ******************/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "Returns the parameters w of the point on the curve, and (u,v) of the point on the surface, which are the ends of the extremum of index index computed by this algorithm. exceptions standard_outofrange if index is not in the range [ 1,nbextrema ], where nbextrema is the number of extrema computed by this algorithm.

	:param Index:
	:type Index: int
	:param W:
	:type W: float
	:param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: None
") Parameters;
		void Parameters(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Points ******************/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "Returns the points p1 on the curve and p2 on the surface, which are the ends of the extremum of index index computed by this algorithm. exceptions standard_outofrange if index is not in the range [ 1,nbextrema ], where nbextrema is the number of extrema computed by this algorithm.

	:param Index:
	:type Index: int
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") Points;
		void Points(const Standard_Integer Index, gp_Pnt & P1, gp_Pnt & P2);

};


%extend GeomAPI_ExtremaCurveSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class GeomAPI_ExtremaSurfaceSurface *
**************************************/
class GeomAPI_ExtremaSurfaceSurface {
	public:
		/****************** Distance ******************/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "Computes the distance between the end points of the extremum of index index computed by this algorithm. exceptions standard_outofrange if index is not in the range [ 1,nbextrema ], where nbextrema is the number of extrema computed by this algorithm.

	:param Index:
	:type Index: int
	:rtype: float
") Distance;
		Standard_Real Distance(const Standard_Integer Index);

		/****************** Extrema ******************/
		%feature("compactdefaultargs") Extrema;
		%feature("autodoc", "Return the algorithmic object from extrema.

	:rtype: Extrema_ExtSS
") Extrema;
		const Extrema_ExtSS & Extrema();

		/****************** GeomAPI_ExtremaSurfaceSurface ******************/
		%feature("compactdefaultargs") GeomAPI_ExtremaSurfaceSurface;
		%feature("autodoc", "Constructs an empty algorithm for computing extrema between two surfaces. use an init function to define the surfaces on which it is going to work.

	:rtype: None
") GeomAPI_ExtremaSurfaceSurface;
		 GeomAPI_ExtremaSurfaceSurface();

		/****************** GeomAPI_ExtremaSurfaceSurface ******************/
		%feature("compactdefaultargs") GeomAPI_ExtremaSurfaceSurface;
		%feature("autodoc", "Computes the extrema distances between the surfaces <s1> and <s2>.

	:param S1:
	:type S1: Geom_Surface
	:param S2:
	:type S2: Geom_Surface
	:rtype: None
") GeomAPI_ExtremaSurfaceSurface;
		 GeomAPI_ExtremaSurfaceSurface(const opencascade::handle<Geom_Surface> & S1, const opencascade::handle<Geom_Surface> & S2);

		/****************** GeomAPI_ExtremaSurfaceSurface ******************/
		%feature("compactdefaultargs") GeomAPI_ExtremaSurfaceSurface;
		%feature("autodoc", "Computes the extrema distances between the portion of the surface s1 limited by the two values of parameter (u1min,u1max) in the u parametric direction, and by the two values of parameter (v1min,v1max) in the v parametric direction, and - the portion of the surface s2 limited by the two values of parameter (u2min,u2max) in the u parametric direction, and by the two values of parameter (v2min,v2max) in the v parametric direction.

	:param S1:
	:type S1: Geom_Surface
	:param S2:
	:type S2: Geom_Surface
	:param U1min:
	:type U1min: float
	:param U1max:
	:type U1max: float
	:param V1min:
	:type V1min: float
	:param V1max:
	:type V1max: float
	:param U2min:
	:type U2min: float
	:param U2max:
	:type U2max: float
	:param V2min:
	:type V2min: float
	:param V2max:
	:type V2max: float
	:rtype: None
") GeomAPI_ExtremaSurfaceSurface;
		 GeomAPI_ExtremaSurfaceSurface(const opencascade::handle<Geom_Surface> & S1, const opencascade::handle<Geom_Surface> & S2, const Standard_Real U1min, const Standard_Real U1max, const Standard_Real V1min, const Standard_Real V1max, const Standard_Real U2min, const Standard_Real U2max, const Standard_Real V2min, const Standard_Real V2max);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes this algorithm with the given arguments and computes the extrema distances between the surfaces <s1> and <s2>.

	:param S1:
	:type S1: Geom_Surface
	:param S2:
	:type S2: Geom_Surface
	:rtype: None
") Init;
		void Init(const opencascade::handle<Geom_Surface> & S1, const opencascade::handle<Geom_Surface> & S2);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes this algorithm with the given arguments and computes the extrema distances between - the portion of the surface s1 limited by the two values of parameter (u1min,u1max) in the u parametric direction, and by the two values of parameter (v1min,v1max) in the v parametric direction, and - the portion of the surface s2 limited by the two values of parameter (u2min,u2max) in the u parametric direction, and by the two values of parameter (v2min,v2max) in the v parametric direction.

	:param S1:
	:type S1: Geom_Surface
	:param S2:
	:type S2: Geom_Surface
	:param U1min:
	:type U1min: float
	:param U1max:
	:type U1max: float
	:param V1min:
	:type V1min: float
	:param V1max:
	:type V1max: float
	:param U2min:
	:type U2min: float
	:param U2max:
	:type U2max: float
	:param V2min:
	:type V2min: float
	:param V2max:
	:type V2max: float
	:rtype: None
") Init;
		void Init(const opencascade::handle<Geom_Surface> & S1, const opencascade::handle<Geom_Surface> & S2, const Standard_Real U1min, const Standard_Real U1max, const Standard_Real V1min, const Standard_Real V1max, const Standard_Real U2min, const Standard_Real U2max, const Standard_Real V2min, const Standard_Real V2max);

		/****************** LowerDistance ******************/
		%feature("compactdefaultargs") LowerDistance;
		%feature("autodoc", "Computes the distance between the end points of the shortest extremum computed by this algorithm. exceptions stdfail_notdone if this algorithm fails.

	:rtype: float
") LowerDistance;
		Standard_Real LowerDistance();

		/****************** LowerDistanceParameters ******************/
		%feature("compactdefaultargs") LowerDistanceParameters;
		%feature("autodoc", "Returns the parameters (u1,v1) of the point on the first surface and (u2,v2) of the point on the second surface, which are the ends of the shortest extremum computed by this algorithm. exceptions - stdfail_notdone if this algorithm fails.

	:param U1:
	:type U1: float
	:param V1:
	:type V1: float
	:param U2:
	:type U2: float
	:param V2:
	:type V2: float
	:rtype: None
") LowerDistanceParameters;
		void LowerDistanceParameters(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** NbExtrema ******************/
		%feature("compactdefaultargs") NbExtrema;
		%feature("autodoc", "Returns the number of extrema computed by this algorithm. note: if this algorithm fails, nbextrema returns 0.

	:rtype: int
") NbExtrema;
		Standard_Integer NbExtrema();

		/****************** NearestPoints ******************/
		%feature("compactdefaultargs") NearestPoints;
		%feature("autodoc", "Returns the points p1 on the first surface and p2 on the second surface, which are the ends of the shortest extremum computed by this algorithm. exceptions stdfail_notdone if this algorithm fails.

	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") NearestPoints;
		void NearestPoints(gp_Pnt & P1, gp_Pnt & P2);

		/****************** Parameters ******************/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "Returns the parameters (u1,v1) of the point on the first surface, and (u2,v2) of the point on the second surface, which are the ends of the extremum of index index computed by this algorithm. exceptions standard_outofrange if index is not in the range [ 1,nbextrema ], where nbextrema is the number of extrema computed by this algorithm.

	:param Index:
	:type Index: int
	:param U1:
	:type U1: float
	:param V1:
	:type V1: float
	:param U2:
	:type U2: float
	:param V2:
	:type V2: float
	:rtype: None
") Parameters;
		void Parameters(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Points ******************/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "Returns the points p1 on the first surface and p2 on the second surface, which are the ends of the extremum of index index computed by this algorithm. exceptions standard_outofrange if index is not in the range [ 1,nbextrema ], where nbextrema is the number of extrema computed by this algorithm.

	:param Index:
	:type Index: int
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") Points;
		void Points(const Standard_Integer Index, gp_Pnt & P1, gp_Pnt & P2);

};


%extend GeomAPI_ExtremaSurfaceSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class GeomAPI_IntCS *
**********************/
class GeomAPI_IntCS {
	public:
		/****************** GeomAPI_IntCS ******************/
		%feature("compactdefaultargs") GeomAPI_IntCS;
		%feature("autodoc", "Creates an empty object. use the function perform for further initialization of the algorithm by the curve and the surface.

	:rtype: None
") GeomAPI_IntCS;
		 GeomAPI_IntCS();

		/****************** GeomAPI_IntCS ******************/
		%feature("compactdefaultargs") GeomAPI_IntCS;
		%feature("autodoc", "Computes the intersections between the curve c and the surface s. warning use function isdone to verify that the intersections are computed successfully.

	:param C:
	:type C: Geom_Curve
	:param S:
	:type S: Geom_Surface
	:rtype: None
") GeomAPI_IntCS;
		 GeomAPI_IntCS(const opencascade::handle<Geom_Curve> & C, const opencascade::handle<Geom_Surface> & S);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the intersections are successfully computed.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbPoints ******************/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Returns the number of intersection points if isdone returns true. else notdone is raised.

	:rtype: int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** NbSegments ******************/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "Returns the number of computed intersection segments in case of tangential intersection. exceptions stdfail_notdone if the intersection algorithm fails or is not initialized.

	:rtype: int
") NbSegments;
		Standard_Integer NbSegments();

		/****************** Parameters ******************/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "Returns parameter w on the curve and (parameters u,v) on the surface of the computed intersection point of index index in case of cross intersection. exceptions stdfail_notdone if intersection algorithm fails or is not initialized. standard_outofrange if index is not in the range [ 1,nbpoints ], where nbpoints is the number of computed intersection points.

	:param Index:
	:type Index: int
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param W:
	:type W: float
	:rtype: None
") Parameters;
		void Parameters(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Parameters ******************/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "Returns the parameters of the first (u1,v1) and the last (u2,v2) points of curve's segment on the surface in case of tangential intersection. index is the number of computed intersection segments. exceptions stdfail_notdone if intersection algorithm fails or is not initialized. standard_outofrange if index is not in the range [ 1,nbsegments ], where nbsegments is the number of computed intersection segments.

	:param Index:
	:type Index: int
	:param U1:
	:type U1: float
	:param V1:
	:type V1: float
	:param U2:
	:type U2: float
	:param V2:
	:type V2: float
	:rtype: None
") Parameters;
		void Parameters(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "This function initializes an algorithm with the curve c and the surface s and computes the intersections between c and s. warning use function isdone to verify that the intersections are computed successfully.

	:param C:
	:type C: Geom_Curve
	:param S:
	:type S: Geom_Surface
	:rtype: None
") Perform;
		void Perform(const opencascade::handle<Geom_Curve> & C, const opencascade::handle<Geom_Surface> & S);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the intersection point of range <index>in case of cross intersection. raises notdone if the computation has failed or if the computation has not been done raises outofrange if index is not in the range <1..nbpoints>.

	:param Index:
	:type Index: int
	:rtype: gp_Pnt
") Point;
		const gp_Pnt Point(const Standard_Integer Index);

		/****************** Segment ******************/
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "Returns the computed intersection segment of index index in case of tangential intersection. intersection segment is a portion of the initial curve tangent to surface. exceptions stdfail_notdone if intersection algorithm fails or is not initialized. standard_outofrange if index is not in the range [ 1,nbsegments ], where nbsegments is the number of computed intersection segments.

	:param Index:
	:type Index: int
	:rtype: opencascade::handle<Geom_Curve>
") Segment;
		opencascade::handle<Geom_Curve> Segment(const Standard_Integer Index);

};


%extend GeomAPI_IntCS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class GeomAPI_IntSS *
**********************/
class GeomAPI_IntSS {
	public:
		/****************** GeomAPI_IntSS ******************/
		%feature("compactdefaultargs") GeomAPI_IntSS;
		%feature("autodoc", "Constructs an empty object. use the function perform for further initialization algorithm by two surfaces.

	:rtype: None
") GeomAPI_IntSS;
		 GeomAPI_IntSS();

		/****************** GeomAPI_IntSS ******************/
		%feature("compactdefaultargs") GeomAPI_IntSS;
		%feature("autodoc", "Computes the intersection curves between the two surfaces s1 and s2. parameter tol defines the precision of curves computation. for most cases the value 1.0e-7 is recommended to use. warning use the function isdone to verify that the intersections are successfully computed.i.

	:param S1:
	:type S1: Geom_Surface
	:param S2:
	:type S2: Geom_Surface
	:param Tol:
	:type Tol: float
	:rtype: None
") GeomAPI_IntSS;
		 GeomAPI_IntSS(const opencascade::handle<Geom_Surface> & S1, const opencascade::handle<Geom_Surface> & S2, const Standard_Real Tol);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the intersection was successful.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Returns the computed intersection curve of index index. exceptions stdfail_notdone if the computation fails. standard_outofrange if index is out of range [1, nblines] where nblines is the number of computed intersection curves.

	:param Index:
	:type Index: int
	:rtype: opencascade::handle<Geom_Curve>
") Line;
		const opencascade::handle<Geom_Curve> & Line(const Standard_Integer Index);

		/****************** NbLines ******************/
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "Returns the number of computed intersection curves. exceptions stdfail_notdone if the computation fails.

	:rtype: int
") NbLines;
		Standard_Integer NbLines();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Initializes an algorithm with the given arguments and computes the intersection curves between the two surfaces s1 and s2. parameter tol defines the precision of curves computation. for most cases the value 1.0e-7 is recommended to use. warning use function isdone to verify that the intersections are successfully computed.

	:param S1:
	:type S1: Geom_Surface
	:param S2:
	:type S2: Geom_Surface
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform(const opencascade::handle<Geom_Surface> & S1, const opencascade::handle<Geom_Surface> & S2, const Standard_Real Tol);

};


%extend GeomAPI_IntSS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class GeomAPI_Interpolate *
****************************/
class GeomAPI_Interpolate {
	public:
		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Returns the computed bspline curve. raises stdfail_notdone if the interpolation fails.

	:rtype: opencascade::handle<Geom_BSplineCurve>
") Curve;
		const opencascade::handle<Geom_BSplineCurve> & Curve();

		/****************** GeomAPI_Interpolate ******************/
		%feature("compactdefaultargs") GeomAPI_Interpolate;
		%feature("autodoc", "Initializes an algorithm for constructing a constrained bspline curve passing through the points of the table points. tangential vectors can then be assigned, using the function load. if periodicflag is true, the constrained bspline curve will be periodic and closed. in this case, the junction point is the first point of the table points. the tolerance value tolerance is used to check that: - points are not too close to each other, or - tangential vectors (defined using the function load) are not too small. the resulting bspline curve will be 'c2' continuous, except where a tangency constraint is defined on a point through which the curve passes (by using the load function). in this case, it will be only 'c1' continuous. once all the constraints are defined, use the function perform to compute the curve. warning - there must be at least 2 points in the table points. - if periodicflag is false, there must be as many parameters in the array parameters as there are points in the array points. - if periodicflag is true, there must be one more parameter in the table parameters: this is used to give the parameter on the resulting bspline curve of the junction point of the curve (which is also the first point of the table points). exceptions - standard_constructionerror if the distance between two consecutive points in the table points is less than or equal to tolerance. - standard_outofrange if: - there are less than two points in the table points, or - conditions relating to the respective number of elements in the parallel tables points and parameters are not respected.

	:param Points:
	:type Points: TColgp_HArray1OfPnt
	:param PeriodicFlag:
	:type PeriodicFlag: bool
	:param Tolerance:
	:type Tolerance: float
	:rtype: None
") GeomAPI_Interpolate;
		 GeomAPI_Interpolate(const opencascade::handle<TColgp_HArray1OfPnt> & Points, const Standard_Boolean PeriodicFlag, const Standard_Real Tolerance);

		/****************** GeomAPI_Interpolate ******************/
		%feature("compactdefaultargs") GeomAPI_Interpolate;
		%feature("autodoc", "Initializes an algorithm for constructing a constrained bspline curve passing through the points of the table points, where the parameters of each of its points are given by the parallel table parameters. tangential vectors can then be assigned, using the function load. if periodicflag is true, the constrained bspline curve will be periodic and closed. in this case, the junction point is the first point of the table points. the tolerance value tolerance is used to check that: - points are not too close to each other, or - tangential vectors (defined using the function load) are not too small. the resulting bspline curve will be 'c2' continuous, except where a tangency constraint is defined on a point through which the curve passes (by using the load function). in this case, it will be only 'c1' continuous. once all the constraints are defined, use the function perform to compute the curve. warning - there must be at least 2 points in the table points. - if periodicflag is false, there must be as many parameters in the array parameters as there are points in the array points. - if periodicflag is true, there must be one more parameter in the table parameters: this is used to give the parameter on the resulting bspline curve of the junction point of the curve (which is also the first point of the table points). exceptions - standard_constructionerror if the distance between two consecutive points in the table points is less than or equal to tolerance. - standard_outofrange if: - there are less than two points in the table points, or - conditions relating to the respective number of elements in the parallel tables points and parameters are not respected.

	:param Points:
	:type Points: TColgp_HArray1OfPnt
	:param Parameters:
	:type Parameters: TColStd_HArray1OfReal
	:param PeriodicFlag:
	:type PeriodicFlag: bool
	:param Tolerance:
	:type Tolerance: float
	:rtype: None
") GeomAPI_Interpolate;
		 GeomAPI_Interpolate(const opencascade::handle<TColgp_HArray1OfPnt> & Points, const opencascade::handle<TColStd_HArray1OfReal> & Parameters, const Standard_Boolean PeriodicFlag, const Standard_Real Tolerance);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the constrained bspline curve is successfully constructed. note: in this case, the result is given by the function curve.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "Assigns this constrained bspline curve to be tangential to vectors initialtangent and finaltangent at its first and last points respectively (i.e. the first and last points of the table of points through which the curve passes, as defined at the time of initialization).

	:param InitialTangent:
	:type InitialTangent: gp_Vec
	:param FinalTangent:
	:type FinalTangent: gp_Vec
	:param Scale: default value is Standard_True
	:type Scale: bool
	:rtype: None
") Load;
		void Load(const gp_Vec & InitialTangent, const gp_Vec & FinalTangent, const Standard_Boolean Scale = Standard_True);

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "Assigns this constrained bspline curve to be tangential to vectors defined in the table tangents, which is parallel to the table of points through which the curve passes, as defined at the time of initialization. vectors in the table tangents are defined only if the flag given in the parallel table tangentflags is true: only these vectors are set as tangency constraints.

	:param Tangents:
	:type Tangents: TColgp_Array1OfVec
	:param TangentFlags:
	:type TangentFlags: TColStd_HArray1OfBoolean
	:param Scale: default value is Standard_True
	:type Scale: bool
	:rtype: None
") Load;
		void Load(const TColgp_Array1OfVec & Tangents, const opencascade::handle<TColStd_HArray1OfBoolean> & TangentFlags, const Standard_Boolean Scale = Standard_True);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Computes the constrained bspline curve. use the function isdone to verify that the computation is successful, and then the function curve to obtain the result.

	:rtype: None
") Perform;
		void Perform();

};


%extend GeomAPI_Interpolate {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class GeomAPI_PointsToBSpline *
********************************/
class GeomAPI_PointsToBSpline {
	public:
		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Returns the computed bspline curve. raises stdfail_notdone if the curve is not built.

	:rtype: opencascade::handle<Geom_BSplineCurve>
") Curve;
		const opencascade::handle<Geom_BSplineCurve> & Curve();

		/****************** GeomAPI_PointsToBSpline ******************/
		%feature("compactdefaultargs") GeomAPI_PointsToBSpline;
		%feature("autodoc", "Constructs an empty approximation algorithm. use an init function to define and build the bspline curve.

	:rtype: None
") GeomAPI_PointsToBSpline;
		 GeomAPI_PointsToBSpline();

		/****************** GeomAPI_PointsToBSpline ******************/
		%feature("compactdefaultargs") GeomAPI_PointsToBSpline;
		%feature("autodoc", "Approximate a bspline curve passing through an array of point. the resulting bspline will have the following properties: 1- his degree will be in the range [degmin,degmax] 2- his continuity will be at least <continuity> 3- the distance from the point <points> to the bspline will be lower to tol3d.

	:param Points:
	:type Points: TColgp_Array1OfPnt
	:param DegMin: default value is 3
	:type DegMin: int
	:param DegMax: default value is 8
	:type DegMax: int
	:param Continuity: default value is GeomAbs_C2
	:type Continuity: GeomAbs_Shape
	:param Tol3D: default value is 1.0e-3
	:type Tol3D: float
	:rtype: None
") GeomAPI_PointsToBSpline;
		 GeomAPI_PointsToBSpline(const TColgp_Array1OfPnt & Points, const Standard_Integer DegMin = 3, const Standard_Integer DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Real Tol3D = 1.0e-3);

		/****************** GeomAPI_PointsToBSpline ******************/
		%feature("compactdefaultargs") GeomAPI_PointsToBSpline;
		%feature("autodoc", "Approximate a bspline curve passing through an array of point. the resulting bspline will have the following properties: 1- his degree will be in the range [degmin,degmax] 2- his continuity will be at least <continuity> 3- the distance from the point <points> to the bspline will be lower to tol3d.

	:param Points:
	:type Points: TColgp_Array1OfPnt
	:param ParType:
	:type ParType: Approx_ParametrizationType
	:param DegMin: default value is 3
	:type DegMin: int
	:param DegMax: default value is 8
	:type DegMax: int
	:param Continuity: default value is GeomAbs_C2
	:type Continuity: GeomAbs_Shape
	:param Tol3D: default value is 1.0e-3
	:type Tol3D: float
	:rtype: None
") GeomAPI_PointsToBSpline;
		 GeomAPI_PointsToBSpline(const TColgp_Array1OfPnt & Points, const Approx_ParametrizationType ParType, const Standard_Integer DegMin = 3, const Standard_Integer DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Real Tol3D = 1.0e-3);

		/****************** GeomAPI_PointsToBSpline ******************/
		%feature("compactdefaultargs") GeomAPI_PointsToBSpline;
		%feature("autodoc", "Approximate a bspline curve passing through an array of point, which parameters are given by the array <parameters>. the resulting bspline will have the following properties: 1- his degree will be in the range [degmin,degmax] 2- his continuity will be at least <continuity> 3- the distance from the point <points> to the bspline will be lower to tol3d.

	:param Points:
	:type Points: TColgp_Array1OfPnt
	:param Parameters:
	:type Parameters: TColStd_Array1OfReal
	:param DegMin: default value is 3
	:type DegMin: int
	:param DegMax: default value is 8
	:type DegMax: int
	:param Continuity: default value is GeomAbs_C2
	:type Continuity: GeomAbs_Shape
	:param Tol3D: default value is 1.0e-3
	:type Tol3D: float
	:rtype: None
") GeomAPI_PointsToBSpline;
		 GeomAPI_PointsToBSpline(const TColgp_Array1OfPnt & Points, const TColStd_Array1OfReal & Parameters, const Standard_Integer DegMin = 3, const Standard_Integer DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Real Tol3D = 1.0e-3);

		/****************** GeomAPI_PointsToBSpline ******************/
		%feature("compactdefaultargs") GeomAPI_PointsToBSpline;
		%feature("autodoc", "Approximate a bspline curve passing through an array of point using variational smoothing algorithm, which tries to minimize additional criterium: weight1*curvelength + weight2*curvature + weight3*torsion.

	:param Points:
	:type Points: TColgp_Array1OfPnt
	:param Weight1:
	:type Weight1: float
	:param Weight2:
	:type Weight2: float
	:param Weight3:
	:type Weight3: float
	:param DegMax: default value is 8
	:type DegMax: int
	:param Continuity: default value is GeomAbs_C2
	:type Continuity: GeomAbs_Shape
	:param Tol3D: default value is 1.0e-3
	:type Tol3D: float
	:rtype: None
") GeomAPI_PointsToBSpline;
		 GeomAPI_PointsToBSpline(const TColgp_Array1OfPnt & Points, const Standard_Real Weight1, const Standard_Real Weight2, const Standard_Real Weight3, const Standard_Integer DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Real Tol3D = 1.0e-3);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Approximate a bspline curve passing through an array of point. the resulting bspline will have the following properties: 1- his degree will be in the range [degmin,degmax] 2- his continuity will be at least <continuity> 3- the distance from the point <points> to the bspline will be lower to tol3d.

	:param Points:
	:type Points: TColgp_Array1OfPnt
	:param DegMin: default value is 3
	:type DegMin: int
	:param DegMax: default value is 8
	:type DegMax: int
	:param Continuity: default value is GeomAbs_C2
	:type Continuity: GeomAbs_Shape
	:param Tol3D: default value is 1.0e-3
	:type Tol3D: float
	:rtype: None
") Init;
		void Init(const TColgp_Array1OfPnt & Points, const Standard_Integer DegMin = 3, const Standard_Integer DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Real Tol3D = 1.0e-3);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Approximate a bspline curve passing through an array of point. the resulting bspline will have the following properties: 1- his degree will be in the range [degmin,degmax] 2- his continuity will be at least <continuity> 3- the distance from the point <points> to the bspline will be lower to tol3d.

	:param Points:
	:type Points: TColgp_Array1OfPnt
	:param ParType:
	:type ParType: Approx_ParametrizationType
	:param DegMin: default value is 3
	:type DegMin: int
	:param DegMax: default value is 8
	:type DegMax: int
	:param Continuity: default value is GeomAbs_C2
	:type Continuity: GeomAbs_Shape
	:param Tol3D: default value is 1.0e-3
	:type Tol3D: float
	:rtype: None
") Init;
		void Init(const TColgp_Array1OfPnt & Points, const Approx_ParametrizationType ParType, const Standard_Integer DegMin = 3, const Standard_Integer DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Real Tol3D = 1.0e-3);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Approximate a bspline curve passing through an array of point, which parameters are given by the array <parameters>. the resulting bspline will have the following properties: 1- his degree will be in the range [degmin,degmax] 2- his continuity will be at least <continuity> 3- the distance from the point <points> to the bspline will be lower to tol3d.

	:param Points:
	:type Points: TColgp_Array1OfPnt
	:param Parameters:
	:type Parameters: TColStd_Array1OfReal
	:param DegMin: default value is 3
	:type DegMin: int
	:param DegMax: default value is 8
	:type DegMax: int
	:param Continuity: default value is GeomAbs_C2
	:type Continuity: GeomAbs_Shape
	:param Tol3D: default value is 1.0e-3
	:type Tol3D: float
	:rtype: None
") Init;
		void Init(const TColgp_Array1OfPnt & Points, const TColStd_Array1OfReal & Parameters, const Standard_Integer DegMin = 3, const Standard_Integer DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Real Tol3D = 1.0e-3);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Approximate a bspline curve passing through an array of point using variational smoothing algorithm, which tries to minimize additional criterium: weight1*curvelength + weight2*curvature + weight3*torsion.

	:param Points:
	:type Points: TColgp_Array1OfPnt
	:param Weight1:
	:type Weight1: float
	:param Weight2:
	:type Weight2: float
	:param Weight3:
	:type Weight3: float
	:param DegMax: default value is 8
	:type DegMax: int
	:param Continuity: default value is GeomAbs_C2
	:type Continuity: GeomAbs_Shape
	:param Tol3D: default value is 1.0e-3
	:type Tol3D: float
	:rtype: None
") Init;
		void Init(const TColgp_Array1OfPnt & Points, const Standard_Real Weight1, const Standard_Real Weight2, const Standard_Real Weight3, const Standard_Integer DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Real Tol3D = 1.0e-3);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone();

};


%extend GeomAPI_PointsToBSpline {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class GeomAPI_PointsToBSplineSurface *
***************************************/
class GeomAPI_PointsToBSplineSurface {
	public:
		/****************** GeomAPI_PointsToBSplineSurface ******************/
		%feature("compactdefaultargs") GeomAPI_PointsToBSplineSurface;
		%feature("autodoc", "Constructs an empty algorithm for approximation or interpolation of a surface. use: - an init function to define and build the bspline surface by approximation, or - an interpolate function to define and build the bspline surface by interpolation.

	:rtype: None
") GeomAPI_PointsToBSplineSurface;
		 GeomAPI_PointsToBSplineSurface();

		/****************** GeomAPI_PointsToBSplineSurface ******************/
		%feature("compactdefaultargs") GeomAPI_PointsToBSplineSurface;
		%feature("autodoc", "	:param Points:
	:type Points: TColgp_Array2OfPnt
	:param DegMin: default value is 3
	:type DegMin: int
	:param DegMax: default value is 8
	:type DegMax: int
	:param Continuity: default value is GeomAbs_C2
	:type Continuity: GeomAbs_Shape
	:param Tol3D: default value is 1.0e-3
	:type Tol3D: float
	:rtype: None
") GeomAPI_PointsToBSplineSurface;
		 GeomAPI_PointsToBSplineSurface(const TColgp_Array2OfPnt & Points, const Standard_Integer DegMin = 3, const Standard_Integer DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Real Tol3D = 1.0e-3);

		/****************** GeomAPI_PointsToBSplineSurface ******************/
		%feature("compactdefaultargs") GeomAPI_PointsToBSplineSurface;
		%feature("autodoc", "	:param Points:
	:type Points: TColgp_Array2OfPnt
	:param ParType:
	:type ParType: Approx_ParametrizationType
	:param DegMin: default value is 3
	:type DegMin: int
	:param DegMax: default value is 8
	:type DegMax: int
	:param Continuity: default value is GeomAbs_C2
	:type Continuity: GeomAbs_Shape
	:param Tol3D: default value is 1.0e-3
	:type Tol3D: float
	:rtype: None
") GeomAPI_PointsToBSplineSurface;
		 GeomAPI_PointsToBSplineSurface(const TColgp_Array2OfPnt & Points, const Approx_ParametrizationType ParType, const Standard_Integer DegMin = 3, const Standard_Integer DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Real Tol3D = 1.0e-3);

		/****************** GeomAPI_PointsToBSplineSurface ******************/
		%feature("compactdefaultargs") GeomAPI_PointsToBSplineSurface;
		%feature("autodoc", "	:param Points:
	:type Points: TColgp_Array2OfPnt
	:param Weight1:
	:type Weight1: float
	:param Weight2:
	:type Weight2: float
	:param Weight3:
	:type Weight3: float
	:param DegMax: default value is 8
	:type DegMax: int
	:param Continuity: default value is GeomAbs_C2
	:type Continuity: GeomAbs_Shape
	:param Tol3D: default value is 1.0e-3
	:type Tol3D: float
	:rtype: None
") GeomAPI_PointsToBSplineSurface;
		 GeomAPI_PointsToBSplineSurface(const TColgp_Array2OfPnt & Points, const Standard_Real Weight1, const Standard_Real Weight2, const Standard_Real Weight3, const Standard_Integer DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Real Tol3D = 1.0e-3);

		/****************** GeomAPI_PointsToBSplineSurface ******************/
		%feature("compactdefaultargs") GeomAPI_PointsToBSplineSurface;
		%feature("autodoc", "	:param ZPoints:
	:type ZPoints: TColStd_Array2OfReal
	:param X0:
	:type X0: float
	:param dX:
	:type dX: float
	:param Y0:
	:type Y0: float
	:param dY:
	:type dY: float
	:param DegMin: default value is 3
	:type DegMin: int
	:param DegMax: default value is 8
	:type DegMax: int
	:param Continuity: default value is GeomAbs_C2
	:type Continuity: GeomAbs_Shape
	:param Tol3D: default value is 1.0e-3
	:type Tol3D: float
	:rtype: None
") GeomAPI_PointsToBSplineSurface;
		 GeomAPI_PointsToBSplineSurface(const TColStd_Array2OfReal & ZPoints, const Standard_Real X0, const Standard_Real dX, const Standard_Real Y0, const Standard_Real dY, const Standard_Integer DegMin = 3, const Standard_Integer DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Real Tol3D = 1.0e-3);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param Points:
	:type Points: TColgp_Array2OfPnt
	:param DegMin: default value is 3
	:type DegMin: int
	:param DegMax: default value is 8
	:type DegMax: int
	:param Continuity: default value is GeomAbs_C2
	:type Continuity: GeomAbs_Shape
	:param Tol3D: default value is 1.0e-3
	:type Tol3D: float
	:rtype: None
") Init;
		void Init(const TColgp_Array2OfPnt & Points, const Standard_Integer DegMin = 3, const Standard_Integer DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Real Tol3D = 1.0e-3);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param ZPoints:
	:type ZPoints: TColStd_Array2OfReal
	:param X0:
	:type X0: float
	:param dX:
	:type dX: float
	:param Y0:
	:type Y0: float
	:param dY:
	:type dY: float
	:param DegMin: default value is 3
	:type DegMin: int
	:param DegMax: default value is 8
	:type DegMax: int
	:param Continuity: default value is GeomAbs_C2
	:type Continuity: GeomAbs_Shape
	:param Tol3D: default value is 1.0e-3
	:type Tol3D: float
	:rtype: None
") Init;
		void Init(const TColStd_Array2OfReal & ZPoints, const Standard_Real X0, const Standard_Real dX, const Standard_Real Y0, const Standard_Real dY, const Standard_Integer DegMin = 3, const Standard_Integer DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Real Tol3D = 1.0e-3);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param Points:
	:type Points: TColgp_Array2OfPnt
	:param ParType:
	:type ParType: Approx_ParametrizationType
	:param DegMin: default value is 3
	:type DegMin: int
	:param DegMax: default value is 8
	:type DegMax: int
	:param Continuity: default value is GeomAbs_C2
	:type Continuity: GeomAbs_Shape
	:param Tol3D: default value is 1.0e-3
	:type Tol3D: float
	:param thePeriodic: default value is Standard_False
	:type thePeriodic: bool
	:rtype: None
") Init;
		void Init(const TColgp_Array2OfPnt & Points, const Approx_ParametrizationType ParType, const Standard_Integer DegMin = 3, const Standard_Integer DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Real Tol3D = 1.0e-3, const Standard_Boolean thePeriodic = Standard_False);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param Points:
	:type Points: TColgp_Array2OfPnt
	:param Weight1:
	:type Weight1: float
	:param Weight2:
	:type Weight2: float
	:param Weight3:
	:type Weight3: float
	:param DegMax: default value is 8
	:type DegMax: int
	:param Continuity: default value is GeomAbs_C2
	:type Continuity: GeomAbs_Shape
	:param Tol3D: default value is 1.0e-3
	:type Tol3D: float
	:rtype: None
") Init;
		void Init(const TColgp_Array2OfPnt & Points, const Standard_Real Weight1, const Standard_Real Weight2, const Standard_Real Weight3, const Standard_Integer DegMax = 8, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Real Tol3D = 1.0e-3);

		/****************** Interpolate ******************/
		%feature("compactdefaultargs") Interpolate;
		%feature("autodoc", "	:param Points:
	:type Points: TColgp_Array2OfPnt
	:param thePeriodic: default value is Standard_False
	:type thePeriodic: bool
	:rtype: None
") Interpolate;
		void Interpolate(const TColgp_Array2OfPnt & Points, const Standard_Boolean thePeriodic = Standard_False);

		/****************** Interpolate ******************/
		%feature("compactdefaultargs") Interpolate;
		%feature("autodoc", "	:param Points:
	:type Points: TColgp_Array2OfPnt
	:param ParType:
	:type ParType: Approx_ParametrizationType
	:param thePeriodic: default value is Standard_False
	:type thePeriodic: bool
	:rtype: None
") Interpolate;
		void Interpolate(const TColgp_Array2OfPnt & Points, const Approx_ParametrizationType ParType, const Standard_Boolean thePeriodic = Standard_False);

		/****************** Interpolate ******************/
		%feature("compactdefaultargs") Interpolate;
		%feature("autodoc", "	:param ZPoints:
	:type ZPoints: TColStd_Array2OfReal
	:param X0:
	:type X0: float
	:param dX:
	:type dX: float
	:param Y0:
	:type Y0: float
	:param dY:
	:type dY: float
	:rtype: None
") Interpolate;
		void Interpolate(const TColStd_Array2OfReal & ZPoints, const Standard_Real X0, const Standard_Real dX, const Standard_Real Y0, const Standard_Real dY);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Returns the approximate bspline surface.

	:rtype: opencascade::handle<Geom_BSplineSurface>
") Surface;
		const opencascade::handle<Geom_BSplineSurface> & Surface();

};


%extend GeomAPI_PointsToBSplineSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class GeomAPI_ProjectPointOnCurve *
************************************/
class GeomAPI_ProjectPointOnCurve {
	public:
		/****************** Distance ******************/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "Computes the distance between the point and its orthogonal projection on the curve. index is a number of a computed point. exceptions standard_outofrange if index is not in the range [ 1,nbpoints ], where nbpoints is the number of solution points.

	:param Index:
	:type Index: int
	:rtype: float
") Distance;
		Standard_Real Distance(const Standard_Integer Index);

		/****************** Extrema ******************/
		%feature("compactdefaultargs") Extrema;
		%feature("autodoc", "Return the algorithmic object from extrema.

	:rtype: Extrema_ExtPC
") Extrema;
		const Extrema_ExtPC & Extrema();

		/****************** GeomAPI_ProjectPointOnCurve ******************/
		%feature("compactdefaultargs") GeomAPI_ProjectPointOnCurve;
		%feature("autodoc", "Creates an empty object. use an init function for further initialization.

	:rtype: None
") GeomAPI_ProjectPointOnCurve;
		 GeomAPI_ProjectPointOnCurve();

		/****************** GeomAPI_ProjectPointOnCurve ******************/
		%feature("compactdefaultargs") GeomAPI_ProjectPointOnCurve;
		%feature("autodoc", "Create the projection of a point <p> on a curve <curve>.

	:param P:
	:type P: gp_Pnt
	:param Curve:
	:type Curve: Geom_Curve
	:rtype: None
") GeomAPI_ProjectPointOnCurve;
		 GeomAPI_ProjectPointOnCurve(const gp_Pnt & P, const opencascade::handle<Geom_Curve> & Curve);

		/****************** GeomAPI_ProjectPointOnCurve ******************/
		%feature("compactdefaultargs") GeomAPI_ProjectPointOnCurve;
		%feature("autodoc", "Create the projection of a point <p> on a curve <curve> limited by the two points of parameter umin and usup.

	:param P:
	:type P: gp_Pnt
	:param Curve:
	:type Curve: Geom_Curve
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:rtype: None
") GeomAPI_ProjectPointOnCurve;
		 GeomAPI_ProjectPointOnCurve(const gp_Pnt & P, const opencascade::handle<Geom_Curve> & Curve, const Standard_Real Umin, const Standard_Real Usup);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Init the projection of a point <p> on a curve <curve>.

	:param P:
	:type P: gp_Pnt
	:param Curve:
	:type Curve: Geom_Curve
	:rtype: None
") Init;
		void Init(const gp_Pnt & P, const opencascade::handle<Geom_Curve> & Curve);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Init the projection of a point <p> on a curve <curve> limited by the two points of parameter umin and usup.

	:param P:
	:type P: gp_Pnt
	:param Curve:
	:type Curve: Geom_Curve
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:rtype: None
") Init;
		void Init(const gp_Pnt & P, const opencascade::handle<Geom_Curve> & Curve, const Standard_Real Umin, const Standard_Real Usup);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Init the projection of a point <p> on a curve <curve> limited by the two points of parameter umin and usup.

	:param Curve:
	:type Curve: Geom_Curve
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:rtype: None
") Init;
		void Init(const opencascade::handle<Geom_Curve> & Curve, const Standard_Real Umin, const Standard_Real Usup);

		/****************** LowerDistance ******************/
		%feature("compactdefaultargs") LowerDistance;
		%feature("autodoc", "Computes the distance between the point and its nearest orthogonal projection on the curve. exceptions: stdfail_notdone if this algorithm fails.

	:rtype: float
") LowerDistance;
		Standard_Real LowerDistance();

		/****************** LowerDistanceParameter ******************/
		%feature("compactdefaultargs") LowerDistanceParameter;
		%feature("autodoc", "Returns the parameter on the curve of the nearest orthogonal projection of the point. exceptions: stdfail_notdone if this algorithm fails.

	:rtype: float
") LowerDistanceParameter;
		Standard_Real LowerDistanceParameter();

		/****************** NbPoints ******************/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Returns the number of computed orthogonal projection points. note: if this algorithm fails, nbpoints returns 0.

	:rtype: int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** NearestPoint ******************/
		%feature("compactdefaultargs") NearestPoint;
		%feature("autodoc", "Returns the nearest orthogonal projection of the point on the curve. exceptions: stdfail_notdone if this algorithm fails.

	:rtype: gp_Pnt
") NearestPoint;
		gp_Pnt NearestPoint();

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Returns the parameter on the curve of the point, which is the orthogonal projection. index is a number of a computed point. exceptions standard_outofrange if index is not in the range [ 1,nbpoints ], where nbpoints is the number of solution points.

	:param Index:
	:type Index: int
	:rtype: float
") Parameter;
		Standard_Real Parameter(const Standard_Integer Index);

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Returns the parameter on the curve of the point, which is the orthogonal projection. index is a number of a computed point. exceptions standard_outofrange if index is not in the range [ 1,nbpoints ], where nbpoints is the number of solution points.-.

	:param Index:
	:type Index: int
	:param U:
	:type U: float
	:rtype: None
") Parameter;
		void Parameter(const Standard_Integer Index, Standard_Real &OutValue);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs the projection of a point on the current curve.

	:param P:
	:type P: gp_Pnt
	:rtype: None
") Perform;
		void Perform(const gp_Pnt & P);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the orthogonal projection on the curve. index is a number of a computed point. exceptions standard_outofrange if index is not in the range [ 1,nbpoints ], where nbpoints is the number of solution points.

	:param Index:
	:type Index: int
	:rtype: gp_Pnt
") Point;
		gp_Pnt Point(const Standard_Integer Index);

};


%extend GeomAPI_ProjectPointOnCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class GeomAPI_ProjectPointOnSurf *
***********************************/
class GeomAPI_ProjectPointOnSurf {
	public:
		/****************** Distance ******************/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "Computes the distance between the point and its orthogonal projection on the surface. index is a number of a computed point. exceptions standard_outofrange if index is not in the range [ 1,nbpoints ], where nbpoints is the number of solution points.

	:param Index:
	:type Index: int
	:rtype: float
") Distance;
		Standard_Real Distance(const Standard_Integer Index);

		/****************** Extrema ******************/
		%feature("compactdefaultargs") Extrema;
		%feature("autodoc", "Return the algorithmic object from extrema.

	:rtype: Extrema_ExtPS
") Extrema;
		const Extrema_ExtPS & Extrema();

		/****************** GeomAPI_ProjectPointOnSurf ******************/
		%feature("compactdefaultargs") GeomAPI_ProjectPointOnSurf;
		%feature("autodoc", "Creates an empty object. use the init function for further initialization.

	:rtype: None
") GeomAPI_ProjectPointOnSurf;
		 GeomAPI_ProjectPointOnSurf();

		/****************** GeomAPI_ProjectPointOnSurf ******************/
		%feature("compactdefaultargs") GeomAPI_ProjectPointOnSurf;
		%feature("autodoc", "Create the projection of a point <p> on a surface <surface>.

	:param P:
	:type P: gp_Pnt
	:param Surface:
	:type Surface: Geom_Surface
	:param Algo: default value is Extrema_ExtAlgo_Grad
	:type Algo: Extrema_ExtAlgo
	:rtype: None
") GeomAPI_ProjectPointOnSurf;
		 GeomAPI_ProjectPointOnSurf(const gp_Pnt & P, const opencascade::handle<Geom_Surface> & Surface, const Extrema_ExtAlgo Algo = Extrema_ExtAlgo_Grad);

		/****************** GeomAPI_ProjectPointOnSurf ******************/
		%feature("compactdefaultargs") GeomAPI_ProjectPointOnSurf;
		%feature("autodoc", "Create the projection of a point <p> on a surface <surface> create the projection of a point <p> on a surface <surface>. the solution are computed in the domain [umin,usup] [vmin,vsup] of the surface.

	:param P:
	:type P: gp_Pnt
	:param Surface:
	:type Surface: Geom_Surface
	:param Tolerance:
	:type Tolerance: float
	:param Algo: default value is Extrema_ExtAlgo_Grad
	:type Algo: Extrema_ExtAlgo
	:rtype: None
") GeomAPI_ProjectPointOnSurf;
		 GeomAPI_ProjectPointOnSurf(const gp_Pnt & P, const opencascade::handle<Geom_Surface> & Surface, const Standard_Real Tolerance, const Extrema_ExtAlgo Algo = Extrema_ExtAlgo_Grad);

		/****************** GeomAPI_ProjectPointOnSurf ******************/
		%feature("compactdefaultargs") GeomAPI_ProjectPointOnSurf;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param Surface:
	:type Surface: Geom_Surface
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param Vmin:
	:type Vmin: float
	:param Vsup:
	:type Vsup: float
	:param Tolerance:
	:type Tolerance: float
	:param Algo: default value is Extrema_ExtAlgo_Grad
	:type Algo: Extrema_ExtAlgo
	:rtype: None
") GeomAPI_ProjectPointOnSurf;
		 GeomAPI_ProjectPointOnSurf(const gp_Pnt & P, const opencascade::handle<Geom_Surface> & Surface, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real Vmin, const Standard_Real Vsup, const Standard_Real Tolerance, const Extrema_ExtAlgo Algo = Extrema_ExtAlgo_Grad);

		/****************** GeomAPI_ProjectPointOnSurf ******************/
		%feature("compactdefaultargs") GeomAPI_ProjectPointOnSurf;
		%feature("autodoc", "Init the projection of a point <p> on a surface <surface>.

	:param P:
	:type P: gp_Pnt
	:param Surface:
	:type Surface: Geom_Surface
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param Vmin:
	:type Vmin: float
	:param Vsup:
	:type Vsup: float
	:param Algo: default value is Extrema_ExtAlgo_Grad
	:type Algo: Extrema_ExtAlgo
	:rtype: None
") GeomAPI_ProjectPointOnSurf;
		 GeomAPI_ProjectPointOnSurf(const gp_Pnt & P, const opencascade::handle<Geom_Surface> & Surface, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real Vmin, const Standard_Real Vsup, const Extrema_ExtAlgo Algo = Extrema_ExtAlgo_Grad);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param Surface:
	:type Surface: Geom_Surface
	:param Tolerance:
	:type Tolerance: float
	:param Algo: default value is Extrema_ExtAlgo_Grad
	:type Algo: Extrema_ExtAlgo
	:rtype: None
") Init;
		void Init(const gp_Pnt & P, const opencascade::handle<Geom_Surface> & Surface, const Standard_Real Tolerance, const Extrema_ExtAlgo Algo = Extrema_ExtAlgo_Grad);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Init the projection of a point <p> on a surface <surface>. the solution are computed in the domain [umin,usup] [vmin,vsup] of the surface.

	:param P:
	:type P: gp_Pnt
	:param Surface:
	:type Surface: Geom_Surface
	:param Algo: default value is Extrema_ExtAlgo_Grad
	:type Algo: Extrema_ExtAlgo
	:rtype: None
") Init;
		void Init(const gp_Pnt & P, const opencascade::handle<Geom_Surface> & Surface, const Extrema_ExtAlgo Algo = Extrema_ExtAlgo_Grad);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param Surface:
	:type Surface: Geom_Surface
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param Vmin:
	:type Vmin: float
	:param Vsup:
	:type Vsup: float
	:param Tolerance:
	:type Tolerance: float
	:param Algo: default value is Extrema_ExtAlgo_Grad
	:type Algo: Extrema_ExtAlgo
	:rtype: None
") Init;
		void Init(const gp_Pnt & P, const opencascade::handle<Geom_Surface> & Surface, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real Vmin, const Standard_Real Vsup, const Standard_Real Tolerance, const Extrema_ExtAlgo Algo = Extrema_ExtAlgo_Grad);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Init the projection for many points on a surface <surface>. the solutions will be computed in the domain [umin,usup] [vmin,vsup] of the surface.

	:param P:
	:type P: gp_Pnt
	:param Surface:
	:type Surface: Geom_Surface
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param Vmin:
	:type Vmin: float
	:param Vsup:
	:type Vsup: float
	:param Algo: default value is Extrema_ExtAlgo_Grad
	:type Algo: Extrema_ExtAlgo
	:rtype: None
") Init;
		void Init(const gp_Pnt & P, const opencascade::handle<Geom_Surface> & Surface, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real Vmin, const Standard_Real Vsup, const Extrema_ExtAlgo Algo = Extrema_ExtAlgo_Grad);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param Surface:
	:type Surface: Geom_Surface
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param Vmin:
	:type Vmin: float
	:param Vsup:
	:type Vsup: float
	:param Tolerance:
	:type Tolerance: float
	:param Algo: default value is Extrema_ExtAlgo_Grad
	:type Algo: Extrema_ExtAlgo
	:rtype: None
") Init;
		void Init(const opencascade::handle<Geom_Surface> & Surface, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real Vmin, const Standard_Real Vsup, const Standard_Real Tolerance, const Extrema_ExtAlgo Algo = Extrema_ExtAlgo_Grad);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param Surface:
	:type Surface: Geom_Surface
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param Vmin:
	:type Vmin: float
	:param Vsup:
	:type Vsup: float
	:param Algo: default value is Extrema_ExtAlgo_Grad
	:type Algo: Extrema_ExtAlgo
	:rtype: None
") Init;
		void Init(const opencascade::handle<Geom_Surface> & Surface, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real Vmin, const Standard_Real Vsup, const Extrema_ExtAlgo Algo = Extrema_ExtAlgo_Grad);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** LowerDistance ******************/
		%feature("compactdefaultargs") LowerDistance;
		%feature("autodoc", "Computes the distance between the point and its nearest orthogonal projection on the surface. exceptions stdfail_notdone if projection fails.

	:rtype: float
") LowerDistance;
		Standard_Real LowerDistance();

		/****************** LowerDistanceParameters ******************/
		%feature("compactdefaultargs") LowerDistanceParameters;
		%feature("autodoc", "Returns the parameters (u,v) on the surface of the nearest computed orthogonal projection of the point. exceptions stdfail_notdone if projection fails.

	:param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: None
") LowerDistanceParameters;
		void LowerDistanceParameters(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** NbPoints ******************/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Returns the number of computed orthogonal projection points. note: if projection fails, nbpoints returns 0.

	:rtype: int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** NearestPoint ******************/
		%feature("compactdefaultargs") NearestPoint;
		%feature("autodoc", "Returns the nearest orthogonal projection of the point on the surface. exceptions stdfail_notdone if projection fails.

	:rtype: gp_Pnt
") NearestPoint;
		gp_Pnt NearestPoint();

		/****************** Parameters ******************/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "Returns the parameters (u,v) on the surface of the orthogonal projection. index is a number of a computed point. exceptions standard_outofrange if index is not in the range [ 1,nbpoints ], where nbpoints is the number of solution points.

	:param Index:
	:type Index: int
	:param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: None
") Parameters;
		void Parameters(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs the projection of a point on the current surface.

	:param P:
	:type P: gp_Pnt
	:rtype: None
") Perform;
		void Perform(const gp_Pnt & P);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the orthogonal projection on the surface. index is a number of a computed point. exceptions standard_outofrange if index is not in the range [ 1,nbpoints ], where nbpoints is the number of solution points.

	:param Index:
	:type Index: int
	:rtype: gp_Pnt
") Point;
		gp_Pnt Point(const Standard_Integer Index);

		/****************** SetExtremaAlgo ******************/
		%feature("compactdefaultargs") SetExtremaAlgo;
		%feature("autodoc", "Sets the extrema search algorithm - grad or tree. by default the extrema is initialized with grad algorithm.

	:param theAlgo:
	:type theAlgo: Extrema_ExtAlgo
	:rtype: None
") SetExtremaAlgo;
		void SetExtremaAlgo(const Extrema_ExtAlgo theAlgo);

		/****************** SetExtremaFlag ******************/
		%feature("compactdefaultargs") SetExtremaFlag;
		%feature("autodoc", "Sets the extrema search flag - min or max or minmax. by default the extrema is set to search the minmax solutions.

	:param theExtFlag:
	:type theExtFlag: Extrema_ExtFlag
	:rtype: None
") SetExtremaFlag;
		void SetExtremaFlag(const Extrema_ExtFlag theExtFlag);

};


%extend GeomAPI_ProjectPointOnSurf {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */

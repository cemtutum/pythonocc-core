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
%define GEOMCONVERTDOCSTRING
"GeomConvert module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_geomconvert.html"
%enddef
%module (package="OCC.Core", docstring=GEOMCONVERTDOCSTRING) GeomConvert


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
#include<GeomConvert_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Geom_module.hxx>
#include<TColGeom_module.hxx>
#include<TColStd_module.hxx>
#include<Convert_module.hxx>
#include<GeomAbs_module.hxx>
#include<Adaptor3d_module.hxx>
#include<TColgp_module.hxx>
#include<Geom2d_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Adaptor2d_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Geom.i
%import TColGeom.i
%import TColStd.i
%import Convert.i
%import GeomAbs.i
%import Adaptor3d.i
%import TColgp.i
/* public enums */
/* end public enums declaration */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/********************
* class GeomConvert *
********************/
%rename(geomconvert) GeomConvert;
class GeomConvert {
	public:
		/****************** C0BSplineToArrayOfC1BSplineCurve ******************/
		%feature("compactdefaultargs") C0BSplineToArrayOfC1BSplineCurve;
		%feature("autodoc", "This method reduces as far as it is possible the multiplicities of the knots of the bspline bs.(keeping the geometry). it returns an array of bspline c1. tolerance is a geometrical tolerance.

	:param BS:
	:type BS: Geom_BSplineCurve
	:param tabBS:
	:type tabBS: TColGeom_HArray1OfBSplineCurve
	:param tolerance:
	:type tolerance: float
	:rtype: None
") C0BSplineToArrayOfC1BSplineCurve;
		static void C0BSplineToArrayOfC1BSplineCurve(const opencascade::handle<Geom_BSplineCurve> & BS, opencascade::handle<TColGeom_HArray1OfBSplineCurve> & tabBS, const Standard_Real tolerance);

		/****************** C0BSplineToArrayOfC1BSplineCurve ******************/
		%feature("compactdefaultargs") C0BSplineToArrayOfC1BSplineCurve;
		%feature("autodoc", "This method reduces as far as it is possible the multiplicities of the knots of the bspline bs.(keeping the geometry). it returns an array of bspline c1. tolerance is a geometrical tolerance : it allows for the maximum deformation the angular tolerance is in radians and mesures the angle of the tangents on the left and on the right to decide if the curve is c1 or not at a given point.

	:param BS:
	:type BS: Geom_BSplineCurve
	:param tabBS:
	:type tabBS: TColGeom_HArray1OfBSplineCurve
	:param AngularTolerance:
	:type AngularTolerance: float
	:param tolerance:
	:type tolerance: float
	:rtype: None
") C0BSplineToArrayOfC1BSplineCurve;
		static void C0BSplineToArrayOfC1BSplineCurve(const opencascade::handle<Geom_BSplineCurve> & BS, opencascade::handle<TColGeom_HArray1OfBSplineCurve> & tabBS, const Standard_Real AngularTolerance, const Standard_Real tolerance);

		/****************** C0BSplineToC1BSplineCurve ******************/
		%feature("compactdefaultargs") C0BSplineToC1BSplineCurve;
		%feature("autodoc", "This method reduces as far as it is possible the multiplicities of the knots of the bspline bs.(keeping the geometry). it returns a new bspline which could still be c0. tolerance is a geometrical tolerance. the angular toleranceis in radians and mesures the angle of the tangents on the left and on the right to decide if the curve is g1 or not at a given point.

	:param BS:
	:type BS: Geom_BSplineCurve
	:param tolerance:
	:type tolerance: float
	:param AngularTolerance: default value is 1.0e-7
	:type AngularTolerance: float
	:rtype: None
") C0BSplineToC1BSplineCurve;
		static void C0BSplineToC1BSplineCurve(opencascade::handle<Geom_BSplineCurve> & BS, const Standard_Real tolerance, const Standard_Real AngularTolerance = 1.0e-7);

		/****************** ConcatC1 ******************/
		%feature("compactdefaultargs") ConcatC1;
		%feature("autodoc", "This method concatenates c1 the arrayofcurves as far as it is possible. arrayofcurves[0..n-1] arrayoftoler contains the biggest tolerance of the two points shared by two consecutives curves. its dimension: [0..n-2] closedflag indicates if the arrayofcurves is closed. in this case closedtolerance contains the biggest tolerance of the two points which are at the closure. otherwise its value is 0.0 closedflag becomes false on the output if it is impossible to build closed curve.

	:param ArrayOfCurves:
	:type ArrayOfCurves: TColGeom_Array1OfBSplineCurve
	:param ArrayOfToler:
	:type ArrayOfToler: TColStd_Array1OfReal
	:param ArrayOfIndices:
	:type ArrayOfIndices: TColStd_HArray1OfInteger
	:param ArrayOfConcatenated:
	:type ArrayOfConcatenated: TColGeom_HArray1OfBSplineCurve
	:param ClosedFlag:
	:type ClosedFlag: bool
	:param ClosedTolerance:
	:type ClosedTolerance: float
	:rtype: None
") ConcatC1;
		static void ConcatC1(TColGeom_Array1OfBSplineCurve & ArrayOfCurves, const TColStd_Array1OfReal & ArrayOfToler, opencascade::handle<TColStd_HArray1OfInteger> & ArrayOfIndices, opencascade::handle<TColGeom_HArray1OfBSplineCurve> & ArrayOfConcatenated, Standard_Boolean &OutValue, const Standard_Real ClosedTolerance);

		/****************** ConcatC1 ******************/
		%feature("compactdefaultargs") ConcatC1;
		%feature("autodoc", "This method concatenates c1 the arrayofcurves as far as it is possible. arrayofcurves[0..n-1] arrayoftoler contains the biggest tolerance of the two points shared by two consecutives curves. its dimension: [0..n-2] closedflag indicates if the arrayofcurves is closed. in this case closedtolerance contains the biggest tolerance of the two points which are at the closure. otherwise its value is 0.0 closedflag becomes false on the output if it is impossible to build closed curve.

	:param ArrayOfCurves:
	:type ArrayOfCurves: TColGeom_Array1OfBSplineCurve
	:param ArrayOfToler:
	:type ArrayOfToler: TColStd_Array1OfReal
	:param ArrayOfIndices:
	:type ArrayOfIndices: TColStd_HArray1OfInteger
	:param ArrayOfConcatenated:
	:type ArrayOfConcatenated: TColGeom_HArray1OfBSplineCurve
	:param ClosedFlag:
	:type ClosedFlag: bool
	:param ClosedTolerance:
	:type ClosedTolerance: float
	:param AngularTolerance:
	:type AngularTolerance: float
	:rtype: None
") ConcatC1;
		static void ConcatC1(TColGeom_Array1OfBSplineCurve & ArrayOfCurves, const TColStd_Array1OfReal & ArrayOfToler, opencascade::handle<TColStd_HArray1OfInteger> & ArrayOfIndices, opencascade::handle<TColGeom_HArray1OfBSplineCurve> & ArrayOfConcatenated, Standard_Boolean &OutValue, const Standard_Real ClosedTolerance, const Standard_Real AngularTolerance);

		/****************** ConcatG1 ******************/
		%feature("compactdefaultargs") ConcatG1;
		%feature("autodoc", "This method concatenates g1 the arrayofcurves as far as it is possible. arrayofcurves[0..n-1] arrayoftoler contains the biggest tolerance of the two points shared by two consecutives curves. its dimension: [0..n-2] closedflag indicates if the arrayofcurves is closed. in this case closedtolerance contains the biggest tolerance of the two points which are at the closure. otherwise its value is 0.0 closedflag becomes false on the output if it is impossible to build closed curve.

	:param ArrayOfCurves:
	:type ArrayOfCurves: TColGeom_Array1OfBSplineCurve
	:param ArrayOfToler:
	:type ArrayOfToler: TColStd_Array1OfReal
	:param ArrayOfConcatenated:
	:type ArrayOfConcatenated: TColGeom_HArray1OfBSplineCurve
	:param ClosedFlag:
	:type ClosedFlag: bool
	:param ClosedTolerance:
	:type ClosedTolerance: float
	:rtype: None
") ConcatG1;
		static void ConcatG1(TColGeom_Array1OfBSplineCurve & ArrayOfCurves, const TColStd_Array1OfReal & ArrayOfToler, opencascade::handle<TColGeom_HArray1OfBSplineCurve> & ArrayOfConcatenated, Standard_Boolean &OutValue, const Standard_Real ClosedTolerance);

		/****************** CurveToBSplineCurve ******************/
		%feature("compactdefaultargs") CurveToBSplineCurve;
		%feature("autodoc", "This function converts a non infinite curve from geom into a b-spline curve. c must be an ellipse or a circle or a trimmed conic or a trimmed line or a bezier curve or a trimmed bezier curve or a bspline curve or a trimmed bspline curve or an offsetcurve. the returned b-spline is not periodic except if c is a circle or an ellipse. if the parameterisation is quasiangular than the returned curve is not periodic in case a periodic geom_circle or geom_ellipse. for tgtthetaover2_1 and tgtthetaover2_2 the method raises an exception in case of a periodic geom_circle or a geom_ellipse parameterisationtype applies only if the curve is a circle or an ellipse : tgtthetaover2, -- tgtthetaover2_1, -- tgtthetaover2_2, -- tgtthetaover2_3, -- tgtthetaover2_4, //! purpose: this is the classical rational parameterisation 2 1 - t cos(theta) = ------ 2 1 + t //! 2t sin(theta) = ------ 2 1 + t //! t = tan (theta/2) //! with tgtthetaover2 the routine will compute the number of spans using the rule num_spans = [ (ulast - ufirst) / 1.2 ] + 1 with tgtthetaover2_n, n spans will be forced: an error will be raized if (ulast - ufirst) >= pi and n = 1, ulast - ufirst >= 2 pi and n = 2 //! quasiangular, here t is a rational function that approximates theta ----> tan(theta/2). neverthless the composing with above function yields exact functions whose square sum up to 1 rationalc1 ; t is replaced by a polynomial function of u so as to grant c1 contiuity across knots. exceptions standard_domainerror: - if the curve c is infinite, or - if c is a (complete) circle or ellipse, and parameterisation is equal to convert_tgtthetaover2_1 or convert_tgtthetaover2_2. standard_constructionerror: - if c is a (complete) circle or ellipse, and if parameterisation is not equal to convert_tgtthetaover2, convert_rationalc1, convert_quasiangular (the curve is converted in these three cases) or to convert_tgtthetaover2_1 or convert_tgtthetaover2_2 (another exception is raised in these two cases). - if c is a trimmed circle or ellipse, if parameterisation is equal to convert_tgtthetaover2_1 and if u2 - u1 > 0.9999 * pi, where u1 and u2 are respectively the first and the last parameters of the trimmed curve (this method of parameterization cannot be used to convert a half-circle or a half-ellipse, for example), or - if c is a trimmed circle or ellipse, if parameterisation is equal to convert_tgtthetaover2_2 and u2 - u1 > 1.9999 * pi where u1 and u2 are respectively the first and the last parameters of the trimmed curve (this method of parameterization cannot be used to convert a quasi-complete circle or ellipse).

	:param C:
	:type C: Geom_Curve
	:param Parameterisation: default value is Convert_TgtThetaOver2
	:type Parameterisation: Convert_ParameterisationType
	:rtype: opencascade::handle<Geom_BSplineCurve>
") CurveToBSplineCurve;
		static opencascade::handle<Geom_BSplineCurve> CurveToBSplineCurve(const opencascade::handle<Geom_Curve> & C, const Convert_ParameterisationType Parameterisation = Convert_TgtThetaOver2);

		/****************** SplitBSplineCurve ******************/
		%feature("compactdefaultargs") SplitBSplineCurve;
		%feature("autodoc", "Convert a curve from geom by an approximation method //! this method computes the arc of b-spline curve between the two knots fromk1 and tok2. if c is periodic the arc has the same orientation as c if sameorientation = standard_true. if c is not periodic sameorientation is not used for the computation and c is oriented from the knot fromk1 to the knot tok2. we just keep the local definition of c between the knots fromk1 and tok2. the returned b-spline curve has its first and last knots with a multiplicity equal to degree + 1, where degree is the polynomial degree of c. the indexes of the knots fromk1 and tok2 doesn't include the repetition of multiple knots in their definition. raised if fromk1 = tok2 raised if fromk1 or tok2 are out of the bounds [firstuknotindex, lastuknotindex].

	:param C:
	:type C: Geom_BSplineCurve
	:param FromK1:
	:type FromK1: int
	:param ToK2:
	:type ToK2: int
	:param SameOrientation: default value is Standard_True
	:type SameOrientation: bool
	:rtype: opencascade::handle<Geom_BSplineCurve>
") SplitBSplineCurve;
		static opencascade::handle<Geom_BSplineCurve> SplitBSplineCurve(const opencascade::handle<Geom_BSplineCurve> & C, const Standard_Integer FromK1, const Standard_Integer ToK2, const Standard_Boolean SameOrientation = Standard_True);

		/****************** SplitBSplineCurve ******************/
		%feature("compactdefaultargs") SplitBSplineCurve;
		%feature("autodoc", "This function computes the segment of b-spline curve between the parametric values fromu1, tou2. if c is periodic the arc has the same orientation as c if sameorientation = true. if c is not periodic sameorientation is not used for the computation and c is oriented fromu1 tou2. if u1 and u2 and two parametric values we consider that u1 = u2 if abs (u1 - u2) <= parametrictolerance and parametrictolerance must be greater or equal to resolution from package gp. //! raised if fromu1 or tou2 are out of the parametric bounds of the curve (the tolerance criterion is parametrictolerance). raised if abs (fromu1 - tou2) <= parametrictolerance raised if parametrictolerance < resolution from gp.

	:param C:
	:type C: Geom_BSplineCurve
	:param FromU1:
	:type FromU1: float
	:param ToU2:
	:type ToU2: float
	:param ParametricTolerance:
	:type ParametricTolerance: float
	:param SameOrientation: default value is Standard_True
	:type SameOrientation: bool
	:rtype: opencascade::handle<Geom_BSplineCurve>
") SplitBSplineCurve;
		static opencascade::handle<Geom_BSplineCurve> SplitBSplineCurve(const opencascade::handle<Geom_BSplineCurve> & C, const Standard_Real FromU1, const Standard_Real ToU2, const Standard_Real ParametricTolerance, const Standard_Boolean SameOrientation = Standard_True);

		/****************** SplitBSplineSurface ******************/
		%feature("compactdefaultargs") SplitBSplineSurface;
		%feature("autodoc", "Computes the b-spline surface patche between the knots values fromuk1, touk2, fromvk1, tovk2. if s is periodic in one direction the patche has the same orientation as s in this direction if the flag is true in this direction (sameuorientation, samevorientation). if s is not periodic sameuorientation and samevorientation are not used for the computation and s is oriented fromuk1 touk2 and fromvk1 tovk2. raised if fromuk1 = touk2 or fromvk1 = tovk2 fromuk1 or touk2 are out of the bounds [firstuknotindex, lastuknotindex] fromvk1 or tovk2 are out of the bounds [firstvknotindex, lastvknotindex].

	:param S:
	:type S: Geom_BSplineSurface
	:param FromUK1:
	:type FromUK1: int
	:param ToUK2:
	:type ToUK2: int
	:param FromVK1:
	:type FromVK1: int
	:param ToVK2:
	:type ToVK2: int
	:param SameUOrientation: default value is Standard_True
	:type SameUOrientation: bool
	:param SameVOrientation: default value is Standard_True
	:type SameVOrientation: bool
	:rtype: opencascade::handle<Geom_BSplineSurface>
") SplitBSplineSurface;
		static opencascade::handle<Geom_BSplineSurface> SplitBSplineSurface(const opencascade::handle<Geom_BSplineSurface> & S, const Standard_Integer FromUK1, const Standard_Integer ToUK2, const Standard_Integer FromVK1, const Standard_Integer ToVK2, const Standard_Boolean SameUOrientation = Standard_True, const Standard_Boolean SameVOrientation = Standard_True);

		/****************** SplitBSplineSurface ******************/
		%feature("compactdefaultargs") SplitBSplineSurface;
		%feature("autodoc", "This method splits a b-spline surface patche between the knots values fromk1, tok2 in one direction. if usplit = true then the splitting direction is the u parametric direction else it is the v parametric direction. if s is periodic in the considered direction the patche has the same orientation as s in this direction if sameorientation is true if s is not periodic in this direction sameorientation is not used for the computation and s is oriented fromk1 tok2. raised if fromk1 = tok2 or if fromk1 or tok2 are out of the bounds [firstuknotindex, lastuknotindex] in the considered parametric direction.

	:param S:
	:type S: Geom_BSplineSurface
	:param FromK1:
	:type FromK1: int
	:param ToK2:
	:type ToK2: int
	:param USplit:
	:type USplit: bool
	:param SameOrientation: default value is Standard_True
	:type SameOrientation: bool
	:rtype: opencascade::handle<Geom_BSplineSurface>
") SplitBSplineSurface;
		static opencascade::handle<Geom_BSplineSurface> SplitBSplineSurface(const opencascade::handle<Geom_BSplineSurface> & S, const Standard_Integer FromK1, const Standard_Integer ToK2, const Standard_Boolean USplit, const Standard_Boolean SameOrientation = Standard_True);

		/****************** SplitBSplineSurface ******************/
		%feature("compactdefaultargs") SplitBSplineSurface;
		%feature("autodoc", "This method computes the b-spline surface patche between the parametric values fromu1, tou2, fromv1, tov2. if s is periodic in one direction the patche has the same orientation as s in this direction if the flag is true in this direction (sameuorientation, samevorientation). if s is not periodic sameuorientation and samevorientation are not used for the computation and s is oriented fromu1 tou2 and fromv1 tov2. if u1 and u2 and two parametric values we consider that u1 = u2 if abs (u1 - u2) <= parametrictolerance and parametrictolerance must be greater or equal to resolution from package gp. //! raised if fromu1 or tou2 or fromv1 or tou2 are out of the parametric bounds of the surface (the tolerance criterion is parametrictolerance). raised if abs (fromu1 - tou2) <= parametrictolerance or abs (fromv1 - tov2) <= parametrictolerance. raised if parametrictolerance < resolution.

	:param S:
	:type S: Geom_BSplineSurface
	:param FromU1:
	:type FromU1: float
	:param ToU2:
	:type ToU2: float
	:param FromV1:
	:type FromV1: float
	:param ToV2:
	:type ToV2: float
	:param ParametricTolerance:
	:type ParametricTolerance: float
	:param SameUOrientation: default value is Standard_True
	:type SameUOrientation: bool
	:param SameVOrientation: default value is Standard_True
	:type SameVOrientation: bool
	:rtype: opencascade::handle<Geom_BSplineSurface>
") SplitBSplineSurface;
		static opencascade::handle<Geom_BSplineSurface> SplitBSplineSurface(const opencascade::handle<Geom_BSplineSurface> & S, const Standard_Real FromU1, const Standard_Real ToU2, const Standard_Real FromV1, const Standard_Real ToV2, const Standard_Real ParametricTolerance, const Standard_Boolean SameUOrientation = Standard_True, const Standard_Boolean SameVOrientation = Standard_True);

		/****************** SplitBSplineSurface ******************/
		%feature("compactdefaultargs") SplitBSplineSurface;
		%feature("autodoc", "This method splits the b-spline surface s in one direction between the parametric values fromparam1, toparam2. if usplit = true then the splitting direction is the u parametric direction else it is the v parametric direction. if s is periodic in the considered direction the patche has the same orientation as s in this direction if sameorientation is true. if s is not periodic in the considered direction sameorientation is not used for the computation and s is oriented fromparam1 toparam2. if u1 and u2 and two parametric values we consider that u1 = u2 if abs (u1 - u2) <= parametrictolerance and parametrictolerance must be greater or equal to resolution from package gp. //! raises if fromparam1 or toparam2 are out of the parametric bounds of the surface in the considered direction. raises if abs (fromparam1 - toparam2) <= parametrictolerance.

	:param S:
	:type S: Geom_BSplineSurface
	:param FromParam1:
	:type FromParam1: float
	:param ToParam2:
	:type ToParam2: float
	:param USplit:
	:type USplit: bool
	:param ParametricTolerance:
	:type ParametricTolerance: float
	:param SameOrientation: default value is Standard_True
	:type SameOrientation: bool
	:rtype: opencascade::handle<Geom_BSplineSurface>
") SplitBSplineSurface;
		static opencascade::handle<Geom_BSplineSurface> SplitBSplineSurface(const opencascade::handle<Geom_BSplineSurface> & S, const Standard_Real FromParam1, const Standard_Real ToParam2, const Standard_Boolean USplit, const Standard_Real ParametricTolerance, const Standard_Boolean SameOrientation = Standard_True);

		/****************** SurfaceToBSplineSurface ******************/
		%feature("compactdefaultargs") SurfaceToBSplineSurface;
		%feature("autodoc", "This algorithm converts a non infinite surface from geom into a b-spline surface. s must be a trimmed plane or a trimmed cylinder or a trimmed cone or a trimmed sphere or a trimmed torus or a sphere or a torus or a bezier surface of a trimmed bezier surface or a trimmed swept surface with a corresponding basis curve which can be turned into a b-spline curve (see the method curvetobsplinecurve). raises domainerror if the type of the surface is not previously defined.

	:param S:
	:type S: Geom_Surface
	:rtype: opencascade::handle<Geom_BSplineSurface>
") SurfaceToBSplineSurface;
		static opencascade::handle<Geom_BSplineSurface> SurfaceToBSplineSurface(const opencascade::handle<Geom_Surface> & S);

};


%extend GeomConvert {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class GeomConvert_ApproxCurve *
********************************/
class GeomConvert_ApproxCurve {
	public:
		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Returns the bspline curve resulting from the approximation algorithm.

	:rtype: opencascade::handle<Geom_BSplineCurve>
") Curve;
		opencascade::handle<Geom_BSplineCurve> Curve();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** GeomConvert_ApproxCurve ******************/
		%feature("compactdefaultargs") GeomConvert_ApproxCurve;
		%feature("autodoc", "Constructs a curve approximation framework defined by - - the conic curve, - the tolerance value tol3d, - the degree of continuity order, - the maximum number of segments maxsegments allowed in the resulting bspline curve, and - the highest degree maxdeg which the polynomial defining the bspline curve may have.

	:param Curve:
	:type Curve: Geom_Curve
	:param Tol3d:
	:type Tol3d: float
	:param Order:
	:type Order: GeomAbs_Shape
	:param MaxSegments:
	:type MaxSegments: int
	:param MaxDegree:
	:type MaxDegree: int
	:rtype: None
") GeomConvert_ApproxCurve;
		 GeomConvert_ApproxCurve(const opencascade::handle<Geom_Curve> & Curve, const Standard_Real Tol3d, const GeomAbs_Shape Order, const Standard_Integer MaxSegments, const Standard_Integer MaxDegree);

		/****************** GeomConvert_ApproxCurve ******************/
		%feature("compactdefaultargs") GeomConvert_ApproxCurve;
		%feature("autodoc", "Constructs a curve approximation framework defined by - - the curve, - the tolerance value tol3d, - the degree of continuity order, - the maximum number of segments maxsegments allowed in the resulting bspline curve, and - the highest degree maxdeg which the polynomial defining the bspline curve may have.

	:param Curve:
	:type Curve: Adaptor3d_HCurve
	:param Tol3d:
	:type Tol3d: float
	:param Order:
	:type Order: GeomAbs_Shape
	:param MaxSegments:
	:type MaxSegments: int
	:param MaxDegree:
	:type MaxDegree: int
	:rtype: None
") GeomConvert_ApproxCurve;
		 GeomConvert_ApproxCurve(const opencascade::handle<Adaptor3d_HCurve> & Curve, const Standard_Real Tol3d, const GeomAbs_Shape Order, const Standard_Integer MaxSegments, const Standard_Integer MaxDegree);

		/****************** HasResult ******************/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "Returns standard_true if the approximation did come out with a result that is not necessarely within the required tolerance.

	:rtype: bool
") HasResult;
		Standard_Boolean HasResult();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns standard_true if the approximation has been done within requiered tolerance.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** MaxError ******************/
		%feature("compactdefaultargs") MaxError;
		%feature("autodoc", "Returns the greatest distance between a point on the source conic and the bspline curve resulting from the approximation. (>0 when an approximation has been done, 0 if no approximation).

	:rtype: float
") MaxError;
		Standard_Real MaxError();

};


%extend GeomConvert_ApproxCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class GeomConvert_ApproxSurface *
**********************************/
class GeomConvert_ApproxSurface {
	public:

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** GeomConvert_ApproxSurface ******************/
		%feature("compactdefaultargs") GeomConvert_ApproxSurface;
		%feature("autodoc", "Constructs a surface approximation framework defined by - the conic surf - the tolerance value tol3d - the degree of continuity ucontinuity, vcontinuity in the directions of the u and v parameters - the highest degree maxdegu, maxdegv which the polynomial defining the bspline curve may have in the directions of the u and v parameters - the maximum number of segments maxsegments allowed in the resulting bspline curve - the index of precision preciscode.

	:param Surf:
	:type Surf: Geom_Surface
	:param Tol3d:
	:type Tol3d: float
	:param UContinuity:
	:type UContinuity: GeomAbs_Shape
	:param VContinuity:
	:type VContinuity: GeomAbs_Shape
	:param MaxDegU:
	:type MaxDegU: int
	:param MaxDegV:
	:type MaxDegV: int
	:param MaxSegments:
	:type MaxSegments: int
	:param PrecisCode:
	:type PrecisCode: int
	:rtype: None
") GeomConvert_ApproxSurface;
		 GeomConvert_ApproxSurface(const opencascade::handle<Geom_Surface> & Surf, const Standard_Real Tol3d, const GeomAbs_Shape UContinuity, const GeomAbs_Shape VContinuity, const Standard_Integer MaxDegU, const Standard_Integer MaxDegV, const Standard_Integer MaxSegments, const Standard_Integer PrecisCode);

		/****************** GeomConvert_ApproxSurface ******************/
		%feature("compactdefaultargs") GeomConvert_ApproxSurface;
		%feature("autodoc", "Constructs a surface approximation framework defined by - the surf - the tolerance value tol3d - the degree of continuity ucontinuity, vcontinuity in the directions of the u and v parameters - the highest degree maxdegu, maxdegv which the polynomial defining the bspline curve may have in the directions of the u and v parameters - the maximum number of segments maxsegments allowed in the resulting bspline curve - the index of precision preciscode.

	:param Surf:
	:type Surf: Adaptor3d_HSurface
	:param Tol3d:
	:type Tol3d: float
	:param UContinuity:
	:type UContinuity: GeomAbs_Shape
	:param VContinuity:
	:type VContinuity: GeomAbs_Shape
	:param MaxDegU:
	:type MaxDegU: int
	:param MaxDegV:
	:type MaxDegV: int
	:param MaxSegments:
	:type MaxSegments: int
	:param PrecisCode:
	:type PrecisCode: int
	:rtype: None
") GeomConvert_ApproxSurface;
		 GeomConvert_ApproxSurface(const opencascade::handle<Adaptor3d_HSurface> & Surf, const Standard_Real Tol3d, const GeomAbs_Shape UContinuity, const GeomAbs_Shape VContinuity, const Standard_Integer MaxDegU, const Standard_Integer MaxDegV, const Standard_Integer MaxSegments, const Standard_Integer PrecisCode);

		/****************** HasResult ******************/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "Returns true if the approximation did come out with a result that is not necessarily within the required tolerance or a result that is not recognized with the wished continuities.

	:rtype: bool
") HasResult;
		Standard_Boolean HasResult();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns standard_true if the approximation has be done.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** MaxError ******************/
		%feature("compactdefaultargs") MaxError;
		%feature("autodoc", "Returns the greatest distance between a point on the source conic surface and the bspline surface resulting from the approximation (>0 when an approximation has been done, 0 if no approximation ).

	:rtype: float
") MaxError;
		Standard_Real MaxError();

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Returns the bspline surface resulting from the approximation algorithm.

	:rtype: opencascade::handle<Geom_BSplineSurface>
") Surface;
		opencascade::handle<Geom_BSplineSurface> Surface();

};


%extend GeomConvert_ApproxSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class GeomConvert_BSplineCurveKnotSplitting *
**********************************************/
class GeomConvert_BSplineCurveKnotSplitting {
	public:
		/****************** GeomConvert_BSplineCurveKnotSplitting ******************/
		%feature("compactdefaultargs") GeomConvert_BSplineCurveKnotSplitting;
		%feature("autodoc", "Determines points at which the bspline curve basiscurve should be split in order to obtain arcs with a degree of continuity equal to continuityrange. these points are knot values of basiscurve. they are identified by indices in the knots table of basiscurve. use the available interrogation functions to access computed values, followed by the global function splitbsplinecurve (provided by the package geomconvert) to split the curve. exceptions standard_rangeerror if continuityrange is less than zero.

	:param BasisCurve:
	:type BasisCurve: Geom_BSplineCurve
	:param ContinuityRange:
	:type ContinuityRange: int
	:rtype: None
") GeomConvert_BSplineCurveKnotSplitting;
		 GeomConvert_BSplineCurveKnotSplitting(const opencascade::handle<Geom_BSplineCurve> & BasisCurve, const Standard_Integer ContinuityRange);

		/****************** NbSplits ******************/
		%feature("compactdefaultargs") NbSplits;
		%feature("autodoc", "Returns the number of points at which the analyzed bspline curve should be split, in order to obtain arcs with the continuity required by this framework. all these points correspond to knot values. note that the first and last points of the curve, which bound the first and last arcs, are counted among these splitting points.

	:rtype: int
") NbSplits;
		Standard_Integer NbSplits();

		/****************** SplitValue ******************/
		%feature("compactdefaultargs") SplitValue;
		%feature("autodoc", "Returns the split knot of index index to the split knots table computed in this framework. the returned value is an index in the knots table of the bspline curve analyzed by this algorithm. notes: - if index is equal to 1, the corresponding knot gives the first point of the curve. - if index is equal to the number of split knots computed in this framework, the corresponding point is the last point of the curve. exceptions standard_rangeerror if index is less than 1 or greater than the number of split knots computed in this framework.

	:param Index:
	:type Index: int
	:rtype: int
") SplitValue;
		Standard_Integer SplitValue(const Standard_Integer Index);

		/****************** Splitting ******************/
		%feature("compactdefaultargs") Splitting;
		%feature("autodoc", "Loads the splitvalues table with the split knots values computed in this framework. each value in the table is an index in the knots table of the bspline curve analyzed by this algorithm. the values in splitvalues are given in ascending order and comprise the indices of the knots which give the first and last points of the curve. use two consecutive values from the table as arguments of the global function splitbsplinecurve (provided by the package geomconvert) to split the curve. exceptions standard_dimensionerror if the array splitvalues was not created with the following bounds: - 1, and - the number of split points computed in this framework (as given by the function nbsplits).

	:param SplitValues:
	:type SplitValues: TColStd_Array1OfInteger
	:rtype: None
") Splitting;
		void Splitting(TColStd_Array1OfInteger & SplitValues);

};


%extend GeomConvert_BSplineCurveKnotSplitting {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class GeomConvert_BSplineCurveToBezierCurve *
**********************************************/
class GeomConvert_BSplineCurveToBezierCurve {
	public:
		/****************** Arc ******************/
		%feature("compactdefaultargs") Arc;
		%feature("autodoc", "Constructs and returns the bezier curve of index index to the table of adjacent bezier arcs computed by this algorithm. this bezier curve has the same orientation as the bspline curve analyzed in this framework. exceptions standard_outofrange if index is less than 1 or greater than the number of adjacent bezier arcs computed by this algorithm.

	:param Index:
	:type Index: int
	:rtype: opencascade::handle<Geom_BezierCurve>
") Arc;
		opencascade::handle<Geom_BezierCurve> Arc(const Standard_Integer Index);

		/****************** Arcs ******************/
		%feature("compactdefaultargs") Arcs;
		%feature("autodoc", "Constructs all the bezier curves whose data is computed by this algorithm and loads these curves into the curves table. the bezier curves have the same orientation as the bspline curve analyzed in this framework. exceptions standard_dimensionerror if the curves array was not created with the following bounds: - 1 , and - the number of adjacent bezier arcs computed by this algorithm (as given by the function nbarcs).

	:param Curves:
	:type Curves: TColGeom_Array1OfBezierCurve
	:rtype: None
") Arcs;
		void Arcs(TColGeom_Array1OfBezierCurve & Curves);

		/****************** GeomConvert_BSplineCurveToBezierCurve ******************/
		%feature("compactdefaultargs") GeomConvert_BSplineCurveToBezierCurve;
		%feature("autodoc", "Computes all the data needed to convert the bspline curve basiscurve into a series of adjacent bezier arcs.

	:param BasisCurve:
	:type BasisCurve: Geom_BSplineCurve
	:rtype: None
") GeomConvert_BSplineCurveToBezierCurve;
		 GeomConvert_BSplineCurveToBezierCurve(const opencascade::handle<Geom_BSplineCurve> & BasisCurve);

		/****************** GeomConvert_BSplineCurveToBezierCurve ******************/
		%feature("compactdefaultargs") GeomConvert_BSplineCurveToBezierCurve;
		%feature("autodoc", "Computes all the data needed to convert the portion of the bspline curve basiscurve limited by the two parameter values u1 and u2 into a series of adjacent bezier arcs. the result consists of a series of basiscurve arcs limited by points corresponding to knot values of the curve. use the available interrogation functions to ascertain the number of computed bezier arcs, and then to construct each individual bezier curve (or all bezier curves). note: parametrictolerance is not used. raises domainerror if u1 or u2 are out of the parametric bounds of the basis curve [firstparameter, lastparameter]. the tolerance criterion is parametrictolerance. raised if abs (u2 - u1) <= parametrictolerance.

	:param BasisCurve:
	:type BasisCurve: Geom_BSplineCurve
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param ParametricTolerance:
	:type ParametricTolerance: float
	:rtype: None
") GeomConvert_BSplineCurveToBezierCurve;
		 GeomConvert_BSplineCurveToBezierCurve(const opencascade::handle<Geom_BSplineCurve> & BasisCurve, const Standard_Real U1, const Standard_Real U2, const Standard_Real ParametricTolerance);

		/****************** Knots ******************/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "This methode returns the bspline's knots associated to the converted arcs raised if the length of curves is not equal to nbarcs + 1.

	:param TKnots:
	:type TKnots: TColStd_Array1OfReal
	:rtype: None
") Knots;
		void Knots(TColStd_Array1OfReal & TKnots);

		/****************** NbArcs ******************/
		%feature("compactdefaultargs") NbArcs;
		%feature("autodoc", "Returns the number of beziercurve arcs. if at the creation time you have decomposed the basis curve between the parametric values ufirst, ulast the number of beziercurve arcs depends on the number of knots included inside the interval [ufirst, ulast]. if you have decomposed the whole basis b-spline curve the number of beziercurve arcs nbarcs is equal to the number of knots less one.

	:rtype: int
") NbArcs;
		Standard_Integer NbArcs();

};


%extend GeomConvert_BSplineCurveToBezierCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************
* class GeomConvert_BSplineSurfaceKnotSplitting *
************************************************/
class GeomConvert_BSplineSurfaceKnotSplitting {
	public:
		/****************** GeomConvert_BSplineSurfaceKnotSplitting ******************/
		%feature("compactdefaultargs") GeomConvert_BSplineSurfaceKnotSplitting;
		%feature("autodoc", "Determines the u- and v-isoparametric curves along which the bspline surface basissurface should be split in order to obtain patches with a degree of continuity equal to ucontinuityrange in the u parametric direction, and to vcontinuityrange in the v parametric direction. these isoparametric curves are defined by parameters, which are basissurface knot values in the u or v parametric direction. they are identified by indices in the basissurface knots table in the corresponding parametric direction. use the available interrogation functions to access computed values, followed by the global function splitbsplinesurface (provided by the package geomconvert) to split the surface. exceptions standard_rangeerror if ucontinuityrange or vcontinuityrange is less than zero.

	:param BasisSurface:
	:type BasisSurface: Geom_BSplineSurface
	:param UContinuityRange:
	:type UContinuityRange: int
	:param VContinuityRange:
	:type VContinuityRange: int
	:rtype: None
") GeomConvert_BSplineSurfaceKnotSplitting;
		 GeomConvert_BSplineSurfaceKnotSplitting(const opencascade::handle<Geom_BSplineSurface> & BasisSurface, const Standard_Integer UContinuityRange, const Standard_Integer VContinuityRange);

		/****************** NbUSplits ******************/
		%feature("compactdefaultargs") NbUSplits;
		%feature("autodoc", "Returns the number of u-isoparametric curves along which the analysed bspline surface should be split in order to obtain patches with the continuity required by this framework. the parameters which define these curves are knot values in the corresponding parametric direction. note that the four curves which bound the surface are counted among these splitting curves.

	:rtype: int
") NbUSplits;
		Standard_Integer NbUSplits();

		/****************** NbVSplits ******************/
		%feature("compactdefaultargs") NbVSplits;
		%feature("autodoc", "Returns the number of v-isoparametric curves along which the analysed bspline surface should be split in order to obtain patches with the continuity required by this framework. the parameters which define these curves are knot values in the corresponding parametric direction. note that the four curves which bound the surface are counted among these splitting curves.

	:rtype: int
") NbVSplits;
		Standard_Integer NbVSplits();

		/****************** Splitting ******************/
		%feature("compactdefaultargs") Splitting;
		%feature("autodoc", "Loads the usplit and vsplit tables with the split knots values computed in this framework. each value in these tables is an index in the knots table corresponding to the u or v parametric direction of the bspline surface analysed by this algorithm. the usplit and vsplit values are given in ascending order and comprise the indices of the knots which give the first and last isoparametric curves of the surface in the corresponding parametric direction. use two consecutive values from the usplit table and two consecutive values from the vsplit table as arguments of the global function splitbsplinesurface (provided by the package geomconvert) to split the surface. exceptions standard_dimensionerror if: - the array usplit was not created with the following bounds: - 1 , and - the number of split knots in the u parametric direction computed in this framework (as given by the function nbusplits); or - the array vsplit was not created with the following bounds: - 1 , and - the number of split knots in the v parametric direction computed in this framework (as given by the function nbvsplits).

	:param USplit:
	:type USplit: TColStd_Array1OfInteger
	:param VSplit:
	:type VSplit: TColStd_Array1OfInteger
	:rtype: None
") Splitting;
		void Splitting(TColStd_Array1OfInteger & USplit, TColStd_Array1OfInteger & VSplit);

		/****************** USplitValue ******************/
		%feature("compactdefaultargs") USplitValue;
		%feature("autodoc", "Returns the split knot of index uindex to the split knots table for the u parametric direction computed in this framework. the returned value is an index in the knots table relative to the u parametric direction of the bspline surface analysed by this algorithm. note: if uindex is equal to 1, or to the number of split knots for the u parametric direction computed in this framework, the corresponding knot gives the parameter of one of the bounding curves of the surface. exceptions standard_rangeerror if uindex is less than 1 or greater than the number of split knots for the u parametric direction computed in this framework.

	:param UIndex:
	:type UIndex: int
	:rtype: int
") USplitValue;
		Standard_Integer USplitValue(const Standard_Integer UIndex);

		/****************** VSplitValue ******************/
		%feature("compactdefaultargs") VSplitValue;
		%feature("autodoc", "Returns the split knot of index vindex to the split knots table for the v parametric direction computed in this framework. the returned value is an index in the knots table relative to the v parametric direction of the bspline surface analysed by this algorithm. note: if uindex is equal to 1, or to the number of split knots for the v parametric direction computed in this framework, the corresponding knot gives the parameter of one of the bounding curves of the surface. exceptions standard_rangeerror if vindex is less than 1 or greater than the number of split knots for the v parametric direction computed in this framework.

	:param VIndex:
	:type VIndex: int
	:rtype: int
") VSplitValue;
		Standard_Integer VSplitValue(const Standard_Integer VIndex);

};


%extend GeomConvert_BSplineSurfaceKnotSplitting {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************
* class GeomConvert_BSplineSurfaceToBezierSurface *
**************************************************/
class GeomConvert_BSplineSurfaceToBezierSurface {
	public:
		/****************** GeomConvert_BSplineSurfaceToBezierSurface ******************/
		%feature("compactdefaultargs") GeomConvert_BSplineSurfaceToBezierSurface;
		%feature("autodoc", "Computes all the data needed to convert - the bspline surface basissurface into a series of adjacent bezier surfaces. the result consists of a grid of basissurface patches limited by isoparametric curves corresponding to knot values, both in the u and v parametric directions of the surface. a row in the grid corresponds to a series of adjacent patches, all limited by the same two u-isoparametric curves. a column in the grid corresponds to a series of adjacent patches, all limited by the same two v-isoparametric curves. use the available interrogation functions to ascertain the number of computed bezier patches, and then to construct each individual bezier surface (or all bezier surfaces). note: parametrictolerance is not used.

	:param BasisSurface:
	:type BasisSurface: Geom_BSplineSurface
	:rtype: None
") GeomConvert_BSplineSurfaceToBezierSurface;
		 GeomConvert_BSplineSurfaceToBezierSurface(const opencascade::handle<Geom_BSplineSurface> & BasisSurface);

		/****************** GeomConvert_BSplineSurfaceToBezierSurface ******************/
		%feature("compactdefaultargs") GeomConvert_BSplineSurfaceToBezierSurface;
		%feature("autodoc", "Computes all the data needed to convert the patch of the bspline surface basissurface limited by the two parameter values u1 and u2 in the u parametric direction, and by the two parameter values v1 and v2 in the v parametric direction, into a series of adjacent bezier surfaces. the result consists of a grid of basissurface patches limited by isoparametric curves corresponding to knot values, both in the u and v parametric directions of the surface. a row in the grid corresponds to a series of adjacent patches, all limited by the same two u-isoparametric curves. a column in the grid corresponds to a series of adjacent patches, all limited by the same two v-isoparametric curves. use the available interrogation functions to ascertain the number of computed bezier patches, and then to construct each individual bezier surface (or all bezier surfaces). note: parametrictolerance is not used. raises domainerror if u1 or u2 or v1 or v2 are out of the parametric bounds of the basis surface [firstuknotindex, lastuknotindex] , [firstvknotindex, lastvknotindex] the tolerance criterion is parametrictolerance. raised if u2 - u1 <= parametrictolerance or v2 - v1 <= parametrictolerance.

	:param BasisSurface:
	:type BasisSurface: Geom_BSplineSurface
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param V1:
	:type V1: float
	:param V2:
	:type V2: float
	:param ParametricTolerance:
	:type ParametricTolerance: float
	:rtype: None
") GeomConvert_BSplineSurfaceToBezierSurface;
		 GeomConvert_BSplineSurfaceToBezierSurface(const opencascade::handle<Geom_BSplineSurface> & BasisSurface, const Standard_Real U1, const Standard_Real U2, const Standard_Real V1, const Standard_Real V2, const Standard_Real ParametricTolerance);

		/****************** NbUPatches ******************/
		%feature("compactdefaultargs") NbUPatches;
		%feature("autodoc", "Returns the number of bezier surfaces in the u direction. if at the creation time you have decomposed the basis surface between the parametric values ufirst, ulast the number of bezier surfaces in the u direction depends on the number of knots included inside the interval [ufirst, ulast]. if you have decomposed the whole basis b-spline surface the number of bezier surfaces nbupatches is equal to the number of uknots less one.

	:rtype: int
") NbUPatches;
		Standard_Integer NbUPatches();

		/****************** NbVPatches ******************/
		%feature("compactdefaultargs") NbVPatches;
		%feature("autodoc", "Returns the number of bezier surfaces in the v direction. if at the creation time you have decomposed the basis surface between the parametric values vfirst, vlast the number of bezier surfaces in the v direction depends on the number of knots included inside the interval [vfirst, vlast]. if you have decomposed the whole basis b-spline surface the number of bezier surfaces nbvpatches is equal to the number of vknots less one.

	:rtype: int
") NbVPatches;
		Standard_Integer NbVPatches();

		/****************** Patch ******************/
		%feature("compactdefaultargs") Patch;
		%feature("autodoc", "Constructs and returns the bezier surface of indices (uindex, vindex) to the patch grid computed on the bspline surface analyzed by this algorithm. this bezier surface has the same orientation as the bspline surface analyzed in this framework. uindex is an index common to a row in the patch grid. a row in the grid corresponds to a series of adjacent patches, all limited by the same two u-isoparametric curves of the surface. vindex is an index common to a column in the patch grid. a column in the grid corresponds to a series of adjacent patches, all limited by the same two v-isoparametric curves of the surface. exceptions standard_outofrange if: - uindex is less than 1 or greater than the number of rows in the patch grid computed on the bspline surface analyzed by this algorithm (as returned by the function nbupatches); or if - vindex is less than 1 or greater than the number of columns in the patch grid computed on the bspline surface analyzed by this algorithm (as returned by the function nbvpatches).

	:param UIndex:
	:type UIndex: int
	:param VIndex:
	:type VIndex: int
	:rtype: opencascade::handle<Geom_BezierSurface>
") Patch;
		opencascade::handle<Geom_BezierSurface> Patch(const Standard_Integer UIndex, const Standard_Integer VIndex);

		/****************** Patches ******************/
		%feature("compactdefaultargs") Patches;
		%feature("autodoc", "Constructs all the bezier surfaces whose data is computed by this algorithm, and loads them into the surfaces table. these bezier surfaces have the same orientation as the bspline surface analyzed in this framework. the surfaces array is organised in the same way as the patch grid computed on the bspline surface analyzed by this algorithm. a row in the array corresponds to a series of adjacent patches, all limited by the same two u-isoparametric curves of the surface. a column in the array corresponds to a series of adjacent patches, all limited by the same two v-isoparametric curves of the surface. exceptions standard_dimensionerror if the surfaces array was not created with the following bounds: - 1, and the number of adjacent patch series in the u parametric direction of the patch grid computed on the bspline surface, analyzed by this algorithm (as given by the function nbupatches) as row bounds, - 1, and the number of adjacent patch series in the v parametric direction of the patch grid computed on the bspline surface, analyzed by this algorithm (as given by the function nbvpatches) as column bounds.

	:param Surfaces:
	:type Surfaces: TColGeom_Array2OfBezierSurface
	:rtype: None
") Patches;
		void Patches(TColGeom_Array2OfBezierSurface & Surfaces);

		/****************** UKnots ******************/
		%feature("compactdefaultargs") UKnots;
		%feature("autodoc", "This methode returns the bspline's u-knots associated to the converted patches raised if the length of curves is not equal to nbupatches + 1.

	:param TKnots:
	:type TKnots: TColStd_Array1OfReal
	:rtype: None
") UKnots;
		void UKnots(TColStd_Array1OfReal & TKnots);

		/****************** VKnots ******************/
		%feature("compactdefaultargs") VKnots;
		%feature("autodoc", "This methode returns the bspline's v-knots associated to the converted patches raised if the length of curves is not equal to nbvpatches + 1.

	:param TKnots:
	:type TKnots: TColStd_Array1OfReal
	:rtype: None
") VKnots;
		void VKnots(TColStd_Array1OfReal & TKnots);

};


%extend GeomConvert_BSplineSurfaceToBezierSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************************
* class GeomConvert_CompBezierSurfacesToBSplineSurface *
*******************************************************/
class GeomConvert_CompBezierSurfacesToBSplineSurface {
	public:
		/****************** GeomConvert_CompBezierSurfacesToBSplineSurface ******************/
		%feature("compactdefaultargs") GeomConvert_CompBezierSurfacesToBSplineSurface;
		%feature("autodoc", "Computes all the data needed to build a 'c0' continuous bspline surface equivalent to the grid of adjacent non-rational bezier surfaces beziers. each surface in the beziers grid becomes a natural patch, limited by knots values, on the bspline surface whose data is computed. surfaces in the grid must satisfy the following conditions: - coincident bounding curves between two consecutive surfaces in a row of the beziers grid must be u-isoparametric bounding curves of these two surfaces. - coincident bounding curves between two consecutive surfaces in a column of the beziers grid must be v-isoparametric bounding curves of these two surfaces. the bspline surface whose data is computed has the following characteristics: - its degree in the u (respectively v) parametric direction is equal to that of the bezier surface which has the highest degree in the u (respectively v) parametric direction in the beziers grid. - it is a 'piecewise bezier' in both u and v parametric directions, i.e.: - the knots are regularly spaced in each parametric direction (i.e. the difference between two consecutive knots is a constant), and - all the multiplicities of the surface knots in a given parametric direction are equal to degree, which is the degree of the bspline surface in this parametric direction, except for the first and last knots for which the multiplicity is equal to degree + 1. - coincident bounding curves between two consecutive columns of bezier surfaces in the beziers grid become u-isoparametric curves, corresponding to knots values of the bspline surface. - coincident bounding curves between two consecutive rows of bezier surfaces in the beziers grid become v-isoparametric curves corresponding to knots values of the bspline surface. use the available consultation functions to access the computed data. this data may be used to construct the bspline surface. warning the surfaces in the beziers grid must be adjacent, i.e. two consecutive bezier surfaces in the grid (in a row or column) must have a coincident bounding curve. in addition, the location of the parameterization on each of these surfaces (i.e. the relative location of u and v isoparametric curves on the surface) is of importance with regard to the positioning of the surfaces in the beziers grid. care must be taken with respect to the above, as these properties are not checked and an error may occur if they are not satisfied. exceptions standard_notimplemented if one of the bezier surfaces of the beziers grid is rational.

	:param Beziers:
	:type Beziers: TColGeom_Array2OfBezierSurface
	:rtype: None
") GeomConvert_CompBezierSurfacesToBSplineSurface;
		 GeomConvert_CompBezierSurfacesToBSplineSurface(const TColGeom_Array2OfBezierSurface & Beziers);

		/****************** GeomConvert_CompBezierSurfacesToBSplineSurface ******************/
		%feature("compactdefaultargs") GeomConvert_CompBezierSurfacesToBSplineSurface;
		%feature("autodoc", "Build an ci uniform (rational) bspline surface the higest continuity ci is imposed, like the maximal deformation is lower than <tolerance>. warning: the continuity c0 is imposed without any check.

	:param Beziers:
	:type Beziers: TColGeom_Array2OfBezierSurface
	:param Tolerance:
	:type Tolerance: float
	:param RemoveKnots: default value is Standard_True
	:type RemoveKnots: bool
	:rtype: None
") GeomConvert_CompBezierSurfacesToBSplineSurface;
		 GeomConvert_CompBezierSurfacesToBSplineSurface(const TColGeom_Array2OfBezierSurface & Beziers, const Standard_Real Tolerance, const Standard_Boolean RemoveKnots = Standard_True);

		/****************** GeomConvert_CompBezierSurfacesToBSplineSurface ******************/
		%feature("compactdefaultargs") GeomConvert_CompBezierSurfacesToBSplineSurface;
		%feature("autodoc", "Computes all the data needed to construct a bspline surface equivalent to the adjacent non-rational bezier surfaces beziers grid. each surface in the beziers grid becomes a natural patch, limited by knots values, on the bspline surface whose data is computed. surfaces in the grid must satisfy the following conditions: - coincident bounding curves between two consecutive surfaces in a row of the beziers grid must be u-isoparametric bounding curves of these two surfaces. - coincident bounding curves between two consecutive surfaces in a column of the beziers grid must be v-isoparametric bounding curves of these two surfaces. the bspline surface whose data is computed has the following characteristics: - its degree in the u (respectively v) parametric direction is equal to that of the bezier surface which has the highest degree in the u (respectively v) parametric direction in the beziers grid. - coincident bounding curves between two consecutive columns of bezier surfaces in the beziers grid become u-isoparametric curves corresponding to knots values of the bspline surface. - coincident bounding curves between two consecutive rows of bezier surfaces in the beziers grid become v-isoparametric curves corresponding to knots values of the bspline surface. knots values of the bspline surface are given in the two tables: - uknots for the u parametric direction (which corresponds to the order of bezier surface columns in the beziers grid), and - vknots for the v parametric direction (which corresponds to the order of bezier surface rows in the beziers grid). the dimensions of uknots (respectively vknots) must be equal to the number of columns (respectively, rows) of the beziers grid, plus 1 . ucontinuity and vcontinuity, which are both defaulted to geomabs_c0, specify the required continuity on the bspline surface. if the required degree of continuity is greater than 0 in a given parametric direction, a deformation is applied locally on the initial surface (as defined by the beziers grid) to satisfy this condition. this local deformation is not applied however, if it is greater than tolerance (defaulted to 1.0 e-7). in such cases, the continuity condition is not satisfied, and the function isdone will return false. a small tolerance value prevents any modification of the surface and a large tolerance value 'smoothes' the surface. use the available consultation functions to access the computed data. this data may be used to construct the bspline surface. warning the surfaces in the beziers grid must be adjacent, i.e. two consecutive bezier surfaces in the grid (in a row or column) must have a coincident bounding curve. in addition, the location of the parameterization on each of these surfaces (i.e. the relative location of u and v isoparametric curves on the surface) is of importance with regard to the positioning of the surfaces in the beziers grid. care must be taken with respect to the above, as these properties are not checked and an error may occur if they are not satisfied. exceptions standard_dimensionmismatch: - if the number of knots in the uknots table (i.e. the length of the uknots array) is not equal to the number of columns of bezier surfaces in the beziers grid plus 1, or - if the number of knots in the vknots table (i.e. the length of the vknots array) is not equal to the number of rows of bezier surfaces in the beziers grid, plus 1. standard_constructionerror: - if ucontinuity and vcontinuity are not equal to one of the following values: geomabs_c0, geomabs_c1, geomabs_c2 and geomabs_c3; or - if the number of columns in the beziers grid is greater than 1, and the required degree of continuity in the u parametric direction is greater than that of the bezier surface with the highest degree in the u parametric direction (in the beziers grid), minus 1; or - if the number of rows in the beziers grid is greater than 1, and the required degree of continuity in the v parametric direction is greater than that of the bezier surface with the highest degree in the v parametric direction (in the beziers grid), minus 1 . standard_notimplemented if one of the bezier surfaces in the beziers grid is rational.

	:param Beziers:
	:type Beziers: TColGeom_Array2OfBezierSurface
	:param UKnots:
	:type UKnots: TColStd_Array1OfReal
	:param VKnots:
	:type VKnots: TColStd_Array1OfReal
	:param UContinuity: default value is GeomAbs_C0
	:type UContinuity: GeomAbs_Shape
	:param VContinuity: default value is GeomAbs_C0
	:type VContinuity: GeomAbs_Shape
	:param Tolerance: default value is 1.0e-4
	:type Tolerance: float
	:rtype: None
") GeomConvert_CompBezierSurfacesToBSplineSurface;
		 GeomConvert_CompBezierSurfacesToBSplineSurface(const TColGeom_Array2OfBezierSurface & Beziers, const TColStd_Array1OfReal & UKnots, const TColStd_Array1OfReal & VKnots, const GeomAbs_Shape UContinuity = GeomAbs_C0, const GeomAbs_Shape VContinuity = GeomAbs_C0, const Standard_Real Tolerance = 1.0e-4);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the conversion was successful. unless an exception was raised at the time of construction, the conversion of the bezier surface grid assigned to this algorithm is always carried out. isdone returns false if the constraints defined at the time of construction cannot be respected. this occurs when there is an incompatibility between a required degree of continuity on the bspline surface, and the maximum tolerance accepted for local deformations of the surface. in such a case the computed data does not satisfy all the initial constraints.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbUKnots ******************/
		%feature("compactdefaultargs") NbUKnots;
		%feature("autodoc", "Returns the number of knots in the u direction of the bspline surface whose data is computed in this framework.

	:rtype: int
") NbUKnots;
		Standard_Integer NbUKnots();

		/****************** NbUPoles ******************/
		%feature("compactdefaultargs") NbUPoles;
		%feature("autodoc", "Returns number of poles in the u direction of the bspline surface whose data is computed in this framework.

	:rtype: int
") NbUPoles;
		Standard_Integer NbUPoles();

		/****************** NbVKnots ******************/
		%feature("compactdefaultargs") NbVKnots;
		%feature("autodoc", "Returns the number of knots in the v direction of the bspline surface whose data is computed in this framework.

	:rtype: int
") NbVKnots;
		Standard_Integer NbVKnots();

		/****************** NbVPoles ******************/
		%feature("compactdefaultargs") NbVPoles;
		%feature("autodoc", "Returns the number of poles in the v direction of the bspline surface whose data is computed in this framework.

	:rtype: int
") NbVPoles;
		Standard_Integer NbVPoles();

		/****************** Poles ******************/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "Returns the table of poles of the bspline surface whose data is computed in this framework.

	:rtype: opencascade::handle<TColgp_HArray2OfPnt>
") Poles;
		const opencascade::handle<TColgp_HArray2OfPnt> & Poles();

		/****************** UDegree ******************/
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", "Returns the degree for the u parametric direction of the bspline surface whose data is computed in this framework.

	:rtype: int
") UDegree;
		Standard_Integer UDegree();

		/****************** UKnots ******************/
		%feature("compactdefaultargs") UKnots;
		%feature("autodoc", "Returns the knots table for the u parametric direction of the bspline surface whose data is computed in this framework.

	:rtype: opencascade::handle<TColStd_HArray1OfReal>
") UKnots;
		const opencascade::handle<TColStd_HArray1OfReal> & UKnots();

		/****************** UMultiplicities ******************/
		%feature("compactdefaultargs") UMultiplicities;
		%feature("autodoc", "Returns the multiplicities table for the u parametric direction of the knots of the bspline surface whose data is computed in this framework.

	:rtype: opencascade::handle<TColStd_HArray1OfInteger>
") UMultiplicities;
		const opencascade::handle<TColStd_HArray1OfInteger> & UMultiplicities();

		/****************** VDegree ******************/
		%feature("compactdefaultargs") VDegree;
		%feature("autodoc", "Returns the degree for the v parametric direction of the bspline surface whose data is computed in this framework.

	:rtype: int
") VDegree;
		Standard_Integer VDegree();

		/****************** VKnots ******************/
		%feature("compactdefaultargs") VKnots;
		%feature("autodoc", "Returns the knots table for the v parametric direction of the bspline surface whose data is computed in this framework.

	:rtype: opencascade::handle<TColStd_HArray1OfReal>
") VKnots;
		const opencascade::handle<TColStd_HArray1OfReal> & VKnots();

		/****************** VMultiplicities ******************/
		%feature("compactdefaultargs") VMultiplicities;
		%feature("autodoc", "-- returns the multiplicities table for the v parametric direction of the knots of the bspline surface whose data is computed in this framework.

	:rtype: opencascade::handle<TColStd_HArray1OfInteger>
") VMultiplicities;
		const opencascade::handle<TColStd_HArray1OfInteger> & VMultiplicities();

};


%extend GeomConvert_CompBezierSurfacesToBSplineSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class GeomConvert_CompCurveToBSplineCurve *
********************************************/
class GeomConvert_CompCurveToBSplineCurve {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Append a curve in the bspline return false if the curve is not g0 with the bsplinecurve. tolerance is used to check continuity and decrease multiplicity at the common knot until minm if minm = 0, the common knot can be removed //! withratio defines whether the resulting curve should have a uniform parameterization. setting withratio to standard_false may greatly decrease the speed of algorithms like cpnts_abscissapoint::advperform when applied to the resulting curve.

	:param NewCurve:
	:type NewCurve: Geom_BoundedCurve
	:param Tolerance:
	:type Tolerance: float
	:param After: default value is Standard_False
	:type After: bool
	:param WithRatio: default value is Standard_True
	:type WithRatio: bool
	:param MinM: default value is 0
	:type MinM: int
	:rtype: bool
") Add;
		Standard_Boolean Add(const opencascade::handle<Geom_BoundedCurve> & NewCurve, const Standard_Real Tolerance, const Standard_Boolean After = Standard_False, const Standard_Boolean WithRatio = Standard_True, const Standard_Integer MinM = 0);

		/****************** BSplineCurve ******************/
		%feature("compactdefaultargs") BSplineCurve;
		%feature("autodoc", "	:rtype: opencascade::handle<Geom_BSplineCurve>
") BSplineCurve;
		opencascade::handle<Geom_BSplineCurve> BSplineCurve();

		/****************** GeomConvert_CompCurveToBSplineCurve ******************/
		%feature("compactdefaultargs") GeomConvert_CompCurveToBSplineCurve;
		%feature("autodoc", "Initialize the algorithme - parameterisation is used to convert.

	:param Parameterisation: default value is Convert_TgtThetaOver2
	:type Parameterisation: Convert_ParameterisationType
	:rtype: None
") GeomConvert_CompCurveToBSplineCurve;
		 GeomConvert_CompCurveToBSplineCurve(const Convert_ParameterisationType Parameterisation = Convert_TgtThetaOver2);

		/****************** GeomConvert_CompCurveToBSplineCurve ******************/
		%feature("compactdefaultargs") GeomConvert_CompCurveToBSplineCurve;
		%feature("autodoc", "Initialize the algorithme with one curve - parameterisation is used to convert.

	:param BasisCurve:
	:type BasisCurve: Geom_BoundedCurve
	:param Parameterisation: default value is Convert_TgtThetaOver2
	:type Parameterisation: Convert_ParameterisationType
	:rtype: None
") GeomConvert_CompCurveToBSplineCurve;
		 GeomConvert_CompCurveToBSplineCurve(const opencascade::handle<Geom_BoundedCurve> & BasisCurve, const Convert_ParameterisationType Parameterisation = Convert_TgtThetaOver2);

};


%extend GeomConvert_CompCurveToBSplineCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */

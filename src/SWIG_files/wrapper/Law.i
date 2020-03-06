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
%define LAWDOCSTRING
"Law module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_law.html"
%enddef
%module (package="OCC.Core", docstring=LAWDOCSTRING) Law


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
#include<Law_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TColStd_module.hxx>
#include<Adaptor3d_module.hxx>
#include<GeomAbs_module.hxx>
#include<TColgp_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TColStd.i
%import Adaptor3d.i
%import GeomAbs.i
%import TColgp.i
/* public enums */
/* end public enums declaration */

/* handles */
%wrap_handle(Law_BSpline)
%wrap_handle(Law_Function)
%wrap_handle(Law_BSpFunc)
%wrap_handle(Law_Composite)
%wrap_handle(Law_Constant)
%wrap_handle(Law_Linear)
%wrap_handle(Law_Interpol)
%wrap_handle(Law_S)
/* end handles declaration */

/* templates */
%template(Law_Laws) NCollection_List<opencascade::handle<Law_Function>>;
%template(Law_ListIteratorOfLaws) NCollection_TListIterator<opencascade::handle<Law_Function>>;
/* end templates declaration */

/* typedefs */
typedef NCollection_List<opencascade::handle<Law_Function>> Law_Laws;
typedef NCollection_List<opencascade::handle<Law_Function>>::Iterator Law_ListIteratorOfLaws;
/* end typedefs declaration */

/************
* class Law *
************/
%rename(law) Law;
class Law {
	public:
		/****************** MixBnd ******************/
		%feature("compactdefaultargs") MixBnd;
		%feature("autodoc", "This algorithm searches the knot values corresponding to the splitting of a given b-spline law into several arcs with the same continuity. the continuity order is given at the construction time. builds a 1d bspline that is near from lin with null derivatives at the extremities.

	:param Lin:
	:type Lin: Law_Linear
	:rtype: opencascade::handle<Law_BSpFunc>
") MixBnd;
		static opencascade::handle<Law_BSpFunc> MixBnd(const opencascade::handle<Law_Linear> & Lin);

		/****************** MixBnd ******************/
		%feature("compactdefaultargs") MixBnd;
		%feature("autodoc", "Builds the poles of the 1d bspline that is near from lin with null derivatives at the extremities.

	:param Degree:
	:type Degree: int
	:param Knots:
	:type Knots: TColStd_Array1OfReal
	:param Mults:
	:type Mults: TColStd_Array1OfInteger
	:param Lin:
	:type Lin: Law_Linear
	:rtype: opencascade::handle<TColStd_HArray1OfReal>
") MixBnd;
		static opencascade::handle<TColStd_HArray1OfReal> MixBnd(const Standard_Integer Degree, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const opencascade::handle<Law_Linear> & Lin);

		/****************** MixTgt ******************/
		%feature("compactdefaultargs") MixTgt;
		%feature("autodoc", "Builds the poles of the 1d bspline that is null on the rigth side of knots(index) (on the left if nulontheright is false) and that is like a t*(1-t)(1-t) curve on the left side of knots(index) (on the rigth if nulontheright is false). the result curve is c1 with a derivative equal to 1. at first parameter (-1 at last parameter if nulontheright is false). warning: mults(index) must greater or equal to degree-1.

	:param Degree:
	:type Degree: int
	:param Knots:
	:type Knots: TColStd_Array1OfReal
	:param Mults:
	:type Mults: TColStd_Array1OfInteger
	:param NulOnTheRight:
	:type NulOnTheRight: bool
	:param Index:
	:type Index: int
	:rtype: opencascade::handle<TColStd_HArray1OfReal>
") MixTgt;
		static opencascade::handle<TColStd_HArray1OfReal> MixTgt(const Standard_Integer Degree, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Boolean NulOnTheRight, const Standard_Integer Index);

		/****************** Reparametrize ******************/
		%feature("compactdefaultargs") Reparametrize;
		%feature("autodoc", "Computes a 1 d curve to reparametrize a curve. its an interpolation of nbpoints points calculated at quasi constant abscissa.

	:param Curve:
	:type Curve: Adaptor3d_Curve
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param HasDF:
	:type HasDF: bool
	:param HasDL:
	:type HasDL: bool
	:param DFirst:
	:type DFirst: float
	:param DLast:
	:type DLast: float
	:param Rev:
	:type Rev: bool
	:param NbPoints:
	:type NbPoints: int
	:rtype: opencascade::handle<Law_BSpline>
") Reparametrize;
		static opencascade::handle<Law_BSpline> Reparametrize(const Adaptor3d_Curve & Curve, const Standard_Real First, const Standard_Real Last, const Standard_Boolean HasDF, const Standard_Boolean HasDL, const Standard_Real DFirst, const Standard_Real DLast, const Standard_Boolean Rev, const Standard_Integer NbPoints);

		/****************** Scale ******************/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "Computes a 1 d curve to scale a field of tangency. value is 1. for t = (first+last)/2 . if hasfirst value for t = first is vfirst (null derivative). if haslast value for t = last is vlast (null derivative). //! 1.  _ _/ \_ __/ \__ / vfirst ____/  vlast \____ first  last.

	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param HasF:
	:type HasF: bool
	:param HasL:
	:type HasL: bool
	:param VFirst:
	:type VFirst: float
	:param VLast:
	:type VLast: float
	:rtype: opencascade::handle<Law_BSpline>
") Scale;
		static opencascade::handle<Law_BSpline> Scale(const Standard_Real First, const Standard_Real Last, const Standard_Boolean HasF, const Standard_Boolean HasL, const Standard_Real VFirst, const Standard_Real VLast);

		/****************** ScaleCub ******************/
		%feature("compactdefaultargs") ScaleCub;
		%feature("autodoc", "	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param HasF:
	:type HasF: bool
	:param HasL:
	:type HasL: bool
	:param VFirst:
	:type VFirst: float
	:param VLast:
	:type VLast: float
	:rtype: opencascade::handle<Law_BSpline>
") ScaleCub;
		static opencascade::handle<Law_BSpline> ScaleCub(const Standard_Real First, const Standard_Real Last, const Standard_Boolean HasF, const Standard_Boolean HasL, const Standard_Real VFirst, const Standard_Real VLast);

};


%extend Law {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class Law_BSpline *
********************/
class Law_BSpline : public Standard_Transient {
	public:
		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Returns the global continuity of the curve : c0 : only geometric continuity, c1 : continuity of the first derivative all along the curve, c2 : continuity of the second derivative all along the curve, c3 : continuity of the third derivative all along the curve, cn : the order of continuity is infinite. for a b-spline curve of degree d if a knot ui has a multiplicity p the b-spline curve is only cd-p continuous at ui. so the global continuity of the curve can't be greater than cd-p where p is the maximum multiplicity of the interior knots. in the interior of a knot span the curve is infinitely continuously differentiable.

	:rtype: GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity();

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	:rtype: opencascade::handle<Law_BSpline>
") Copy;
		opencascade::handle<Law_BSpline> Copy();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	:param U:
	:type U: float
	:param P:
	:type P: float
	:rtype: None
") D0;
		void D0(const Standard_Real U, Standard_Real &OutValue);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	:param U:
	:type U: float
	:param P:
	:type P: float
	:param V1:
	:type V1: float
	:rtype: None
") D1;
		void D1(const Standard_Real U, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	:param U:
	:type U: float
	:param P:
	:type P: float
	:param V1:
	:type V1: float
	:param V2:
	:type V2: float
	:rtype: None
") D2;
		void D2(const Standard_Real U, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "	:param U:
	:type U: float
	:param P:
	:type P: float
	:param V1:
	:type V1: float
	:param V2:
	:type V2: float
	:param V3:
	:type V3: float
	:rtype: None
") D3;
		void D3(const Standard_Real U, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "The following functions computes the point of parameter u and the derivatives at this point on the b-spline curve arc defined between the knot fromk1 and the knot tok2. u can be out of bounds [knot (fromk1), knot (tok2)] but for the computation we only use the definition of the curve between these two knots. this method is useful to compute local derivative, if the order of continuity of the whole curve is not greater enough. inside the parametric domain knot (fromk1), knot (tok2) the evaluations are the same as if we consider the whole definition of the curve. of course the evaluations are different outside this parametric domain.

	:param U:
	:type U: float
	:param N:
	:type N: int
	:rtype: float
") DN;
		Standard_Real DN(const Standard_Real U, const Standard_Integer N);

		/****************** Degree ******************/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "Computation of value and derivatives.

	:rtype: int
") Degree;
		Standard_Integer Degree();

		/****************** EndPoint ******************/
		%feature("compactdefaultargs") EndPoint;
		%feature("autodoc", "Returns the last point of the curve. warnings : the last point of the curve is different from the last pole of the curve if the multiplicity of the last knot is lower than degree.

	:rtype: float
") EndPoint;
		Standard_Real EndPoint();

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Computes the parametric value of the start point of the curve. it is a knot value.

	:rtype: float
") FirstParameter;
		Standard_Real FirstParameter();

		/****************** FirstUKnotIndex ******************/
		%feature("compactdefaultargs") FirstUKnotIndex;
		%feature("autodoc", "For a b-spline curve the first parameter (which gives the start point of the curve) is a knot value but if the multiplicity of the first knot index is lower than degree + 1 it is not the first knot of the curve. this method computes the index of the knot corresponding to the first parameter.

	:rtype: int
") FirstUKnotIndex;
		Standard_Integer FirstUKnotIndex();

		/****************** IncreaseDegree ******************/
		%feature("compactdefaultargs") IncreaseDegree;
		%feature("autodoc", "Increase the degree to <degree>. nothing is done if <degree> is lower or equal to the current degree.

	:param Degree:
	:type Degree: int
	:rtype: None
") IncreaseDegree;
		void IncreaseDegree(const Standard_Integer Degree);

		/****************** IncreaseMultiplicity ******************/
		%feature("compactdefaultargs") IncreaseMultiplicity;
		%feature("autodoc", "Increases the multiplicity of the knot <index> to <m>. //! if <m> is lower or equal to the current multiplicity nothing is done. if <m> is higher than the degree the degree is used. if <index> is not in [firstuknotindex, lastuknotindex].

	:param Index:
	:type Index: int
	:param M:
	:type M: int
	:rtype: None
") IncreaseMultiplicity;
		void IncreaseMultiplicity(const Standard_Integer Index, const Standard_Integer M);

		/****************** IncreaseMultiplicity ******************/
		%feature("compactdefaultargs") IncreaseMultiplicity;
		%feature("autodoc", "Increases the multiplicities of the knots in [i1,i2] to <m>. //! for each knot if <m> is lower or equal to the current multiplicity nothing is done. if <m> is higher than the degree the degree is used. if <i1,i2> are not in [firstuknotindex, lastuknotindex].

	:param I1:
	:type I1: int
	:param I2:
	:type I2: int
	:param M:
	:type M: int
	:rtype: None
") IncreaseMultiplicity;
		void IncreaseMultiplicity(const Standard_Integer I1, const Standard_Integer I2, const Standard_Integer M);

		/****************** IncrementMultiplicity ******************/
		%feature("compactdefaultargs") IncrementMultiplicity;
		%feature("autodoc", "Increment the multiplicities of the knots in [i1,i2] by <m>. //! if <m> is not positive nithing is done. //! for each knot the resulting multiplicity is limited to the degree. if <i1,i2> are not in [firstuknotindex, lastuknotindex].

	:param I1:
	:type I1: int
	:param I2:
	:type I2: int
	:param M:
	:type M: int
	:rtype: None
") IncrementMultiplicity;
		void IncrementMultiplicity(const Standard_Integer I1, const Standard_Integer I2, const Standard_Integer M);

		/****************** InsertKnot ******************/
		%feature("compactdefaultargs") InsertKnot;
		%feature("autodoc", "Inserts a knot value in the sequence of knots. if <u> is an existing knot the multiplicity is increased by <m>. //! if u is not on the parameter range nothing is done. //! if the multiplicity is negative or null nothing is done. the new multiplicity is limited to the degree. //! the tolerance criterion for knots equality is the max of epsilon(u) and parametrictolerance.

	:param U:
	:type U: float
	:param M: default value is 1
	:type M: int
	:param ParametricTolerance: default value is 0.0
	:type ParametricTolerance: float
	:param Add: default value is Standard_True
	:type Add: bool
	:rtype: None
") InsertKnot;
		void InsertKnot(const Standard_Real U, const Standard_Integer M = 1, const Standard_Real ParametricTolerance = 0.0, const Standard_Boolean Add = Standard_True);

		/****************** InsertKnots ******************/
		%feature("compactdefaultargs") InsertKnots;
		%feature("autodoc", "Inserts a set of knots values in the sequence of knots. //! for each u = knots(i), m = mults(i) //! if <u> is an existing knot the multiplicity is increased by <m> if <add> is true, increased to <m> if <add> is false. //! if u is not on the parameter range nothing is done. //! if the multiplicity is negative or null nothing is done. the new multiplicity is limited to the degree. //! the tolerance criterion for knots equality is the max of epsilon(u) and parametrictolerance.

	:param Knots:
	:type Knots: TColStd_Array1OfReal
	:param Mults:
	:type Mults: TColStd_Array1OfInteger
	:param ParametricTolerance: default value is 0.0
	:type ParametricTolerance: float
	:param Add: default value is Standard_False
	:type Add: bool
	:rtype: None
") InsertKnots;
		void InsertKnots(const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Real ParametricTolerance = 0.0, const Standard_Boolean Add = Standard_False);

		/****************** IsCN ******************/
		%feature("compactdefaultargs") IsCN;
		%feature("autodoc", "Returns the continuity of the curve, the curve is at least c0. raised if n < 0.

	:param N:
	:type N: int
	:rtype: bool
") IsCN;
		Standard_Boolean IsCN(const Standard_Integer N);

		/****************** IsClosed ******************/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Returns true if the distance between the first point and the last point of the curve is lower or equal to resolution from package gp. warnings : the first and the last point can be different from the first pole and the last pole of the curve.

	:rtype: bool
") IsClosed;
		Standard_Boolean IsClosed();

		/****************** IsPeriodic ******************/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Returns true if the curve is periodic.

	:rtype: bool
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****************** IsRational ******************/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Returns true if the weights are not identical. the tolerance criterion is epsilon of the class real.

	:rtype: bool
") IsRational;
		Standard_Boolean IsRational();

		/****************** Knot ******************/
		%feature("compactdefaultargs") Knot;
		%feature("autodoc", "Returns the knot of range index. when there is a knot with a multiplicity greater than 1 the knot is not repeated. the method multiplicity can be used to get the multiplicity of the knot. raised if index < 1 or index > nbknots.

	:param Index:
	:type Index: int
	:rtype: float
") Knot;
		Standard_Real Knot(const Standard_Integer Index);

		/****************** KnotDistribution ******************/
		%feature("compactdefaultargs") KnotDistribution;
		%feature("autodoc", "Returns nonuniform or uniform or quasiuniform or piecewisebezier. if all the knots differ by a positive constant from the preceding knot the bspline curve can be : - uniform if all the knots are of multiplicity 1, - quasiuniform if all the knots are of multiplicity 1 except for the first and last knot which are of multiplicity degree + 1, - piecewisebezier if the first and last knots have multiplicity degree + 1 and if interior knots have multiplicity degree a piecewise bezier with only two knots is a beziercurve. else the curve is non uniform. the tolerance criterion is epsilon from class real.

	:rtype: GeomAbs_BSplKnotDistribution
") KnotDistribution;
		GeomAbs_BSplKnotDistribution KnotDistribution();

		/****************** KnotSequence ******************/
		%feature("compactdefaultargs") KnotSequence;
		%feature("autodoc", "Returns the knots sequence. in this sequence the knots with a multiplicity greater than 1 are repeated. example : k = {k1, k1, k1, k2, k3, k3, k4, k4, k4} //! raised if the length of k is not equal to nbpoles + degree + 1.

	:param K:
	:type K: TColStd_Array1OfReal
	:rtype: None
") KnotSequence;
		void KnotSequence(TColStd_Array1OfReal & K);

		/****************** Knots ******************/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "Returns the knot values of the b-spline curve; //! raised if the length of k is not equal to the number of knots.

	:param K:
	:type K: TColStd_Array1OfReal
	:rtype: None
") Knots;
		void Knots(TColStd_Array1OfReal & K);

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Computes the parametric value of the end point of the curve. it is a knot value.

	:rtype: float
") LastParameter;
		Standard_Real LastParameter();

		/****************** LastUKnotIndex ******************/
		%feature("compactdefaultargs") LastUKnotIndex;
		%feature("autodoc", "For a bspline curve the last parameter (which gives the end point of the curve) is a knot value but if the multiplicity of the last knot index is lower than degree + 1 it is not the last knot of the curve. this method computes the index of the knot corresponding to the last parameter.

	:rtype: int
") LastUKnotIndex;
		Standard_Integer LastUKnotIndex();

		/****************** Law_BSpline ******************/
		%feature("compactdefaultargs") Law_BSpline;
		%feature("autodoc", "Creates a non-rational b_spline curve on the basis <knots, multiplicities> of degree <degree>.

	:param Poles:
	:type Poles: TColStd_Array1OfReal
	:param Knots:
	:type Knots: TColStd_Array1OfReal
	:param Multiplicities:
	:type Multiplicities: TColStd_Array1OfInteger
	:param Degree:
	:type Degree: int
	:param Periodic: default value is Standard_False
	:type Periodic: bool
	:rtype: None
") Law_BSpline;
		 Law_BSpline(const TColStd_Array1OfReal & Poles, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Multiplicities, const Standard_Integer Degree, const Standard_Boolean Periodic = Standard_False);

		/****************** Law_BSpline ******************/
		%feature("compactdefaultargs") Law_BSpline;
		%feature("autodoc", "Creates a rational b_spline curve on the basis <knots, multiplicities> of degree <degree>.

	:param Poles:
	:type Poles: TColStd_Array1OfReal
	:param Weights:
	:type Weights: TColStd_Array1OfReal
	:param Knots:
	:type Knots: TColStd_Array1OfReal
	:param Multiplicities:
	:type Multiplicities: TColStd_Array1OfInteger
	:param Degree:
	:type Degree: int
	:param Periodic: default value is Standard_False
	:type Periodic: bool
	:rtype: None
") Law_BSpline;
		 Law_BSpline(const TColStd_Array1OfReal & Poles, const TColStd_Array1OfReal & Weights, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Multiplicities, const Standard_Integer Degree, const Standard_Boolean Periodic = Standard_False);

		/****************** LocalD0 ******************/
		%feature("compactdefaultargs") LocalD0;
		%feature("autodoc", "	:param U:
	:type U: float
	:param FromK1:
	:type FromK1: int
	:param ToK2:
	:type ToK2: int
	:param P:
	:type P: float
	:rtype: None
") LocalD0;
		void LocalD0(const Standard_Real U, const Standard_Integer FromK1, const Standard_Integer ToK2, Standard_Real &OutValue);

		/****************** LocalD1 ******************/
		%feature("compactdefaultargs") LocalD1;
		%feature("autodoc", "	:param U:
	:type U: float
	:param FromK1:
	:type FromK1: int
	:param ToK2:
	:type ToK2: int
	:param P:
	:type P: float
	:param V1:
	:type V1: float
	:rtype: None
") LocalD1;
		void LocalD1(const Standard_Real U, const Standard_Integer FromK1, const Standard_Integer ToK2, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** LocalD2 ******************/
		%feature("compactdefaultargs") LocalD2;
		%feature("autodoc", "	:param U:
	:type U: float
	:param FromK1:
	:type FromK1: int
	:param ToK2:
	:type ToK2: int
	:param P:
	:type P: float
	:param V1:
	:type V1: float
	:param V2:
	:type V2: float
	:rtype: None
") LocalD2;
		void LocalD2(const Standard_Real U, const Standard_Integer FromK1, const Standard_Integer ToK2, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** LocalD3 ******************/
		%feature("compactdefaultargs") LocalD3;
		%feature("autodoc", "	:param U:
	:type U: float
	:param FromK1:
	:type FromK1: int
	:param ToK2:
	:type ToK2: int
	:param P:
	:type P: float
	:param V1:
	:type V1: float
	:param V2:
	:type V2: float
	:param V3:
	:type V3: float
	:rtype: None
") LocalD3;
		void LocalD3(const Standard_Real U, const Standard_Integer FromK1, const Standard_Integer ToK2, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** LocalDN ******************/
		%feature("compactdefaultargs") LocalDN;
		%feature("autodoc", "	:param U:
	:type U: float
	:param FromK1:
	:type FromK1: int
	:param ToK2:
	:type ToK2: int
	:param N:
	:type N: int
	:rtype: float
") LocalDN;
		Standard_Real LocalDN(const Standard_Real U, const Standard_Integer FromK1, const Standard_Integer ToK2, const Standard_Integer N);

		/****************** LocalValue ******************/
		%feature("compactdefaultargs") LocalValue;
		%feature("autodoc", "	:param U:
	:type U: float
	:param FromK1:
	:type FromK1: int
	:param ToK2:
	:type ToK2: int
	:rtype: float
") LocalValue;
		Standard_Real LocalValue(const Standard_Real U, const Standard_Integer FromK1, const Standard_Integer ToK2);

		/****************** LocateU ******************/
		%feature("compactdefaultargs") LocateU;
		%feature("autodoc", "Locates the parametric value u in the sequence of knots. if 'withknotrepetition' is true we consider the knot's representation with repetition of multiple knot value, otherwise we consider the knot's representation with no repetition of multiple knot values. knots (i1) <= u <= knots (i2) . if i1 = i2 u is a knot value (the tolerance criterion parametrictolerance is used). . if i1 < 1 => u < knots (1) - abs(parametrictolerance) . if i2 > nbknots => u > knots (nbknots) + abs(parametrictolerance).

	:param U:
	:type U: float
	:param ParametricTolerance:
	:type ParametricTolerance: float
	:param I1:
	:type I1: int
	:param I2:
	:type I2: int
	:param WithKnotRepetition: default value is Standard_False
	:type WithKnotRepetition: bool
	:rtype: None
") LocateU;
		void LocateU(const Standard_Real U, const Standard_Real ParametricTolerance, Standard_Integer &OutValue, Standard_Integer &OutValue, const Standard_Boolean WithKnotRepetition = Standard_False);

		/****************** MaxDegree ******************/
		%feature("compactdefaultargs") MaxDegree;
		%feature("autodoc", "Returns the value of the maximum degree of the normalized b-spline basis functions in this package.

	:rtype: int
") MaxDegree;
		static Standard_Integer MaxDegree();

		/****************** MovePointAndTangent ******************/
		%feature("compactdefaultargs") MovePointAndTangent;
		%feature("autodoc", "Changes the value of the law at parameter u to newvalue. and makes its derivative at u be derivative. startingcondition = -1 means first can move endingcondition = -1 means last point can move startingcondition = 0 means the first point cannot move endingcondition = 0 means the last point cannot move startingcondition = 1 means the first point and tangent cannot move endingcondition = 1 means the last point and tangent cannot move and so forth errorstatus != 0 means that there are not enought degree of freedom with the constrain to deform the curve accordingly.

	:param U:
	:type U: float
	:param NewValue:
	:type NewValue: float
	:param Derivative:
	:type Derivative: float
	:param Tolerance:
	:type Tolerance: float
	:param StartingCondition:
	:type StartingCondition: int
	:param EndingCondition:
	:type EndingCondition: int
	:param ErrorStatus:
	:type ErrorStatus: int
	:rtype: None
") MovePointAndTangent;
		void MovePointAndTangent(const Standard_Real U, const Standard_Real NewValue, const Standard_Real Derivative, const Standard_Real Tolerance, const Standard_Integer StartingCondition, const Standard_Integer EndingCondition, Standard_Integer &OutValue);

		/****************** Multiplicities ******************/
		%feature("compactdefaultargs") Multiplicities;
		%feature("autodoc", "Returns the multiplicity of the knots of the curve. //! raised if the length of m is not equal to nbknots.

	:param M:
	:type M: TColStd_Array1OfInteger
	:rtype: None
") Multiplicities;
		void Multiplicities(TColStd_Array1OfInteger & M);

		/****************** Multiplicity ******************/
		%feature("compactdefaultargs") Multiplicity;
		%feature("autodoc", "Returns the multiplicity of the knots of range index. raised if index < 1 or index > nbknots.

	:param Index:
	:type Index: int
	:rtype: int
") Multiplicity;
		Standard_Integer Multiplicity(const Standard_Integer Index);

		/****************** NbKnots ******************/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "Returns the number of knots. this method returns the number of knot without repetition of multiple knots.

	:rtype: int
") NbKnots;
		Standard_Integer NbKnots();

		/****************** NbPoles ******************/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "Returns the number of poles.

	:rtype: int
") NbPoles;
		Standard_Integer NbPoles();

		/****************** PeriodicNormalization ******************/
		%feature("compactdefaultargs") PeriodicNormalization;
		%feature("autodoc", "Returns the parameter normalized within the period if the curve is periodic : otherwise does not do anything.

	:param U:
	:type U: float
	:rtype: None
") PeriodicNormalization;
		void PeriodicNormalization(Standard_Real &OutValue);

		/****************** Pole ******************/
		%feature("compactdefaultargs") Pole;
		%feature("autodoc", "Returns the pole of range index. raised if index < 1 or index > nbpoles.

	:param Index:
	:type Index: int
	:rtype: float
") Pole;
		Standard_Real Pole(const Standard_Integer Index);

		/****************** Poles ******************/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "Returns the poles of the b-spline curve; //! raised if the length of p is not equal to the number of poles.

	:param P:
	:type P: TColStd_Array1OfReal
	:rtype: None
") Poles;
		void Poles(TColStd_Array1OfReal & P);

		/****************** RemoveKnot ******************/
		%feature("compactdefaultargs") RemoveKnot;
		%feature("autodoc", "Decrement the knots multiplicity to <m>. if m is 0 the knot is removed. the poles sequence is modified. //! as there are two ways to compute the new poles the average is computed if the distance is lower than the <tolerance>, else false is returned. //! a low tolerance is used to prevent the modification of the curve. //! a high tolerance is used to 'smooth' the curve. //! raised if index is not in the range [firstuknotindex, lastuknotindex] pole insertion and pole removing this operation is limited to the uniform or quasiuniform bsplinecurve. the knot values are modified . if the bspline is nonuniform or piecewise bezier an exception construction error is raised.

	:param Index:
	:type Index: int
	:param M:
	:type M: int
	:param Tolerance:
	:type Tolerance: float
	:rtype: bool
") RemoveKnot;
		Standard_Boolean RemoveKnot(const Standard_Integer Index, const Standard_Integer M, const Standard_Real Tolerance);

		/****************** Resolution ******************/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "Given tolerance3d returns utolerance such that if f(t) is the curve we have | t1 - t0| < utolerance ===> |f(t1) - f(t0)| < tolerance3d.

	:param Tolerance3D:
	:type Tolerance3D: float
	:param UTolerance:
	:type UTolerance: float
	:rtype: None
") Resolution;
		void Resolution(const Standard_Real Tolerance3D, Standard_Real &OutValue);

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Changes the direction of parametrization of <self>. the knot sequence is modified, the firstparameter and the lastparameter are not modified. the startpoint of the initial curve becomes the endpoint of the reversed curve and the endpoint of the initial curve becomes the startpoint of the reversed curve.

	:rtype: None
") Reverse;
		void Reverse();

		/****************** ReversedParameter ******************/
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", "Returns the parameter on the reversed curve for the point of parameter u on <self>. //! returns ufirst + ulast - u.

	:param U:
	:type U: float
	:rtype: float
") ReversedParameter;
		Standard_Real ReversedParameter(const Standard_Real U);

		/****************** Segment ******************/
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "Segments the curve between u1 and u2. the control points are modified, the first and the last point are not the same. warnings : even if <self> is not closed it can become closed after the segmentation for example if u1 or u2 are out of the bounds of the curve <self> or if the curve makes loop. after the segmentation the length of a curve can be null. raises if u2 < u1.

	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:rtype: None
") Segment;
		void Segment(const Standard_Real U1, const Standard_Real U2);

		/****************** SetKnot ******************/
		%feature("compactdefaultargs") SetKnot;
		%feature("autodoc", "Changes the knot of range index. the multiplicity of the knot is not modified. raised if k >= knots(index+1) or k <= knots(index-1). raised if index < 1 || index > nbknots.

	:param Index:
	:type Index: int
	:param K:
	:type K: float
	:rtype: None
") SetKnot;
		void SetKnot(const Standard_Integer Index, const Standard_Real K);

		/****************** SetKnot ******************/
		%feature("compactdefaultargs") SetKnot;
		%feature("autodoc", "Changes the knot of range index with its multiplicity. you can increase the multiplicity of a knot but it is not allowed to decrease the multiplicity of an existing knot. //! raised if k >= knots(index+1) or k <= knots(index-1). raised if m is greater than degree or lower than the previous multiplicity of knot of range index. raised if index < 1 || index > nbknots.

	:param Index:
	:type Index: int
	:param K:
	:type K: float
	:param M:
	:type M: int
	:rtype: None
") SetKnot;
		void SetKnot(const Standard_Integer Index, const Standard_Real K, const Standard_Integer M);

		/****************** SetKnots ******************/
		%feature("compactdefaultargs") SetKnots;
		%feature("autodoc", "Changes all the knots of the curve the multiplicity of the knots are not modified. //! raised if there is an index such that k (index+1) <= k (index). //! raised if k.lower() < 1 or k.upper() > nbknots.

	:param K:
	:type K: TColStd_Array1OfReal
	:rtype: None
") SetKnots;
		void SetKnots(const TColStd_Array1OfReal & K);

		/****************** SetNotPeriodic ******************/
		%feature("compactdefaultargs") SetNotPeriodic;
		%feature("autodoc", "Makes a non periodic curve. if the curve was non periodic the curve is not modified.

	:rtype: None
") SetNotPeriodic;
		void SetNotPeriodic();

		/****************** SetOrigin ******************/
		%feature("compactdefaultargs") SetOrigin;
		%feature("autodoc", "Set the origin of a periodic curve at knot(index) knotvector and poles are modified. raised if the curve is not periodic raised if index not in the range [firstuknotindex , lastuknotindex].

	:param Index:
	:type Index: int
	:rtype: None
") SetOrigin;
		void SetOrigin(const Standard_Integer Index);

		/****************** SetPeriodic ******************/
		%feature("compactdefaultargs") SetPeriodic;
		%feature("autodoc", "Makes a closed b-spline into a periodic curve. the curve is periodic if the knot sequence is periodic and if the curve is closed (the tolerance criterion is resolution from gp). the period t is equal to knot(lastuknotindex) - knot(firstuknotindex). a periodic b-spline can be uniform or not. raised if the curve is not closed.

	:rtype: None
") SetPeriodic;
		void SetPeriodic();

		/****************** SetPole ******************/
		%feature("compactdefaultargs") SetPole;
		%feature("autodoc", "Substitutes the pole of range index with p. //! raised if index < 1 || index > nbpoles.

	:param Index:
	:type Index: int
	:param P:
	:type P: float
	:rtype: None
") SetPole;
		void SetPole(const Standard_Integer Index, const Standard_Real P);

		/****************** SetPole ******************/
		%feature("compactdefaultargs") SetPole;
		%feature("autodoc", "Substitutes the pole and the weight of range index. if the curve <self> is not rational it can become rational if the curve was rational it can become non rational //! raised if index < 1 || index > nbpoles raised if weight <= 0.0.

	:param Index:
	:type Index: int
	:param P:
	:type P: float
	:param Weight:
	:type Weight: float
	:rtype: None
") SetPole;
		void SetPole(const Standard_Integer Index, const Standard_Real P, const Standard_Real Weight);

		/****************** SetWeight ******************/
		%feature("compactdefaultargs") SetWeight;
		%feature("autodoc", "Changes the weight for the pole of range index. if the curve was non rational it can become rational. if the curve was rational it can become non rational. //! raised if index < 1 || index > nbpoles raised if weight <= 0.0.

	:param Index:
	:type Index: int
	:param Weight:
	:type Weight: float
	:rtype: None
") SetWeight;
		void SetWeight(const Standard_Integer Index, const Standard_Real Weight);

		/****************** StartPoint ******************/
		%feature("compactdefaultargs") StartPoint;
		%feature("autodoc", "Returns the start point of the curve. warnings : this point is different from the first pole of the curve if the multiplicity of the first knot is lower than degree.

	:rtype: float
") StartPoint;
		Standard_Real StartPoint();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param U:
	:type U: float
	:rtype: float
") Value;
		Standard_Real Value(const Standard_Real U);

		/****************** Weight ******************/
		%feature("compactdefaultargs") Weight;
		%feature("autodoc", "Returns the weight of the pole of range index . raised if index < 1 or index > nbpoles.

	:param Index:
	:type Index: int
	:rtype: float
") Weight;
		Standard_Real Weight(const Standard_Integer Index);

		/****************** Weights ******************/
		%feature("compactdefaultargs") Weights;
		%feature("autodoc", "Returns the weights of the b-spline curve; //! raised if the length of w is not equal to nbpoles.

	:param W:
	:type W: TColStd_Array1OfReal
	:rtype: None
") Weights;
		void Weights(TColStd_Array1OfReal & W);

};


%make_alias(Law_BSpline)

%extend Law_BSpline {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class Law_BSplineKnotSplitting *
*********************************/
class Law_BSplineKnotSplitting {
	public:
		/****************** Law_BSplineKnotSplitting ******************/
		%feature("compactdefaultargs") Law_BSplineKnotSplitting;
		%feature("autodoc", "Locates the knot values which correspond to the segmentation of the curve into arcs with a continuity equal to continuityrange. //! raised if continuityrange is not greater or equal zero.

	:param BasisLaw:
	:type BasisLaw: Law_BSpline
	:param ContinuityRange:
	:type ContinuityRange: int
	:rtype: None
") Law_BSplineKnotSplitting;
		 Law_BSplineKnotSplitting(const opencascade::handle<Law_BSpline> & BasisLaw, const Standard_Integer ContinuityRange);

		/****************** NbSplits ******************/
		%feature("compactdefaultargs") NbSplits;
		%feature("autodoc", "Returns the number of knots corresponding to the splitting.

	:rtype: int
") NbSplits;
		Standard_Integer NbSplits();

		/****************** SplitValue ******************/
		%feature("compactdefaultargs") SplitValue;
		%feature("autodoc", "Returns the index of the knot corresponding to the splitting of range index. //! raised if index < 1 or index > nbsplits.

	:param Index:
	:type Index: int
	:rtype: int
") SplitValue;
		Standard_Integer SplitValue(const Standard_Integer Index);

		/****************** Splitting ******************/
		%feature("compactdefaultargs") Splitting;
		%feature("autodoc", "Returns the indexes of the bspline curve knots corresponding to the splitting. //! raised if the length of splitvalues is not equal to nbsplit.

	:param SplitValues:
	:type SplitValues: TColStd_Array1OfInteger
	:rtype: None
") Splitting;
		void Splitting(TColStd_Array1OfInteger & SplitValues);

};


%extend Law_BSplineKnotSplitting {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class Law_Function *
*********************/
%nodefaultctor Law_Function;
class Law_Function : public Standard_Transient {
	public:
		/****************** Bounds ******************/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "Returns the parametric bounds of the function.

	:param PFirst:
	:type PFirst: float
	:param PLast:
	:type PLast: float
	:rtype: None
") Bounds;
		virtual void Bounds(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "	:rtype: GeomAbs_Shape
") Continuity;
		virtual GeomAbs_Shape Continuity();

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Returns the value f and the first derivative d of the function at the point of parameter x.

	:param X:
	:type X: float
	:param F:
	:type F: float
	:param D:
	:type D: float
	:rtype: None
") D1;
		virtual void D1(const Standard_Real X, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Returns the value, first and seconde derivatives at parameter x.

	:param X:
	:type X: float
	:param F:
	:type F: float
	:param D:
	:type D: float
	:param D2:
	:type D2: float
	:rtype: None
") D2;
		virtual void D2(const Standard_Real X, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Intervals ******************/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "Stores in <t> the parameters bounding the intervals of continuity <s>. //! the array must provide enough room to accomodate for the parameters. i.e. t.length() > nbintervals().

	:param T:
	:type T: TColStd_Array1OfReal
	:param S:
	:type S: GeomAbs_Shape
	:rtype: None
") Intervals;
		virtual void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Returns the number of intervals for continuity <s>. may be one if continuity(me) >= <s>.

	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		virtual Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****************** Trim ******************/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "Returns a law equivalent of <self> between parameters <first> and <last>. <tol> is used to test for 3d points confusion. it is usfule to determines the derivatives in these values <first> and <last> if the law is not cn.

	:param PFirst:
	:type PFirst: float
	:param PLast:
	:type PLast: float
	:param Tol:
	:type Tol: float
	:rtype: opencascade::handle<Law_Function>
") Trim;
		virtual opencascade::handle<Law_Function> Trim(const Standard_Real PFirst, const Standard_Real PLast, const Standard_Real Tol);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the value of the function at the point of parameter x.

	:param X:
	:type X: float
	:rtype: float
") Value;
		virtual Standard_Real Value(const Standard_Real X);

};


%make_alias(Law_Function)

%extend Law_Function {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class Law_Interpolate *
************************/
class Law_Interpolate {
	public:
		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "	:rtype: opencascade::handle<Law_BSpline>
") Curve;
		const opencascade::handle<Law_BSpline> & Curve();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Law_Interpolate ******************/
		%feature("compactdefaultargs") Law_Interpolate;
		%feature("autodoc", "Tolerance is to check if the points are not too close to one an other. it is also used to check if the tangent vector is not too small. there should be at least 2 points. if periodicflag is true then the curve will be periodic be periodic.

	:param Points:
	:type Points: TColStd_HArray1OfReal
	:param PeriodicFlag:
	:type PeriodicFlag: bool
	:param Tolerance:
	:type Tolerance: float
	:rtype: None
") Law_Interpolate;
		 Law_Interpolate(const opencascade::handle<TColStd_HArray1OfReal> & Points, const Standard_Boolean PeriodicFlag, const Standard_Real Tolerance);

		/****************** Law_Interpolate ******************/
		%feature("compactdefaultargs") Law_Interpolate;
		%feature("autodoc", "Tolerance is to check if the points are not too close to one an other. it is also used to check if the tangent vector is not too small. there should be at least 2 points. if periodicflag is true then the curve will be periodic be periodic.

	:param Points:
	:type Points: TColStd_HArray1OfReal
	:param Parameters:
	:type Parameters: TColStd_HArray1OfReal
	:param PeriodicFlag:
	:type PeriodicFlag: bool
	:param Tolerance:
	:type Tolerance: float
	:rtype: None
") Law_Interpolate;
		 Law_Interpolate(const opencascade::handle<TColStd_HArray1OfReal> & Points, const opencascade::handle<TColStd_HArray1OfReal> & Parameters, const Standard_Boolean PeriodicFlag, const Standard_Real Tolerance);

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "Loads initial and final tangents if any.

	:param InitialTangent:
	:type InitialTangent: float
	:param FinalTangent:
	:type FinalTangent: float
	:rtype: None
") Load;
		void Load(const Standard_Real InitialTangent, const Standard_Real FinalTangent);

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "Loads the tangents. we should have as many tangents as they are points in the array if tangentflags.value(i) is standard_true use the tangent tangents.value(i) otherwise the tangent is not constrained.

	:param Tangents:
	:type Tangents: TColStd_Array1OfReal
	:param TangentFlags:
	:type TangentFlags: TColStd_HArray1OfBoolean
	:rtype: None
") Load;
		void Load(const TColStd_Array1OfReal & Tangents, const opencascade::handle<TColStd_HArray1OfBoolean> & TangentFlags);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Makes the interpolation.

	:rtype: None
") Perform;
		void Perform();

};


%extend Law_Interpolate {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class Law_BSpFunc *
********************/
class Law_BSpFunc : public Law_Function {
	public:
		/****************** Bounds ******************/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "	:param PFirst:
	:type PFirst: float
	:param PLast:
	:type PLast: float
	:rtype: None
") Bounds;
		void Bounds(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "	:rtype: GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity();

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "	:rtype: opencascade::handle<Law_BSpline>
") Curve;
		opencascade::handle<Law_BSpline> Curve();

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	:param X:
	:type X: float
	:param F:
	:type F: float
	:param D:
	:type D: float
	:rtype: None
") D1;
		void D1(const Standard_Real X, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	:param X:
	:type X: float
	:param F:
	:type F: float
	:param D:
	:type D: float
	:param D2:
	:type D2: float
	:rtype: None
") D2;
		void D2(const Standard_Real X, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Intervals ******************/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "Stores in <t> the parameters bounding the intervals of continuity <s>. //! the array must provide enough room to accomodate for the parameters. i.e. t.length() > nbintervals().

	:param T:
	:type T: TColStd_Array1OfReal
	:param S:
	:type S: GeomAbs_Shape
	:rtype: None
") Intervals;
		void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** Law_BSpFunc ******************/
		%feature("compactdefaultargs") Law_BSpFunc;
		%feature("autodoc", "	:rtype: None
") Law_BSpFunc;
		 Law_BSpFunc();

		/****************** Law_BSpFunc ******************/
		%feature("compactdefaultargs") Law_BSpFunc;
		%feature("autodoc", "	:param C:
	:type C: Law_BSpline
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:rtype: None
") Law_BSpFunc;
		 Law_BSpFunc(const opencascade::handle<Law_BSpline> & C, const Standard_Real First, const Standard_Real Last);

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Returns the number of intervals for continuity <s>. may be one if continuity(me) >= <s>.

	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****************** SetCurve ******************/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "	:param C:
	:type C: Law_BSpline
	:rtype: None
") SetCurve;
		void SetCurve(const opencascade::handle<Law_BSpline> & C);

		/****************** Trim ******************/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "Returns a law equivalent of <self> between parameters <first> and <last>. <tol> is used to test for 3d points confusion. it is usfule to determines the derivatives in these values <first> and <last> if the law is not cn.

	:param PFirst:
	:type PFirst: float
	:param PLast:
	:type PLast: float
	:param Tol:
	:type Tol: float
	:rtype: opencascade::handle<Law_Function>
") Trim;
		opencascade::handle<Law_Function> Trim(const Standard_Real PFirst, const Standard_Real PLast, const Standard_Real Tol);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param X:
	:type X: float
	:rtype: float
") Value;
		Standard_Real Value(const Standard_Real X);

};


%make_alias(Law_BSpFunc)

%extend Law_BSpFunc {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class Law_Composite *
**********************/
class Law_Composite : public Law_Function {
	public:
		/****************** Bounds ******************/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "Returns the parametric bounds of the function.

	:param PFirst:
	:type PFirst: float
	:param PLast:
	:type PLast: float
	:rtype: None
") Bounds;
		void Bounds(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** ChangeElementaryLaw ******************/
		%feature("compactdefaultargs") ChangeElementaryLaw;
		%feature("autodoc", "Returns the elementary function of the composite used to compute at parameter w.

	:param W:
	:type W: float
	:rtype: opencascade::handle<Law_Function>
") ChangeElementaryLaw;
		opencascade::handle<Law_Function> & ChangeElementaryLaw(const Standard_Real W);

		/****************** ChangeLaws ******************/
		%feature("compactdefaultargs") ChangeLaws;
		%feature("autodoc", "	:rtype: Law_Laws
") ChangeLaws;
		Law_Laws & ChangeLaws();

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "	:rtype: GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity();

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Returns the value and the first derivative at parameter x.

	:param X:
	:type X: float
	:param F:
	:type F: float
	:param D:
	:type D: float
	:rtype: None
") D1;
		void D1(const Standard_Real X, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Returns the value, first and second derivatives at parameter x.

	:param X:
	:type X: float
	:param F:
	:type F: float
	:param D:
	:type D: float
	:param D2:
	:type D2: float
	:rtype: None
") D2;
		void D2(const Standard_Real X, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Intervals ******************/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "Stores in <t> the parameters bounding the intervals of continuity <s>. //! the array must provide enough room to accomodate for the parameters. i.e. t.length() > nbintervals().

	:param T:
	:type T: TColStd_Array1OfReal
	:param S:
	:type S: GeomAbs_Shape
	:rtype: None
") Intervals;
		void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsPeriodic ******************/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "	:rtype: bool
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****************** Law_Composite ******************/
		%feature("compactdefaultargs") Law_Composite;
		%feature("autodoc", "Construct an empty law.

	:rtype: None
") Law_Composite;
		 Law_Composite();

		/****************** Law_Composite ******************/
		%feature("compactdefaultargs") Law_Composite;
		%feature("autodoc", "Construct an empty, trimed law.

	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Law_Composite;
		 Law_Composite(const Standard_Real First, const Standard_Real Last, const Standard_Real Tol);

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Returns the number of intervals for continuity <s>. may be one if continuity(me) >= <s>.

	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****************** SetPeriodic ******************/
		%feature("compactdefaultargs") SetPeriodic;
		%feature("autodoc", "	:rtype: None
") SetPeriodic;
		void SetPeriodic();

		/****************** Trim ******************/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "Returns a law equivalent of <self> between parameters <first> and <last>. <tol> is used to test for 3d points confusion. it is usfule to determines the derivatives in these values <first> and <last> if the law is not cn.

	:param PFirst:
	:type PFirst: float
	:param PLast:
	:type PLast: float
	:param Tol:
	:type Tol: float
	:rtype: opencascade::handle<Law_Function>
") Trim;
		opencascade::handle<Law_Function> Trim(const Standard_Real PFirst, const Standard_Real PLast, const Standard_Real Tol);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the value at parameter x.

	:param X:
	:type X: float
	:rtype: float
") Value;
		Standard_Real Value(const Standard_Real X);

};


%make_alias(Law_Composite)

%extend Law_Composite {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class Law_Constant *
*********************/
class Law_Constant : public Law_Function {
	public:
		/****************** Bounds ******************/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "Returns the parametric bounds of the function.

	:param PFirst:
	:type PFirst: float
	:param PLast:
	:type PLast: float
	:rtype: None
") Bounds;
		void Bounds(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Returns geomabs_cn.

	:rtype: GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity();

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Returns the value and the first derivative at parameter x.

	:param X:
	:type X: float
	:param F:
	:type F: float
	:param D:
	:type D: float
	:rtype: None
") D1;
		void D1(const Standard_Real X, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Returns the value, first and second derivatives at parameter x.

	:param X:
	:type X: float
	:param F:
	:type F: float
	:param D:
	:type D: float
	:param D2:
	:type D2: float
	:rtype: None
") D2;
		void D2(const Standard_Real X, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Intervals ******************/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "	:param T:
	:type T: TColStd_Array1OfReal
	:param S:
	:type S: GeomAbs_Shape
	:rtype: None
") Intervals;
		void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** Law_Constant ******************/
		%feature("compactdefaultargs") Law_Constant;
		%feature("autodoc", "	:rtype: None
") Law_Constant;
		 Law_Constant();

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Returns 1.

	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Set the radius and the range of the constant law.

	:param Radius:
	:type Radius: float
	:param PFirst:
	:type PFirst: float
	:param PLast:
	:type PLast: float
	:rtype: None
") Set;
		void Set(const Standard_Real Radius, const Standard_Real PFirst, const Standard_Real PLast);

		/****************** Trim ******************/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "	:param PFirst:
	:type PFirst: float
	:param PLast:
	:type PLast: float
	:param Tol:
	:type Tol: float
	:rtype: opencascade::handle<Law_Function>
") Trim;
		opencascade::handle<Law_Function> Trim(const Standard_Real PFirst, const Standard_Real PLast, const Standard_Real Tol);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the value at parameter x.

	:param X:
	:type X: float
	:rtype: float
") Value;
		Standard_Real Value(const Standard_Real X);

};


%make_alias(Law_Constant)

%extend Law_Constant {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************
* class Law_Linear *
*******************/
class Law_Linear : public Law_Function {
	public:
		/****************** Bounds ******************/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "Returns the parametric bounds of the function.

	:param PFirst:
	:type PFirst: float
	:param PLast:
	:type PLast: float
	:rtype: None
") Bounds;
		void Bounds(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Returns geomabs_cn.

	:rtype: GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity();

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Returns the value f and the first derivative d of this function at the point of parameter x.

	:param X:
	:type X: float
	:param F:
	:type F: float
	:param D:
	:type D: float
	:rtype: None
") D1;
		void D1(const Standard_Real X, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Returns the value, first and second derivatives at parameter x.

	:param X:
	:type X: float
	:param F:
	:type F: float
	:param D:
	:type D: float
	:param D2:
	:type D2: float
	:rtype: None
") D2;
		void D2(const Standard_Real X, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Intervals ******************/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "	:param T:
	:type T: TColStd_Array1OfReal
	:param S:
	:type S: GeomAbs_Shape
	:rtype: None
") Intervals;
		void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** Law_Linear ******************/
		%feature("compactdefaultargs") Law_Linear;
		%feature("autodoc", "Constructs an empty linear evolution law.

	:rtype: None
") Law_Linear;
		 Law_Linear();

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Returns 1.

	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Defines this linear evolution law by assigning both: - the bounds pdeb and pfin of the parameter, and - the values valdeb and valfin of the function at these two parametric bounds.

	:param Pdeb:
	:type Pdeb: float
	:param Valdeb:
	:type Valdeb: float
	:param Pfin:
	:type Pfin: float
	:param Valfin:
	:type Valfin: float
	:rtype: None
") Set;
		void Set(const Standard_Real Pdeb, const Standard_Real Valdeb, const Standard_Real Pfin, const Standard_Real Valfin);

		/****************** Trim ******************/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "Returns a law equivalent of <self> between parameters <first> and <last>. <tol> is used to test for 3d points confusion. it is usfule to determines the derivatives in these values <first> and <last> if the law is not cn.

	:param PFirst:
	:type PFirst: float
	:param PLast:
	:type PLast: float
	:param Tol:
	:type Tol: float
	:rtype: opencascade::handle<Law_Function>
") Trim;
		opencascade::handle<Law_Function> Trim(const Standard_Real PFirst, const Standard_Real PLast, const Standard_Real Tol);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the value of this function at the point of parameter x.

	:param X:
	:type X: float
	:rtype: float
") Value;
		Standard_Real Value(const Standard_Real X);

};


%make_alias(Law_Linear)

%extend Law_Linear {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class Law_Interpol *
*********************/
class Law_Interpol : public Law_BSpFunc {
	public:
		/****************** Law_Interpol ******************/
		%feature("compactdefaultargs") Law_Interpol;
		%feature("autodoc", "Constructs an empty interpolative evolution law. the function set is used to define the law.

	:rtype: None
") Law_Interpol;
		 Law_Interpol();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Defines this evolution law by interpolating the set of 2d points parandrad. the y coordinate of a point of parandrad is the value of the function at the parameter point given by its x coordinate. if periodic is true, this function is assumed to be periodic. warning - the x coordinates of points in the table parandrad must be given in ascendant order. - if periodic is true, the first and last y coordinates of points in the table parandrad are assumed to be equal. in addition, with the second syntax, dd and df are also assumed to be equal. if this is not the case, set uses the first value(s) as last value(s).

	:param ParAndRad:
	:type ParAndRad: TColgp_Array1OfPnt2d
	:param Periodic: default value is Standard_False
	:type Periodic: bool
	:rtype: None
") Set;
		void Set(const TColgp_Array1OfPnt2d & ParAndRad, const Standard_Boolean Periodic = Standard_False);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Defines this evolution law by interpolating the set of 2d points parandrad. the y coordinate of a point of parandrad is the value of the function at the parameter point given by its x coordinate. if periodic is true, this function is assumed to be periodic. in the second syntax, dd and df define the values of the first derivative of the function at its first and last points. warning - the x coordinates of points in the table parandrad must be given in ascendant order. - if periodic is true, the first and last y coordinates of points in the table parandrad are assumed to be equal. in addition, with the second syntax, dd and df are also assumed to be equal. if this is not the case, set uses the first value(s) as last value(s).

	:param ParAndRad:
	:type ParAndRad: TColgp_Array1OfPnt2d
	:param Dd:
	:type Dd: float
	:param Df:
	:type Df: float
	:param Periodic: default value is Standard_False
	:type Periodic: bool
	:rtype: None
") Set;
		void Set(const TColgp_Array1OfPnt2d & ParAndRad, const Standard_Real Dd, const Standard_Real Df, const Standard_Boolean Periodic = Standard_False);

		/****************** SetInRelative ******************/
		%feature("compactdefaultargs") SetInRelative;
		%feature("autodoc", "	:param ParAndRad:
	:type ParAndRad: TColgp_Array1OfPnt2d
	:param Ud:
	:type Ud: float
	:param Uf:
	:type Uf: float
	:param Periodic: default value is Standard_False
	:type Periodic: bool
	:rtype: None
") SetInRelative;
		void SetInRelative(const TColgp_Array1OfPnt2d & ParAndRad, const Standard_Real Ud, const Standard_Real Uf, const Standard_Boolean Periodic = Standard_False);

		/****************** SetInRelative ******************/
		%feature("compactdefaultargs") SetInRelative;
		%feature("autodoc", "	:param ParAndRad:
	:type ParAndRad: TColgp_Array1OfPnt2d
	:param Ud:
	:type Ud: float
	:param Uf:
	:type Uf: float
	:param Dd:
	:type Dd: float
	:param Df:
	:type Df: float
	:param Periodic: default value is Standard_False
	:type Periodic: bool
	:rtype: None
") SetInRelative;
		void SetInRelative(const TColgp_Array1OfPnt2d & ParAndRad, const Standard_Real Ud, const Standard_Real Uf, const Standard_Real Dd, const Standard_Real Df, const Standard_Boolean Periodic = Standard_False);

};


%make_alias(Law_Interpol)

%extend Law_Interpol {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************
* class Law_S *
**************/
class Law_S : public Law_BSpFunc {
	public:
		/****************** Law_S ******************/
		%feature("compactdefaultargs") Law_S;
		%feature("autodoc", "Constructs an empty 's' evolution law.

	:rtype: None
") Law_S;
		 Law_S();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Defines this s evolution law by assigning both: - the bounds pdeb and pfin of the parameter, and - the values valdeb and valfin of the function at these two parametric bounds. the function is assumed to have the first derivatives equal to 0 at the two parameter points pdeb and pfin.

	:param Pdeb:
	:type Pdeb: float
	:param Valdeb:
	:type Valdeb: float
	:param Pfin:
	:type Pfin: float
	:param Valfin:
	:type Valfin: float
	:rtype: None
") Set;
		void Set(const Standard_Real Pdeb, const Standard_Real Valdeb, const Standard_Real Pfin, const Standard_Real Valfin);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Defines this s evolution law by assigning - the bounds pdeb and pfin of the parameter, - the values valdeb and valfin of the function at these two parametric bounds, and - the values ddeb and dfin of the first derivative of the function at these two parametric bounds.

	:param Pdeb:
	:type Pdeb: float
	:param Valdeb:
	:type Valdeb: float
	:param Ddeb:
	:type Ddeb: float
	:param Pfin:
	:type Pfin: float
	:param Valfin:
	:type Valfin: float
	:param Dfin:
	:type Dfin: float
	:rtype: None
") Set;
		void Set(const Standard_Real Pdeb, const Standard_Real Valdeb, const Standard_Real Ddeb, const Standard_Real Pfin, const Standard_Real Valfin, const Standard_Real Dfin);

};


%make_alias(Law_S)

%extend Law_S {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */

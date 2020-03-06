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
%define PLIBDOCSTRING
"PLib module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_plib.html"
%enddef
%module (package="OCC.Core", docstring=PLIBDOCSTRING) PLib


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
#include<PLib_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<GeomAbs_module.hxx>
#include<math_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TColgp.i
%import TColStd.i
%import GeomAbs.i
%import math.i
/* public enums */
/* end public enums declaration */

/* handles */
%wrap_handle(PLib_Base)
%wrap_handle(PLib_HermitJacobi)
%wrap_handle(PLib_JacobiPolynomial)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/*************
* class PLib *
*************/
%rename(plib) PLib;
class PLib {
	public:
		/****************** Bin ******************/
		%feature("compactdefaultargs") Bin;
		%feature("autodoc", "Returns the binomial cnp. n should be <= bsplclib::maxdegree().

	:param N:
	:type N: int
	:param P:
	:type P: int
	:rtype: float
") Bin;
		static Standard_Real Bin(const Standard_Integer N, const Standard_Integer P);

		/****************** CoefficientsPoles ******************/
		%feature("compactdefaultargs") CoefficientsPoles;
		%feature("autodoc", "	:param Coefs:
	:type Coefs: TColgp_Array1OfPnt
	:param WCoefs:
	:type WCoefs: TColStd_Array1OfReal *
	:param Poles:
	:type Poles: TColgp_Array1OfPnt
	:param WPoles:
	:type WPoles: TColStd_Array1OfReal *
	:rtype: None
") CoefficientsPoles;
		static void CoefficientsPoles(const TColgp_Array1OfPnt & Coefs, const TColStd_Array1OfReal * WCoefs, TColgp_Array1OfPnt & Poles, TColStd_Array1OfReal * WPoles);

		/****************** CoefficientsPoles ******************/
		%feature("compactdefaultargs") CoefficientsPoles;
		%feature("autodoc", "	:param Coefs:
	:type Coefs: TColgp_Array1OfPnt2d
	:param WCoefs:
	:type WCoefs: TColStd_Array1OfReal *
	:param Poles:
	:type Poles: TColgp_Array1OfPnt2d
	:param WPoles:
	:type WPoles: TColStd_Array1OfReal *
	:rtype: None
") CoefficientsPoles;
		static void CoefficientsPoles(const TColgp_Array1OfPnt2d & Coefs, const TColStd_Array1OfReal * WCoefs, TColgp_Array1OfPnt2d & Poles, TColStd_Array1OfReal * WPoles);

		/****************** CoefficientsPoles ******************/
		%feature("compactdefaultargs") CoefficientsPoles;
		%feature("autodoc", "	:param Coefs:
	:type Coefs: TColStd_Array1OfReal
	:param WCoefs:
	:type WCoefs: TColStd_Array1OfReal *
	:param Poles:
	:type Poles: TColStd_Array1OfReal
	:param WPoles:
	:type WPoles: TColStd_Array1OfReal *
	:rtype: None
") CoefficientsPoles;
		static void CoefficientsPoles(const TColStd_Array1OfReal & Coefs, const TColStd_Array1OfReal * WCoefs, TColStd_Array1OfReal & Poles, TColStd_Array1OfReal * WPoles);

		/****************** CoefficientsPoles ******************/
		%feature("compactdefaultargs") CoefficientsPoles;
		%feature("autodoc", "	:param dim:
	:type dim: int
	:param Coefs:
	:type Coefs: TColStd_Array1OfReal
	:param WCoefs:
	:type WCoefs: TColStd_Array1OfReal *
	:param Poles:
	:type Poles: TColStd_Array1OfReal
	:param WPoles:
	:type WPoles: TColStd_Array1OfReal *
	:rtype: None
") CoefficientsPoles;
		static void CoefficientsPoles(const Standard_Integer dim, const TColStd_Array1OfReal & Coefs, const TColStd_Array1OfReal * WCoefs, TColStd_Array1OfReal & Poles, TColStd_Array1OfReal * WPoles);

		/****************** CoefficientsPoles ******************/
		%feature("compactdefaultargs") CoefficientsPoles;
		%feature("autodoc", "	:param Coefs:
	:type Coefs: TColgp_Array2OfPnt
	:param WCoefs:
	:type WCoefs: TColStd_Array2OfReal *
	:param Poles:
	:type Poles: TColgp_Array2OfPnt
	:param WPoles:
	:type WPoles: TColStd_Array2OfReal *
	:rtype: None
") CoefficientsPoles;
		static void CoefficientsPoles(const TColgp_Array2OfPnt & Coefs, const TColStd_Array2OfReal * WCoefs, TColgp_Array2OfPnt & Poles, TColStd_Array2OfReal * WPoles);

		/****************** ConstraintOrder ******************/
		%feature("compactdefaultargs") ConstraintOrder;
		%feature("autodoc", "Translates from integer to geomabs_shape.

	:param NivConstr:
	:type NivConstr: int
	:rtype: GeomAbs_Shape
") ConstraintOrder;
		static GeomAbs_Shape ConstraintOrder(const Standard_Integer NivConstr);

		/****************** EvalCubicHermite ******************/
		%feature("compactdefaultargs") EvalCubicHermite;
		%feature("autodoc", "Performs the cubic hermite interpolation of given series of points with given parameters with the requested derivative order. valuearray stores the value at the first and last parameter. it has the following format : [0], [dimension-1]  : value at first param [dimension], [dimension + dimension-1] : value at last param derivative array stores the value of the derivatives at the first parameter and at the last parameter in the following format [0], [dimension-1]  : derivative at first param [dimension], [dimension + dimension-1] : derivative at last param //! parameterarray stores the first and last parameter in the following format : [0] : first parameter [1] : last parameter //! results will store things in the following format with d = derivativeorder //! [0], [dimension-1]  : value [dimension], [dimension + dimension-1] : first derivative //! [d *dimension], [d*dimension + dimension-1]: dth derivative.

	:param U:
	:type U: float
	:param DerivativeOrder:
	:type DerivativeOrder: int
	:param Dimension:
	:type Dimension: int
	:param ValueArray:
	:type ValueArray: float
	:param DerivativeArray:
	:type DerivativeArray: float
	:param ParameterArray:
	:type ParameterArray: float
	:param Results:
	:type Results: float
	:rtype: int
") EvalCubicHermite;
		static Standard_Integer EvalCubicHermite(const Standard_Real U, const Standard_Integer DerivativeOrder, const Standard_Integer Dimension, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** EvalLagrange ******************/
		%feature("compactdefaultargs") EvalLagrange;
		%feature("autodoc", "Performs the lagrange interpolation of given series of points with given parameters with the requested derivative order results will store things in the following format with d = derivativeorder //! [0], [dimension-1]  : value [dimension], [dimension + dimension-1] : first derivative //! [d *dimension], [d*dimension + dimension-1]: dth derivative.

	:param U:
	:type U: float
	:param DerivativeOrder:
	:type DerivativeOrder: int
	:param Degree:
	:type Degree: int
	:param Dimension:
	:type Dimension: int
	:param ValueArray:
	:type ValueArray: float
	:param ParameterArray:
	:type ParameterArray: float
	:param Results:
	:type Results: float
	:rtype: int
") EvalLagrange;
		static Standard_Integer EvalLagrange(const Standard_Real U, const Standard_Integer DerivativeOrder, const Standard_Integer Degree, const Standard_Integer Dimension, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** EvalLength ******************/
		%feature("compactdefaultargs") EvalLength;
		%feature("autodoc", "	:param Degree:
	:type Degree: int
	:param Dimension:
	:type Dimension: int
	:param PolynomialCoeff:
	:type PolynomialCoeff: float
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param Length:
	:type Length: float
	:rtype: None
") EvalLength;
		static void EvalLength(const Standard_Integer Degree, const Standard_Integer Dimension, Standard_Real &OutValue, const Standard_Real U1, const Standard_Real U2, Standard_Real &OutValue);

		/****************** EvalLength ******************/
		%feature("compactdefaultargs") EvalLength;
		%feature("autodoc", "	:param Degree:
	:type Degree: int
	:param Dimension:
	:type Dimension: int
	:param PolynomialCoeff:
	:type PolynomialCoeff: float
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param Tol:
	:type Tol: float
	:param Length:
	:type Length: float
	:param Error:
	:type Error: float
	:rtype: None
") EvalLength;
		static void EvalLength(const Standard_Integer Degree, const Standard_Integer Dimension, Standard_Real &OutValue, const Standard_Real U1, const Standard_Real U2, const Standard_Real Tol, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** EvalPoly2Var ******************/
		%feature("compactdefaultargs") EvalPoly2Var;
		%feature("autodoc", "Applies evalpolynomial twice to evaluate the derivative of orders uderivativeorder in u, vderivativeorder in v at parameters u,v //! polynomialcoeff are stored in the following fashion c00(1) .... c00(dimension) c10(1) .... c10(dimension) .... cm0(1) .... cm0(dimension) .... c01(1) .... c01(dimension) c11(1) .... c11(dimension) .... cm1(1) .... cm1(dimension) .... c0n(1) .... c0n(dimension) c1n(1) .... c1n(dimension) .... cmn(1) .... cmn(dimension) //! where the polynomial is defined as : 2  m c00 + c10 u + c20 u + .... + cm0 u 2  m + c01 v + c11 uv + c21 u v + .... + cm1 u v n m n + .... + c0n v + .... + cmn u v //! with m = udegree and n = vdegree //! results stores the result in the following format //! f(1) f(2) .... f(dimension) //! warning: <results> and <polynomialcoeff> must be dimensioned properly.

	:param U:
	:type U: float
	:param V:
	:type V: float
	:param UDerivativeOrder:
	:type UDerivativeOrder: int
	:param VDerivativeOrder:
	:type VDerivativeOrder: int
	:param UDegree:
	:type UDegree: int
	:param VDegree:
	:type VDegree: int
	:param Dimension:
	:type Dimension: int
	:param PolynomialCoeff:
	:type PolynomialCoeff: float
	:param Results:
	:type Results: float
	:rtype: None
") EvalPoly2Var;
		static void EvalPoly2Var(const Standard_Real U, const Standard_Real V, const Standard_Integer UDerivativeOrder, const Standard_Integer VDerivativeOrder, const Standard_Integer UDegree, const Standard_Integer VDegree, const Standard_Integer Dimension, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** EvalPolynomial ******************/
		%feature("compactdefaultargs") EvalPolynomial;
		%feature("autodoc", "Performs horner method with synthethic division for derivatives parameter <u>, with <degree> and <dimension>. polynomialcoeff are stored in the following fashion c0(1) c0(2) .... c0(dimension) c1(1) c1(2) .... c1(dimension) //! cdegree(1) cdegree(2) .... cdegree(dimension) where the polynomial is defined as : //! 2 degree c0 + c1 x + c2 x + .... cdegree x //! results stores the result in the following format //! f(1) f(2) .... f(dimension) (1)  (1)  (1) f (1) f (2) .... f (dimension) //! (derivativerequest) (derivativerequest) f (1)  f (dimension) //! this just evaluates the point at parameter u //! warning: <results> and <polynomialcoeff> must be dimensioned properly.

	:param U:
	:type U: float
	:param DerivativeOrder:
	:type DerivativeOrder: int
	:param Degree:
	:type Degree: int
	:param Dimension:
	:type Dimension: int
	:param PolynomialCoeff:
	:type PolynomialCoeff: float
	:param Results:
	:type Results: float
	:rtype: None
") EvalPolynomial;
		static void EvalPolynomial(const Standard_Real U, const Standard_Integer DerivativeOrder, const Standard_Integer Degree, const Standard_Integer Dimension, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** GetPoles ******************/
		%feature("compactdefaultargs") GetPoles;
		%feature("autodoc", "Get from fp the coordinates of the poles.

	:param FP:
	:type FP: TColStd_Array1OfReal
	:param Poles:
	:type Poles: TColgp_Array1OfPnt
	:rtype: None
") GetPoles;
		static void GetPoles(const TColStd_Array1OfReal & FP, TColgp_Array1OfPnt & Poles);

		/****************** GetPoles ******************/
		%feature("compactdefaultargs") GetPoles;
		%feature("autodoc", "Get from fp the coordinates of the poles.

	:param FP:
	:type FP: TColStd_Array1OfReal
	:param Poles:
	:type Poles: TColgp_Array1OfPnt
	:param Weights:
	:type Weights: TColStd_Array1OfReal
	:rtype: None
") GetPoles;
		static void GetPoles(const TColStd_Array1OfReal & FP, TColgp_Array1OfPnt & Poles, TColStd_Array1OfReal & Weights);

		/****************** GetPoles ******************/
		%feature("compactdefaultargs") GetPoles;
		%feature("autodoc", "Get from fp the coordinates of the poles.

	:param FP:
	:type FP: TColStd_Array1OfReal
	:param Poles:
	:type Poles: TColgp_Array1OfPnt2d
	:rtype: None
") GetPoles;
		static void GetPoles(const TColStd_Array1OfReal & FP, TColgp_Array1OfPnt2d & Poles);

		/****************** GetPoles ******************/
		%feature("compactdefaultargs") GetPoles;
		%feature("autodoc", "Get from fp the coordinates of the poles.

	:param FP:
	:type FP: TColStd_Array1OfReal
	:param Poles:
	:type Poles: TColgp_Array1OfPnt2d
	:param Weights:
	:type Weights: TColStd_Array1OfReal
	:rtype: None
") GetPoles;
		static void GetPoles(const TColStd_Array1OfReal & FP, TColgp_Array1OfPnt2d & Poles, TColStd_Array1OfReal & Weights);

		/****************** HermiteCoefficients ******************/
		%feature("compactdefaultargs") HermiteCoefficients;
		%feature("autodoc", "This build the coefficient of hermite's polynomes on [firstparameter, lastparameter] //! if j <= firstorder+1 then //! matrixcoefs[i, j] = ith coefficient of the polynome h0,j-1 //! else //! matrixcoefs[i, j] = ith coefficient of the polynome h1,k with k = j - firstorder - 2 //! return false if - |firstparameter| > 100 - |lastparameter| > 100 - |firstparameter| +|lastparameter| < 1/100 - |lastparameter - firstparameter| / (|firstparameter| +|lastparameter|) < 1/100.

	:param FirstParameter:
	:type FirstParameter: float
	:param LastParameter:
	:type LastParameter: float
	:param FirstOrder:
	:type FirstOrder: int
	:param LastOrder:
	:type LastOrder: int
	:param MatrixCoefs:
	:type MatrixCoefs: math_Matrix
	:rtype: bool
") HermiteCoefficients;
		static Standard_Boolean HermiteCoefficients(const Standard_Real FirstParameter, const Standard_Real LastParameter, const Standard_Integer FirstOrder, const Standard_Integer LastOrder, math_Matrix & MatrixCoefs);

		/****************** HermiteInterpolate ******************/
		%feature("compactdefaultargs") HermiteInterpolate;
		%feature("autodoc", "Compute the coefficients in the canonical base of the polynomial satisfying the given constraints at the given parameters the array firstcontr(i,j) i=1,dimension j=0,firstorder contains the values of the constraint at parameter firstparameter idem for lastconstr.

	:param Dimension:
	:type Dimension: int
	:param FirstParameter:
	:type FirstParameter: float
	:param LastParameter:
	:type LastParameter: float
	:param FirstOrder:
	:type FirstOrder: int
	:param LastOrder:
	:type LastOrder: int
	:param FirstConstr:
	:type FirstConstr: TColStd_Array2OfReal
	:param LastConstr:
	:type LastConstr: TColStd_Array2OfReal
	:param Coefficients:
	:type Coefficients: TColStd_Array1OfReal
	:rtype: bool
") HermiteInterpolate;
		static Standard_Boolean HermiteInterpolate(const Standard_Integer Dimension, const Standard_Real FirstParameter, const Standard_Real LastParameter, const Standard_Integer FirstOrder, const Standard_Integer LastOrder, const TColStd_Array2OfReal & FirstConstr, const TColStd_Array2OfReal & LastConstr, TColStd_Array1OfReal & Coefficients);

		/****************** JacobiParameters ******************/
		%feature("compactdefaultargs") JacobiParameters;
		%feature("autodoc", "Compute the number of points used for integral computations (nbgausspoints) and the degree of jacobi polynomial (workdegree). constraintorder has to be geomabs_c0, geomabs_c1 or geomabs_c2 code: code d' init. des parametres de discretisation. = -5 = -4 = -3 = -2 = -1 = 1 calcul rapide avec precision moyenne. = 2 calcul rapide avec meilleure precision. = 3 calcul un peu plus lent avec bonne precision. = 4 calcul lent avec la meilleure precision possible.

	:param ConstraintOrder:
	:type ConstraintOrder: GeomAbs_Shape
	:param MaxDegree:
	:type MaxDegree: int
	:param Code:
	:type Code: int
	:param NbGaussPoints:
	:type NbGaussPoints: int
	:param WorkDegree:
	:type WorkDegree: int
	:rtype: None
") JacobiParameters;
		static void JacobiParameters(const GeomAbs_Shape ConstraintOrder, const Standard_Integer MaxDegree, const Standard_Integer Code, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** NivConstr ******************/
		%feature("compactdefaultargs") NivConstr;
		%feature("autodoc", "Translates from geomabs_shape to integer.

	:param ConstraintOrder:
	:type ConstraintOrder: GeomAbs_Shape
	:rtype: int
") NivConstr;
		static Standard_Integer NivConstr(const GeomAbs_Shape ConstraintOrder);

		/****************** NoDerivativeEvalPolynomial ******************/
		%feature("compactdefaultargs") NoDerivativeEvalPolynomial;
		%feature("autodoc", "Same as above with derivativeorder = 0;.

	:param U:
	:type U: float
	:param Degree:
	:type Degree: int
	:param Dimension:
	:type Dimension: int
	:param DegreeDimension:
	:type DegreeDimension: int
	:param PolynomialCoeff:
	:type PolynomialCoeff: float
	:param Results:
	:type Results: float
	:rtype: None
") NoDerivativeEvalPolynomial;
		static void NoDerivativeEvalPolynomial(const Standard_Real U, const Standard_Integer Degree, const Standard_Integer Dimension, const Standard_Integer DegreeDimension, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** NoWeights ******************/
		%feature("compactdefaultargs") NoWeights;
		%feature("autodoc", "Used as argument for a non rational functions.

	:rtype: TColStd_Array1OfReal *
") NoWeights;
		static TColStd_Array1OfReal * NoWeights();

		/****************** NoWeights2 ******************/
		%feature("compactdefaultargs") NoWeights2;
		%feature("autodoc", "Used as argument for a non rational functions.

	:rtype: TColStd_Array2OfReal *
") NoWeights2;
		static TColStd_Array2OfReal * NoWeights2();

		/****************** RationalDerivative ******************/
		%feature("compactdefaultargs") RationalDerivative;
		%feature("autodoc", "Computes the derivatives of a ratio at order <n> in dimension <dimension>. //! <ders> is an array containing the values of the input derivatives from 0 to min(<n>,<degree>). for orders higher than <degree> the inputcd /s2d1/bmdl/ derivatives are assumed to be 0. //! content of <ders> : //! x(1),x(2),...,x(dimension),w x'(1),x'(2),...,x'(dimension),w' x''(1),x''(2),...,x''(dimension),w'' //! if <all> is false, only the derivative at order <n> is computed. <rders> is an array of length dimension which will contain the result : //! x(1)/w , x(2)/w , ... derivated <n> times //! if <all> is true all the derivatives up to order <n> are computed. <rders> is an array of length dimension * (n+1) which will contains : //! x(1)/w , x(2)/w , ... x(1)/w , x(2)/w , ... derivated <1> times x(1)/w , x(2)/w , ... derivated <2> times ... x(1)/w , x(2)/w , ... derivated <n> times //! warning: <rders> must be dimensionned properly.

	:param Degree:
	:type Degree: int
	:param N:
	:type N: int
	:param Dimension:
	:type Dimension: int
	:param Ders:
	:type Ders: float
	:param RDers:
	:type RDers: float
	:param All: default value is Standard_True
	:type All: bool
	:rtype: None
") RationalDerivative;
		static void RationalDerivative(const Standard_Integer Degree, const Standard_Integer N, const Standard_Integer Dimension, Standard_Real &OutValue, Standard_Real &OutValue, const Standard_Boolean All = Standard_True);

		/****************** RationalDerivatives ******************/
		%feature("compactdefaultargs") RationalDerivatives;
		%feature("autodoc", "Computes derivativesrequest derivatives of a ratio at of a bspline function of degree <degree> dimension <dimension>. //! <polesderivatives> is an array containing the values of the input derivatives from 0 to <derivativerequest> for orders higher than <degree> the input derivatives are assumed to be 0. //! content of <poleasderivatives> : //! x(1),x(2),...,x(dimension) x'(1),x'(2),...,x'(dimension) x''(1),x''(2),...,x''(dimension) //! weightsderivatives is an array that contains derivatives from 0 to <derivativerequest> after returning from the routine the array rationalderivatives contains the following x(1)/w , x(2)/w , ... x(1)/w , x(2)/w , ... derivated once x(1)/w , x(2)/w , ... twice x(1)/w , x(2)/w , ... derivated <derivativerequest> times //! the array rationalderivatives and polesderivatives can be same since the overwrite is non destructive within the algorithm //! warning: <rationalderivates> must be dimensionned properly.

	:param DerivativesRequest:
	:type DerivativesRequest: int
	:param Dimension:
	:type Dimension: int
	:param PolesDerivatives:
	:type PolesDerivatives: float
	:param WeightsDerivatives:
	:type WeightsDerivatives: float
	:param RationalDerivates:
	:type RationalDerivates: float
	:rtype: None
") RationalDerivatives;
		static void RationalDerivatives(const Standard_Integer DerivativesRequest, const Standard_Integer Dimension, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** SetPoles ******************/
		%feature("compactdefaultargs") SetPoles;
		%feature("autodoc", "Copy in fp the coordinates of the poles.

	:param Poles:
	:type Poles: TColgp_Array1OfPnt
	:param FP:
	:type FP: TColStd_Array1OfReal
	:rtype: None
") SetPoles;
		static void SetPoles(const TColgp_Array1OfPnt & Poles, TColStd_Array1OfReal & FP);

		/****************** SetPoles ******************/
		%feature("compactdefaultargs") SetPoles;
		%feature("autodoc", "Copy in fp the coordinates of the poles.

	:param Poles:
	:type Poles: TColgp_Array1OfPnt
	:param Weights:
	:type Weights: TColStd_Array1OfReal
	:param FP:
	:type FP: TColStd_Array1OfReal
	:rtype: None
") SetPoles;
		static void SetPoles(const TColgp_Array1OfPnt & Poles, const TColStd_Array1OfReal & Weights, TColStd_Array1OfReal & FP);

		/****************** SetPoles ******************/
		%feature("compactdefaultargs") SetPoles;
		%feature("autodoc", "Copy in fp the coordinates of the poles.

	:param Poles:
	:type Poles: TColgp_Array1OfPnt2d
	:param FP:
	:type FP: TColStd_Array1OfReal
	:rtype: None
") SetPoles;
		static void SetPoles(const TColgp_Array1OfPnt2d & Poles, TColStd_Array1OfReal & FP);

		/****************** SetPoles ******************/
		%feature("compactdefaultargs") SetPoles;
		%feature("autodoc", "Copy in fp the coordinates of the poles.

	:param Poles:
	:type Poles: TColgp_Array1OfPnt2d
	:param Weights:
	:type Weights: TColStd_Array1OfReal
	:param FP:
	:type FP: TColStd_Array1OfReal
	:rtype: None
") SetPoles;
		static void SetPoles(const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal & Weights, TColStd_Array1OfReal & FP);

		/****************** Trimming ******************/
		%feature("compactdefaultargs") Trimming;
		%feature("autodoc", "	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param Coeffs:
	:type Coeffs: TColgp_Array1OfPnt
	:param WCoeffs:
	:type WCoeffs: TColStd_Array1OfReal *
	:rtype: None
") Trimming;
		static void Trimming(const Standard_Real U1, const Standard_Real U2, TColgp_Array1OfPnt & Coeffs, TColStd_Array1OfReal * WCoeffs);

		/****************** Trimming ******************/
		%feature("compactdefaultargs") Trimming;
		%feature("autodoc", "	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param Coeffs:
	:type Coeffs: TColgp_Array1OfPnt2d
	:param WCoeffs:
	:type WCoeffs: TColStd_Array1OfReal *
	:rtype: None
") Trimming;
		static void Trimming(const Standard_Real U1, const Standard_Real U2, TColgp_Array1OfPnt2d & Coeffs, TColStd_Array1OfReal * WCoeffs);

		/****************** Trimming ******************/
		%feature("compactdefaultargs") Trimming;
		%feature("autodoc", "	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param Coeffs:
	:type Coeffs: TColStd_Array1OfReal
	:param WCoeffs:
	:type WCoeffs: TColStd_Array1OfReal *
	:rtype: None
") Trimming;
		static void Trimming(const Standard_Real U1, const Standard_Real U2, TColStd_Array1OfReal & Coeffs, TColStd_Array1OfReal * WCoeffs);

		/****************** Trimming ******************/
		%feature("compactdefaultargs") Trimming;
		%feature("autodoc", "	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param dim:
	:type dim: int
	:param Coeffs:
	:type Coeffs: TColStd_Array1OfReal
	:param WCoeffs:
	:type WCoeffs: TColStd_Array1OfReal *
	:rtype: None
") Trimming;
		static void Trimming(const Standard_Real U1, const Standard_Real U2, const Standard_Integer dim, TColStd_Array1OfReal & Coeffs, TColStd_Array1OfReal * WCoeffs);

		/****************** UTrimming ******************/
		%feature("compactdefaultargs") UTrimming;
		%feature("autodoc", "	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param Coeffs:
	:type Coeffs: TColgp_Array2OfPnt
	:param WCoeffs:
	:type WCoeffs: TColStd_Array2OfReal *
	:rtype: None
") UTrimming;
		static void UTrimming(const Standard_Real U1, const Standard_Real U2, TColgp_Array2OfPnt & Coeffs, TColStd_Array2OfReal * WCoeffs);

		/****************** VTrimming ******************/
		%feature("compactdefaultargs") VTrimming;
		%feature("autodoc", "	:param V1:
	:type V1: float
	:param V2:
	:type V2: float
	:param Coeffs:
	:type Coeffs: TColgp_Array2OfPnt
	:param WCoeffs:
	:type WCoeffs: TColStd_Array2OfReal *
	:rtype: None
") VTrimming;
		static void VTrimming(const Standard_Real V1, const Standard_Real V2, TColgp_Array2OfPnt & Coeffs, TColStd_Array2OfReal * WCoeffs);

};


%extend PLib {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************
* class PLib_Base *
******************/
%nodefaultctor PLib_Base;
class PLib_Base : public Standard_Transient {
	public:
		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Compute the values of the basis functions in u.

	:param U:
	:type U: float
	:param BasisValue:
	:type BasisValue: TColStd_Array1OfReal
	:rtype: None
") D0;
		virtual void D0(const Standard_Real U, TColStd_Array1OfReal & BasisValue);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Compute the values and the derivatives values of the basis functions in u.

	:param U:
	:type U: float
	:param BasisValue:
	:type BasisValue: TColStd_Array1OfReal
	:param BasisD1:
	:type BasisD1: TColStd_Array1OfReal
	:rtype: None
") D1;
		virtual void D1(const Standard_Real U, TColStd_Array1OfReal & BasisValue, TColStd_Array1OfReal & BasisD1);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Compute the values and the derivatives values of the basis functions in u.

	:param U:
	:type U: float
	:param BasisValue:
	:type BasisValue: TColStd_Array1OfReal
	:param BasisD1:
	:type BasisD1: TColStd_Array1OfReal
	:param BasisD2:
	:type BasisD2: TColStd_Array1OfReal
	:rtype: None
") D2;
		virtual void D2(const Standard_Real U, TColStd_Array1OfReal & BasisValue, TColStd_Array1OfReal & BasisD1, TColStd_Array1OfReal & BasisD2);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Compute the values and the derivatives values of the basis functions in u.

	:param U:
	:type U: float
	:param BasisValue:
	:type BasisValue: TColStd_Array1OfReal
	:param BasisD1:
	:type BasisD1: TColStd_Array1OfReal
	:param BasisD2:
	:type BasisD2: TColStd_Array1OfReal
	:param BasisD3:
	:type BasisD3: TColStd_Array1OfReal
	:rtype: None
") D3;
		virtual void D3(const Standard_Real U, TColStd_Array1OfReal & BasisValue, TColStd_Array1OfReal & BasisD1, TColStd_Array1OfReal & BasisD2, TColStd_Array1OfReal & BasisD3);

		/****************** ReduceDegree ******************/
		%feature("compactdefaultargs") ReduceDegree;
		%feature("autodoc", "Compute newdegree <= maxdegree so that maxerror is lower than tol. maxerror can be greater than tol if it is not possible to find a newdegree <= maxdegree. in this case newdegree = maxdegree.

	:param Dimension:
	:type Dimension: int
	:param MaxDegree:
	:type MaxDegree: int
	:param Tol:
	:type Tol: float
	:param BaseCoeff:
	:type BaseCoeff: float
	:param NewDegree:
	:type NewDegree: int
	:param MaxError:
	:type MaxError: float
	:rtype: None
") ReduceDegree;
		virtual void ReduceDegree(const Standard_Integer Dimension, const Standard_Integer MaxDegree, const Standard_Real Tol, Standard_Real &OutValue, Standard_Integer &OutValue, Standard_Real &OutValue);

		/****************** ToCoefficients ******************/
		%feature("compactdefaultargs") ToCoefficients;
		%feature("autodoc", "Convert the polynomial p(t) in the canonical base.

	:param Dimension:
	:type Dimension: int
	:param Degree:
	:type Degree: int
	:param CoeffinBase:
	:type CoeffinBase: TColStd_Array1OfReal
	:param Coefficients:
	:type Coefficients: TColStd_Array1OfReal
	:rtype: None
") ToCoefficients;
		virtual void ToCoefficients(const Standard_Integer Dimension, const Standard_Integer Degree, const TColStd_Array1OfReal & CoeffinBase, TColStd_Array1OfReal & Coefficients);

		/****************** WorkDegree ******************/
		%feature("compactdefaultargs") WorkDegree;
		%feature("autodoc", "Returns workdegree.

	:rtype: int
") WorkDegree;
		virtual Standard_Integer WorkDegree();

};


%make_alias(PLib_Base)

%extend PLib_Base {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class PLib_DoubleJacobiPolynomial *
************************************/
class PLib_DoubleJacobiPolynomial {
	public:
		/****************** AverageError ******************/
		%feature("compactdefaultargs") AverageError;
		%feature("autodoc", "	:param Dimension:
	:type Dimension: int
	:param DegreeU:
	:type DegreeU: int
	:param DegreeV:
	:type DegreeV: int
	:param dJacCoeff:
	:type dJacCoeff: int
	:param JacCoeff:
	:type JacCoeff: TColStd_Array1OfReal
	:rtype: float
") AverageError;
		Standard_Real AverageError(const Standard_Integer Dimension, const Standard_Integer DegreeU, const Standard_Integer DegreeV, const Standard_Integer dJacCoeff, const TColStd_Array1OfReal & JacCoeff);

		/****************** MaxError ******************/
		%feature("compactdefaultargs") MaxError;
		%feature("autodoc", "	:param Dimension:
	:type Dimension: int
	:param MinDegreeU:
	:type MinDegreeU: int
	:param MaxDegreeU:
	:type MaxDegreeU: int
	:param MinDegreeV:
	:type MinDegreeV: int
	:param MaxDegreeV:
	:type MaxDegreeV: int
	:param dJacCoeff:
	:type dJacCoeff: int
	:param JacCoeff:
	:type JacCoeff: TColStd_Array1OfReal
	:param Error:
	:type Error: float
	:rtype: float
") MaxError;
		Standard_Real MaxError(const Standard_Integer Dimension, const Standard_Integer MinDegreeU, const Standard_Integer MaxDegreeU, const Standard_Integer MinDegreeV, const Standard_Integer MaxDegreeV, const Standard_Integer dJacCoeff, const TColStd_Array1OfReal & JacCoeff, const Standard_Real Error);

		/****************** MaxErrorU ******************/
		%feature("compactdefaultargs") MaxErrorU;
		%feature("autodoc", "	:param Dimension:
	:type Dimension: int
	:param DegreeU:
	:type DegreeU: int
	:param DegreeV:
	:type DegreeV: int
	:param dJacCoeff:
	:type dJacCoeff: int
	:param JacCoeff:
	:type JacCoeff: TColStd_Array1OfReal
	:rtype: float
") MaxErrorU;
		Standard_Real MaxErrorU(const Standard_Integer Dimension, const Standard_Integer DegreeU, const Standard_Integer DegreeV, const Standard_Integer dJacCoeff, const TColStd_Array1OfReal & JacCoeff);

		/****************** MaxErrorV ******************/
		%feature("compactdefaultargs") MaxErrorV;
		%feature("autodoc", "	:param Dimension:
	:type Dimension: int
	:param DegreeU:
	:type DegreeU: int
	:param DegreeV:
	:type DegreeV: int
	:param dJacCoeff:
	:type dJacCoeff: int
	:param JacCoeff:
	:type JacCoeff: TColStd_Array1OfReal
	:rtype: float
") MaxErrorV;
		Standard_Real MaxErrorV(const Standard_Integer Dimension, const Standard_Integer DegreeU, const Standard_Integer DegreeV, const Standard_Integer dJacCoeff, const TColStd_Array1OfReal & JacCoeff);

		/****************** PLib_DoubleJacobiPolynomial ******************/
		%feature("compactdefaultargs") PLib_DoubleJacobiPolynomial;
		%feature("autodoc", "	:rtype: None
") PLib_DoubleJacobiPolynomial;
		 PLib_DoubleJacobiPolynomial();

		/****************** PLib_DoubleJacobiPolynomial ******************/
		%feature("compactdefaultargs") PLib_DoubleJacobiPolynomial;
		%feature("autodoc", "	:param JacPolU:
	:type JacPolU: PLib_JacobiPolynomial
	:param JacPolV:
	:type JacPolV: PLib_JacobiPolynomial
	:rtype: None
") PLib_DoubleJacobiPolynomial;
		 PLib_DoubleJacobiPolynomial(const opencascade::handle<PLib_JacobiPolynomial> & JacPolU, const opencascade::handle<PLib_JacobiPolynomial> & JacPolV);

		/****************** ReduceDegree ******************/
		%feature("compactdefaultargs") ReduceDegree;
		%feature("autodoc", "	:param Dimension:
	:type Dimension: int
	:param MinDegreeU:
	:type MinDegreeU: int
	:param MaxDegreeU:
	:type MaxDegreeU: int
	:param MinDegreeV:
	:type MinDegreeV: int
	:param MaxDegreeV:
	:type MaxDegreeV: int
	:param dJacCoeff:
	:type dJacCoeff: int
	:param JacCoeff:
	:type JacCoeff: TColStd_Array1OfReal
	:param EpmsCut:
	:type EpmsCut: float
	:param MaxError:
	:type MaxError: float
	:param NewDegreeU:
	:type NewDegreeU: int
	:param NewDegreeV:
	:type NewDegreeV: int
	:rtype: None
") ReduceDegree;
		void ReduceDegree(const Standard_Integer Dimension, const Standard_Integer MinDegreeU, const Standard_Integer MaxDegreeU, const Standard_Integer MinDegreeV, const Standard_Integer MaxDegreeV, const Standard_Integer dJacCoeff, const TColStd_Array1OfReal & JacCoeff, const Standard_Real EpmsCut, Standard_Real &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** TabMaxU ******************/
		%feature("compactdefaultargs") TabMaxU;
		%feature("autodoc", "Returns mytabmaxu;.

	:rtype: opencascade::handle<TColStd_HArray1OfReal>
") TabMaxU;
		opencascade::handle<TColStd_HArray1OfReal> TabMaxU();

		/****************** TabMaxV ******************/
		%feature("compactdefaultargs") TabMaxV;
		%feature("autodoc", "Returns mytabmaxv;.

	:rtype: opencascade::handle<TColStd_HArray1OfReal>
") TabMaxV;
		opencascade::handle<TColStd_HArray1OfReal> TabMaxV();

		/****************** U ******************/
		%feature("compactdefaultargs") U;
		%feature("autodoc", "Returns myjacpolu;.

	:rtype: opencascade::handle<PLib_JacobiPolynomial>
") U;
		opencascade::handle<PLib_JacobiPolynomial> U();

		/****************** V ******************/
		%feature("compactdefaultargs") V;
		%feature("autodoc", "Returns myjacpolv;.

	:rtype: opencascade::handle<PLib_JacobiPolynomial>
") V;
		opencascade::handle<PLib_JacobiPolynomial> V();

		/****************** WDoubleJacobiToCoefficients ******************/
		%feature("compactdefaultargs") WDoubleJacobiToCoefficients;
		%feature("autodoc", "	:param Dimension:
	:type Dimension: int
	:param DegreeU:
	:type DegreeU: int
	:param DegreeV:
	:type DegreeV: int
	:param JacCoeff:
	:type JacCoeff: TColStd_Array1OfReal
	:param Coefficients:
	:type Coefficients: TColStd_Array1OfReal
	:rtype: None
") WDoubleJacobiToCoefficients;
		void WDoubleJacobiToCoefficients(const Standard_Integer Dimension, const Standard_Integer DegreeU, const Standard_Integer DegreeV, const TColStd_Array1OfReal & JacCoeff, TColStd_Array1OfReal & Coefficients);

};


%extend PLib_DoubleJacobiPolynomial {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class PLib_HermitJacobi *
**************************/
class PLib_HermitJacobi : public PLib_Base {
	public:
		/****************** AverageError ******************/
		%feature("compactdefaultargs") AverageError;
		%feature("autodoc", "	:param Dimension:
	:type Dimension: int
	:param HermJacCoeff:
	:type HermJacCoeff: float
	:param NewDegree:
	:type NewDegree: int
	:rtype: float
") AverageError;
		Standard_Real AverageError(const Standard_Integer Dimension, Standard_Real &OutValue, const Standard_Integer NewDegree);

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Compute the values of the basis functions in u.

	:param U:
	:type U: float
	:param BasisValue:
	:type BasisValue: TColStd_Array1OfReal
	:rtype: None
") D0;
		void D0(const Standard_Real U, TColStd_Array1OfReal & BasisValue);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Compute the values and the derivatives values of the basis functions in u.

	:param U:
	:type U: float
	:param BasisValue:
	:type BasisValue: TColStd_Array1OfReal
	:param BasisD1:
	:type BasisD1: TColStd_Array1OfReal
	:rtype: None
") D1;
		void D1(const Standard_Real U, TColStd_Array1OfReal & BasisValue, TColStd_Array1OfReal & BasisD1);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Compute the values and the derivatives values of the basis functions in u.

	:param U:
	:type U: float
	:param BasisValue:
	:type BasisValue: TColStd_Array1OfReal
	:param BasisD1:
	:type BasisD1: TColStd_Array1OfReal
	:param BasisD2:
	:type BasisD2: TColStd_Array1OfReal
	:rtype: None
") D2;
		void D2(const Standard_Real U, TColStd_Array1OfReal & BasisValue, TColStd_Array1OfReal & BasisD1, TColStd_Array1OfReal & BasisD2);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Compute the values and the derivatives values of the basis functions in u.

	:param U:
	:type U: float
	:param BasisValue:
	:type BasisValue: TColStd_Array1OfReal
	:param BasisD1:
	:type BasisD1: TColStd_Array1OfReal
	:param BasisD2:
	:type BasisD2: TColStd_Array1OfReal
	:param BasisD3:
	:type BasisD3: TColStd_Array1OfReal
	:rtype: None
") D3;
		void D3(const Standard_Real U, TColStd_Array1OfReal & BasisValue, TColStd_Array1OfReal & BasisD1, TColStd_Array1OfReal & BasisD2, TColStd_Array1OfReal & BasisD3);

		/****************** MaxError ******************/
		%feature("compactdefaultargs") MaxError;
		%feature("autodoc", "This method computes the maximum error on the polynomial w(t) q(t) obtained by missing the coefficients of jaccoeff from newdegree +1 to degree.

	:param Dimension:
	:type Dimension: int
	:param HermJacCoeff:
	:type HermJacCoeff: float
	:param NewDegree:
	:type NewDegree: int
	:rtype: float
") MaxError;
		Standard_Real MaxError(const Standard_Integer Dimension, Standard_Real &OutValue, const Standard_Integer NewDegree);

		/****************** NivConstr ******************/
		%feature("compactdefaultargs") NivConstr;
		%feature("autodoc", "Returns nivconstr.

	:rtype: int
") NivConstr;
		Standard_Integer NivConstr();

		/****************** PLib_HermitJacobi ******************/
		%feature("compactdefaultargs") PLib_HermitJacobi;
		%feature("autodoc", "Initialize the polynomial class degree has to be <= 30 constraintorder has to be geomabs_c0 geomabs_c1 geomabs_c2.

	:param WorkDegree:
	:type WorkDegree: int
	:param ConstraintOrder:
	:type ConstraintOrder: GeomAbs_Shape
	:rtype: None
") PLib_HermitJacobi;
		 PLib_HermitJacobi(const Standard_Integer WorkDegree, const GeomAbs_Shape ConstraintOrder);

		/****************** ReduceDegree ******************/
		%feature("compactdefaultargs") ReduceDegree;
		%feature("autodoc", "Compute newdegree <= maxdegree so that maxerror is lower than tol. maxerror can be greater than tol if it is not possible to find a newdegree <= maxdegree. in this case newdegree = maxdegree.

	:param Dimension:
	:type Dimension: int
	:param MaxDegree:
	:type MaxDegree: int
	:param Tol:
	:type Tol: float
	:param HermJacCoeff:
	:type HermJacCoeff: float
	:param NewDegree:
	:type NewDegree: int
	:param MaxError:
	:type MaxError: float
	:rtype: None
") ReduceDegree;
		void ReduceDegree(const Standard_Integer Dimension, const Standard_Integer MaxDegree, const Standard_Real Tol, Standard_Real &OutValue, Standard_Integer &OutValue, Standard_Real &OutValue);

		/****************** ToCoefficients ******************/
		%feature("compactdefaultargs") ToCoefficients;
		%feature("autodoc", "Convert the polynomial p(t) = h(t) + w(t) q(t) in the canonical base.

	:param Dimension:
	:type Dimension: int
	:param Degree:
	:type Degree: int
	:param HermJacCoeff:
	:type HermJacCoeff: TColStd_Array1OfReal
	:param Coefficients:
	:type Coefficients: TColStd_Array1OfReal
	:rtype: None
") ToCoefficients;
		void ToCoefficients(const Standard_Integer Dimension, const Standard_Integer Degree, const TColStd_Array1OfReal & HermJacCoeff, TColStd_Array1OfReal & Coefficients);

		/****************** WorkDegree ******************/
		%feature("compactdefaultargs") WorkDegree;
		%feature("autodoc", "Returns workdegree.

	:rtype: int
") WorkDegree;
		Standard_Integer WorkDegree();

};


%make_alias(PLib_HermitJacobi)

%extend PLib_HermitJacobi {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class PLib_JacobiPolynomial *
******************************/
class PLib_JacobiPolynomial : public PLib_Base {
	public:
		/****************** AverageError ******************/
		%feature("compactdefaultargs") AverageError;
		%feature("autodoc", "	:param Dimension:
	:type Dimension: int
	:param JacCoeff:
	:type JacCoeff: float
	:param NewDegree:
	:type NewDegree: int
	:rtype: float
") AverageError;
		Standard_Real AverageError(const Standard_Integer Dimension, Standard_Real &OutValue, const Standard_Integer NewDegree);

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Compute the values of the basis functions in u.

	:param U:
	:type U: float
	:param BasisValue:
	:type BasisValue: TColStd_Array1OfReal
	:rtype: None
") D0;
		void D0(const Standard_Real U, TColStd_Array1OfReal & BasisValue);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Compute the values and the derivatives values of the basis functions in u.

	:param U:
	:type U: float
	:param BasisValue:
	:type BasisValue: TColStd_Array1OfReal
	:param BasisD1:
	:type BasisD1: TColStd_Array1OfReal
	:rtype: None
") D1;
		void D1(const Standard_Real U, TColStd_Array1OfReal & BasisValue, TColStd_Array1OfReal & BasisD1);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Compute the values and the derivatives values of the basis functions in u.

	:param U:
	:type U: float
	:param BasisValue:
	:type BasisValue: TColStd_Array1OfReal
	:param BasisD1:
	:type BasisD1: TColStd_Array1OfReal
	:param BasisD2:
	:type BasisD2: TColStd_Array1OfReal
	:rtype: None
") D2;
		void D2(const Standard_Real U, TColStd_Array1OfReal & BasisValue, TColStd_Array1OfReal & BasisD1, TColStd_Array1OfReal & BasisD2);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Compute the values and the derivatives values of the basis functions in u.

	:param U:
	:type U: float
	:param BasisValue:
	:type BasisValue: TColStd_Array1OfReal
	:param BasisD1:
	:type BasisD1: TColStd_Array1OfReal
	:param BasisD2:
	:type BasisD2: TColStd_Array1OfReal
	:param BasisD3:
	:type BasisD3: TColStd_Array1OfReal
	:rtype: None
") D3;
		void D3(const Standard_Real U, TColStd_Array1OfReal & BasisValue, TColStd_Array1OfReal & BasisD1, TColStd_Array1OfReal & BasisD2, TColStd_Array1OfReal & BasisD3);

		/****************** MaxError ******************/
		%feature("compactdefaultargs") MaxError;
		%feature("autodoc", "This method computes the maximum error on the polynomial w(t) q(t) obtained by missing the coefficients of jaccoeff from newdegree +1 to degree.

	:param Dimension:
	:type Dimension: int
	:param JacCoeff:
	:type JacCoeff: float
	:param NewDegree:
	:type NewDegree: int
	:rtype: float
") MaxError;
		Standard_Real MaxError(const Standard_Integer Dimension, Standard_Real &OutValue, const Standard_Integer NewDegree);

		/****************** MaxValue ******************/
		%feature("compactdefaultargs") MaxValue;
		%feature("autodoc", "This method loads for k=0,q the maximum value of abs ( w(t)*jk(t) )for t bellonging to [-1,1] this values are loaded is the array tabmax(0,myworkdegree-2*(mynivconst+1)) maxvalue ( me ; tabmaxpointer : in out real );.

	:param TabMax:
	:type TabMax: TColStd_Array1OfReal
	:rtype: None
") MaxValue;
		void MaxValue(TColStd_Array1OfReal & TabMax);

		/****************** NivConstr ******************/
		%feature("compactdefaultargs") NivConstr;
		%feature("autodoc", "Returns nivconstr.

	:rtype: int
") NivConstr;
		Standard_Integer NivConstr();

		/****************** PLib_JacobiPolynomial ******************/
		%feature("compactdefaultargs") PLib_JacobiPolynomial;
		%feature("autodoc", "Initialize the polynomial class degree has to be <= 30 constraintorder has to be geomabs_c0 geomabs_c1 geomabs_c2.

	:param WorkDegree:
	:type WorkDegree: int
	:param ConstraintOrder:
	:type ConstraintOrder: GeomAbs_Shape
	:rtype: None
") PLib_JacobiPolynomial;
		 PLib_JacobiPolynomial(const Standard_Integer WorkDegree, const GeomAbs_Shape ConstraintOrder);

		/****************** Points ******************/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "Returns the jacobi points for gauss integration ie the positive values of the legendre roots by increasing values nbgausspoints is the number of points choosen for the integral computation. tabpoints (0,nbgausspoints/2) tabpoints (0) is loaded only for the odd values of nbgausspoints the possible values for nbgausspoints are : 8, 10, 15, 20, 25, 30, 35, 40, 50, 61 nbgausspoints must be greater than degree.

	:param NbGaussPoints:
	:type NbGaussPoints: int
	:param TabPoints:
	:type TabPoints: TColStd_Array1OfReal
	:rtype: None
") Points;
		void Points(const Standard_Integer NbGaussPoints, TColStd_Array1OfReal & TabPoints);

		/****************** ReduceDegree ******************/
		%feature("compactdefaultargs") ReduceDegree;
		%feature("autodoc", "Compute newdegree <= maxdegree so that maxerror is lower than tol. maxerror can be greater than tol if it is not possible to find a newdegree <= maxdegree. in this case newdegree = maxdegree.

	:param Dimension:
	:type Dimension: int
	:param MaxDegree:
	:type MaxDegree: int
	:param Tol:
	:type Tol: float
	:param JacCoeff:
	:type JacCoeff: float
	:param NewDegree:
	:type NewDegree: int
	:param MaxError:
	:type MaxError: float
	:rtype: None
") ReduceDegree;
		void ReduceDegree(const Standard_Integer Dimension, const Standard_Integer MaxDegree, const Standard_Real Tol, Standard_Real &OutValue, Standard_Integer &OutValue, Standard_Real &OutValue);

		/****************** ToCoefficients ******************/
		%feature("compactdefaultargs") ToCoefficients;
		%feature("autodoc", "Convert the polynomial p(t) = r(t) + w(t) q(t) in the canonical base.

	:param Dimension:
	:type Dimension: int
	:param Degree:
	:type Degree: int
	:param JacCoeff:
	:type JacCoeff: TColStd_Array1OfReal
	:param Coefficients:
	:type Coefficients: TColStd_Array1OfReal
	:rtype: None
") ToCoefficients;
		void ToCoefficients(const Standard_Integer Dimension, const Standard_Integer Degree, const TColStd_Array1OfReal & JacCoeff, TColStd_Array1OfReal & Coefficients);

		/****************** Weights ******************/
		%feature("compactdefaultargs") Weights;
		%feature("autodoc", "Returns the jacobi weigths for gauss integration only for the positive values of the legendre roots in the order they are given by the method points nbgausspoints is the number of points choosen for the integral computation. tabweights (0,nbgausspoints/2,0,degree) tabweights (0,.) are only loaded for the odd values of nbgausspoints the possible values for nbgausspoints are : 8 , 10 , 15 ,20 ,25 , 30, 35 , 40 , 50 , 61 nbgausspoints must be greater than degree.

	:param NbGaussPoints:
	:type NbGaussPoints: int
	:param TabWeights:
	:type TabWeights: TColStd_Array2OfReal
	:rtype: None
") Weights;
		void Weights(const Standard_Integer NbGaussPoints, TColStd_Array2OfReal & TabWeights);

		/****************** WorkDegree ******************/
		%feature("compactdefaultargs") WorkDegree;
		%feature("autodoc", "Returns workdegree.

	:rtype: int
") WorkDegree;
		Standard_Integer WorkDegree();

};


%make_alias(PLib_JacobiPolynomial)

%extend PLib_JacobiPolynomial {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */

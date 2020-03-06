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
%define CPNTSDOCSTRING
"CPnts module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_cpnts.html"
%enddef
%module (package="OCC.Core", docstring=CPNTSDOCSTRING) CPnts


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
#include<CPnts_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Adaptor2d_module.hxx>
#include<math_module.hxx>
#include<gp_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Adaptor3d.i
%import Adaptor2d.i
%import math.i
%import gp.i
/* public enums */
/* end public enums declaration */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
typedef Standard_Real ( * CPnts_RealFunction ) ( const Standard_Real, const Standard_Address );
/* end typedefs declaration */

/****************************
* class CPnts_AbscissaPoint *
****************************/
class CPnts_AbscissaPoint {
	public:
		/****************** AdvPerform ******************/
		%feature("compactdefaultargs") AdvPerform;
		%feature("autodoc", "Computes the point at the distance <abscissa> of the curve; performs more appropriate tolerance managment; to use this method in right way it is necessary to call empty consructor. then call method init with tolerance = resolution, then call advpermorm. u0 is the parameter of the point from which the distance is measured and ui is the starting value for the iterative process (should be close to the final solution).

	:param Abscissa:
	:type Abscissa: float
	:param U0:
	:type U0: float
	:param Ui:
	:type Ui: float
	:param Resolution:
	:type Resolution: float
	:rtype: None
") AdvPerform;
		void AdvPerform(const Standard_Real Abscissa, const Standard_Real U0, const Standard_Real Ui, const Standard_Real Resolution);

		/****************** CPnts_AbscissaPoint ******************/
		%feature("compactdefaultargs") CPnts_AbscissaPoint;
		%feature("autodoc", "	:rtype: None
") CPnts_AbscissaPoint;
		 CPnts_AbscissaPoint();

		/****************** CPnts_AbscissaPoint ******************/
		%feature("compactdefaultargs") CPnts_AbscissaPoint;
		%feature("autodoc", "The algorithm computes a point on a curve <curve> at the distance <abscissa> from the point of parameter <u0>. <resolution> is the error allowed in the computation. the computed point can be outside of the curve 's bounds.

	:param C:
	:type C: Adaptor3d_Curve
	:param Abscissa:
	:type Abscissa: float
	:param U0:
	:type U0: float
	:param Resolution:
	:type Resolution: float
	:rtype: None
") CPnts_AbscissaPoint;
		 CPnts_AbscissaPoint(const Adaptor3d_Curve & C, const Standard_Real Abscissa, const Standard_Real U0, const Standard_Real Resolution);

		/****************** CPnts_AbscissaPoint ******************/
		%feature("compactdefaultargs") CPnts_AbscissaPoint;
		%feature("autodoc", "The algorithm computes a point on a curve <curve> at the distance <abscissa> from the point of parameter <u0>. <resolution> is the error allowed in the computation. the computed point can be outside of the curve 's bounds.

	:param C:
	:type C: Adaptor2d_Curve2d
	:param Abscissa:
	:type Abscissa: float
	:param U0:
	:type U0: float
	:param Resolution:
	:type Resolution: float
	:rtype: None
") CPnts_AbscissaPoint;
		 CPnts_AbscissaPoint(const Adaptor2d_Curve2d & C, const Standard_Real Abscissa, const Standard_Real U0, const Standard_Real Resolution);

		/****************** CPnts_AbscissaPoint ******************/
		%feature("compactdefaultargs") CPnts_AbscissaPoint;
		%feature("autodoc", "The algorithm computes a point on a curve <curve> at the distance <abscissa> from the point of parameter <u0>. <ui> is the starting value used in the iterative process which find the solution, it must be closed to the final solution <resolution> is the error allowed in the computation. the computed point can be outside of the curve 's bounds.

	:param C:
	:type C: Adaptor3d_Curve
	:param Abscissa:
	:type Abscissa: float
	:param U0:
	:type U0: float
	:param Ui:
	:type Ui: float
	:param Resolution:
	:type Resolution: float
	:rtype: None
") CPnts_AbscissaPoint;
		 CPnts_AbscissaPoint(const Adaptor3d_Curve & C, const Standard_Real Abscissa, const Standard_Real U0, const Standard_Real Ui, const Standard_Real Resolution);

		/****************** CPnts_AbscissaPoint ******************/
		%feature("compactdefaultargs") CPnts_AbscissaPoint;
		%feature("autodoc", "The algorithm computes a point on a curve <curve> at the distance <abscissa> from the point of parameter <u0>. <ui> is the starting value used in the iterative process which find the solution, it must be closed to the final solution <resolution> is the error allowed in the computation. the computed point can be outside of the curve 's bounds.

	:param C:
	:type C: Adaptor2d_Curve2d
	:param Abscissa:
	:type Abscissa: float
	:param U0:
	:type U0: float
	:param Ui:
	:type Ui: float
	:param Resolution:
	:type Resolution: float
	:rtype: None
") CPnts_AbscissaPoint;
		 CPnts_AbscissaPoint(const Adaptor2d_Curve2d & C, const Standard_Real Abscissa, const Standard_Real U0, const Standard_Real Ui, const Standard_Real Resolution);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes the resolution function with <c>.

	:param C:
	:type C: Adaptor3d_Curve
	:rtype: None
") Init;
		void Init(const Adaptor3d_Curve & C);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes the resolution function with <c>.

	:param C:
	:type C: Adaptor2d_Curve2d
	:rtype: None
") Init;
		void Init(const Adaptor2d_Curve2d & C);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes the resolution function with <c>.

	:param C:
	:type C: Adaptor3d_Curve
	:param Tol:
	:type Tol: float
	:rtype: None
") Init;
		void Init(const Adaptor3d_Curve & C, const Standard_Real Tol);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes the resolution function with <c>.

	:param C:
	:type C: Adaptor2d_Curve2d
	:param Tol:
	:type Tol: float
	:rtype: None
") Init;
		void Init(const Adaptor2d_Curve2d & C, const Standard_Real Tol);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes the resolution function with <c> between u1 and u2.

	:param C:
	:type C: Adaptor3d_Curve
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:rtype: None
") Init;
		void Init(const Adaptor3d_Curve & C, const Standard_Real U1, const Standard_Real U2);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes the resolution function with <c> between u1 and u2.

	:param C:
	:type C: Adaptor2d_Curve2d
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:rtype: None
") Init;
		void Init(const Adaptor2d_Curve2d & C, const Standard_Real U1, const Standard_Real U2);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes the resolution function with <c> between u1 and u2.

	:param C:
	:type C: Adaptor3d_Curve
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Init;
		void Init(const Adaptor3d_Curve & C, const Standard_Real U1, const Standard_Real U2, const Standard_Real Tol);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes the resolution function with <c> between u1 and u2.

	:param C:
	:type C: Adaptor2d_Curve2d
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Init;
		void Init(const Adaptor2d_Curve2d & C, const Standard_Real U1, const Standard_Real U2, const Standard_Real Tol);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "True if the computation was successful, false otherwise.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Computes the length of the curve <c>.

	:param C:
	:type C: Adaptor3d_Curve
	:rtype: float
") Length;
		static Standard_Real Length(const Adaptor3d_Curve & C);

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Computes the length of the curve <c>.

	:param C:
	:type C: Adaptor2d_Curve2d
	:rtype: float
") Length;
		static Standard_Real Length(const Adaptor2d_Curve2d & C);

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Computes the length of the curve <c> with the given tolerance.

	:param C:
	:type C: Adaptor3d_Curve
	:param Tol:
	:type Tol: float
	:rtype: float
") Length;
		static Standard_Real Length(const Adaptor3d_Curve & C, const Standard_Real Tol);

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Computes the length of the curve <c> with the given tolerance.

	:param C:
	:type C: Adaptor2d_Curve2d
	:param Tol:
	:type Tol: float
	:rtype: float
") Length;
		static Standard_Real Length(const Adaptor2d_Curve2d & C, const Standard_Real Tol);

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Computes the length of the curve <c> between <u1> and <u2>.

	:param C:
	:type C: Adaptor3d_Curve
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:rtype: float
") Length;
		static Standard_Real Length(const Adaptor3d_Curve & C, const Standard_Real U1, const Standard_Real U2);

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Computes the length of the curve <c> between <u1> and <u2>.

	:param C:
	:type C: Adaptor2d_Curve2d
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:rtype: float
") Length;
		static Standard_Real Length(const Adaptor2d_Curve2d & C, const Standard_Real U1, const Standard_Real U2);

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Computes the length of the curve <c> between <u1> and <u2> with the given tolerance.

	:param C:
	:type C: Adaptor3d_Curve
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param Tol:
	:type Tol: float
	:rtype: float
") Length;
		static Standard_Real Length(const Adaptor3d_Curve & C, const Standard_Real U1, const Standard_Real U2, const Standard_Real Tol);

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Computes the length of the curve <c> between <u1> and <u2> with the given tolerance. creation of a indefinite abscissapoint.

	:param C:
	:type C: Adaptor2d_Curve2d
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param Tol:
	:type Tol: float
	:rtype: float
") Length;
		static Standard_Real Length(const Adaptor2d_Curve2d & C, const Standard_Real U1, const Standard_Real U2, const Standard_Real Tol);

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Returns the parameter of the solution.

	:rtype: float
") Parameter;
		Standard_Real Parameter();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Computes the point at the distance <abscissa> of the curve. u0 is the parameter of the point from which the distance is measured.

	:param Abscissa:
	:type Abscissa: float
	:param U0:
	:type U0: float
	:param Resolution:
	:type Resolution: float
	:rtype: None
") Perform;
		void Perform(const Standard_Real Abscissa, const Standard_Real U0, const Standard_Real Resolution);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Computes the point at the distance <abscissa> of the curve. u0 is the parameter of the point from which the distance is measured and ui is the starting value for the iterative process (should be close to the final solution).

	:param Abscissa:
	:type Abscissa: float
	:param U0:
	:type U0: float
	:param Ui:
	:type Ui: float
	:param Resolution:
	:type Resolution: float
	:rtype: None
") Perform;
		void Perform(const Standard_Real Abscissa, const Standard_Real U0, const Standard_Real Ui, const Standard_Real Resolution);

		/****************** SetParameter ******************/
		%feature("compactdefaultargs") SetParameter;
		%feature("autodoc", "Enforce the solution, used by gcpnts.

	:param P:
	:type P: float
	:rtype: None
") SetParameter;
		void SetParameter(const Standard_Real P);

};


%extend CPnts_AbscissaPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class CPnts_MyGaussFunction *
******************************/
class CPnts_MyGaussFunction : public math_Function {
	public:
		/****************** CPnts_MyGaussFunction ******************/
		%feature("compactdefaultargs") CPnts_MyGaussFunction;
		%feature("autodoc", "	:rtype: None
") CPnts_MyGaussFunction;
		 CPnts_MyGaussFunction();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "F is a pointer on a function d is a client data //! each value is computed with f(d).

	:param F:
	:type F: CPnts_RealFunction
	:param D:
	:type D: Standard_Address
	:rtype: None
") Init;
		void Init(const CPnts_RealFunction & F, const Standard_Address D);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param X:
	:type X: float
	:param F:
	:type F: float
	:rtype: bool
") Value;
		Standard_Boolean Value(const Standard_Real X, Standard_Real &OutValue);

};


%extend CPnts_MyGaussFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class CPnts_MyRootFunction *
*****************************/
class CPnts_MyRootFunction : public math_FunctionWithDerivative {
	public:
		/****************** CPnts_MyRootFunction ******************/
		%feature("compactdefaultargs") CPnts_MyRootFunction;
		%feature("autodoc", "	:rtype: None
") CPnts_MyRootFunction;
		 CPnts_MyRootFunction();

		/****************** Derivative ******************/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "This is f(x,d).

	:param X:
	:type X: float
	:param Df:
	:type Df: float
	:rtype: bool
") Derivative;
		Standard_Boolean Derivative(const Standard_Real X, Standard_Real &OutValue);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "F is a pointer on a function d is a client data order is the order of integration to use.

	:param F:
	:type F: CPnts_RealFunction
	:param D:
	:type D: Standard_Address
	:param Order:
	:type Order: int
	:rtype: None
") Init;
		void Init(const CPnts_RealFunction & F, const Standard_Address D, const Standard_Integer Order);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "We want to solve integral(x0,x,f(x,d)) = l.

	:param X0:
	:type X0: float
	:param L:
	:type L: float
	:rtype: None
") Init;
		void Init(const Standard_Real X0, const Standard_Real L);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "We want to solve integral(x0,x,f(x,d)) = l with given tolerance.

	:param X0:
	:type X0: float
	:param L:
	:type L: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Init;
		void Init(const Standard_Real X0, const Standard_Real L, const Standard_Real Tol);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "This is integral(x0,x,f(x,d)) - l.

	:param X:
	:type X: float
	:param F:
	:type F: float
	:rtype: bool
") Value;
		Standard_Boolean Value(const Standard_Real X, Standard_Real &OutValue);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	:param X:
	:type X: float
	:param F:
	:type F: float
	:param Df:
	:type Df: float
	:rtype: bool
") Values;
		Standard_Boolean Values(const Standard_Real X, Standard_Real &OutValue, Standard_Real &OutValue);

};


%extend CPnts_MyRootFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class CPnts_UniformDeflection *
********************************/
class CPnts_UniformDeflection {
	public:
		/****************** CPnts_UniformDeflection ******************/
		%feature("compactdefaultargs") CPnts_UniformDeflection;
		%feature("autodoc", "Creation of a indefinite uniformdeflection.

	:rtype: None
") CPnts_UniformDeflection;
		 CPnts_UniformDeflection();

		/****************** CPnts_UniformDeflection ******************/
		%feature("compactdefaultargs") CPnts_UniformDeflection;
		%feature("autodoc", "Computes a uniform deflection distribution of points on the curve <c>. <deflection> defines the constant deflection value. the algorithm computes the number of points and the points. the curve <c> must be at least c2 else the computation can fail. if just some parts of the curve is c2 it is better to give the parameters bounds and to use the below constructor . if <withcontrol> is true, the algorithm controls the estimate deflection when the curve is singular at the point p(u),the algorithm computes the next point as p(u + max(currentstep,abs(lastparameter-firstparameter))) if the singularity is at the first point ,the next point calculated is the p(lastparameter).

	:param C:
	:type C: Adaptor3d_Curve
	:param Deflection:
	:type Deflection: float
	:param Resolution:
	:type Resolution: float
	:param WithControl:
	:type WithControl: bool
	:rtype: None
") CPnts_UniformDeflection;
		 CPnts_UniformDeflection(const Adaptor3d_Curve & C, const Standard_Real Deflection, const Standard_Real Resolution, const Standard_Boolean WithControl);

		/****************** CPnts_UniformDeflection ******************/
		%feature("compactdefaultargs") CPnts_UniformDeflection;
		%feature("autodoc", "As above with 2d curve.

	:param C:
	:type C: Adaptor2d_Curve2d
	:param Deflection:
	:type Deflection: float
	:param Resolution:
	:type Resolution: float
	:param WithControl:
	:type WithControl: bool
	:rtype: None
") CPnts_UniformDeflection;
		 CPnts_UniformDeflection(const Adaptor2d_Curve2d & C, const Standard_Real Deflection, const Standard_Real Resolution, const Standard_Boolean WithControl);

		/****************** CPnts_UniformDeflection ******************/
		%feature("compactdefaultargs") CPnts_UniformDeflection;
		%feature("autodoc", "Computes an uniform deflection distribution of points on a part of the curve <c>. deflection defines the step between the points. <u1> and <u2> define the distribution span. <u1> and <u2> must be in the parametric range of the curve.

	:param C:
	:type C: Adaptor3d_Curve
	:param Deflection:
	:type Deflection: float
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param Resolution:
	:type Resolution: float
	:param WithControl:
	:type WithControl: bool
	:rtype: None
") CPnts_UniformDeflection;
		 CPnts_UniformDeflection(const Adaptor3d_Curve & C, const Standard_Real Deflection, const Standard_Real U1, const Standard_Real U2, const Standard_Real Resolution, const Standard_Boolean WithControl);

		/****************** CPnts_UniformDeflection ******************/
		%feature("compactdefaultargs") CPnts_UniformDeflection;
		%feature("autodoc", "As above with 2d curve.

	:param C:
	:type C: Adaptor2d_Curve2d
	:param Deflection:
	:type Deflection: float
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param Resolution:
	:type Resolution: float
	:param WithControl:
	:type WithControl: bool
	:rtype: None
") CPnts_UniformDeflection;
		 CPnts_UniformDeflection(const Adaptor2d_Curve2d & C, const Standard_Real Deflection, const Standard_Real U1, const Standard_Real U2, const Standard_Real Resolution, const Standard_Boolean WithControl);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initialize the algoritms with <c>, <deflection>, <ustep>, <resolution> and <withcontrol>.

	:param C:
	:type C: Adaptor3d_Curve
	:param Deflection:
	:type Deflection: float
	:param Resolution:
	:type Resolution: float
	:param WithControl:
	:type WithControl: bool
	:rtype: None
") Initialize;
		void Initialize(const Adaptor3d_Curve & C, const Standard_Real Deflection, const Standard_Real Resolution, const Standard_Boolean WithControl);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initialize the algoritms with <c>, <deflection>, <ustep>, <resolution> and <withcontrol>.

	:param C:
	:type C: Adaptor2d_Curve2d
	:param Deflection:
	:type Deflection: float
	:param Resolution:
	:type Resolution: float
	:param WithControl:
	:type WithControl: bool
	:rtype: None
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & C, const Standard_Real Deflection, const Standard_Real Resolution, const Standard_Boolean WithControl);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initialize the algoritms with <c>, <deflection>, <ustep>, <u1>, <u2> and <withcontrol>.

	:param C:
	:type C: Adaptor3d_Curve
	:param Deflection:
	:type Deflection: float
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param Resolution:
	:type Resolution: float
	:param WithControl:
	:type WithControl: bool
	:rtype: None
") Initialize;
		void Initialize(const Adaptor3d_Curve & C, const Standard_Real Deflection, const Standard_Real U1, const Standard_Real U2, const Standard_Real Resolution, const Standard_Boolean WithControl);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initialize the algoritms with <c>, <deflection>, <ustep>, <u1>, <u2> and <withcontrol>.

	:param C:
	:type C: Adaptor2d_Curve2d
	:param Deflection:
	:type Deflection: float
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param Resolution:
	:type Resolution: float
	:param WithControl:
	:type WithControl: bool
	:rtype: None
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & C, const Standard_Real Deflection, const Standard_Real U1, const Standard_Real U2, const Standard_Real Resolution, const Standard_Boolean WithControl);

		/****************** IsAllDone ******************/
		%feature("compactdefaultargs") IsAllDone;
		%feature("autodoc", "To know if all the calculus were done successfully (ie all the points have been computed). the calculus can fail if the curve is not c1 in the considered domain. returns true if the calculus was successful.

	:rtype: bool
") IsAllDone;
		Standard_Boolean IsAllDone();

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Returns true if it exists a next point.

	:rtype: bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Go to the next point.

	:rtype: None
") Next;
		void Next();

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Return the computed parameter.

	:rtype: gp_Pnt
") Point;
		gp_Pnt Point();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return the computed parameter.

	:rtype: float
") Value;
		Standard_Real Value();

};


%extend CPnts_UniformDeflection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */

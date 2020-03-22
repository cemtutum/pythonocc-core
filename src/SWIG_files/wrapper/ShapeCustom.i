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
%define SHAPECUSTOMDOCSTRING
"ShapeCustom module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_shapecustom.html"
%enddef
%module (package="OCC.Core", docstring=SHAPECUSTOMDOCSTRING) ShapeCustom


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
#include<ShapeCustom_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TopoDS_module.hxx>
#include<GeomAbs_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<TColgp_module.hxx>
#include<BRepTools_module.hxx>
#include<ShapeExtend_module.hxx>
#include<Message_module.hxx>
#include<TopLoc_module.hxx>
#include<gp_module.hxx>
#include<BRep_module.hxx>
#include<Message_module.hxx>
#include<Poly_module.hxx>
#include<TShort_module.hxx>
#include<Bnd_module.hxx>
#include<TColGeom_module.hxx>
#include<ShapeExtend_module.hxx>
#include<TopTools_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TopoDS.i
%import GeomAbs.i
%import Geom.i
%import Geom2d.i
%import TColgp.i
%import BRepTools.i
%import ShapeExtend.i
%import Message.i
%import TopLoc.i
%import gp.i

%pythoncode {
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
%wrap_handle(ShapeCustom_Modification)
%wrap_handle(ShapeCustom_RestrictionParameters)
%wrap_handle(ShapeCustom_TrsfModification)
%wrap_handle(ShapeCustom_ConvertToBSpline)
%wrap_handle(ShapeCustom_DirectModification)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/********************
* class ShapeCustom *
********************/
%rename(shapecustom) ShapeCustom;
class ShapeCustom {
	public:
		/****************** BSplineRestriction ******************/
		%feature("compactdefaultargs") BSplineRestriction;
		%feature("autodoc", "Returns a new shape with all surfaces, curves and pcurves which type is bspline/bezier or based on them converted having degree less than <maxdegree> or number of spans less than <nbmaxsegment> in dependence on parameter priority <degree>. <gmaxdegree> and <gmaxsegments> are maximum possible degree and number of spans correspondingly. these values will be used in those cases when approximation with specified parameters is impossible and one of gmaxdegree or gmaxsegments is selected in dependence on priority. note that even if approximation is impossible with <gmaxdegree> then number of spans can exceed specified <gmaxsegment> <rational> specifies if to convert rational bspline/bezier into polynomial b-spline. if flags convoffsurf,convoffcurve3d,convoffcurve2d are standard_true there are means that offset surfaces , offset curves 3d and offset curves 2d are converted to bspline correspondingly.

Parameters
----------
S: TopoDS_Shape
Tol3d: float
Tol2d: float
MaxDegree: int
MaxNbSegment: int
Continuity3d: GeomAbs_Shape
Continuity2d: GeomAbs_Shape
Degree: bool
Rational: bool
aParameters: ShapeCustom_RestrictionParameters

Returns
-------
TopoDS_Shape
") BSplineRestriction;
		static TopoDS_Shape BSplineRestriction(const TopoDS_Shape & S, const Standard_Real Tol3d, const Standard_Real Tol2d, const Standard_Integer MaxDegree, const Standard_Integer MaxNbSegment, const GeomAbs_Shape Continuity3d, const GeomAbs_Shape Continuity2d, const Standard_Boolean Degree, const Standard_Boolean Rational, const opencascade::handle<ShapeCustom_RestrictionParameters> & aParameters);

		/****************** ConvertToBSpline ******************/
		%feature("compactdefaultargs") ConvertToBSpline;
		%feature("autodoc", "Returns a new shape with all surfaces of linear extrusion, revolution, offset, and planar surfaces converted according to flags to geom_bsplinesurface (with same parameterisation).

Parameters
----------
S: TopoDS_Shape
extrMode: bool
revolMode: bool
offsetMode: bool
planeMode: bool,optional
	default value is Standard_False

Returns
-------
TopoDS_Shape
") ConvertToBSpline;
		static TopoDS_Shape ConvertToBSpline(const TopoDS_Shape & S, const Standard_Boolean extrMode, const Standard_Boolean revolMode, const Standard_Boolean offsetMode, const Standard_Boolean planeMode = Standard_False);

		/****************** ConvertToRevolution ******************/
		%feature("compactdefaultargs") ConvertToRevolution;
		%feature("autodoc", "Returns a new shape with all elementary periodic surfaces converted to geom_surfaceofrevolution.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopoDS_Shape
") ConvertToRevolution;
		static TopoDS_Shape ConvertToRevolution(const TopoDS_Shape & S);

		/****************** DirectFaces ******************/
		%feature("compactdefaultargs") DirectFaces;
		%feature("autodoc", "Returns a new shape without indirect surfaces.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopoDS_Shape
") DirectFaces;
		static TopoDS_Shape DirectFaces(const TopoDS_Shape & S);

		/****************** ScaleShape ******************/
		%feature("compactdefaultargs") ScaleShape;
		%feature("autodoc", "Returns a new shape which is scaled original.

Parameters
----------
S: TopoDS_Shape
scale: float

Returns
-------
TopoDS_Shape
") ScaleShape;
		static TopoDS_Shape ScaleShape(const TopoDS_Shape & S, const Standard_Real scale);

		/****************** SweptToElementary ******************/
		%feature("compactdefaultargs") SweptToElementary;
		%feature("autodoc", "Returns a new shape with all surfaces of revolution and linear extrusion convert to elementary periodic surfaces.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopoDS_Shape
") SweptToElementary;
		static TopoDS_Shape SweptToElementary(const TopoDS_Shape & S);

};


%extend ShapeCustom {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def ApplyModifier(self):
		pass
	}
};

/**************************
* class ShapeCustom_Curve *
**************************/
class ShapeCustom_Curve {
	public:
		/****************** ConvertToPeriodic ******************/
		%feature("compactdefaultargs") ConvertToPeriodic;
		%feature("autodoc", "Tries to convert the curve to the periodic form returns the resulting curve works only if the curve is bspline and is closed with precision::confusion() else, or in case of failure, returns a null handle.

Parameters
----------
substitute: bool
preci: float,optional
	default value is -1

Returns
-------
opencascade::handle<Geom_Curve>
") ConvertToPeriodic;
		opencascade::handle<Geom_Curve> ConvertToPeriodic(const Standard_Boolean substitute, const Standard_Real preci = -1);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom_Curve

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Geom_Curve> & C);

		/****************** ShapeCustom_Curve ******************/
		%feature("compactdefaultargs") ShapeCustom_Curve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ShapeCustom_Curve;
		 ShapeCustom_Curve();

		/****************** ShapeCustom_Curve ******************/
		%feature("compactdefaultargs") ShapeCustom_Curve;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom_Curve

Returns
-------
None
") ShapeCustom_Curve;
		 ShapeCustom_Curve(const opencascade::handle<Geom_Curve> & C);

};


%extend ShapeCustom_Curve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class ShapeCustom_Curve2d *
****************************/
class ShapeCustom_Curve2d {
	public:
		/****************** ConvertToLine2d ******************/
		%feature("compactdefaultargs") ConvertToLine2d;
		%feature("autodoc", "Try to convert bspline2d or bezier2d to line 2d only if it is linear. recalculate first and last parameters. returns line2d or null curve2d.

Parameters
----------
theCurve: Geom2d_Curve
theFirstIn: float
theLastIn: float
theTolerance: float
theNewFirst: float
theNewLast: float
theDeviation: float

Returns
-------
opencascade::handle<Geom2d_Line>
") ConvertToLine2d;
		static opencascade::handle<Geom2d_Line> ConvertToLine2d(const opencascade::handle<Geom2d_Curve> & theCurve, const Standard_Real theFirstIn, const Standard_Real theLastIn, const Standard_Real theTolerance, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** IsLinear ******************/
		%feature("compactdefaultargs") IsLinear;
		%feature("autodoc", "Check if poleses is in the plane with given precision returns false if no.

Parameters
----------
thePoles: TColgp_Array1OfPnt2d
theTolerance: float
theDeviation: float

Returns
-------
bool
") IsLinear;
		static Standard_Boolean IsLinear(const TColgp_Array1OfPnt2d & thePoles, const Standard_Real theTolerance, Standard_Real &OutValue);

		/****************** SimplifyBSpline2d ******************/
		%feature("compactdefaultargs") SimplifyBSpline2d;
		%feature("autodoc", "Try to remove knots from bspline where local derivatives are the same. remove knots with given precision. returns false if bsplien was not modified.

Parameters
----------
theBSpline2d: Geom2d_BSplineCurve
theTolerance: float

Returns
-------
bool
") SimplifyBSpline2d;
		static Standard_Boolean SimplifyBSpline2d(opencascade::handle<Geom2d_BSplineCurve> & theBSpline2d, const Standard_Real theTolerance);

};


%extend ShapeCustom_Curve2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class ShapeCustom_Modification *
*********************************/
%nodefaultctor ShapeCustom_Modification;
class ShapeCustom_Modification : public BRepTools_Modification {
	public:
		/****************** MsgRegistrator ******************/
		%feature("compactdefaultargs") MsgRegistrator;
		%feature("autodoc", "Returns message registrator.

Returns
-------
opencascade::handle<ShapeExtend_BasicMsgRegistrator>
") MsgRegistrator;
		opencascade::handle<ShapeExtend_BasicMsgRegistrator> MsgRegistrator();

		/****************** SendMsg ******************/
		%feature("compactdefaultargs") SendMsg;
		%feature("autodoc", "Sends a message to be attached to the shape. calls corresponding message of message registrator.

Parameters
----------
shape: TopoDS_Shape
message: Message_Msg
gravity: Message_Gravity,optional
	default value is Message_Info

Returns
-------
None
") SendMsg;
		void SendMsg(const TopoDS_Shape & shape, const Message_Msg & message, const Message_Gravity gravity = Message_Info);

		/****************** SetMsgRegistrator ******************/
		%feature("compactdefaultargs") SetMsgRegistrator;
		%feature("autodoc", "Sets message registrator.

Parameters
----------
msgreg: ShapeExtend_BasicMsgRegistrator

Returns
-------
None
") SetMsgRegistrator;
		virtual void SetMsgRegistrator(const opencascade::handle<ShapeExtend_BasicMsgRegistrator> & msgreg);

};


%make_alias(ShapeCustom_Modification)

%extend ShapeCustom_Modification {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class ShapeCustom_RestrictionParameters *
******************************************/
class ShapeCustom_RestrictionParameters : public Standard_Transient {
	public:

        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetConvertBezierSurf() {
            return (Standard_Boolean) $self->ConvertBezierSurf();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetConvertBezierSurf(Standard_Boolean value) {
            $self->ConvertBezierSurf()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetConvertConicalSurf() {
            return (Standard_Boolean) $self->ConvertConicalSurf();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetConvertConicalSurf(Standard_Boolean value) {
            $self->ConvertConicalSurf()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetConvertCurve2d() {
            return (Standard_Boolean) $self->ConvertCurve2d();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetConvertCurve2d(Standard_Boolean value) {
            $self->ConvertCurve2d()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetConvertCurve3d() {
            return (Standard_Boolean) $self->ConvertCurve3d();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetConvertCurve3d(Standard_Boolean value) {
            $self->ConvertCurve3d()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetConvertCylindricalSurf() {
            return (Standard_Boolean) $self->ConvertCylindricalSurf();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetConvertCylindricalSurf(Standard_Boolean value) {
            $self->ConvertCylindricalSurf()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetConvertExtrusionSurf() {
            return (Standard_Boolean) $self->ConvertExtrusionSurf();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetConvertExtrusionSurf(Standard_Boolean value) {
            $self->ConvertExtrusionSurf()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetConvertOffsetCurv2d() {
            return (Standard_Boolean) $self->ConvertOffsetCurv2d();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetConvertOffsetCurv2d(Standard_Boolean value) {
            $self->ConvertOffsetCurv2d()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetConvertOffsetCurv3d() {
            return (Standard_Boolean) $self->ConvertOffsetCurv3d();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetConvertOffsetCurv3d(Standard_Boolean value) {
            $self->ConvertOffsetCurv3d()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetConvertOffsetSurf() {
            return (Standard_Boolean) $self->ConvertOffsetSurf();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetConvertOffsetSurf(Standard_Boolean value) {
            $self->ConvertOffsetSurf()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetConvertPlane() {
            return (Standard_Boolean) $self->ConvertPlane();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetConvertPlane(Standard_Boolean value) {
            $self->ConvertPlane()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetConvertRevolutionSurf() {
            return (Standard_Boolean) $self->ConvertRevolutionSurf();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetConvertRevolutionSurf(Standard_Boolean value) {
            $self->ConvertRevolutionSurf()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetConvertSphericalSurf() {
            return (Standard_Boolean) $self->ConvertSphericalSurf();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetConvertSphericalSurf(Standard_Boolean value) {
            $self->ConvertSphericalSurf()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetConvertToroidalSurf() {
            return (Standard_Boolean) $self->ConvertToroidalSurf();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetConvertToroidalSurf(Standard_Boolean value) {
            $self->ConvertToroidalSurf()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Integer GetGMaxDegree() {
            return (Standard_Integer) $self->GMaxDegree();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetGMaxDegree(Standard_Integer value) {
            $self->GMaxDegree()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Integer GetGMaxSeg() {
            return (Standard_Integer) $self->GMaxSeg();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetGMaxSeg(Standard_Integer value) {
            $self->GMaxSeg()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetSegmentSurfaceMode() {
            return (Standard_Boolean) $self->SegmentSurfaceMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetSegmentSurfaceMode(Standard_Boolean value) {
            $self->SegmentSurfaceMode()=value;
            }
        };
		/****************** ShapeCustom_RestrictionParameters ******************/
		%feature("compactdefaultargs") ShapeCustom_RestrictionParameters;
		%feature("autodoc", "Sets default parameters.

Returns
-------
None
") ShapeCustom_RestrictionParameters;
		 ShapeCustom_RestrictionParameters();

};


%make_alias(ShapeCustom_RestrictionParameters)

%extend ShapeCustom_RestrictionParameters {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class ShapeCustom_Surface *
****************************/
class ShapeCustom_Surface {
	public:
		/****************** ConvertToAnalytical ******************/
		%feature("compactdefaultargs") ConvertToAnalytical;
		%feature("autodoc", "Tries to convert the surface to an analytic form returns the result works only if the surface is bspline or bezier. else, or in case of failure, returns a null handle //! if <substitute> is true, the new surface replaces the actual one in <self> //! it works by analysing the case which can apply, creating the corresponding analytic surface, then checking coincidence warning: parameter laws are not kept, hence pcurves should be redone.

Parameters
----------
tol: float
substitute: bool

Returns
-------
opencascade::handle<Geom_Surface>
") ConvertToAnalytical;
		opencascade::handle<Geom_Surface> ConvertToAnalytical(const Standard_Real tol, const Standard_Boolean substitute);

		/****************** ConvertToPeriodic ******************/
		%feature("compactdefaultargs") ConvertToPeriodic;
		%feature("autodoc", "Tries to convert the surface to the periodic form returns the resulting surface works only if the surface is bspline and is closed with precision::confusion() else, or in case of failure, returns a null handle.

Parameters
----------
substitute: bool
preci: float,optional
	default value is -1

Returns
-------
opencascade::handle<Geom_Surface>
") ConvertToPeriodic;
		opencascade::handle<Geom_Surface> ConvertToPeriodic(const Standard_Boolean substitute, const Standard_Real preci = -1);

		/****************** Gap ******************/
		%feature("compactdefaultargs") Gap;
		%feature("autodoc", "Returns maximal deviation of converted surface from the original one computed by last call to converttoanalytical.

Returns
-------
float
") Gap;
		Standard_Real Gap();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Geom_Surface

Returns
-------
None
") Init;
		void Init(const opencascade::handle<Geom_Surface> & S);

		/****************** ShapeCustom_Surface ******************/
		%feature("compactdefaultargs") ShapeCustom_Surface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ShapeCustom_Surface;
		 ShapeCustom_Surface();

		/****************** ShapeCustom_Surface ******************/
		%feature("compactdefaultargs") ShapeCustom_Surface;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Geom_Surface

Returns
-------
None
") ShapeCustom_Surface;
		 ShapeCustom_Surface(const opencascade::handle<Geom_Surface> & S);

};


%extend ShapeCustom_Surface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class ShapeCustom_TrsfModification *
*************************************/
class ShapeCustom_TrsfModification : public BRepTools_TrsfModification {
	public:
		/****************** NewCurve ******************/
		%feature("compactdefaultargs") NewCurve;
		%feature("autodoc", "Calls inherited method. sets <tol> as actual tolerance of <e> multiplied with scale factor.

Parameters
----------
E: TopoDS_Edge
C: Geom_Curve
L: TopLoc_Location
Tol: float

Returns
-------
bool
") NewCurve;
		Standard_Boolean NewCurve(const TopoDS_Edge & E, opencascade::handle<Geom_Curve> & C, TopLoc_Location & L, Standard_Real &OutValue);

		/****************** NewCurve2d ******************/
		%feature("compactdefaultargs") NewCurve2d;
		%feature("autodoc", "Calls inherited method. sets <tol> as actual tolerance of <e> multiplied with scale factor.

Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face
NewE: TopoDS_Edge
NewF: TopoDS_Face
C: Geom2d_Curve
Tol: float

Returns
-------
bool
") NewCurve2d;
		Standard_Boolean NewCurve2d(const TopoDS_Edge & E, const TopoDS_Face & F, const TopoDS_Edge & NewE, const TopoDS_Face & NewF, opencascade::handle<Geom2d_Curve> & C, Standard_Real &OutValue);

		/****************** NewParameter ******************/
		%feature("compactdefaultargs") NewParameter;
		%feature("autodoc", "Calls inherited method. sets <tol> as actual tolerance of <v> multiplied with scale factor.

Parameters
----------
V: TopoDS_Vertex
E: TopoDS_Edge
P: float
Tol: float

Returns
-------
bool
") NewParameter;
		Standard_Boolean NewParameter(const TopoDS_Vertex & V, const TopoDS_Edge & E, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** NewPoint ******************/
		%feature("compactdefaultargs") NewPoint;
		%feature("autodoc", "Calls inherited method. sets <tol> as actual tolerance of <v> multiplied with scale factor.

Parameters
----------
V: TopoDS_Vertex
P: gp_Pnt
Tol: float

Returns
-------
bool
") NewPoint;
		Standard_Boolean NewPoint(const TopoDS_Vertex & V, gp_Pnt & P, Standard_Real &OutValue);

		/****************** NewSurface ******************/
		%feature("compactdefaultargs") NewSurface;
		%feature("autodoc", "Calls inherited method. sets <tol> as actual tolerance of <f> multiplied with scale factor.

Parameters
----------
F: TopoDS_Face
S: Geom_Surface
L: TopLoc_Location
Tol: float
RevWires: bool
RevFace: bool

Returns
-------
bool
") NewSurface;
		Standard_Boolean NewSurface(const TopoDS_Face & F, opencascade::handle<Geom_Surface> & S, TopLoc_Location & L, Standard_Real &OutValue, Standard_Boolean &OutValue, Standard_Boolean &OutValue);

		/****************** ShapeCustom_TrsfModification ******************/
		%feature("compactdefaultargs") ShapeCustom_TrsfModification;
		%feature("autodoc", "Empty constructor.

Parameters
----------
T: gp_Trsf

Returns
-------
None
") ShapeCustom_TrsfModification;
		 ShapeCustom_TrsfModification(const gp_Trsf & T);

};


%make_alias(ShapeCustom_TrsfModification)

%extend ShapeCustom_TrsfModification {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class ShapeCustom_BSplineRestriction *
***************************************/
/*************************************
* class ShapeCustom_ConvertToBSpline *
*************************************/
class ShapeCustom_ConvertToBSpline : public ShapeCustom_Modification {
	public:
		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Returns the continuity of <newe> between <newf1> and <newf2>. //! <newe> is the new edge created from <e>. <newf1> (resp. <newf2>) is the new face created from <f1> (resp. <f2>).

Parameters
----------
E: TopoDS_Edge
F1: TopoDS_Face
F2: TopoDS_Face
NewE: TopoDS_Edge
NewF1: TopoDS_Face
NewF2: TopoDS_Face

Returns
-------
GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity(const TopoDS_Edge & E, const TopoDS_Face & F1, const TopoDS_Face & F2, const TopoDS_Edge & NewE, const TopoDS_Face & NewF1, const TopoDS_Face & NewF2);

		/****************** NewCurve ******************/
		%feature("compactdefaultargs") NewCurve;
		%feature("autodoc", "Returns standard_true if the edge <e> has been modified. in this case, <c> is the new geometric support of the edge, <l> the new location, <tol> the new tolerance. otherwise, returns standard_false, and <c>, <l>, <tol> are not significant.

Parameters
----------
E: TopoDS_Edge
C: Geom_Curve
L: TopLoc_Location
Tol: float

Returns
-------
bool
") NewCurve;
		Standard_Boolean NewCurve(const TopoDS_Edge & E, opencascade::handle<Geom_Curve> & C, TopLoc_Location & L, Standard_Real &OutValue);

		/****************** NewCurve2d ******************/
		%feature("compactdefaultargs") NewCurve2d;
		%feature("autodoc", "Returns standard_true if the edge <e> has a new curve on surface on the face <f>.in this case, <c> is the new geometric support of the edge, <l> the new location, <tol> the new tolerance. //! otherwise, returns standard_false, and <c>, <l>, <tol> are not significant. //! <newe> is the new edge created from <e>. <newf> is the new face created from <f>. they may be usefull.

Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face
NewE: TopoDS_Edge
NewF: TopoDS_Face
C: Geom2d_Curve
Tol: float

Returns
-------
bool
") NewCurve2d;
		Standard_Boolean NewCurve2d(const TopoDS_Edge & E, const TopoDS_Face & F, const TopoDS_Edge & NewE, const TopoDS_Face & NewF, opencascade::handle<Geom2d_Curve> & C, Standard_Real &OutValue);

		/****************** NewParameter ******************/
		%feature("compactdefaultargs") NewParameter;
		%feature("autodoc", "Returns standard_true if the vertex <v> has a new parameter on the edge <e>. in this case, <p> is the parameter, <tol> the new tolerance. otherwise, returns standard_false, and <p>, <tol> are not significant.

Parameters
----------
V: TopoDS_Vertex
E: TopoDS_Edge
P: float
Tol: float

Returns
-------
bool
") NewParameter;
		Standard_Boolean NewParameter(const TopoDS_Vertex & V, const TopoDS_Edge & E, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** NewPoint ******************/
		%feature("compactdefaultargs") NewPoint;
		%feature("autodoc", "Returns standard_true if the vertex <v> has been modified. in this case, <p> is the new geometric support of the vertex, <tol> the new tolerance. otherwise, returns standard_false, and <p>, <tol> are not significant.

Parameters
----------
V: TopoDS_Vertex
P: gp_Pnt
Tol: float

Returns
-------
bool
") NewPoint;
		Standard_Boolean NewPoint(const TopoDS_Vertex & V, gp_Pnt & P, Standard_Real &OutValue);

		/****************** NewSurface ******************/
		%feature("compactdefaultargs") NewSurface;
		%feature("autodoc", "Returns standard_true if the face <f> has been modified. in this case, <s> is the new geometric support of the face, <l> the new location, <tol> the new tolerance. otherwise, returns standard_false, and <s>, <l>, <tol> are not significant.

Parameters
----------
F: TopoDS_Face
S: Geom_Surface
L: TopLoc_Location
Tol: float
RevWires: bool
RevFace: bool

Returns
-------
bool
") NewSurface;
		Standard_Boolean NewSurface(const TopoDS_Face & F, opencascade::handle<Geom_Surface> & S, TopLoc_Location & L, Standard_Real &OutValue, Standard_Boolean &OutValue, Standard_Boolean &OutValue);

		/****************** SetExtrusionMode ******************/
		%feature("compactdefaultargs") SetExtrusionMode;
		%feature("autodoc", "Sets mode for convertion of surfaces of linear extrusion.

Parameters
----------
extrMode: bool

Returns
-------
None
") SetExtrusionMode;
		void SetExtrusionMode(const Standard_Boolean extrMode);

		/****************** SetOffsetMode ******************/
		%feature("compactdefaultargs") SetOffsetMode;
		%feature("autodoc", "Sets mode for convertion of offset surfaces.

Parameters
----------
offsetMode: bool

Returns
-------
None
") SetOffsetMode;
		void SetOffsetMode(const Standard_Boolean offsetMode);

		/****************** SetPlaneMode ******************/
		%feature("compactdefaultargs") SetPlaneMode;
		%feature("autodoc", "Sets mode for convertion of plane surfaces.

Parameters
----------
planeMode: bool

Returns
-------
None
") SetPlaneMode;
		void SetPlaneMode(const Standard_Boolean planeMode);

		/****************** SetRevolutionMode ******************/
		%feature("compactdefaultargs") SetRevolutionMode;
		%feature("autodoc", "Sets mode for convertion of surfaces of revolution.

Parameters
----------
revolMode: bool

Returns
-------
None
") SetRevolutionMode;
		void SetRevolutionMode(const Standard_Boolean revolMode);

		/****************** ShapeCustom_ConvertToBSpline ******************/
		%feature("compactdefaultargs") ShapeCustom_ConvertToBSpline;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ShapeCustom_ConvertToBSpline;
		 ShapeCustom_ConvertToBSpline();

};


%make_alias(ShapeCustom_ConvertToBSpline)

%extend ShapeCustom_ConvertToBSpline {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class ShapeCustom_ConvertToRevolution *
****************************************/
/***************************************
* class ShapeCustom_DirectModification *
***************************************/
class ShapeCustom_DirectModification : public ShapeCustom_Modification {
	public:
		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Returns the continuity of <newe> between <newf1> and <newf2>. //! <newe> is the new edge created from <e>. <newf1> (resp. <newf2>) is the new face created from <f1> (resp. <f2>).

Parameters
----------
E: TopoDS_Edge
F1: TopoDS_Face
F2: TopoDS_Face
NewE: TopoDS_Edge
NewF1: TopoDS_Face
NewF2: TopoDS_Face

Returns
-------
GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity(const TopoDS_Edge & E, const TopoDS_Face & F1, const TopoDS_Face & F2, const TopoDS_Edge & NewE, const TopoDS_Face & NewF1, const TopoDS_Face & NewF2);

		/****************** NewCurve ******************/
		%feature("compactdefaultargs") NewCurve;
		%feature("autodoc", "Returns standard_true if the edge <e> has been modified. in this case, <c> is the new geometric support of the edge, <l> the new location, <tol> the new tolerance. otherwise, returns standard_false, and <c>, <l>, <tol> are not significant.

Parameters
----------
E: TopoDS_Edge
C: Geom_Curve
L: TopLoc_Location
Tol: float

Returns
-------
bool
") NewCurve;
		Standard_Boolean NewCurve(const TopoDS_Edge & E, opencascade::handle<Geom_Curve> & C, TopLoc_Location & L, Standard_Real &OutValue);

		/****************** NewCurve2d ******************/
		%feature("compactdefaultargs") NewCurve2d;
		%feature("autodoc", "Returns standard_true if the edge <e> has a new curve on surface on the face <f>.in this case, <c> is the new geometric support of the edge, <l> the new location, <tol> the new tolerance. //! otherwise, returns standard_false, and <c>, <l>, <tol> are not significant. //! <newe> is the new edge created from <e>. <newf> is the new face created from <f>. they may be usefull.

Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face
NewE: TopoDS_Edge
NewF: TopoDS_Face
C: Geom2d_Curve
Tol: float

Returns
-------
bool
") NewCurve2d;
		Standard_Boolean NewCurve2d(const TopoDS_Edge & E, const TopoDS_Face & F, const TopoDS_Edge & NewE, const TopoDS_Face & NewF, opencascade::handle<Geom2d_Curve> & C, Standard_Real &OutValue);

		/****************** NewParameter ******************/
		%feature("compactdefaultargs") NewParameter;
		%feature("autodoc", "Returns standard_true if the vertex <v> has a new parameter on the edge <e>. in this case, <p> is the parameter, <tol> the new tolerance. otherwise, returns standard_false, and <p>, <tol> are not significant.

Parameters
----------
V: TopoDS_Vertex
E: TopoDS_Edge
P: float
Tol: float

Returns
-------
bool
") NewParameter;
		Standard_Boolean NewParameter(const TopoDS_Vertex & V, const TopoDS_Edge & E, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** NewPoint ******************/
		%feature("compactdefaultargs") NewPoint;
		%feature("autodoc", "Returns standard_true if the vertex <v> has been modified. in this case, <p> is the new geometric support of the vertex, <tol> the new tolerance. otherwise, returns standard_false, and <p>, <tol> are not significant.

Parameters
----------
V: TopoDS_Vertex
P: gp_Pnt
Tol: float

Returns
-------
bool
") NewPoint;
		Standard_Boolean NewPoint(const TopoDS_Vertex & V, gp_Pnt & P, Standard_Real &OutValue);

		/****************** NewSurface ******************/
		%feature("compactdefaultargs") NewSurface;
		%feature("autodoc", "Returns standard_true if the face <f> has been modified. in this case, <s> is the new geometric support of the face, <l> the new location, <tol> the new tolerance. otherwise, returns standard_false, and <s>, <l>, <tol> are not significant.

Parameters
----------
F: TopoDS_Face
S: Geom_Surface
L: TopLoc_Location
Tol: float
RevWires: bool
RevFace: bool

Returns
-------
bool
") NewSurface;
		Standard_Boolean NewSurface(const TopoDS_Face & F, opencascade::handle<Geom_Surface> & S, TopLoc_Location & L, Standard_Real &OutValue, Standard_Boolean &OutValue, Standard_Boolean &OutValue);

		/****************** ShapeCustom_DirectModification ******************/
		%feature("compactdefaultargs") ShapeCustom_DirectModification;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ShapeCustom_DirectModification;
		 ShapeCustom_DirectModification();

};


%make_alias(ShapeCustom_DirectModification)

%extend ShapeCustom_DirectModification {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class ShapeCustom_SweptToElementary *
**************************************/
/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class ShapeCustom_BSplineRestriction:
	pass

@classnotwrapped
class ShapeCustom_SweptToElementary:
	pass

@classnotwrapped
class ShapeCustom_ConvertToRevolution:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */

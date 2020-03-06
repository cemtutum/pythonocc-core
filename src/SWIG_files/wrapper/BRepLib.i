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
%define BREPLIBDOCSTRING
"BRepLib module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_breplib.html"
%enddef
%module (package="OCC.Core", docstring=BREPLIBDOCSTRING) BRepLib


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
#include<BRepLib_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<gp_module.hxx>
#include<TopoDS_module.hxx>
#include<GeomAbs_module.hxx>
#include<Geom2d_module.hxx>
#include<TopTools_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Geom_module.hxx>
#include<BRepTools_module.hxx>
#include<TopLoc_module.hxx>
#include<TopoDS_module.hxx>
#include<Adaptor2d_module.hxx>
#include<BRep_module.hxx>
#include<Message_module.hxx>
#include<Bnd_module.hxx>
#include<Poly_module.hxx>
#include<TShort_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import gp.i
%import TopoDS.i
%import GeomAbs.i
%import Geom2d.i
%import TopTools.i
%import Adaptor3d.i
%import Geom.i
%import BRepTools.i
%import TopLoc.i
/* public enums */
enum BRepLib_EdgeError {
	BRepLib_EdgeDone = 0,
	BRepLib_PointProjectionFailed = 1,
	BRepLib_ParameterOutOfRange = 2,
	BRepLib_DifferentPointsOnClosedCurve = 3,
	BRepLib_PointWithInfiniteParameter = 4,
	BRepLib_DifferentsPointAndParameter = 5,
	BRepLib_LineThroughIdenticPoints = 6,
};

enum BRepLib_ShellError {
	BRepLib_ShellDone = 0,
	BRepLib_EmptyShell = 1,
	BRepLib_DisconnectedShell = 2,
	BRepLib_ShellParametersOutOfRange = 3,
};

enum BRepLib_ShapeModification {
	BRepLib_Preserved = 0,
	BRepLib_Deleted = 1,
	BRepLib_Trimmed = 2,
	BRepLib_Merged = 3,
	BRepLib_BoundaryModified = 4,
};

enum BRepLib_WireError {
	BRepLib_WireDone = 0,
	BRepLib_EmptyWire = 1,
	BRepLib_DisconnectedWire = 2,
	BRepLib_NonManifoldWire = 3,
};

enum BRepLib_FaceError {
	BRepLib_FaceDone = 0,
	BRepLib_NoFace = 1,
	BRepLib_NotPlanar = 2,
	BRepLib_CurveProjectionFailed = 3,
	BRepLib_ParametersOutOfRange = 4,
};

/* end public enums declaration */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/****************
* class BRepLib *
****************/
%rename(breplib) BRepLib;
class BRepLib {
	public:
		/****************** BoundingVertex ******************/
		%feature("compactdefaultargs") BoundingVertex;
		%feature("autodoc", "Calculates the bounding sphere around the set of vertexes from the thelv list. returns the center (thenewcenter) and the radius (thenewtol) of this sphere. this can be used to construct the new vertex which covers the given set of other vertices.

	:param theLV:
	:type theLV: NCollection_List<TopoDS_Shape>
	:param theNewCenter:
	:type theNewCenter: gp_Pnt
	:param theNewTol:
	:type theNewTol: float
	:rtype: None
") BoundingVertex;
		static void BoundingVertex(const NCollection_List<TopoDS_Shape> & theLV, gp_Pnt & theNewCenter, Standard_Real &OutValue);

		/****************** BuildCurve3d ******************/
		%feature("compactdefaultargs") BuildCurve3d;
		%feature("autodoc", "Computes the 3d curve for the edge <e> if it does not exist. returns true if the curve was computed or existed. returns false if there is no planar pcurve or the computation failed. <maxsegment> >= 30 in approximation.

	:param E:
	:type E: TopoDS_Edge
	:param Tolerance: default value is 1.0e-5
	:type Tolerance: float
	:param Continuity: default value is GeomAbs_C1
	:type Continuity: GeomAbs_Shape
	:param MaxDegree: default value is 14
	:type MaxDegree: int
	:param MaxSegment: default value is 0
	:type MaxSegment: int
	:rtype: bool
") BuildCurve3d;
		static Standard_Boolean BuildCurve3d(const TopoDS_Edge & E, const Standard_Real Tolerance = 1.0e-5, const GeomAbs_Shape Continuity = GeomAbs_C1, const Standard_Integer MaxDegree = 14, const Standard_Integer MaxSegment = 0);

		/****************** BuildCurves3d ******************/
		%feature("compactdefaultargs") BuildCurves3d;
		%feature("autodoc", "Computes the 3d curves for all the edges of <s> return false if one of the computation failed. <maxsegment> >= 30 in approximation.

	:param S:
	:type S: TopoDS_Shape
	:param Tolerance:
	:type Tolerance: float
	:param Continuity: default value is GeomAbs_C1
	:type Continuity: GeomAbs_Shape
	:param MaxDegree: default value is 14
	:type MaxDegree: int
	:param MaxSegment: default value is 0
	:type MaxSegment: int
	:rtype: bool
") BuildCurves3d;
		static Standard_Boolean BuildCurves3d(const TopoDS_Shape & S, const Standard_Real Tolerance, const GeomAbs_Shape Continuity = GeomAbs_C1, const Standard_Integer MaxDegree = 14, const Standard_Integer MaxSegment = 0);

		/****************** BuildCurves3d ******************/
		%feature("compactdefaultargs") BuildCurves3d;
		%feature("autodoc", "Computes the 3d curves for all the edges of <s> return false if one of the computation failed.

	:param S:
	:type S: TopoDS_Shape
	:rtype: bool
") BuildCurves3d;
		static Standard_Boolean BuildCurves3d(const TopoDS_Shape & S);

		/****************** BuildPCurveForEdgeOnPlane ******************/
		%feature("compactdefaultargs") BuildPCurveForEdgeOnPlane;
		%feature("autodoc", "Builds pcurve of edge on face if the surface is plane, and updates the edge.

	:param theE:
	:type theE: TopoDS_Edge
	:param theF:
	:type theF: TopoDS_Face
	:rtype: None
") BuildPCurveForEdgeOnPlane;
		static void BuildPCurveForEdgeOnPlane(const TopoDS_Edge & theE, const TopoDS_Face & theF);

		/****************** BuildPCurveForEdgeOnPlane ******************/
		%feature("compactdefaultargs") BuildPCurveForEdgeOnPlane;
		%feature("autodoc", "Builds pcurve of edge on face if the surface is plane, but does not update the edge. the output are the pcurve and the flag telling that pcurve was built.

	:param theE:
	:type theE: TopoDS_Edge
	:param theF:
	:type theF: TopoDS_Face
	:param aC2D:
	:type aC2D: Geom2d_Curve
	:param bToUpdate:
	:type bToUpdate: bool
	:rtype: None
") BuildPCurveForEdgeOnPlane;
		static void BuildPCurveForEdgeOnPlane(const TopoDS_Edge & theE, const TopoDS_Face & theF, opencascade::handle<Geom2d_Curve> & aC2D, Standard_Boolean &OutValue);

		/****************** CheckSameRange ******************/
		%feature("compactdefaultargs") CheckSameRange;
		%feature("autodoc", "Checks if the edge is same range ignoring the same range flag of the edge confusion argument is to compare real numbers idenpendently of any model space tolerance.

	:param E:
	:type E: TopoDS_Edge
	:param Confusion: default value is 1.0e-12
	:type Confusion: float
	:rtype: bool
") CheckSameRange;
		static Standard_Boolean CheckSameRange(const TopoDS_Edge & E, const Standard_Real Confusion = 1.0e-12);

		/****************** EncodeRegularity ******************/
		%feature("compactdefaultargs") EncodeRegularity;
		%feature("autodoc", "Encodes the regularity of edges on a shape. warning: <tolang> is an angular tolerance, expressed in rad. warning: if the edges's regularity are coded before, nothing is done.

	:param S:
	:type S: TopoDS_Shape
	:param TolAng: default value is 1.0e-10
	:type TolAng: float
	:rtype: None
") EncodeRegularity;
		static void EncodeRegularity(const TopoDS_Shape & S, const Standard_Real TolAng = 1.0e-10);

		/****************** EncodeRegularity ******************/
		%feature("compactdefaultargs") EncodeRegularity;
		%feature("autodoc", "Encodes the regularity of edges in list <le> on the shape <s> warning: <tolang> is an angular tolerance, expressed in rad. warning: if the edges's regularity are coded before, nothing is done.

	:param S:
	:type S: TopoDS_Shape
	:param LE:
	:type LE: TopTools_ListOfShape
	:param TolAng: default value is 1.0e-10
	:type TolAng: float
	:rtype: None
") EncodeRegularity;
		static void EncodeRegularity(const TopoDS_Shape & S, const TopTools_ListOfShape & LE, const Standard_Real TolAng = 1.0e-10);

		/****************** EncodeRegularity ******************/
		%feature("compactdefaultargs") EncodeRegularity;
		%feature("autodoc", "Encodes the regularity beetween <f1> and <f2> by <e> warning: <tolang> is an angular tolerance, expressed in rad. warning: if the edge's regularity is coded before, nothing is done.

	:param E:
	:type E: TopoDS_Edge
	:param F1:
	:type F1: TopoDS_Face
	:param F2:
	:type F2: TopoDS_Face
	:param TolAng: default value is 1.0e-10
	:type TolAng: float
	:rtype: None
") EncodeRegularity;
		static void EncodeRegularity(TopoDS_Edge & E, const TopoDS_Face & F1, const TopoDS_Face & F2, const Standard_Real TolAng = 1.0e-10);

		/****************** EnsureNormalConsistency ******************/
		%feature("compactdefaultargs") EnsureNormalConsistency;
		%feature("autodoc", "Corrects the normals in poly_triangulation of faces, in such way that normals at nodes lying along smooth edges have the same value on both adjacent triangulations. returns true if any correction is done.

	:param S:
	:type S: TopoDS_Shape
	:param theAngTol: default value is 0.001
	:type theAngTol: float
	:param ForceComputeNormals: default value is Standard_False
	:type ForceComputeNormals: bool
	:rtype: bool
") EnsureNormalConsistency;
		static Standard_Boolean EnsureNormalConsistency(const TopoDS_Shape & S, const Standard_Real theAngTol = 0.001, const Standard_Boolean ForceComputeNormals = Standard_False);

		/****************** ExtendFace ******************/
		%feature("compactdefaultargs") ExtendFace;
		%feature("autodoc", "Enlarges the face on the given value. @param thef [in] the face to extend @param theextval [in] the extension value @param theextumin [in] defines whether to extend the face in umin direction @param theextumax [in] defines whether to extend the face in umax direction @param theextvmin [in] defines whether to extend the face in vmin direction @param theextvmax [in] defines whether to extend the face in vmax direction @param thefextended [in] the extended face.

	:param theF:
	:type theF: TopoDS_Face
	:param theExtVal:
	:type theExtVal: float
	:param theExtUMin:
	:type theExtUMin: bool
	:param theExtUMax:
	:type theExtUMax: bool
	:param theExtVMin:
	:type theExtVMin: bool
	:param theExtVMax:
	:type theExtVMax: bool
	:param theFExtended:
	:type theFExtended: TopoDS_Face
	:rtype: None
") ExtendFace;
		static void ExtendFace(const TopoDS_Face & theF, const Standard_Real theExtVal, const Standard_Boolean theExtUMin, const Standard_Boolean theExtUMax, const Standard_Boolean theExtVMin, const Standard_Boolean theExtVMax, TopoDS_Face & theFExtended);

		/****************** FindValidRange ******************/
		%feature("compactdefaultargs") FindValidRange;
		%feature("autodoc", "For an edge defined by 3d curve and tolerance and vertices defined by points, parameters on curve and tolerances, finds a range of curve between vertices not covered by vertices tolerances. returns false if there is no such range. otherwise, sets thefirst and thelast as its bounds.

	:param theCurve:
	:type theCurve: Adaptor3d_Curve
	:param theTolE:
	:type theTolE: float
	:param theParV1:
	:type theParV1: float
	:param thePntV1:
	:type thePntV1: gp_Pnt
	:param theTolV1:
	:type theTolV1: float
	:param theParV2:
	:type theParV2: float
	:param thePntV2:
	:type thePntV2: gp_Pnt
	:param theTolV2:
	:type theTolV2: float
	:param theFirst:
	:type theFirst: float
	:param theLast:
	:type theLast: float
	:rtype: bool
") FindValidRange;
		static Standard_Boolean FindValidRange(const Adaptor3d_Curve & theCurve, const Standard_Real theTolE, const Standard_Real theParV1, const gp_Pnt & thePntV1, const Standard_Real theTolV1, const Standard_Real theParV2, const gp_Pnt & thePntV2, const Standard_Real theTolV2, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** FindValidRange ******************/
		%feature("compactdefaultargs") FindValidRange;
		%feature("autodoc", "Finds a range of 3d curve of the edge not covered by vertices tolerances. returns false if there is no such range. otherwise, sets thefirst and thelast as its bounds.

	:param theEdge:
	:type theEdge: TopoDS_Edge
	:param theFirst:
	:type theFirst: float
	:param theLast:
	:type theLast: float
	:rtype: bool
") FindValidRange;
		static Standard_Boolean FindValidRange(const TopoDS_Edge & theEdge, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** OrientClosedSolid ******************/
		%feature("compactdefaultargs") OrientClosedSolid;
		%feature("autodoc", "Orients the solid forward and the shell with the orientation to have matter in the solid. returns false if the solid is unorientable (open or incoherent).

	:param solid:
	:type solid: TopoDS_Solid
	:rtype: bool
") OrientClosedSolid;
		static Standard_Boolean OrientClosedSolid(TopoDS_Solid & solid);

		/****************** Plane ******************/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "Sets the current plane to p.

	:param P:
	:type P: Geom_Plane
	:rtype: None
") Plane;
		static void Plane(const opencascade::handle<Geom_Plane> & P);

		/****************** Plane ******************/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "Returns the current plane.

	:rtype: opencascade::handle<Geom_Plane>
") Plane;
		static const opencascade::handle<Geom_Plane> & Plane();

		/****************** Precision ******************/
		%feature("compactdefaultargs") Precision;
		%feature("autodoc", "Computes the max distance between edge and its 2d representation on the face. sets the default precision. the current precision is returned.

	:param P:
	:type P: float
	:rtype: None
") Precision;
		static void Precision(const Standard_Real P);

		/****************** Precision ******************/
		%feature("compactdefaultargs") Precision;
		%feature("autodoc", "Returns the default precision.

	:rtype: float
") Precision;
		static Standard_Real Precision();

		/****************** ReverseSortFaces ******************/
		%feature("compactdefaultargs") ReverseSortFaces;
		%feature("autodoc", "Sorts in lf the faces of s on the reverse complexity of their surfaces (other,torus,sphere,cone,cylinder,plane).

	:param S:
	:type S: TopoDS_Shape
	:param LF:
	:type LF: TopTools_ListOfShape
	:rtype: None
") ReverseSortFaces;
		static void ReverseSortFaces(const TopoDS_Shape & S, TopTools_ListOfShape & LF);

		/****************** SameParameter ******************/
		%feature("compactdefaultargs") SameParameter;
		%feature("autodoc", "Computes new 2d curve(s) for the edge <theedge> to have the same parameter as the 3d curve. the algorithm is not done if the flag sameparameter was true on the edge.

	:param theEdge:
	:type theEdge: TopoDS_Edge
	:param Tolerance: default value is 1.0e-5
	:type Tolerance: float
	:rtype: None
") SameParameter;
		static void SameParameter(const TopoDS_Edge & theEdge, const Standard_Real Tolerance = 1.0e-5);

		/****************** SameParameter ******************/
		%feature("compactdefaultargs") SameParameter;
		%feature("autodoc", "Computes new 2d curve(s) for the edge <theedge> to have the same parameter as the 3d curve. the algorithm is not done if the flag sameparameter was true on the edge. thenewtol is a new tolerance of vertices of the input edge (not applied inside the algorithm, but pre-computed). if isuseoldedge is true then the input edge will be modified, otherwise the new copy of input edge will be created. returns the new edge as a result, can be ignored if isuseoldedge is true.

	:param theEdge:
	:type theEdge: TopoDS_Edge
	:param theTolerance:
	:type theTolerance: float
	:param theNewTol:
	:type theNewTol: float
	:param IsUseOldEdge:
	:type IsUseOldEdge: bool
	:rtype: TopoDS_Edge
") SameParameter;
		static TopoDS_Edge SameParameter(const TopoDS_Edge & theEdge, const Standard_Real theTolerance, Standard_Real &OutValue, const Standard_Boolean IsUseOldEdge);

		/****************** SameParameter ******************/
		%feature("compactdefaultargs") SameParameter;
		%feature("autodoc", "Computes new 2d curve(s) for all the edges of <s> to have the same parameter as the 3d curve. the algorithm is not done if the flag sameparameter was true on an edge.

	:param S:
	:type S: TopoDS_Shape
	:param Tolerance: default value is 1.0e-5
	:type Tolerance: float
	:param forced: default value is Standard_False
	:type forced: bool
	:rtype: None
") SameParameter;
		static void SameParameter(const TopoDS_Shape & S, const Standard_Real Tolerance = 1.0e-5, const Standard_Boolean forced = Standard_False);

		/****************** SameParameter ******************/
		%feature("compactdefaultargs") SameParameter;
		%feature("autodoc", "Computes new 2d curve(s) for all the edges of <s> to have the same parameter as the 3d curve. the algorithm is not done if the flag sameparameter was true on an edge. thereshaper is used to record the modifications of input shape <s> to prevent any modifications on the shape itself. thus the input shape (and its subshapes) will not be modified, instead the reshaper will contain a modified empty-copies of original subshapes as substitutions.

	:param S:
	:type S: TopoDS_Shape
	:param theReshaper:
	:type theReshaper: BRepTools_ReShape
	:param Tolerance: default value is 1.0e-5
	:type Tolerance: float
	:param forced: default value is Standard_False
	:type forced: bool
	:rtype: None
") SameParameter;
		static void SameParameter(const TopoDS_Shape & S, BRepTools_ReShape & theReshaper, const Standard_Real Tolerance = 1.0e-5, const Standard_Boolean forced = Standard_False);

		/****************** SameRange ******************/
		%feature("compactdefaultargs") SameRange;
		%feature("autodoc", "Will make all the curve representation have the same range domain for the parameters. this will ignore the same range flag value to proceed. if there is a 3d curve there it will the range of that curve. if not the first curve representation encountered in the list will give its range to the all the other curves.

	:param E:
	:type E: TopoDS_Edge
	:param Tolerance: default value is 1.0e-5
	:type Tolerance: float
	:rtype: None
") SameRange;
		static void SameRange(const TopoDS_Edge & E, const Standard_Real Tolerance = 1.0e-5);

		/****************** SortFaces ******************/
		%feature("compactdefaultargs") SortFaces;
		%feature("autodoc", "Sorts in lf the faces of s on the complexity of their surfaces (plane,cylinder,cone,sphere,torus,other).

	:param S:
	:type S: TopoDS_Shape
	:param LF:
	:type LF: TopTools_ListOfShape
	:rtype: None
") SortFaces;
		static void SortFaces(const TopoDS_Shape & S, TopTools_ListOfShape & LF);

		/****************** UpdateEdgeTol ******************/
		%feature("compactdefaultargs") UpdateEdgeTol;
		%feature("autodoc", "Checks if the edge has a tolerance smaller than -- -- -- -- maxtolerancetocheck if so it will compute the radius of -- the cylindrical pipe surface that mintolerancerequest is the minimum tolerance before it is usefull to start testing. usually it should be arround 10e-5 contains all -- the curve represenation of the edge returns true if the edge tolerance had to be updated.

	:param E:
	:type E: TopoDS_Edge
	:param MinToleranceRequest:
	:type MinToleranceRequest: float
	:param MaxToleranceToCheck:
	:type MaxToleranceToCheck: float
	:rtype: bool
") UpdateEdgeTol;
		static Standard_Boolean UpdateEdgeTol(const TopoDS_Edge & E, const Standard_Real MinToleranceRequest, const Standard_Real MaxToleranceToCheck);

		/****************** UpdateEdgeTolerance ******************/
		%feature("compactdefaultargs") UpdateEdgeTolerance;
		%feature("autodoc", "-- checks all the edges of the shape whose -- -- -- tolerance is smaller than maxtolerancetocheck -- returns true if at least one edge was updated -- mintolerancerequest is the minimum tolerance before -- it -- is usefull to start testing. usually it should be arround -- 10e-5-- //! warning :the method is very slow as it checks all. use only in interfaces or processing assimilate batch.

	:param S:
	:type S: TopoDS_Shape
	:param MinToleranceRequest:
	:type MinToleranceRequest: float
	:param MaxToleranceToCheck:
	:type MaxToleranceToCheck: float
	:rtype: bool
") UpdateEdgeTolerance;
		static Standard_Boolean UpdateEdgeTolerance(const TopoDS_Shape & S, const Standard_Real MinToleranceRequest, const Standard_Real MaxToleranceToCheck);

		/****************** UpdateInnerTolerances ******************/
		%feature("compactdefaultargs") UpdateInnerTolerances;
		%feature("autodoc", "Checks tolerances of edges (including inner points) and vertices of a shape and updates them to satisfy 'sameparameter' condition.

	:param S:
	:type S: TopoDS_Shape
	:rtype: None
") UpdateInnerTolerances;
		static void UpdateInnerTolerances(const TopoDS_Shape & S);

		/****************** UpdateTolerances ******************/
		%feature("compactdefaultargs") UpdateTolerances;
		%feature("autodoc", "Replaces tolerance of face edge vertex by the tolerance max of their connected handling shapes. it is not necessary to use this call after sameparameter. (called in).

	:param S:
	:type S: TopoDS_Shape
	:param verifyFaceTolerance: default value is Standard_False
	:type verifyFaceTolerance: bool
	:rtype: None
") UpdateTolerances;
		static void UpdateTolerances(const TopoDS_Shape & S, const Standard_Boolean verifyFaceTolerance = Standard_False);

		/****************** UpdateTolerances ******************/
		%feature("compactdefaultargs") UpdateTolerances;
		%feature("autodoc", "Replaces tolerance of face edge vertex by the tolerance max of their connected handling shapes. it is not necessary to use this call after sameparameter. (called in) thereshaper is used to record the modifications of input shape <s> to prevent any modifications on the shape itself. thus the input shape (and its subshapes) will not be modified, instead the reshaper will contain a modified empty-copies of original subshapes as substitutions.

	:param S:
	:type S: TopoDS_Shape
	:param theReshaper:
	:type theReshaper: BRepTools_ReShape
	:param verifyFaceTolerance: default value is Standard_False
	:type verifyFaceTolerance: bool
	:rtype: None
") UpdateTolerances;
		static void UpdateTolerances(const TopoDS_Shape & S, BRepTools_ReShape & theReshaper, const Standard_Boolean verifyFaceTolerance = Standard_False);

};


%extend BRepLib {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class BRepLib_CheckCurveOnSurface *
************************************/
class BRepLib_CheckCurveOnSurface {
	public:
		/****************** BRepLib_CheckCurveOnSurface ******************/
		%feature("compactdefaultargs") BRepLib_CheckCurveOnSurface;
		%feature("autodoc", "Default contructor.

	:rtype: None
") BRepLib_CheckCurveOnSurface;
		 BRepLib_CheckCurveOnSurface();

		/****************** BRepLib_CheckCurveOnSurface ******************/
		%feature("compactdefaultargs") BRepLib_CheckCurveOnSurface;
		%feature("autodoc", "Contructor.

	:param theEdge:
	:type theEdge: TopoDS_Edge
	:param theFace:
	:type theFace: TopoDS_Face
	:rtype: None
") BRepLib_CheckCurveOnSurface;
		 BRepLib_CheckCurveOnSurface(const TopoDS_Edge & theEdge, const TopoDS_Face & theFace);

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Returns source 3d-curve.

	:rtype: opencascade::handle<Geom_Curve>
") Curve;
		const opencascade::handle<Geom_Curve> & Curve();

		/****************** ErrorStatus ******************/
		%feature("compactdefaultargs") ErrorStatus;
		%feature("autodoc", "Returns error status the possible values are: 0 - ok; 1 - null curve or surface or 2d curve; 2 - invalid parametric range; 3 - error in calculations.

	:rtype: int
") ErrorStatus;
		Standard_Integer ErrorStatus();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Sets the data for the algorithm.

	:param theEdge:
	:type theEdge: TopoDS_Edge
	:param theFace:
	:type theFace: TopoDS_Face
	:rtype: None
") Init;
		void Init(const TopoDS_Edge & theEdge, const TopoDS_Face & theFace);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the max distance has been found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** MaxDistance ******************/
		%feature("compactdefaultargs") MaxDistance;
		%feature("autodoc", "Returns max distance.

	:rtype: float
") MaxDistance;
		Standard_Real MaxDistance();

		/****************** MaxParameter ******************/
		%feature("compactdefaultargs") MaxParameter;
		%feature("autodoc", "Returns parameter in which the distance is maximal.

	:rtype: float
") MaxParameter;
		Standard_Real MaxParameter();

		/****************** PCurve ******************/
		%feature("compactdefaultargs") PCurve;
		%feature("autodoc", "Returns mine 2d-curve.

	:rtype: opencascade::handle<Geom2d_Curve>
") PCurve;
		const opencascade::handle<Geom2d_Curve> & PCurve();

		/****************** PCurve2 ******************/
		%feature("compactdefaultargs") PCurve2;
		%feature("autodoc", "Returns 2nd 2d-curve (if it exists, e.g. for seam-edge).

	:rtype: opencascade::handle<Geom2d_Curve>
") PCurve2;
		const opencascade::handle<Geom2d_Curve> & PCurve2();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs the calculation if isthemultytheaddisabled == true then computation will be made without any parallelization.

	:param isTheMultyTheradDisabled: default value is Standard_False
	:type isTheMultyTheradDisabled: bool
	:rtype: None
") Perform;
		void Perform(const Standard_Boolean isTheMultyTheradDisabled = Standard_False);

		/****************** Range ******************/
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "Returns first and last parameter of the curves (2d- and 3d-curves are considered to have same range).

	:param theFirst:
	:type theFirst: float
	:param theLast:
	:type theLast: float
	:rtype: None
") Range;
		void Range(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Returns source surface.

	:rtype: opencascade::handle<Geom_Surface>
") Surface;
		const opencascade::handle<Geom_Surface> & Surface();

};


%extend BRepLib_CheckCurveOnSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class BRepLib_Command *
************************/
%nodefaultctor BRepLib_Command;
class BRepLib_Command {
	public:
		/****************** Check ******************/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "Raises notdone if done is false.

	:rtype: None
") Check;
		void Check();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone();

};


%extend BRepLib_Command {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class BRepLib_FindSurface *
****************************/
class BRepLib_FindSurface {
	public:
		/****************** BRepLib_FindSurface ******************/
		%feature("compactdefaultargs") BRepLib_FindSurface;
		%feature("autodoc", "	:rtype: None
") BRepLib_FindSurface;
		 BRepLib_FindSurface();

		/****************** BRepLib_FindSurface ******************/
		%feature("compactdefaultargs") BRepLib_FindSurface;
		%feature("autodoc", "Computes the surface from the edges of <s> with the given tolerance. if <onlyplane> is true, the computed surface will be a plane. if it is not possible to find a plane, the flag notdone will be set. if <onlyclosed> is true, then s sould be a wire and the existing surface, on which wire s is not closed in 2d, will be ignored.

	:param S:
	:type S: TopoDS_Shape
	:param Tol: default value is -1
	:type Tol: float
	:param OnlyPlane: default value is Standard_False
	:type OnlyPlane: bool
	:param OnlyClosed: default value is Standard_False
	:type OnlyClosed: bool
	:rtype: None
") BRepLib_FindSurface;
		 BRepLib_FindSurface(const TopoDS_Shape & S, const Standard_Real Tol = -1, const Standard_Boolean OnlyPlane = Standard_False, const Standard_Boolean OnlyClosed = Standard_False);

		/****************** Existed ******************/
		%feature("compactdefaultargs") Existed;
		%feature("autodoc", "	:rtype: bool
") Existed;
		Standard_Boolean Existed();

		/****************** Found ******************/
		%feature("compactdefaultargs") Found;
		%feature("autodoc", "	:rtype: bool
") Found;
		Standard_Boolean Found();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Computes the surface from the edges of <s> with the given tolerance. if <onlyplane> is true, the computed surface will be a plane. if it is not possible to find a plane, the flag notdone will be set. if <onlyclosed> is true, then s sould be a wire and the existing surface, on which wire s is not closed in 2d, will be ignored.

	:param S:
	:type S: TopoDS_Shape
	:param Tol: default value is -1
	:type Tol: float
	:param OnlyPlane: default value is Standard_False
	:type OnlyPlane: bool
	:param OnlyClosed: default value is Standard_False
	:type OnlyClosed: bool
	:rtype: None
") Init;
		void Init(const TopoDS_Shape & S, const Standard_Real Tol = -1, const Standard_Boolean OnlyPlane = Standard_False, const Standard_Boolean OnlyClosed = Standard_False);

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "	:rtype: TopLoc_Location
") Location;
		TopLoc_Location Location();

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "	:rtype: opencascade::handle<Geom_Surface>
") Surface;
		opencascade::handle<Geom_Surface> Surface();

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "	:rtype: float
") Tolerance;
		Standard_Real Tolerance();

		/****************** ToleranceReached ******************/
		%feature("compactdefaultargs") ToleranceReached;
		%feature("autodoc", "	:rtype: float
") ToleranceReached;
		Standard_Real ToleranceReached();

};


%extend BRepLib_FindSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class BRepLib_FuseEdges *
**************************/
class BRepLib_FuseEdges {
	public:
		/****************** AvoidEdges ******************/
		%feature("compactdefaultargs") AvoidEdges;
		%feature("autodoc", "Set edges to avoid being fused.

	:param theMapEdg:
	:type theMapEdg: TopTools_IndexedMapOfShape
	:rtype: None
") AvoidEdges;
		void AvoidEdges(const TopTools_IndexedMapOfShape & theMapEdg);

		/****************** BRepLib_FuseEdges ******************/
		%feature("compactdefaultargs") BRepLib_FuseEdges;
		%feature("autodoc", "Initialise members and build construction of map of ancestors.

	:param theShape:
	:type theShape: TopoDS_Shape
	:param PerformNow: default value is Standard_False
	:type PerformNow: bool
	:rtype: None
") BRepLib_FuseEdges;
		 BRepLib_FuseEdges(const TopoDS_Shape & theShape, const Standard_Boolean PerformNow = Standard_False);

		/****************** Edges ******************/
		%feature("compactdefaultargs") Edges;
		%feature("autodoc", "Returns all the list of edges to be fused each list of the map represent a set of connex edges that can be fused.

	:param theMapLstEdg:
	:type theMapLstEdg: TopTools_DataMapOfIntegerListOfShape
	:rtype: None
") Edges;
		void Edges(TopTools_DataMapOfIntegerListOfShape & theMapLstEdg);

		/****************** Faces ******************/
		%feature("compactdefaultargs") Faces;
		%feature("autodoc", "Returns the map of modified faces.

	:param theMapFac:
	:type theMapFac: TopTools_DataMapOfShapeShape
	:rtype: None
") Faces;
		void Faces(TopTools_DataMapOfShapeShape & theMapFac);

		/****************** NbVertices ******************/
		%feature("compactdefaultargs") NbVertices;
		%feature("autodoc", "Returns the number of vertices candidate to be removed.

	:rtype: int
") NbVertices;
		Standard_Integer NbVertices();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Using map of list of connex edges, fuse each list to one edge and then update myshape.

	:rtype: None
") Perform;
		void Perform();

		/****************** ResultEdges ******************/
		%feature("compactdefaultargs") ResultEdges;
		%feature("autodoc", "Returns all the fused edges. each integer entry in the map corresponds to the integer in the datamapofintegerlistofshape we get in method edges. that is to say, to the list of edges in themaplstedg(i) corresponds the resulting edge themapedge(i).

	:param theMapEdg:
	:type theMapEdg: TopTools_DataMapOfIntegerShape
	:rtype: None
") ResultEdges;
		void ResultEdges(TopTools_DataMapOfIntegerShape & theMapEdg);

		/****************** SetConcatBSpl ******************/
		%feature("compactdefaultargs") SetConcatBSpl;
		%feature("autodoc", "Set mode to enable concatenation g1 bspline edges in one end modified by ifv 19.04.07.

	:param theConcatBSpl: default value is Standard_True
	:type theConcatBSpl: bool
	:rtype: None
") SetConcatBSpl;
		void SetConcatBSpl(const Standard_Boolean theConcatBSpl = Standard_True);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Returns myshape modified with the list of internal edges removed from it.

	:rtype: TopoDS_Shape
") Shape;
		TopoDS_Shape Shape();

};


%extend BRepLib_FuseEdges {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class BRepLib_MakeShape *
**************************/
%nodefaultctor BRepLib_MakeShape;
class BRepLib_MakeShape : public BRepLib_Command {
	public:
		/****************** Build ******************/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "This is called by shape(). it does nothing but may be redefined.

	:rtype: None
") Build;
		void Build();

		/****************** DescendantFaces ******************/
		%feature("compactdefaultargs") DescendantFaces;
		%feature("autodoc", "Returns the list of generated faces.

	:param F:
	:type F: TopoDS_Face
	:rtype: TopTools_ListOfShape
") DescendantFaces;
		virtual const TopTools_ListOfShape & DescendantFaces(const TopoDS_Face & F);

		/****************** FaceStatus ******************/
		%feature("compactdefaultargs") FaceStatus;
		%feature("autodoc", "Returns the status of the face after the shape creation.

	:param F:
	:type F: TopoDS_Face
	:rtype: BRepLib_ShapeModification
") FaceStatus;
		virtual BRepLib_ShapeModification FaceStatus(const TopoDS_Face & F);

		/****************** FacesFromEdges ******************/
		%feature("compactdefaultargs") FacesFromEdges;
		%feature("autodoc", "Returns a list of the created faces from the edge <e>.

	:param E:
	:type E: TopoDS_Edge
	:rtype: TopTools_ListOfShape
") FacesFromEdges;
		virtual const TopTools_ListOfShape & FacesFromEdges(const TopoDS_Edge & E);

		/****************** HasDescendants ******************/
		%feature("compactdefaultargs") HasDescendants;
		%feature("autodoc", "Returns true if the face generates new topology.

	:param F:
	:type F: TopoDS_Face
	:rtype: bool
") HasDescendants;
		virtual Standard_Boolean HasDescendants(const TopoDS_Face & F);

		/****************** NbSurfaces ******************/
		%feature("compactdefaultargs") NbSurfaces;
		%feature("autodoc", "Returns the number of surfaces after the shape creation.

	:rtype: int
") NbSurfaces;
		virtual Standard_Integer NbSurfaces();

		/****************** NewFaces ******************/
		%feature("compactdefaultargs") NewFaces;
		%feature("autodoc", "Return the faces created for surface i.

	:param I:
	:type I: int
	:rtype: TopTools_ListOfShape
") NewFaces;
		virtual const TopTools_ListOfShape & NewFaces(const Standard_Integer I);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Shape;
		const TopoDS_Shape Shape();

};


%extend BRepLib_MakeShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class BRepLib_MakeEdge *
*************************/
class BRepLib_MakeEdge : public BRepLib_MakeShape {
	public:
		/****************** BRepLib_MakeEdge ******************/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge();

		/****************** BRepLib_MakeEdge ******************/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "	:param V1:
	:type V1: TopoDS_Vertex
	:param V2:
	:type V2: TopoDS_Vertex
	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** BRepLib_MakeEdge ******************/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const gp_Pnt & P1, const gp_Pnt & P2);

		/****************** BRepLib_MakeEdge ******************/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: gp_Lin
	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const gp_Lin & L);

		/****************** BRepLib_MakeEdge ******************/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: gp_Lin
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const gp_Lin & L, const Standard_Real p1, const Standard_Real p2);

		/****************** BRepLib_MakeEdge ******************/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: gp_Lin
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const gp_Lin & L, const gp_Pnt & P1, const gp_Pnt & P2);

		/****************** BRepLib_MakeEdge ******************/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: gp_Lin
	:param V1:
	:type V1: TopoDS_Vertex
	:param V2:
	:type V2: TopoDS_Vertex
	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const gp_Lin & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** BRepLib_MakeEdge ******************/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: gp_Circ
	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const gp_Circ & L);

		/****************** BRepLib_MakeEdge ******************/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: gp_Circ
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const gp_Circ & L, const Standard_Real p1, const Standard_Real p2);

		/****************** BRepLib_MakeEdge ******************/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: gp_Circ
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const gp_Circ & L, const gp_Pnt & P1, const gp_Pnt & P2);

		/****************** BRepLib_MakeEdge ******************/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: gp_Circ
	:param V1:
	:type V1: TopoDS_Vertex
	:param V2:
	:type V2: TopoDS_Vertex
	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const gp_Circ & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** BRepLib_MakeEdge ******************/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: gp_Elips
	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const gp_Elips & L);

		/****************** BRepLib_MakeEdge ******************/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: gp_Elips
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const gp_Elips & L, const Standard_Real p1, const Standard_Real p2);

		/****************** BRepLib_MakeEdge ******************/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: gp_Elips
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const gp_Elips & L, const gp_Pnt & P1, const gp_Pnt & P2);

		/****************** BRepLib_MakeEdge ******************/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: gp_Elips
	:param V1:
	:type V1: TopoDS_Vertex
	:param V2:
	:type V2: TopoDS_Vertex
	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const gp_Elips & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** BRepLib_MakeEdge ******************/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: gp_Hypr
	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const gp_Hypr & L);

		/****************** BRepLib_MakeEdge ******************/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: gp_Hypr
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const gp_Hypr & L, const Standard_Real p1, const Standard_Real p2);

		/****************** BRepLib_MakeEdge ******************/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: gp_Hypr
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const gp_Hypr & L, const gp_Pnt & P1, const gp_Pnt & P2);

		/****************** BRepLib_MakeEdge ******************/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: gp_Hypr
	:param V1:
	:type V1: TopoDS_Vertex
	:param V2:
	:type V2: TopoDS_Vertex
	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const gp_Hypr & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** BRepLib_MakeEdge ******************/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: gp_Parab
	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const gp_Parab & L);

		/****************** BRepLib_MakeEdge ******************/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: gp_Parab
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const gp_Parab & L, const Standard_Real p1, const Standard_Real p2);

		/****************** BRepLib_MakeEdge ******************/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: gp_Parab
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const gp_Parab & L, const gp_Pnt & P1, const gp_Pnt & P2);

		/****************** BRepLib_MakeEdge ******************/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: gp_Parab
	:param V1:
	:type V1: TopoDS_Vertex
	:param V2:
	:type V2: TopoDS_Vertex
	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const gp_Parab & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** BRepLib_MakeEdge ******************/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: Geom_Curve
	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const opencascade::handle<Geom_Curve> & L);

		/****************** BRepLib_MakeEdge ******************/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: Geom_Curve
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const opencascade::handle<Geom_Curve> & L, const Standard_Real p1, const Standard_Real p2);

		/****************** BRepLib_MakeEdge ******************/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: Geom_Curve
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const opencascade::handle<Geom_Curve> & L, const gp_Pnt & P1, const gp_Pnt & P2);

		/****************** BRepLib_MakeEdge ******************/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: Geom_Curve
	:param V1:
	:type V1: TopoDS_Vertex
	:param V2:
	:type V2: TopoDS_Vertex
	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const opencascade::handle<Geom_Curve> & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** BRepLib_MakeEdge ******************/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: Geom_Curve
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const opencascade::handle<Geom_Curve> & L, const gp_Pnt & P1, const gp_Pnt & P2, const Standard_Real p1, const Standard_Real p2);

		/****************** BRepLib_MakeEdge ******************/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: Geom_Curve
	:param V1:
	:type V1: TopoDS_Vertex
	:param V2:
	:type V2: TopoDS_Vertex
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const opencascade::handle<Geom_Curve> & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2, const Standard_Real p1, const Standard_Real p2);

		/****************** BRepLib_MakeEdge ******************/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: Geom2d_Curve
	:param S:
	:type S: Geom_Surface
	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const opencascade::handle<Geom2d_Curve> & L, const opencascade::handle<Geom_Surface> & S);

		/****************** BRepLib_MakeEdge ******************/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: Geom2d_Curve
	:param S:
	:type S: Geom_Surface
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const opencascade::handle<Geom2d_Curve> & L, const opencascade::handle<Geom_Surface> & S, const Standard_Real p1, const Standard_Real p2);

		/****************** BRepLib_MakeEdge ******************/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: Geom2d_Curve
	:param S:
	:type S: Geom_Surface
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const opencascade::handle<Geom2d_Curve> & L, const opencascade::handle<Geom_Surface> & S, const gp_Pnt & P1, const gp_Pnt & P2);

		/****************** BRepLib_MakeEdge ******************/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: Geom2d_Curve
	:param S:
	:type S: Geom_Surface
	:param V1:
	:type V1: TopoDS_Vertex
	:param V2:
	:type V2: TopoDS_Vertex
	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const opencascade::handle<Geom2d_Curve> & L, const opencascade::handle<Geom_Surface> & S, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** BRepLib_MakeEdge ******************/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: Geom2d_Curve
	:param S:
	:type S: Geom_Surface
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const opencascade::handle<Geom2d_Curve> & L, const opencascade::handle<Geom_Surface> & S, const gp_Pnt & P1, const gp_Pnt & P2, const Standard_Real p1, const Standard_Real p2);

		/****************** BRepLib_MakeEdge ******************/
		%feature("compactdefaultargs") BRepLib_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: Geom2d_Curve
	:param S:
	:type S: Geom_Surface
	:param V1:
	:type V1: TopoDS_Vertex
	:param V2:
	:type V2: TopoDS_Vertex
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge(const opencascade::handle<Geom2d_Curve> & L, const opencascade::handle<Geom_Surface> & S, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2, const Standard_Real p1, const Standard_Real p2);

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "	:rtype: TopoDS_Edge
") Edge;
		const TopoDS_Edge Edge();

		/****************** Error ******************/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "Returns the error description when notdone.

	:rtype: BRepLib_EdgeError
") Error;
		BRepLib_EdgeError Error();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param C:
	:type C: Geom_Curve
	:rtype: None
") Init;
		void Init(const opencascade::handle<Geom_Curve> & C);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param C:
	:type C: Geom_Curve
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") Init;
		void Init(const opencascade::handle<Geom_Curve> & C, const Standard_Real p1, const Standard_Real p2);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param C:
	:type C: Geom_Curve
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") Init;
		void Init(const opencascade::handle<Geom_Curve> & C, const gp_Pnt & P1, const gp_Pnt & P2);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param C:
	:type C: Geom_Curve
	:param V1:
	:type V1: TopoDS_Vertex
	:param V2:
	:type V2: TopoDS_Vertex
	:rtype: None
") Init;
		void Init(const opencascade::handle<Geom_Curve> & C, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param C:
	:type C: Geom_Curve
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") Init;
		void Init(const opencascade::handle<Geom_Curve> & C, const gp_Pnt & P1, const gp_Pnt & P2, const Standard_Real p1, const Standard_Real p2);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param C:
	:type C: Geom_Curve
	:param V1:
	:type V1: TopoDS_Vertex
	:param V2:
	:type V2: TopoDS_Vertex
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") Init;
		void Init(const opencascade::handle<Geom_Curve> & C, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2, const Standard_Real p1, const Standard_Real p2);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param C:
	:type C: Geom2d_Curve
	:param S:
	:type S: Geom_Surface
	:rtype: None
") Init;
		void Init(const opencascade::handle<Geom2d_Curve> & C, const opencascade::handle<Geom_Surface> & S);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param C:
	:type C: Geom2d_Curve
	:param S:
	:type S: Geom_Surface
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") Init;
		void Init(const opencascade::handle<Geom2d_Curve> & C, const opencascade::handle<Geom_Surface> & S, const Standard_Real p1, const Standard_Real p2);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param C:
	:type C: Geom2d_Curve
	:param S:
	:type S: Geom_Surface
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") Init;
		void Init(const opencascade::handle<Geom2d_Curve> & C, const opencascade::handle<Geom_Surface> & S, const gp_Pnt & P1, const gp_Pnt & P2);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param C:
	:type C: Geom2d_Curve
	:param S:
	:type S: Geom_Surface
	:param V1:
	:type V1: TopoDS_Vertex
	:param V2:
	:type V2: TopoDS_Vertex
	:rtype: None
") Init;
		void Init(const opencascade::handle<Geom2d_Curve> & C, const opencascade::handle<Geom_Surface> & S, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param C:
	:type C: Geom2d_Curve
	:param S:
	:type S: Geom_Surface
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") Init;
		void Init(const opencascade::handle<Geom2d_Curve> & C, const opencascade::handle<Geom_Surface> & S, const gp_Pnt & P1, const gp_Pnt & P2, const Standard_Real p1, const Standard_Real p2);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param C:
	:type C: Geom2d_Curve
	:param S:
	:type S: Geom_Surface
	:param V1:
	:type V1: TopoDS_Vertex
	:param V2:
	:type V2: TopoDS_Vertex
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") Init;
		void Init(const opencascade::handle<Geom2d_Curve> & C, const opencascade::handle<Geom_Surface> & S, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2, const Standard_Real p1, const Standard_Real p2);

		/****************** Vertex1 ******************/
		%feature("compactdefaultargs") Vertex1;
		%feature("autodoc", "Returns the first vertex of the edge. may be null.

	:rtype: TopoDS_Vertex
") Vertex1;
		const TopoDS_Vertex Vertex1();

		/****************** Vertex2 ******************/
		%feature("compactdefaultargs") Vertex2;
		%feature("autodoc", "Returns the second vertex of the edge. may be null.

	:rtype: TopoDS_Vertex
") Vertex2;
		const TopoDS_Vertex Vertex2();

};


%extend BRepLib_MakeEdge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class BRepLib_MakeEdge2d *
***************************/
class BRepLib_MakeEdge2d : public BRepLib_MakeShape {
	public:
		/****************** BRepLib_MakeEdge2d ******************/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
		%feature("autodoc", "	:param V1:
	:type V1: TopoDS_Vertex
	:param V2:
	:type V2: TopoDS_Vertex
	:rtype: None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** BRepLib_MakeEdge2d ******************/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
		%feature("autodoc", "	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****************** BRepLib_MakeEdge2d ******************/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: gp_Lin2d
	:rtype: None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const gp_Lin2d & L);

		/****************** BRepLib_MakeEdge2d ******************/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: gp_Lin2d
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const gp_Lin2d & L, const Standard_Real p1, const Standard_Real p2);

		/****************** BRepLib_MakeEdge2d ******************/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: gp_Lin2d
	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const gp_Lin2d & L, const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****************** BRepLib_MakeEdge2d ******************/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: gp_Lin2d
	:param V1:
	:type V1: TopoDS_Vertex
	:param V2:
	:type V2: TopoDS_Vertex
	:rtype: None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const gp_Lin2d & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** BRepLib_MakeEdge2d ******************/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: gp_Circ2d
	:rtype: None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const gp_Circ2d & L);

		/****************** BRepLib_MakeEdge2d ******************/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: gp_Circ2d
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const gp_Circ2d & L, const Standard_Real p1, const Standard_Real p2);

		/****************** BRepLib_MakeEdge2d ******************/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: gp_Circ2d
	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const gp_Circ2d & L, const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****************** BRepLib_MakeEdge2d ******************/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: gp_Circ2d
	:param V1:
	:type V1: TopoDS_Vertex
	:param V2:
	:type V2: TopoDS_Vertex
	:rtype: None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const gp_Circ2d & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** BRepLib_MakeEdge2d ******************/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: gp_Elips2d
	:rtype: None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const gp_Elips2d & L);

		/****************** BRepLib_MakeEdge2d ******************/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: gp_Elips2d
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const gp_Elips2d & L, const Standard_Real p1, const Standard_Real p2);

		/****************** BRepLib_MakeEdge2d ******************/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: gp_Elips2d
	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const gp_Elips2d & L, const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****************** BRepLib_MakeEdge2d ******************/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: gp_Elips2d
	:param V1:
	:type V1: TopoDS_Vertex
	:param V2:
	:type V2: TopoDS_Vertex
	:rtype: None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const gp_Elips2d & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** BRepLib_MakeEdge2d ******************/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: gp_Hypr2d
	:rtype: None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const gp_Hypr2d & L);

		/****************** BRepLib_MakeEdge2d ******************/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: gp_Hypr2d
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const gp_Hypr2d & L, const Standard_Real p1, const Standard_Real p2);

		/****************** BRepLib_MakeEdge2d ******************/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: gp_Hypr2d
	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const gp_Hypr2d & L, const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****************** BRepLib_MakeEdge2d ******************/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: gp_Hypr2d
	:param V1:
	:type V1: TopoDS_Vertex
	:param V2:
	:type V2: TopoDS_Vertex
	:rtype: None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const gp_Hypr2d & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** BRepLib_MakeEdge2d ******************/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: gp_Parab2d
	:rtype: None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const gp_Parab2d & L);

		/****************** BRepLib_MakeEdge2d ******************/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: gp_Parab2d
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const gp_Parab2d & L, const Standard_Real p1, const Standard_Real p2);

		/****************** BRepLib_MakeEdge2d ******************/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: gp_Parab2d
	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const gp_Parab2d & L, const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****************** BRepLib_MakeEdge2d ******************/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: gp_Parab2d
	:param V1:
	:type V1: TopoDS_Vertex
	:param V2:
	:type V2: TopoDS_Vertex
	:rtype: None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const gp_Parab2d & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** BRepLib_MakeEdge2d ******************/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: Geom2d_Curve
	:rtype: None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const opencascade::handle<Geom2d_Curve> & L);

		/****************** BRepLib_MakeEdge2d ******************/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: Geom2d_Curve
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const opencascade::handle<Geom2d_Curve> & L, const Standard_Real p1, const Standard_Real p2);

		/****************** BRepLib_MakeEdge2d ******************/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: Geom2d_Curve
	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const opencascade::handle<Geom2d_Curve> & L, const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****************** BRepLib_MakeEdge2d ******************/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: Geom2d_Curve
	:param V1:
	:type V1: TopoDS_Vertex
	:param V2:
	:type V2: TopoDS_Vertex
	:rtype: None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const opencascade::handle<Geom2d_Curve> & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** BRepLib_MakeEdge2d ******************/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: Geom2d_Curve
	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const opencascade::handle<Geom2d_Curve> & L, const gp_Pnt2d & P1, const gp_Pnt2d & P2, const Standard_Real p1, const Standard_Real p2);

		/****************** BRepLib_MakeEdge2d ******************/
		%feature("compactdefaultargs") BRepLib_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: Geom2d_Curve
	:param V1:
	:type V1: TopoDS_Vertex
	:param V2:
	:type V2: TopoDS_Vertex
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d(const opencascade::handle<Geom2d_Curve> & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2, const Standard_Real p1, const Standard_Real p2);

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "	:rtype: TopoDS_Edge
") Edge;
		const TopoDS_Edge Edge();

		/****************** Error ******************/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "Returns the error description when notdone.

	:rtype: BRepLib_EdgeError
") Error;
		BRepLib_EdgeError Error();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param C:
	:type C: Geom2d_Curve
	:rtype: None
") Init;
		void Init(const opencascade::handle<Geom2d_Curve> & C);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param C:
	:type C: Geom2d_Curve
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") Init;
		void Init(const opencascade::handle<Geom2d_Curve> & C, const Standard_Real p1, const Standard_Real p2);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param C:
	:type C: Geom2d_Curve
	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None
") Init;
		void Init(const opencascade::handle<Geom2d_Curve> & C, const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param C:
	:type C: Geom2d_Curve
	:param V1:
	:type V1: TopoDS_Vertex
	:param V2:
	:type V2: TopoDS_Vertex
	:rtype: None
") Init;
		void Init(const opencascade::handle<Geom2d_Curve> & C, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param C:
	:type C: Geom2d_Curve
	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") Init;
		void Init(const opencascade::handle<Geom2d_Curve> & C, const gp_Pnt2d & P1, const gp_Pnt2d & P2, const Standard_Real p1, const Standard_Real p2);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param C:
	:type C: Geom2d_Curve
	:param V1:
	:type V1: TopoDS_Vertex
	:param V2:
	:type V2: TopoDS_Vertex
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") Init;
		void Init(const opencascade::handle<Geom2d_Curve> & C, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2, const Standard_Real p1, const Standard_Real p2);

		/****************** Vertex1 ******************/
		%feature("compactdefaultargs") Vertex1;
		%feature("autodoc", "Returns the first vertex of the edge. may be null.

	:rtype: TopoDS_Vertex
") Vertex1;
		const TopoDS_Vertex Vertex1();

		/****************** Vertex2 ******************/
		%feature("compactdefaultargs") Vertex2;
		%feature("autodoc", "Returns the second vertex of the edge. may be null.

	:rtype: TopoDS_Vertex
") Vertex2;
		const TopoDS_Vertex Vertex2();

};


%extend BRepLib_MakeEdge2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class BRepLib_MakeFace *
*************************/
class BRepLib_MakeFace : public BRepLib_MakeShape {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds the wire <w> in the current face.

	:param W:
	:type W: TopoDS_Wire
	:rtype: None
") Add;
		void Add(const TopoDS_Wire & W);

		/****************** BRepLib_MakeFace ******************/
		%feature("compactdefaultargs") BRepLib_MakeFace;
		%feature("autodoc", "Not done.

	:rtype: None
") BRepLib_MakeFace;
		 BRepLib_MakeFace();

		/****************** BRepLib_MakeFace ******************/
		%feature("compactdefaultargs") BRepLib_MakeFace;
		%feature("autodoc", "Load a face. usefull to add wires.

	:param F:
	:type F: TopoDS_Face
	:rtype: None
") BRepLib_MakeFace;
		 BRepLib_MakeFace(const TopoDS_Face & F);

		/****************** BRepLib_MakeFace ******************/
		%feature("compactdefaultargs") BRepLib_MakeFace;
		%feature("autodoc", "Make a face from a plane.

	:param P:
	:type P: gp_Pln
	:rtype: None
") BRepLib_MakeFace;
		 BRepLib_MakeFace(const gp_Pln & P);

		/****************** BRepLib_MakeFace ******************/
		%feature("compactdefaultargs") BRepLib_MakeFace;
		%feature("autodoc", "Make a face from a cylinder.

	:param C:
	:type C: gp_Cylinder
	:rtype: None
") BRepLib_MakeFace;
		 BRepLib_MakeFace(const gp_Cylinder & C);

		/****************** BRepLib_MakeFace ******************/
		%feature("compactdefaultargs") BRepLib_MakeFace;
		%feature("autodoc", "Make a face from a cone.

	:param C:
	:type C: gp_Cone
	:rtype: None
") BRepLib_MakeFace;
		 BRepLib_MakeFace(const gp_Cone & C);

		/****************** BRepLib_MakeFace ******************/
		%feature("compactdefaultargs") BRepLib_MakeFace;
		%feature("autodoc", "Make a face from a sphere.

	:param S:
	:type S: gp_Sphere
	:rtype: None
") BRepLib_MakeFace;
		 BRepLib_MakeFace(const gp_Sphere & S);

		/****************** BRepLib_MakeFace ******************/
		%feature("compactdefaultargs") BRepLib_MakeFace;
		%feature("autodoc", "Make a face from a torus.

	:param C:
	:type C: gp_Torus
	:rtype: None
") BRepLib_MakeFace;
		 BRepLib_MakeFace(const gp_Torus & C);

		/****************** BRepLib_MakeFace ******************/
		%feature("compactdefaultargs") BRepLib_MakeFace;
		%feature("autodoc", "Make a face from a surface. accepts tolerance value (toldegen) for resolution of degenerated edges.

	:param S:
	:type S: Geom_Surface
	:param TolDegen:
	:type TolDegen: float
	:rtype: None
") BRepLib_MakeFace;
		 BRepLib_MakeFace(const opencascade::handle<Geom_Surface> & S, const Standard_Real TolDegen);

		/****************** BRepLib_MakeFace ******************/
		%feature("compactdefaultargs") BRepLib_MakeFace;
		%feature("autodoc", "Make a face from a plane.

	:param P:
	:type P: gp_Pln
	:param UMin:
	:type UMin: float
	:param UMax:
	:type UMax: float
	:param VMin:
	:type VMin: float
	:param VMax:
	:type VMax: float
	:rtype: None
") BRepLib_MakeFace;
		 BRepLib_MakeFace(const gp_Pln & P, const Standard_Real UMin, const Standard_Real UMax, const Standard_Real VMin, const Standard_Real VMax);

		/****************** BRepLib_MakeFace ******************/
		%feature("compactdefaultargs") BRepLib_MakeFace;
		%feature("autodoc", "Make a face from a cylinder.

	:param C:
	:type C: gp_Cylinder
	:param UMin:
	:type UMin: float
	:param UMax:
	:type UMax: float
	:param VMin:
	:type VMin: float
	:param VMax:
	:type VMax: float
	:rtype: None
") BRepLib_MakeFace;
		 BRepLib_MakeFace(const gp_Cylinder & C, const Standard_Real UMin, const Standard_Real UMax, const Standard_Real VMin, const Standard_Real VMax);

		/****************** BRepLib_MakeFace ******************/
		%feature("compactdefaultargs") BRepLib_MakeFace;
		%feature("autodoc", "Make a face from a cone.

	:param C:
	:type C: gp_Cone
	:param UMin:
	:type UMin: float
	:param UMax:
	:type UMax: float
	:param VMin:
	:type VMin: float
	:param VMax:
	:type VMax: float
	:rtype: None
") BRepLib_MakeFace;
		 BRepLib_MakeFace(const gp_Cone & C, const Standard_Real UMin, const Standard_Real UMax, const Standard_Real VMin, const Standard_Real VMax);

		/****************** BRepLib_MakeFace ******************/
		%feature("compactdefaultargs") BRepLib_MakeFace;
		%feature("autodoc", "Make a face from a sphere.

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
	:rtype: None
") BRepLib_MakeFace;
		 BRepLib_MakeFace(const gp_Sphere & S, const Standard_Real UMin, const Standard_Real UMax, const Standard_Real VMin, const Standard_Real VMax);

		/****************** BRepLib_MakeFace ******************/
		%feature("compactdefaultargs") BRepLib_MakeFace;
		%feature("autodoc", "Make a face from a torus.

	:param C:
	:type C: gp_Torus
	:param UMin:
	:type UMin: float
	:param UMax:
	:type UMax: float
	:param VMin:
	:type VMin: float
	:param VMax:
	:type VMax: float
	:rtype: None
") BRepLib_MakeFace;
		 BRepLib_MakeFace(const gp_Torus & C, const Standard_Real UMin, const Standard_Real UMax, const Standard_Real VMin, const Standard_Real VMax);

		/****************** BRepLib_MakeFace ******************/
		%feature("compactdefaultargs") BRepLib_MakeFace;
		%feature("autodoc", "Make a face from a surface. accepts min & max parameters to construct the face's bounds. also accepts tolerance value (toldegen) for resolution of degenerated edges.

	:param S:
	:type S: Geom_Surface
	:param UMin:
	:type UMin: float
	:param UMax:
	:type UMax: float
	:param VMin:
	:type VMin: float
	:param VMax:
	:type VMax: float
	:param TolDegen:
	:type TolDegen: float
	:rtype: None
") BRepLib_MakeFace;
		 BRepLib_MakeFace(const opencascade::handle<Geom_Surface> & S, const Standard_Real UMin, const Standard_Real UMax, const Standard_Real VMin, const Standard_Real VMax, const Standard_Real TolDegen);

		/****************** BRepLib_MakeFace ******************/
		%feature("compactdefaultargs") BRepLib_MakeFace;
		%feature("autodoc", "Find a surface from the wire and make a face. if <onlyplane> is true, the computed surface will be a plane. if it is not possible to find a plane, the flag notdone will be set.

	:param W:
	:type W: TopoDS_Wire
	:param OnlyPlane: default value is Standard_False
	:type OnlyPlane: bool
	:rtype: None
") BRepLib_MakeFace;
		 BRepLib_MakeFace(const TopoDS_Wire & W, const Standard_Boolean OnlyPlane = Standard_False);

		/****************** BRepLib_MakeFace ******************/
		%feature("compactdefaultargs") BRepLib_MakeFace;
		%feature("autodoc", "Make a face from a plane and a wire.

	:param P:
	:type P: gp_Pln
	:param W:
	:type W: TopoDS_Wire
	:param Inside: default value is Standard_True
	:type Inside: bool
	:rtype: None
") BRepLib_MakeFace;
		 BRepLib_MakeFace(const gp_Pln & P, const TopoDS_Wire & W, const Standard_Boolean Inside = Standard_True);

		/****************** BRepLib_MakeFace ******************/
		%feature("compactdefaultargs") BRepLib_MakeFace;
		%feature("autodoc", "Make a face from a cylinder and a wire.

	:param C:
	:type C: gp_Cylinder
	:param W:
	:type W: TopoDS_Wire
	:param Inside: default value is Standard_True
	:type Inside: bool
	:rtype: None
") BRepLib_MakeFace;
		 BRepLib_MakeFace(const gp_Cylinder & C, const TopoDS_Wire & W, const Standard_Boolean Inside = Standard_True);

		/****************** BRepLib_MakeFace ******************/
		%feature("compactdefaultargs") BRepLib_MakeFace;
		%feature("autodoc", "Make a face from a cone and a wire.

	:param C:
	:type C: gp_Cone
	:param W:
	:type W: TopoDS_Wire
	:param Inside: default value is Standard_True
	:type Inside: bool
	:rtype: None
") BRepLib_MakeFace;
		 BRepLib_MakeFace(const gp_Cone & C, const TopoDS_Wire & W, const Standard_Boolean Inside = Standard_True);

		/****************** BRepLib_MakeFace ******************/
		%feature("compactdefaultargs") BRepLib_MakeFace;
		%feature("autodoc", "Make a face from a sphere and a wire.

	:param S:
	:type S: gp_Sphere
	:param W:
	:type W: TopoDS_Wire
	:param Inside: default value is Standard_True
	:type Inside: bool
	:rtype: None
") BRepLib_MakeFace;
		 BRepLib_MakeFace(const gp_Sphere & S, const TopoDS_Wire & W, const Standard_Boolean Inside = Standard_True);

		/****************** BRepLib_MakeFace ******************/
		%feature("compactdefaultargs") BRepLib_MakeFace;
		%feature("autodoc", "Make a face from a torus and a wire.

	:param C:
	:type C: gp_Torus
	:param W:
	:type W: TopoDS_Wire
	:param Inside: default value is Standard_True
	:type Inside: bool
	:rtype: None
") BRepLib_MakeFace;
		 BRepLib_MakeFace(const gp_Torus & C, const TopoDS_Wire & W, const Standard_Boolean Inside = Standard_True);

		/****************** BRepLib_MakeFace ******************/
		%feature("compactdefaultargs") BRepLib_MakeFace;
		%feature("autodoc", "Make a face from a surface and a wire.

	:param S:
	:type S: Geom_Surface
	:param W:
	:type W: TopoDS_Wire
	:param Inside: default value is Standard_True
	:type Inside: bool
	:rtype: None
") BRepLib_MakeFace;
		 BRepLib_MakeFace(const opencascade::handle<Geom_Surface> & S, const TopoDS_Wire & W, const Standard_Boolean Inside = Standard_True);

		/****************** BRepLib_MakeFace ******************/
		%feature("compactdefaultargs") BRepLib_MakeFace;
		%feature("autodoc", "Adds the wire <w> in the face <f>.

	:param F:
	:type F: TopoDS_Face
	:param W:
	:type W: TopoDS_Wire
	:rtype: None
") BRepLib_MakeFace;
		 BRepLib_MakeFace(const TopoDS_Face & F, const TopoDS_Wire & W);

		/****************** Error ******************/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "	:rtype: BRepLib_FaceError
") Error;
		BRepLib_FaceError Error();

		/****************** Face ******************/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Returns the new face.

	:rtype: TopoDS_Face
") Face;
		const TopoDS_Face Face();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Load the face.

	:param F:
	:type F: TopoDS_Face
	:rtype: None
") Init;
		void Init(const TopoDS_Face & F);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Creates the face from the surface. if bound is true a wire is made from the natural bounds. accepts tolerance value (toldegen) for resolution of degenerated edges.

	:param S:
	:type S: Geom_Surface
	:param Bound:
	:type Bound: bool
	:param TolDegen:
	:type TolDegen: float
	:rtype: None
") Init;
		void Init(const opencascade::handle<Geom_Surface> & S, const Standard_Boolean Bound, const Standard_Real TolDegen);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Creates the face from the surface and the min-max values. accepts tolerance value (toldegen) for resolution of degenerated edges.

	:param S:
	:type S: Geom_Surface
	:param UMin:
	:type UMin: float
	:param UMax:
	:type UMax: float
	:param VMin:
	:type VMin: float
	:param VMax:
	:type VMax: float
	:param TolDegen:
	:type TolDegen: float
	:rtype: None
") Init;
		void Init(const opencascade::handle<Geom_Surface> & S, const Standard_Real UMin, const Standard_Real UMax, const Standard_Real VMin, const Standard_Real VMax, const Standard_Real TolDegen);

		/****************** IsDegenerated ******************/
		%feature("compactdefaultargs") IsDegenerated;
		%feature("autodoc", "Checks the specified curve is degenerated according to specified tolerance. returns <theacttol> less than <themaxtol>, which shows actual tolerance to decide the curve is degenerated. warning: for internal use of breplib_makeface and breplib_makeshell.

	:param theCurve:
	:type theCurve: Geom_Curve
	:param theMaxTol:
	:type theMaxTol: float
	:param theActTol:
	:type theActTol: float
	:rtype: bool
") IsDegenerated;
		static Standard_Boolean IsDegenerated(const opencascade::handle<Geom_Curve> & theCurve, const Standard_Real theMaxTol, Standard_Real &OutValue);

};


%extend BRepLib_MakeFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class BRepLib_MakePolygon *
****************************/
class BRepLib_MakePolygon : public BRepLib_MakeShape {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:rtype: None
") Add;
		void Add(const gp_Pnt & P);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param V:
	:type V: TopoDS_Vertex
	:rtype: None
") Add;
		void Add(const TopoDS_Vertex & V);

		/****************** Added ******************/
		%feature("compactdefaultargs") Added;
		%feature("autodoc", "Returns true if the last vertex or point was succesfully added.

	:rtype: bool
") Added;
		Standard_Boolean Added();

		/****************** BRepLib_MakePolygon ******************/
		%feature("compactdefaultargs") BRepLib_MakePolygon;
		%feature("autodoc", "Creates an empty makepolygon.

	:rtype: None
") BRepLib_MakePolygon;
		 BRepLib_MakePolygon();

		/****************** BRepLib_MakePolygon ******************/
		%feature("compactdefaultargs") BRepLib_MakePolygon;
		%feature("autodoc", "	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") BRepLib_MakePolygon;
		 BRepLib_MakePolygon(const gp_Pnt & P1, const gp_Pnt & P2);

		/****************** BRepLib_MakePolygon ******************/
		%feature("compactdefaultargs") BRepLib_MakePolygon;
		%feature("autodoc", "	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:param P3:
	:type P3: gp_Pnt
	:param Close: default value is Standard_False
	:type Close: bool
	:rtype: None
") BRepLib_MakePolygon;
		 BRepLib_MakePolygon(const gp_Pnt & P1, const gp_Pnt & P2, const gp_Pnt & P3, const Standard_Boolean Close = Standard_False);

		/****************** BRepLib_MakePolygon ******************/
		%feature("compactdefaultargs") BRepLib_MakePolygon;
		%feature("autodoc", "	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:param P3:
	:type P3: gp_Pnt
	:param P4:
	:type P4: gp_Pnt
	:param Close: default value is Standard_False
	:type Close: bool
	:rtype: None
") BRepLib_MakePolygon;
		 BRepLib_MakePolygon(const gp_Pnt & P1, const gp_Pnt & P2, const gp_Pnt & P3, const gp_Pnt & P4, const Standard_Boolean Close = Standard_False);

		/****************** BRepLib_MakePolygon ******************/
		%feature("compactdefaultargs") BRepLib_MakePolygon;
		%feature("autodoc", "	:param V1:
	:type V1: TopoDS_Vertex
	:param V2:
	:type V2: TopoDS_Vertex
	:rtype: None
") BRepLib_MakePolygon;
		 BRepLib_MakePolygon(const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** BRepLib_MakePolygon ******************/
		%feature("compactdefaultargs") BRepLib_MakePolygon;
		%feature("autodoc", "	:param V1:
	:type V1: TopoDS_Vertex
	:param V2:
	:type V2: TopoDS_Vertex
	:param V3:
	:type V3: TopoDS_Vertex
	:param Close: default value is Standard_False
	:type Close: bool
	:rtype: None
") BRepLib_MakePolygon;
		 BRepLib_MakePolygon(const TopoDS_Vertex & V1, const TopoDS_Vertex & V2, const TopoDS_Vertex & V3, const Standard_Boolean Close = Standard_False);

		/****************** BRepLib_MakePolygon ******************/
		%feature("compactdefaultargs") BRepLib_MakePolygon;
		%feature("autodoc", "	:param V1:
	:type V1: TopoDS_Vertex
	:param V2:
	:type V2: TopoDS_Vertex
	:param V3:
	:type V3: TopoDS_Vertex
	:param V4:
	:type V4: TopoDS_Vertex
	:param Close: default value is Standard_False
	:type Close: bool
	:rtype: None
") BRepLib_MakePolygon;
		 BRepLib_MakePolygon(const TopoDS_Vertex & V1, const TopoDS_Vertex & V2, const TopoDS_Vertex & V3, const TopoDS_Vertex & V4, const Standard_Boolean Close = Standard_False);

		/****************** Close ******************/
		%feature("compactdefaultargs") Close;
		%feature("autodoc", "	:rtype: None
") Close;
		void Close();

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Returns the last edge added to the polygon.

	:rtype: TopoDS_Edge
") Edge;
		const TopoDS_Edge Edge();

		/****************** FirstVertex ******************/
		%feature("compactdefaultargs") FirstVertex;
		%feature("autodoc", "	:rtype: TopoDS_Vertex
") FirstVertex;
		const TopoDS_Vertex FirstVertex();

		/****************** LastVertex ******************/
		%feature("compactdefaultargs") LastVertex;
		%feature("autodoc", "	:rtype: TopoDS_Vertex
") LastVertex;
		const TopoDS_Vertex LastVertex();

		/****************** Wire ******************/
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", "	:rtype: TopoDS_Wire
") Wire;
		const TopoDS_Wire Wire();

};


%extend BRepLib_MakePolygon {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class BRepLib_MakeShell *
**************************/
class BRepLib_MakeShell : public BRepLib_MakeShape {
	public:
		/****************** BRepLib_MakeShell ******************/
		%feature("compactdefaultargs") BRepLib_MakeShell;
		%feature("autodoc", "Not done.

	:rtype: None
") BRepLib_MakeShell;
		 BRepLib_MakeShell();

		/****************** BRepLib_MakeShell ******************/
		%feature("compactdefaultargs") BRepLib_MakeShell;
		%feature("autodoc", "	:param S:
	:type S: Geom_Surface
	:param Segment: default value is Standard_False
	:type Segment: bool
	:rtype: None
") BRepLib_MakeShell;
		 BRepLib_MakeShell(const opencascade::handle<Geom_Surface> & S, const Standard_Boolean Segment = Standard_False);

		/****************** BRepLib_MakeShell ******************/
		%feature("compactdefaultargs") BRepLib_MakeShell;
		%feature("autodoc", "	:param S:
	:type S: Geom_Surface
	:param UMin:
	:type UMin: float
	:param UMax:
	:type UMax: float
	:param VMin:
	:type VMin: float
	:param VMax:
	:type VMax: float
	:param Segment: default value is Standard_False
	:type Segment: bool
	:rtype: None
") BRepLib_MakeShell;
		 BRepLib_MakeShell(const opencascade::handle<Geom_Surface> & S, const Standard_Real UMin, const Standard_Real UMax, const Standard_Real VMin, const Standard_Real VMax, const Standard_Boolean Segment = Standard_False);

		/****************** Error ******************/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "	:rtype: BRepLib_ShellError
") Error;
		BRepLib_ShellError Error();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Creates the shell from the surface and the min-max values.

	:param S:
	:type S: Geom_Surface
	:param UMin:
	:type UMin: float
	:param UMax:
	:type UMax: float
	:param VMin:
	:type VMin: float
	:param VMax:
	:type VMax: float
	:param Segment: default value is Standard_False
	:type Segment: bool
	:rtype: None
") Init;
		void Init(const opencascade::handle<Geom_Surface> & S, const Standard_Real UMin, const Standard_Real UMax, const Standard_Real VMin, const Standard_Real VMax, const Standard_Boolean Segment = Standard_False);

		/****************** Shell ******************/
		%feature("compactdefaultargs") Shell;
		%feature("autodoc", "Returns the new shell.

	:rtype: TopoDS_Shell
") Shell;
		const TopoDS_Shell Shell();

};


%extend BRepLib_MakeShell {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class BRepLib_MakeSolid *
**************************/
class BRepLib_MakeSolid : public BRepLib_MakeShape {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Add the shell to the current solid.

	:param S:
	:type S: TopoDS_Shell
	:rtype: None
") Add;
		void Add(const TopoDS_Shell & S);

		/****************** BRepLib_MakeSolid ******************/
		%feature("compactdefaultargs") BRepLib_MakeSolid;
		%feature("autodoc", "Solid covers whole space.

	:rtype: None
") BRepLib_MakeSolid;
		 BRepLib_MakeSolid();

		/****************** BRepLib_MakeSolid ******************/
		%feature("compactdefaultargs") BRepLib_MakeSolid;
		%feature("autodoc", "Make a solid from a compsolid.

	:param S:
	:type S: TopoDS_CompSolid
	:rtype: None
") BRepLib_MakeSolid;
		 BRepLib_MakeSolid(const TopoDS_CompSolid & S);

		/****************** BRepLib_MakeSolid ******************/
		%feature("compactdefaultargs") BRepLib_MakeSolid;
		%feature("autodoc", "Make a solid from a shell.

	:param S:
	:type S: TopoDS_Shell
	:rtype: None
") BRepLib_MakeSolid;
		 BRepLib_MakeSolid(const TopoDS_Shell & S);

		/****************** BRepLib_MakeSolid ******************/
		%feature("compactdefaultargs") BRepLib_MakeSolid;
		%feature("autodoc", "Make a solid from two shells.

	:param S1:
	:type S1: TopoDS_Shell
	:param S2:
	:type S2: TopoDS_Shell
	:rtype: None
") BRepLib_MakeSolid;
		 BRepLib_MakeSolid(const TopoDS_Shell & S1, const TopoDS_Shell & S2);

		/****************** BRepLib_MakeSolid ******************/
		%feature("compactdefaultargs") BRepLib_MakeSolid;
		%feature("autodoc", "Make a solid from three shells.

	:param S1:
	:type S1: TopoDS_Shell
	:param S2:
	:type S2: TopoDS_Shell
	:param S3:
	:type S3: TopoDS_Shell
	:rtype: None
") BRepLib_MakeSolid;
		 BRepLib_MakeSolid(const TopoDS_Shell & S1, const TopoDS_Shell & S2, const TopoDS_Shell & S3);

		/****************** BRepLib_MakeSolid ******************/
		%feature("compactdefaultargs") BRepLib_MakeSolid;
		%feature("autodoc", "Make a solid from a solid. usefull for adding later.

	:param So:
	:type So: TopoDS_Solid
	:rtype: None
") BRepLib_MakeSolid;
		 BRepLib_MakeSolid(const TopoDS_Solid & So);

		/****************** BRepLib_MakeSolid ******************/
		%feature("compactdefaultargs") BRepLib_MakeSolid;
		%feature("autodoc", "Add a shell to a solid.

	:param So:
	:type So: TopoDS_Solid
	:param S:
	:type S: TopoDS_Shell
	:rtype: None
") BRepLib_MakeSolid;
		 BRepLib_MakeSolid(const TopoDS_Solid & So, const TopoDS_Shell & S);

		/****************** FaceStatus ******************/
		%feature("compactdefaultargs") FaceStatus;
		%feature("autodoc", "Returns the status of the face after the shape creation.

	:param F:
	:type F: TopoDS_Face
	:rtype: BRepLib_ShapeModification
") FaceStatus;
		virtual BRepLib_ShapeModification FaceStatus(const TopoDS_Face & F);

		/****************** Solid ******************/
		%feature("compactdefaultargs") Solid;
		%feature("autodoc", "Returns the new solid.

	:rtype: TopoDS_Solid
") Solid;
		const TopoDS_Solid Solid();

};


%extend BRepLib_MakeSolid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class BRepLib_MakeVertex *
***************************/
class BRepLib_MakeVertex : public BRepLib_MakeShape {
	public:
		/****************** BRepLib_MakeVertex ******************/
		%feature("compactdefaultargs") BRepLib_MakeVertex;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:rtype: None
") BRepLib_MakeVertex;
		 BRepLib_MakeVertex(const gp_Pnt & P);

		/****************** Vertex ******************/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "	:rtype: TopoDS_Vertex
") Vertex;
		const TopoDS_Vertex Vertex();

};


%extend BRepLib_MakeVertex {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class BRepLib_MakeWire *
*************************/
class BRepLib_MakeWire : public BRepLib_MakeShape {
	public:
		class BRepLib_BndBoxVertexSelector {};
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Add the edge <e> to the current wire.

	:param E:
	:type E: TopoDS_Edge
	:rtype: None
") Add;
		void Add(const TopoDS_Edge & E);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Add the edges of <w> to the current wire.

	:param W:
	:type W: TopoDS_Wire
	:rtype: None
") Add;
		void Add(const TopoDS_Wire & W);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Add the edges of <l> to the current wire. the edges are not to be consecutive. but they are to be all connected geometrically or topologically.

	:param L:
	:type L: TopTools_ListOfShape
	:rtype: None
") Add;
		void Add(const TopTools_ListOfShape & L);

		/****************** BRepLib_MakeWire ******************/
		%feature("compactdefaultargs") BRepLib_MakeWire;
		%feature("autodoc", "Notdone makewire.

	:rtype: None
") BRepLib_MakeWire;
		 BRepLib_MakeWire();

		/****************** BRepLib_MakeWire ******************/
		%feature("compactdefaultargs") BRepLib_MakeWire;
		%feature("autodoc", "Make a wire from an edge.

	:param E:
	:type E: TopoDS_Edge
	:rtype: None
") BRepLib_MakeWire;
		 BRepLib_MakeWire(const TopoDS_Edge & E);

		/****************** BRepLib_MakeWire ******************/
		%feature("compactdefaultargs") BRepLib_MakeWire;
		%feature("autodoc", "Make a wire from two edges.

	:param E1:
	:type E1: TopoDS_Edge
	:param E2:
	:type E2: TopoDS_Edge
	:rtype: None
") BRepLib_MakeWire;
		 BRepLib_MakeWire(const TopoDS_Edge & E1, const TopoDS_Edge & E2);

		/****************** BRepLib_MakeWire ******************/
		%feature("compactdefaultargs") BRepLib_MakeWire;
		%feature("autodoc", "Make a wire from three edges.

	:param E1:
	:type E1: TopoDS_Edge
	:param E2:
	:type E2: TopoDS_Edge
	:param E3:
	:type E3: TopoDS_Edge
	:rtype: None
") BRepLib_MakeWire;
		 BRepLib_MakeWire(const TopoDS_Edge & E1, const TopoDS_Edge & E2, const TopoDS_Edge & E3);

		/****************** BRepLib_MakeWire ******************/
		%feature("compactdefaultargs") BRepLib_MakeWire;
		%feature("autodoc", "Make a wire from four edges.

	:param E1:
	:type E1: TopoDS_Edge
	:param E2:
	:type E2: TopoDS_Edge
	:param E3:
	:type E3: TopoDS_Edge
	:param E4:
	:type E4: TopoDS_Edge
	:rtype: None
") BRepLib_MakeWire;
		 BRepLib_MakeWire(const TopoDS_Edge & E1, const TopoDS_Edge & E2, const TopoDS_Edge & E3, const TopoDS_Edge & E4);

		/****************** BRepLib_MakeWire ******************/
		%feature("compactdefaultargs") BRepLib_MakeWire;
		%feature("autodoc", "Make a wire from a wire. usefull for adding later.

	:param W:
	:type W: TopoDS_Wire
	:rtype: None
") BRepLib_MakeWire;
		 BRepLib_MakeWire(const TopoDS_Wire & W);

		/****************** BRepLib_MakeWire ******************/
		%feature("compactdefaultargs") BRepLib_MakeWire;
		%feature("autodoc", "Add an edge to a wire.

	:param W:
	:type W: TopoDS_Wire
	:param E:
	:type E: TopoDS_Edge
	:rtype: None
") BRepLib_MakeWire;
		 BRepLib_MakeWire(const TopoDS_Wire & W, const TopoDS_Edge & E);

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Returns the last edge added to the wire.

	:rtype: TopoDS_Edge
") Edge;
		const TopoDS_Edge Edge();

		/****************** Error ******************/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "	:rtype: BRepLib_WireError
") Error;
		BRepLib_WireError Error();

		/****************** Vertex ******************/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "Returns the last connecting vertex.

	:rtype: TopoDS_Vertex
") Vertex;
		const TopoDS_Vertex Vertex();

		/****************** Wire ******************/
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", "Returns the new wire.

	:rtype: TopoDS_Wire
") Wire;
		const TopoDS_Wire Wire();

};


%extend BRepLib_MakeWire {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */

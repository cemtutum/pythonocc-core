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
%define BREPBUILDERAPIDOCSTRING
"BRepBuilderAPI module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_brepbuilderapi.html"
%enddef
%module (package="OCC.Core", docstring=BREPBUILDERAPIDOCSTRING) BRepBuilderAPI


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
#include<BRepBuilderAPI_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Geom_module.hxx>
#include<TopoDS_module.hxx>
#include<TopTools_module.hxx>
#include<BRepTools_module.hxx>
#include<Message_module.hxx>
#include<gp_module.hxx>
#include<TColStd_module.hxx>
#include<Bnd_module.hxx>
#include<Geom2d_module.hxx>
#include<BRep_module.hxx>
#include<TopLoc_module.hxx>
#include<TShort_module.hxx>
#include<Poly_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Geom.i
%import TopoDS.i
%import TopTools.i
%import BRepTools.i
%import Message.i
%import gp.i
%import TColStd.i
%import Bnd.i
%import Geom2d.i
/* public enums */
enum BRepBuilderAPI_ShapeModification {
	BRepBuilderAPI_Preserved = 0,
	BRepBuilderAPI_Deleted = 1,
	BRepBuilderAPI_Trimmed = 2,
	BRepBuilderAPI_Merged = 3,
	BRepBuilderAPI_BoundaryModified = 4,
};

enum BRepBuilderAPI_WireError {
	BRepBuilderAPI_WireDone = 0,
	BRepBuilderAPI_EmptyWire = 1,
	BRepBuilderAPI_DisconnectedWire = 2,
	BRepBuilderAPI_NonManifoldWire = 3,
};

enum BRepBuilderAPI_EdgeError {
	BRepBuilderAPI_EdgeDone = 0,
	BRepBuilderAPI_PointProjectionFailed = 1,
	BRepBuilderAPI_ParameterOutOfRange = 2,
	BRepBuilderAPI_DifferentPointsOnClosedCurve = 3,
	BRepBuilderAPI_PointWithInfiniteParameter = 4,
	BRepBuilderAPI_DifferentsPointAndParameter = 5,
	BRepBuilderAPI_LineThroughIdenticPoints = 6,
};

enum BRepBuilderAPI_PipeError {
	BRepBuilderAPI_PipeDone = 0,
	BRepBuilderAPI_PipeNotDone = 1,
	BRepBuilderAPI_PlaneNotIntersectGuide = 2,
	BRepBuilderAPI_ImpossibleContact = 3,
};

enum BRepBuilderAPI_TransitionMode {
	BRepBuilderAPI_Transformed = 0,
	BRepBuilderAPI_RightCorner = 1,
	BRepBuilderAPI_RoundCorner = 2,
};

enum BRepBuilderAPI_FaceError {
	BRepBuilderAPI_FaceDone = 0,
	BRepBuilderAPI_NoFace = 1,
	BRepBuilderAPI_NotPlanar = 2,
	BRepBuilderAPI_CurveProjectionFailed = 3,
	BRepBuilderAPI_ParametersOutOfRange = 4,
};

enum BRepBuilderAPI_ShellError {
	BRepBuilderAPI_ShellDone = 0,
	BRepBuilderAPI_EmptyShell = 1,
	BRepBuilderAPI_DisconnectedShell = 2,
	BRepBuilderAPI_ShellParametersOutOfRange = 3,
};

/* end public enums declaration */

/* handles */
%wrap_handle(BRepBuilderAPI_FastSewing)
%wrap_handle(BRepBuilderAPI_Sewing)
/* end handles declaration */

/* templates */
%template(BRepBuilderAPI_BndBoxTree) NCollection_UBTree<Standard_Integer,Bnd_Box>;
/* end templates declaration */

/* typedefs */
typedef NCollection_Vector<gp_XYZ> VectorOfPoint;
typedef NCollection_CellFilter<BRepBuilderAPI_VertexInspector> BRepBuilderAPI_CellFilter;
typedef NCollection_UBTree<Standard_Integer, Bnd_Box> BRepBuilderAPI_BndBoxTree;
/* end typedefs declaration */

/***********************
* class BRepBuilderAPI *
***********************/
%rename(brepbuilderapi) BRepBuilderAPI;
class BRepBuilderAPI {
	public:
		/****************** Plane ******************/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "Sets the current plane.

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
		%feature("autodoc", "Sets the default precision. the current precision is returned.

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

};


%extend BRepBuilderAPI {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class BRepBuilderAPI_Collect *
*******************************/
class BRepBuilderAPI_Collect {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param SI:
	:type SI: TopoDS_Shape
	:param MKS:
	:type MKS: BRepBuilderAPI_MakeShape
	:rtype: None
") Add;
		void Add(const TopoDS_Shape & SI, BRepBuilderAPI_MakeShape & MKS);

		/****************** AddGenerated ******************/
		%feature("compactdefaultargs") AddGenerated;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape
	:param Gen:
	:type Gen: TopoDS_Shape
	:rtype: None
") AddGenerated;
		void AddGenerated(const TopoDS_Shape & S, const TopoDS_Shape & Gen);

		/****************** AddModif ******************/
		%feature("compactdefaultargs") AddModif;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape
	:param Mod:
	:type Mod: TopoDS_Shape
	:rtype: None
") AddModif;
		void AddModif(const TopoDS_Shape & S, const TopoDS_Shape & Mod);

		/****************** BRepBuilderAPI_Collect ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_Collect;
		%feature("autodoc", "	:rtype: None
") BRepBuilderAPI_Collect;
		 BRepBuilderAPI_Collect();

		/****************** Filter ******************/
		%feature("compactdefaultargs") Filter;
		%feature("autodoc", "	:param SF:
	:type SF: TopoDS_Shape
	:rtype: None
") Filter;
		void Filter(const TopoDS_Shape & SF);

		/****************** Generated ******************/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "	:rtype: TopTools_DataMapOfShapeListOfShape
") Generated;
		const TopTools_DataMapOfShapeListOfShape & Generated();

		/****************** Modification ******************/
		%feature("compactdefaultargs") Modification;
		%feature("autodoc", "	:rtype: TopTools_DataMapOfShapeListOfShape
") Modification;
		const TopTools_DataMapOfShapeListOfShape & Modification();

};


%extend BRepBuilderAPI_Collect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class BRepBuilderAPI_Command *
*******************************/
%nodefaultctor BRepBuilderAPI_Command;
class BRepBuilderAPI_Command {
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
		virtual Standard_Boolean IsDone();

};


%extend BRepBuilderAPI_Command {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class BRepBuilderAPI_FastSewing *
**********************************/
class BRepBuilderAPI_FastSewing : public Standard_Transient {
	public:
typedef unsigned int FS_VARStatuses;
		class FS_Vertex {};
		class FS_Face {};
		class FS_Edge {};
		class NodeInspector {};
/* public enums */
enum FS_Statuses {
	FS_OK = 0,
	FS_Degenerated = 1,
	FS_FindVertexError = 2,
	FS_FindEdgeError = 4,
	FS_FaceWithNullSurface = 8,
	FS_NotNaturalBoundsFace = 16,
	FS_InfiniteSurface = 32,
	FS_EmptyInput = 64,
	FS_Exception = 128,
};

/* end public enums declaration */

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds faces of a shape.

	:param theShape:
	:type theShape: TopoDS_Shape
	:rtype: bool
") Add;
		Standard_Boolean Add(const TopoDS_Shape & theShape);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds a surface.

	:param theSurface:
	:type theSurface: Geom_Surface
	:rtype: bool
") Add;
		Standard_Boolean Add(const opencascade::handle<Geom_Surface> & theSurface);

		/****************** BRepBuilderAPI_FastSewing ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_FastSewing;
		%feature("autodoc", "Creates an object with tolerance of connexity.

	:param theTolerance: default value is 1.0e-06
	:type theTolerance: float
	:rtype: None
") BRepBuilderAPI_FastSewing;
		 BRepBuilderAPI_FastSewing(const Standard_Real theTolerance = 1.0e-06);

		/****************** GetResult ******************/
		%feature("compactdefaultargs") GetResult;
		%feature("autodoc", "Returns resulted shape.

	:rtype: TopoDS_Shape
") GetResult;
		const TopoDS_Shape GetResult();

		/****************** GetTolerance ******************/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "Returns tolerance.

	:rtype: float
") GetTolerance;
		Standard_Real GetTolerance();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Compute resulted shape.

	:rtype: None
") Perform;
		void Perform();

		/****************** SetTolerance ******************/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "Sets tolerance.

	:param theToler:
	:type theToler: float
	:rtype: None
") SetTolerance;
		void SetTolerance(const Standard_Real theToler);

};


%make_alias(BRepBuilderAPI_FastSewing)

%extend BRepBuilderAPI_FastSewing {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class BRepBuilderAPI_FindPlane *
*********************************/
class BRepBuilderAPI_FindPlane {
	public:
		/****************** BRepBuilderAPI_FindPlane ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_FindPlane;
		%feature("autodoc", "Initializes an empty algorithm. the function init is then used to define the shape.

	:rtype: None
") BRepBuilderAPI_FindPlane;
		 BRepBuilderAPI_FindPlane();

		/****************** BRepBuilderAPI_FindPlane ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_FindPlane;
		%feature("autodoc", "Constructs the plane containing the edges of the shape s. a plane is built only if all the edges are within a distance of less than or equal to tolerance from a planar surface. this tolerance value is equal to the larger of the following two values: - tol, where the default value is negative, or - the largest of the tolerance values assigned to the individual edges of s. use the function found to verify that a plane is built. the resulting plane is then retrieved using the function plane.

	:param S:
	:type S: TopoDS_Shape
	:param Tol: default value is -1
	:type Tol: float
	:rtype: None
") BRepBuilderAPI_FindPlane;
		 BRepBuilderAPI_FindPlane(const TopoDS_Shape & S, const Standard_Real Tol = -1);

		/****************** Found ******************/
		%feature("compactdefaultargs") Found;
		%feature("autodoc", "Returns true if a plane containing the edges of the shape is found and built. use the function plane to consult the result.

	:rtype: bool
") Found;
		Standard_Boolean Found();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Constructs the plane containing the edges of the shape s. a plane is built only if all the edges are within a distance of less than or equal to tolerance from a planar surface. this tolerance value is equal to the larger of the following two values: - tol, where the default value is negative, or - the largest of the tolerance values assigned to the individual edges of s. use the function found to verify that a plane is built. the resulting plane is then retrieved using the function plane.

	:param S:
	:type S: TopoDS_Shape
	:param Tol: default value is -1
	:type Tol: float
	:rtype: None
") Init;
		void Init(const TopoDS_Shape & S, const Standard_Real Tol = -1);

		/****************** Plane ******************/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "Returns the plane containing the edges of the shape. warning use the function found to verify that the plane is built. if a plane is not found, plane returns a null handle.

	:rtype: opencascade::handle<Geom_Plane>
") Plane;
		opencascade::handle<Geom_Plane> Plane();

};


%extend BRepBuilderAPI_FindPlane {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class BRepBuilderAPI_Sewing *
******************************/
class BRepBuilderAPI_Sewing : public Standard_Transient {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Defines the shapes to be sewed or controlled.

	:param shape:
	:type shape: TopoDS_Shape
	:rtype: None
") Add;
		void Add(const TopoDS_Shape & shape);

		/****************** BRepBuilderAPI_Sewing ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_Sewing;
		%feature("autodoc", "Creates an object with tolerance of connexity option for sewing (if false only control) option for analysis of degenerated shapes option for cutting of free edges. option for non manifold processing.

	:param tolerance: default value is 1.0e-06
	:type tolerance: float
	:param option1: default value is Standard_True
	:type option1: bool
	:param option2: default value is Standard_True
	:type option2: bool
	:param option3: default value is Standard_True
	:type option3: bool
	:param option4: default value is Standard_False
	:type option4: bool
	:rtype: None
") BRepBuilderAPI_Sewing;
		 BRepBuilderAPI_Sewing(const Standard_Real tolerance = 1.0e-06, const Standard_Boolean option1 = Standard_True, const Standard_Boolean option2 = Standard_True, const Standard_Boolean option3 = Standard_True, const Standard_Boolean option4 = Standard_False);

		/****************** ContigousEdge ******************/
		%feature("compactdefaultargs") ContigousEdge;
		%feature("autodoc", "Gives each contigous edge.

	:param index:
	:type index: int
	:rtype: TopoDS_Edge
") ContigousEdge;
		const TopoDS_Edge ContigousEdge(const Standard_Integer index);

		/****************** ContigousEdgeCouple ******************/
		%feature("compactdefaultargs") ContigousEdgeCouple;
		%feature("autodoc", "Gives the sections (edge) belonging to a contigous edge.

	:param index:
	:type index: int
	:rtype: TopTools_ListOfShape
") ContigousEdgeCouple;
		const TopTools_ListOfShape & ContigousEdgeCouple(const Standard_Integer index);

		/****************** DegeneratedShape ******************/
		%feature("compactdefaultargs") DegeneratedShape;
		%feature("autodoc", "Gives each degenerated shape.

	:param index:
	:type index: int
	:rtype: TopoDS_Shape
") DegeneratedShape;
		const TopoDS_Shape DegeneratedShape(const Standard_Integer index);

		/****************** DeletedFace ******************/
		%feature("compactdefaultargs") DeletedFace;
		%feature("autodoc", "Gives each deleted face.

	:param index:
	:type index: int
	:rtype: TopoDS_Face
") DeletedFace;
		const TopoDS_Face DeletedFace(const Standard_Integer index);

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Print the informations.

	:rtype: None
") Dump;
		void Dump();

		/****************** FaceMode ******************/
		%feature("compactdefaultargs") FaceMode;
		%feature("autodoc", "Returns mode for sewing faces by default - true.

	:rtype: bool
") FaceMode;
		Standard_Boolean FaceMode();

		/****************** FloatingEdgesMode ******************/
		%feature("compactdefaultargs") FloatingEdgesMode;
		%feature("autodoc", "Returns mode for sewing floating edges by default - false.

	:rtype: bool
") FloatingEdgesMode;
		Standard_Boolean FloatingEdgesMode();

		/****************** FreeEdge ******************/
		%feature("compactdefaultargs") FreeEdge;
		%feature("autodoc", "Gives each free edge.

	:param index:
	:type index: int
	:rtype: TopoDS_Edge
") FreeEdge;
		const TopoDS_Edge FreeEdge(const Standard_Integer index);

		/****************** GetContext ******************/
		%feature("compactdefaultargs") GetContext;
		%feature("autodoc", "Return context.

	:rtype: opencascade::handle<BRepTools_ReShape>
") GetContext;
		const opencascade::handle<BRepTools_ReShape> & GetContext();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize the parameters if necessary.

	:param tolerance: default value is 1.0e-06
	:type tolerance: float
	:param option1: default value is Standard_True
	:type option1: bool
	:param option2: default value is Standard_True
	:type option2: bool
	:param option3: default value is Standard_True
	:type option3: bool
	:param option4: default value is Standard_False
	:type option4: bool
	:rtype: None
") Init;
		void Init(const Standard_Real tolerance = 1.0e-06, const Standard_Boolean option1 = Standard_True, const Standard_Boolean option2 = Standard_True, const Standard_Boolean option3 = Standard_True, const Standard_Boolean option4 = Standard_False);

		/****************** IsDegenerated ******************/
		%feature("compactdefaultargs") IsDegenerated;
		%feature("autodoc", "Indicates if a input shape is degenerated.

	:param shape:
	:type shape: TopoDS_Shape
	:rtype: bool
") IsDegenerated;
		Standard_Boolean IsDegenerated(const TopoDS_Shape & shape);

		/****************** IsModified ******************/
		%feature("compactdefaultargs") IsModified;
		%feature("autodoc", "Indicates if a input shape has been modified.

	:param shape:
	:type shape: TopoDS_Shape
	:rtype: bool
") IsModified;
		Standard_Boolean IsModified(const TopoDS_Shape & shape);

		/****************** IsModifiedSubShape ******************/
		%feature("compactdefaultargs") IsModifiedSubShape;
		%feature("autodoc", "Indicates if a input subshape has been modified.

	:param shape:
	:type shape: TopoDS_Shape
	:rtype: bool
") IsModifiedSubShape;
		Standard_Boolean IsModifiedSubShape(const TopoDS_Shape & shape);

		/****************** IsSectionBound ******************/
		%feature("compactdefaultargs") IsSectionBound;
		%feature("autodoc", "Indicates if a section is bound (before use sectiontoboundary).

	:param section:
	:type section: TopoDS_Edge
	:rtype: bool
") IsSectionBound;
		Standard_Boolean IsSectionBound(const TopoDS_Edge & section);

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "Loades the context shape.

	:param shape:
	:type shape: TopoDS_Shape
	:rtype: None
") Load;
		void Load(const TopoDS_Shape & shape);

		/****************** LocalTolerancesMode ******************/
		%feature("compactdefaultargs") LocalTolerancesMode;
		%feature("autodoc", "Returns mode for accounting of local tolerances of edges and vertices during of merging.

	:rtype: bool
") LocalTolerancesMode;
		Standard_Boolean LocalTolerancesMode();

		/****************** MaxTolerance ******************/
		%feature("compactdefaultargs") MaxTolerance;
		%feature("autodoc", "Gives set max tolerance.

	:rtype: float
") MaxTolerance;
		Standard_Real MaxTolerance();

		/****************** MinTolerance ******************/
		%feature("compactdefaultargs") MinTolerance;
		%feature("autodoc", "Gives set min tolerance.

	:rtype: float
") MinTolerance;
		Standard_Real MinTolerance();

		/****************** Modified ******************/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "Gives a modifieded shape.

	:param shape:
	:type shape: TopoDS_Shape
	:rtype: TopoDS_Shape
") Modified;
		const TopoDS_Shape Modified(const TopoDS_Shape & shape);

		/****************** ModifiedSubShape ******************/
		%feature("compactdefaultargs") ModifiedSubShape;
		%feature("autodoc", "Gives a modifieded subshape.

	:param shape:
	:type shape: TopoDS_Shape
	:rtype: TopoDS_Shape
") ModifiedSubShape;
		TopoDS_Shape ModifiedSubShape(const TopoDS_Shape & shape);

		/****************** MultipleEdge ******************/
		%feature("compactdefaultargs") MultipleEdge;
		%feature("autodoc", "Gives each multiple edge.

	:param index:
	:type index: int
	:rtype: TopoDS_Edge
") MultipleEdge;
		const TopoDS_Edge MultipleEdge(const Standard_Integer index);

		/****************** NbContigousEdges ******************/
		%feature("compactdefaultargs") NbContigousEdges;
		%feature("autodoc", "Gives the number of contigous edges (edge shared by two faces).

	:rtype: int
") NbContigousEdges;
		Standard_Integer NbContigousEdges();

		/****************** NbDegeneratedShapes ******************/
		%feature("compactdefaultargs") NbDegeneratedShapes;
		%feature("autodoc", "Gives the number of degenerated shapes.

	:rtype: int
") NbDegeneratedShapes;
		Standard_Integer NbDegeneratedShapes();

		/****************** NbDeletedFaces ******************/
		%feature("compactdefaultargs") NbDeletedFaces;
		%feature("autodoc", "Gives the number of deleted faces (faces smallest than tolerance).

	:rtype: int
") NbDeletedFaces;
		Standard_Integer NbDeletedFaces();

		/****************** NbFreeEdges ******************/
		%feature("compactdefaultargs") NbFreeEdges;
		%feature("autodoc", "Gives the number of free edges (edge shared by one face).

	:rtype: int
") NbFreeEdges;
		Standard_Integer NbFreeEdges();

		/****************** NbMultipleEdges ******************/
		%feature("compactdefaultargs") NbMultipleEdges;
		%feature("autodoc", "Gives the number of multiple edges (edge shared by more than two faces).

	:rtype: int
") NbMultipleEdges;
		Standard_Integer NbMultipleEdges();

		/****************** NonManifoldMode ******************/
		%feature("compactdefaultargs") NonManifoldMode;
		%feature("autodoc", "Gets mode for non-manifold sewing. //! internal fuctions ---.

	:rtype: bool
") NonManifoldMode;
		Standard_Boolean NonManifoldMode();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Computing thepi - progress indicator of algorithm.

	:param thePI: default value is 0
	:type thePI: Message_ProgressIndicator
	:rtype: None
") Perform;
		void Perform(const opencascade::handle<Message_ProgressIndicator> & thePI = 0);

		/****************** SameParameterMode ******************/
		%feature("compactdefaultargs") SameParameterMode;
		%feature("autodoc", "Gets same parameter mode.

	:rtype: bool
") SameParameterMode;
		Standard_Boolean SameParameterMode();

		/****************** SectionToBoundary ******************/
		%feature("compactdefaultargs") SectionToBoundary;
		%feature("autodoc", "Gives the original edge (free boundary) which becomes the the section. remember that sections constitute common edges. this imformation is important for control because with original edge we can find the surface to which the section is attached.

	:param section:
	:type section: TopoDS_Edge
	:rtype: TopoDS_Edge
") SectionToBoundary;
		const TopoDS_Edge SectionToBoundary(const TopoDS_Edge & section);

		/****************** SetContext ******************/
		%feature("compactdefaultargs") SetContext;
		%feature("autodoc", "Set context.

	:param theContext:
	:type theContext: BRepTools_ReShape
	:rtype: None
") SetContext;
		void SetContext(const opencascade::handle<BRepTools_ReShape> & theContext);

		/****************** SetFaceMode ******************/
		%feature("compactdefaultargs") SetFaceMode;
		%feature("autodoc", "Sets mode for sewing faces by default - true.

	:param theFaceMode:
	:type theFaceMode: bool
	:rtype: None
") SetFaceMode;
		void SetFaceMode(const Standard_Boolean theFaceMode);

		/****************** SetFloatingEdgesMode ******************/
		%feature("compactdefaultargs") SetFloatingEdgesMode;
		%feature("autodoc", "Sets mode for sewing floating edges by default - false. returns mode for cutting floating edges by default - false. sets mode for cutting floating edges by default - false.

	:param theFloatingEdgesMode:
	:type theFloatingEdgesMode: bool
	:rtype: None
") SetFloatingEdgesMode;
		void SetFloatingEdgesMode(const Standard_Boolean theFloatingEdgesMode);

		/****************** SetLocalTolerancesMode ******************/
		%feature("compactdefaultargs") SetLocalTolerancesMode;
		%feature("autodoc", "Sets mode for accounting of local tolerances of edges and vertices during of merging in this case worktolerance = mytolerance + toledge1+ toledg2;.

	:param theLocalTolerancesMode:
	:type theLocalTolerancesMode: bool
	:rtype: None
") SetLocalTolerancesMode;
		void SetLocalTolerancesMode(const Standard_Boolean theLocalTolerancesMode);

		/****************** SetMaxTolerance ******************/
		%feature("compactdefaultargs") SetMaxTolerance;
		%feature("autodoc", "Sets max tolerance.

	:param theMaxToler:
	:type theMaxToler: float
	:rtype: None
") SetMaxTolerance;
		void SetMaxTolerance(const Standard_Real theMaxToler);

		/****************** SetMinTolerance ******************/
		%feature("compactdefaultargs") SetMinTolerance;
		%feature("autodoc", "Sets min tolerance.

	:param theMinToler:
	:type theMinToler: float
	:rtype: None
") SetMinTolerance;
		void SetMinTolerance(const Standard_Real theMinToler);

		/****************** SetNonManifoldMode ******************/
		%feature("compactdefaultargs") SetNonManifoldMode;
		%feature("autodoc", "Sets mode for non-manifold sewing.

	:param theNonManifoldMode:
	:type theNonManifoldMode: bool
	:rtype: None
") SetNonManifoldMode;
		void SetNonManifoldMode(const Standard_Boolean theNonManifoldMode);

		/****************** SetSameParameterMode ******************/
		%feature("compactdefaultargs") SetSameParameterMode;
		%feature("autodoc", "Sets same parameter mode.

	:param SameParameterMode:
	:type SameParameterMode: bool
	:rtype: None
") SetSameParameterMode;
		void SetSameParameterMode(const Standard_Boolean SameParameterMode);

		/****************** SetTolerance ******************/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "Sets tolerance.

	:param theToler:
	:type theToler: float
	:rtype: None
") SetTolerance;
		void SetTolerance(const Standard_Real theToler);

		/****************** SewedShape ******************/
		%feature("compactdefaultargs") SewedShape;
		%feature("autodoc", "Gives the sewed shape a null shape if nothing constructed may be a face, a shell, a solid or a compound.

	:rtype: TopoDS_Shape
") SewedShape;
		const TopoDS_Shape SewedShape();

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Gives set tolerance.

	:rtype: float
") Tolerance;
		Standard_Real Tolerance();

		/****************** WhichFace ******************/
		%feature("compactdefaultargs") WhichFace;
		%feature("autodoc", "Gives a modified shape.

	:param theEdg:
	:type theEdg: TopoDS_Edge
	:param index: default value is 1
	:type index: int
	:rtype: TopoDS_Face
") WhichFace;
		TopoDS_Face WhichFace(const TopoDS_Edge & theEdg, const Standard_Integer index = 1);

};


%make_alias(BRepBuilderAPI_Sewing)

%extend BRepBuilderAPI_Sewing {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class BRepBuilderAPI_VertexInspector *
***************************************/
class BRepBuilderAPI_VertexInspector : public NCollection_CellFilter_InspectorXYZ {
	public:
typedef Standard_Integer Target;
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Keep the points used for comparison.

	:param thePnt:
	:type thePnt: gp_XYZ
	:rtype: None
") Add;
		void Add(const gp_XYZ & thePnt);

		/****************** BRepBuilderAPI_VertexInspector ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_VertexInspector;
		%feature("autodoc", "Constructor; remembers the tolerance.

	:param theTol:
	:type theTol: float
	:rtype: None
") BRepBuilderAPI_VertexInspector;
		 BRepBuilderAPI_VertexInspector(const Standard_Real theTol);

		/****************** ClearResList ******************/
		%feature("compactdefaultargs") ClearResList;
		%feature("autodoc", "Clear the list of adjacent points.

	:rtype: None
") ClearResList;
		void ClearResList();

		/****************** Inspect ******************/
		%feature("compactdefaultargs") Inspect;
		%feature("autodoc", "Implementation of inspection method.

	:param theTarget:
	:type theTarget: int
	:rtype: NCollection_CellFilter_Action
") Inspect;
		NCollection_CellFilter_Action Inspect(const Standard_Integer theTarget);

		/****************** ResInd ******************/
		%feature("compactdefaultargs") ResInd;
		%feature("autodoc", "Get list of indexes of points adjacent with the current.

	:rtype: TColStd_ListOfInteger
") ResInd;
		const TColStd_ListOfInteger & ResInd();

		/****************** SetCurrent ******************/
		%feature("compactdefaultargs") SetCurrent;
		%feature("autodoc", "Set current point to search for coincidence.

	:param theCurPnt:
	:type theCurPnt: gp_XYZ
	:rtype: None
") SetCurrent;
		void SetCurrent(const gp_XYZ & theCurPnt);

};


%extend BRepBuilderAPI_VertexInspector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class BRepBuilderAPI_BndBoxTreeSelector *
******************************************/
class BRepBuilderAPI_BndBoxTreeSelector : public BRepBuilderAPI_BndBoxTree::Selector {
	public:
		/****************** Accept ******************/
		%feature("compactdefaultargs") Accept;
		%feature("autodoc", "Implementation of acceptance method this method is called when the bounding box intersect with the current. it stores the object - the index of box in the list of accepted objects. returns true, because the object is accepted.

	:param theObj:
	:type theObj: int
	:rtype: bool
") Accept;
		Standard_Boolean Accept(const Standard_Integer & theObj);

		/****************** BRepBuilderAPI_BndBoxTreeSelector ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_BndBoxTreeSelector;
		%feature("autodoc", "Constructor; calls the base class constructor.

	:rtype: None
") BRepBuilderAPI_BndBoxTreeSelector;
		 BRepBuilderAPI_BndBoxTreeSelector();

		/****************** ClearResList ******************/
		%feature("compactdefaultargs") ClearResList;
		%feature("autodoc", "Clear the list of intersecting boxes.

	:rtype: None
") ClearResList;
		void ClearResList();

		/****************** Reject ******************/
		%feature("compactdefaultargs") Reject;
		%feature("autodoc", "Implementation of rejection method returns true if the bounding box does not intersect with the current .

	:param theBox:
	:type theBox: Bnd_Box
	:rtype: bool
") Reject;
		Standard_Boolean Reject(const Bnd_Box & theBox);

		/****************** ResInd ******************/
		%feature("compactdefaultargs") ResInd;
		%feature("autodoc", "Get list of indexes of boxes intersecting with the current box.

	:rtype: TColStd_ListOfInteger
") ResInd;
		const TColStd_ListOfInteger & ResInd();

		/****************** SetCurrent ******************/
		%feature("compactdefaultargs") SetCurrent;
		%feature("autodoc", "Set current box to search for overlapping with him.

	:param theBox:
	:type theBox: Bnd_Box
	:rtype: None
") SetCurrent;
		void SetCurrent(const Bnd_Box & theBox);

};


%extend BRepBuilderAPI_BndBoxTreeSelector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class BRepBuilderAPI_MakeShape *
*********************************/
%nodefaultctor BRepBuilderAPI_MakeShape;
class BRepBuilderAPI_MakeShape : public BRepBuilderAPI_Command {
	public:
		/****************** Build ******************/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "This is called by shape(). it does nothing but may be redefined.

	:rtype: None
") Build;
		virtual void Build();

		/****************** Generated ******************/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "Returns the list of shapes generated from the shape <s>.

	:param S:
	:type S: TopoDS_Shape
	:rtype: TopTools_ListOfShape
") Generated;
		virtual const TopTools_ListOfShape & Generated(const TopoDS_Shape & S);

		/****************** IsDeleted ******************/
		%feature("compactdefaultargs") IsDeleted;
		%feature("autodoc", "Returns true if the shape s has been deleted.

	:param S:
	:type S: TopoDS_Shape
	:rtype: bool
") IsDeleted;
		virtual Standard_Boolean IsDeleted(const TopoDS_Shape & S);

		/****************** Modified ******************/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "Returns the list of shapes modified from the shape <s>.

	:param S:
	:type S: TopoDS_Shape
	:rtype: TopTools_ListOfShape
") Modified;
		virtual const TopTools_ListOfShape & Modified(const TopoDS_Shape & S);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Returns a shape built by the shape construction algorithm. raises exception stdfail_notdone if the shape was not built.

	:rtype: TopoDS_Shape
") Shape;
		virtual const TopoDS_Shape Shape();

};


%extend BRepBuilderAPI_MakeShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class BRepBuilderAPI_MakeEdge *
********************************/
class BRepBuilderAPI_MakeEdge : public BRepBuilderAPI_MakeShape {
	public:
		/****************** BRepBuilderAPI_MakeEdge ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "	:rtype: None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge();

		/****************** BRepBuilderAPI_MakeEdge ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "	:param V1:
	:type V1: TopoDS_Vertex
	:param V2:
	:type V2: TopoDS_Vertex
	:rtype: None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** BRepBuilderAPI_MakeEdge ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const gp_Pnt & P1, const gp_Pnt & P2);

		/****************** BRepBuilderAPI_MakeEdge ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: gp_Lin
	:rtype: None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const gp_Lin & L);

		/****************** BRepBuilderAPI_MakeEdge ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: gp_Lin
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const gp_Lin & L, const Standard_Real p1, const Standard_Real p2);

		/****************** BRepBuilderAPI_MakeEdge ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: gp_Lin
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const gp_Lin & L, const gp_Pnt & P1, const gp_Pnt & P2);

		/****************** BRepBuilderAPI_MakeEdge ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: gp_Lin
	:param V1:
	:type V1: TopoDS_Vertex
	:param V2:
	:type V2: TopoDS_Vertex
	:rtype: None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const gp_Lin & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** BRepBuilderAPI_MakeEdge ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: gp_Circ
	:rtype: None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const gp_Circ & L);

		/****************** BRepBuilderAPI_MakeEdge ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: gp_Circ
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const gp_Circ & L, const Standard_Real p1, const Standard_Real p2);

		/****************** BRepBuilderAPI_MakeEdge ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: gp_Circ
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const gp_Circ & L, const gp_Pnt & P1, const gp_Pnt & P2);

		/****************** BRepBuilderAPI_MakeEdge ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: gp_Circ
	:param V1:
	:type V1: TopoDS_Vertex
	:param V2:
	:type V2: TopoDS_Vertex
	:rtype: None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const gp_Circ & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** BRepBuilderAPI_MakeEdge ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: gp_Elips
	:rtype: None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const gp_Elips & L);

		/****************** BRepBuilderAPI_MakeEdge ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: gp_Elips
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const gp_Elips & L, const Standard_Real p1, const Standard_Real p2);

		/****************** BRepBuilderAPI_MakeEdge ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: gp_Elips
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const gp_Elips & L, const gp_Pnt & P1, const gp_Pnt & P2);

		/****************** BRepBuilderAPI_MakeEdge ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: gp_Elips
	:param V1:
	:type V1: TopoDS_Vertex
	:param V2:
	:type V2: TopoDS_Vertex
	:rtype: None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const gp_Elips & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** BRepBuilderAPI_MakeEdge ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: gp_Hypr
	:rtype: None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const gp_Hypr & L);

		/****************** BRepBuilderAPI_MakeEdge ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: gp_Hypr
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const gp_Hypr & L, const Standard_Real p1, const Standard_Real p2);

		/****************** BRepBuilderAPI_MakeEdge ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: gp_Hypr
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const gp_Hypr & L, const gp_Pnt & P1, const gp_Pnt & P2);

		/****************** BRepBuilderAPI_MakeEdge ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: gp_Hypr
	:param V1:
	:type V1: TopoDS_Vertex
	:param V2:
	:type V2: TopoDS_Vertex
	:rtype: None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const gp_Hypr & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** BRepBuilderAPI_MakeEdge ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: gp_Parab
	:rtype: None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const gp_Parab & L);

		/****************** BRepBuilderAPI_MakeEdge ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: gp_Parab
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const gp_Parab & L, const Standard_Real p1, const Standard_Real p2);

		/****************** BRepBuilderAPI_MakeEdge ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: gp_Parab
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const gp_Parab & L, const gp_Pnt & P1, const gp_Pnt & P2);

		/****************** BRepBuilderAPI_MakeEdge ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: gp_Parab
	:param V1:
	:type V1: TopoDS_Vertex
	:param V2:
	:type V2: TopoDS_Vertex
	:rtype: None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const gp_Parab & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** BRepBuilderAPI_MakeEdge ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: Geom_Curve
	:rtype: None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const opencascade::handle<Geom_Curve> & L);

		/****************** BRepBuilderAPI_MakeEdge ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: Geom_Curve
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const opencascade::handle<Geom_Curve> & L, const Standard_Real p1, const Standard_Real p2);

		/****************** BRepBuilderAPI_MakeEdge ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: Geom_Curve
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const opencascade::handle<Geom_Curve> & L, const gp_Pnt & P1, const gp_Pnt & P2);

		/****************** BRepBuilderAPI_MakeEdge ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: Geom_Curve
	:param V1:
	:type V1: TopoDS_Vertex
	:param V2:
	:type V2: TopoDS_Vertex
	:rtype: None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const opencascade::handle<Geom_Curve> & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** BRepBuilderAPI_MakeEdge ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
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
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const opencascade::handle<Geom_Curve> & L, const gp_Pnt & P1, const gp_Pnt & P2, const Standard_Real p1, const Standard_Real p2);

		/****************** BRepBuilderAPI_MakeEdge ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
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
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const opencascade::handle<Geom_Curve> & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2, const Standard_Real p1, const Standard_Real p2);

		/****************** BRepBuilderAPI_MakeEdge ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: Geom2d_Curve
	:param S:
	:type S: Geom_Surface
	:rtype: None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const opencascade::handle<Geom2d_Curve> & L, const opencascade::handle<Geom_Surface> & S);

		/****************** BRepBuilderAPI_MakeEdge ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: Geom2d_Curve
	:param S:
	:type S: Geom_Surface
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const opencascade::handle<Geom2d_Curve> & L, const opencascade::handle<Geom_Surface> & S, const Standard_Real p1, const Standard_Real p2);

		/****************** BRepBuilderAPI_MakeEdge ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: Geom2d_Curve
	:param S:
	:type S: Geom_Surface
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const opencascade::handle<Geom2d_Curve> & L, const opencascade::handle<Geom_Surface> & S, const gp_Pnt & P1, const gp_Pnt & P2);

		/****************** BRepBuilderAPI_MakeEdge ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "	:param L:
	:type L: Geom2d_Curve
	:param S:
	:type S: Geom_Surface
	:param V1:
	:type V1: TopoDS_Vertex
	:param V2:
	:type V2: TopoDS_Vertex
	:rtype: None
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const opencascade::handle<Geom2d_Curve> & L, const opencascade::handle<Geom_Surface> & S, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** BRepBuilderAPI_MakeEdge ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
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
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const opencascade::handle<Geom2d_Curve> & L, const opencascade::handle<Geom_Surface> & S, const gp_Pnt & P1, const gp_Pnt & P2, const Standard_Real p1, const Standard_Real p2);

		/****************** BRepBuilderAPI_MakeEdge ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge;
		%feature("autodoc", "The general method to directly create an edge is to give - a 3d curve c as the support (geometric domain) of the edge, - two vertices v1 and v2 to limit the curve (definition of the restriction of the edge), and - two real values p1 and p2 which are the parameters for the vertices v1 and v2 on the curve. the curve may be defined as a 2d curve in the parametric space of a surface: a pcurve. the surface on which the edge is built is then kept at the level of the edge. the default tolerance will be associated with this edge. rules applied to the arguments: for the curve: - the curve must not be a 'null handle'. - if the curve is a trimmed curve the basis curve is used. for the vertices: - vertices may be null shapes. when v1 or v2 is null the edge is open in the corresponding direction and the parameter value p1 or p2 must be infinite (remember that precision::infinite() defines an infinite value). - the two vertices must be identical if they have the same 3d location. identical vertices are used in particular when the curve is closed. for the parameters: - the parameters must be in the parametric range of the curve (or the basis curve if the curve is trimmed). if this condition is not satisfied the edge is not built, and the error function will return brepapi_parameteroutofrange. - parameter values must not be equal. if this condition is not satisfied (i.e. if | p1 - p2 | ) the edge is not built, and the error function will return brepapi_linethroughidenticpoints. parameter values are expected to be given in increasing order: c->firstparameter() - if the parameter values are given in decreasing order the vertices are switched, i.e. the 'first vertex' is on the point of parameter p2 and the 'second vertex' is on the point of parameter p1. in such a case, to keep the original intent of the construction, the edge will be oriented 'reversed'. - on a periodic curve the parameter values p1 and p2 are adjusted by adding or subtracting the period to obtain p1 in the parametric range of the curve, and p2] such that [ p1 , where period is the period of the curve. - a parameter value may be infinite. the edge is open in the corresponding direction. however the corresponding vertex must be a null shape. if this condition is not satisfied the edge is not built, and the error function will return brepapi_pointwithinfiniteparameter. - the distance between the vertex and the point evaluated on the curve with the parameter, must be lower than the precision of the vertex. if this condition is not satisfied the edge is not built, and the error function will return brepapi_differentspointandparameter. other edge constructions - the parameter values can be omitted, they will be computed by projecting the vertices on the curve. note that projection is the only way to evaluate the parameter values of the vertices on the curve: vertices must be given on the curve, i.e. the distance from a vertex to the curve must be less than or equal to the precision of the vertex. if this condition is not satisfied the edge is not built, and the error function will return brepapi_pointprojectionfailed. - 3d points can be given in place of vertices. vertices will be created from the points (with the default topological precision precision::confusion()). note: - giving vertices is useful when creating a connected edge. - if the parameter values correspond to the extremities of a closed curve, points must be identical, or at least coincident. if this condition is not satisfied the edge is not built, and the error function will return brepapi_differentpointsonclosedcurve. - the vertices or points can be omitted if the parameter values are given. the points will be computed from the parameters on the curve. the vertices or points and the parameter values can be omitted. the first and last parameters of the curve will then be used. //! auxiliary methods.

	:param L:
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
") BRepBuilderAPI_MakeEdge;
		 BRepBuilderAPI_MakeEdge(const opencascade::handle<Geom2d_Curve> & L, const opencascade::handle<Geom_Surface> & S, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2, const Standard_Real p1, const Standard_Real p2);

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Returns the constructed edge. exceptions stdfail_notdone if the edge is not built.

	:rtype: TopoDS_Edge
") Edge;
		const TopoDS_Edge Edge();

		/****************** Error ******************/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "Returns the construction status - brepbuilderapi_edgedone if the edge is built, or - another value of the brepbuilderapi_edgeerror enumeration indicating the reason of construction failure.

	:rtype: BRepBuilderAPI_EdgeError
") Error;
		BRepBuilderAPI_EdgeError Error();

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
		%feature("autodoc", "Defines or redefines the arguments for the construction of an edge. this function is currently used after the empty constructor brepapi_makeedge().

	:param C:
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

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the edge is built.

	:rtype: bool
") IsDone;
		virtual Standard_Boolean IsDone();

		/****************** Vertex1 ******************/
		%feature("compactdefaultargs") Vertex1;
		%feature("autodoc", "Returns the first vertex of the edge. may be null.

	:rtype: TopoDS_Vertex
") Vertex1;
		const TopoDS_Vertex Vertex1();

		/****************** Vertex2 ******************/
		%feature("compactdefaultargs") Vertex2;
		%feature("autodoc", "Returns the second vertex of the edge. may be null. //! warning the returned vertex in each function corresponds respectively to - the lowest, or - the highest parameter on the curve along which the edge is built. it does not correspond to the first or second vertex given at the time of the construction, if the edge is oriented reversed. exceptions stdfail_notdone if the edge is not built.

	:rtype: TopoDS_Vertex
") Vertex2;
		const TopoDS_Vertex Vertex2();

};


%extend BRepBuilderAPI_MakeEdge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class BRepBuilderAPI_MakeEdge2d *
**********************************/
class BRepBuilderAPI_MakeEdge2d : public BRepBuilderAPI_MakeShape {
	public:
		/****************** BRepBuilderAPI_MakeEdge2d ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "	:param V1:
	:type V1: TopoDS_Vertex
	:param V2:
	:type V2: TopoDS_Vertex
	:rtype: None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** BRepBuilderAPI_MakeEdge2d ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****************** BRepBuilderAPI_MakeEdge2d ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: gp_Lin2d
	:rtype: None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const gp_Lin2d & L);

		/****************** BRepBuilderAPI_MakeEdge2d ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: gp_Lin2d
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const gp_Lin2d & L, const Standard_Real p1, const Standard_Real p2);

		/****************** BRepBuilderAPI_MakeEdge2d ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: gp_Lin2d
	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const gp_Lin2d & L, const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****************** BRepBuilderAPI_MakeEdge2d ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: gp_Lin2d
	:param V1:
	:type V1: TopoDS_Vertex
	:param V2:
	:type V2: TopoDS_Vertex
	:rtype: None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const gp_Lin2d & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** BRepBuilderAPI_MakeEdge2d ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: gp_Circ2d
	:rtype: None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const gp_Circ2d & L);

		/****************** BRepBuilderAPI_MakeEdge2d ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: gp_Circ2d
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const gp_Circ2d & L, const Standard_Real p1, const Standard_Real p2);

		/****************** BRepBuilderAPI_MakeEdge2d ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: gp_Circ2d
	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const gp_Circ2d & L, const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****************** BRepBuilderAPI_MakeEdge2d ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: gp_Circ2d
	:param V1:
	:type V1: TopoDS_Vertex
	:param V2:
	:type V2: TopoDS_Vertex
	:rtype: None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const gp_Circ2d & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** BRepBuilderAPI_MakeEdge2d ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: gp_Elips2d
	:rtype: None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const gp_Elips2d & L);

		/****************** BRepBuilderAPI_MakeEdge2d ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: gp_Elips2d
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const gp_Elips2d & L, const Standard_Real p1, const Standard_Real p2);

		/****************** BRepBuilderAPI_MakeEdge2d ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: gp_Elips2d
	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const gp_Elips2d & L, const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****************** BRepBuilderAPI_MakeEdge2d ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: gp_Elips2d
	:param V1:
	:type V1: TopoDS_Vertex
	:param V2:
	:type V2: TopoDS_Vertex
	:rtype: None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const gp_Elips2d & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** BRepBuilderAPI_MakeEdge2d ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: gp_Hypr2d
	:rtype: None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const gp_Hypr2d & L);

		/****************** BRepBuilderAPI_MakeEdge2d ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: gp_Hypr2d
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const gp_Hypr2d & L, const Standard_Real p1, const Standard_Real p2);

		/****************** BRepBuilderAPI_MakeEdge2d ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: gp_Hypr2d
	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const gp_Hypr2d & L, const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****************** BRepBuilderAPI_MakeEdge2d ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: gp_Hypr2d
	:param V1:
	:type V1: TopoDS_Vertex
	:param V2:
	:type V2: TopoDS_Vertex
	:rtype: None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const gp_Hypr2d & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** BRepBuilderAPI_MakeEdge2d ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: gp_Parab2d
	:rtype: None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const gp_Parab2d & L);

		/****************** BRepBuilderAPI_MakeEdge2d ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: gp_Parab2d
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const gp_Parab2d & L, const Standard_Real p1, const Standard_Real p2);

		/****************** BRepBuilderAPI_MakeEdge2d ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: gp_Parab2d
	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const gp_Parab2d & L, const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****************** BRepBuilderAPI_MakeEdge2d ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: gp_Parab2d
	:param V1:
	:type V1: TopoDS_Vertex
	:param V2:
	:type V2: TopoDS_Vertex
	:rtype: None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const gp_Parab2d & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** BRepBuilderAPI_MakeEdge2d ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: Geom2d_Curve
	:rtype: None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const opencascade::handle<Geom2d_Curve> & L);

		/****************** BRepBuilderAPI_MakeEdge2d ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: Geom2d_Curve
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const opencascade::handle<Geom2d_Curve> & L, const Standard_Real p1, const Standard_Real p2);

		/****************** BRepBuilderAPI_MakeEdge2d ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: Geom2d_Curve
	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const opencascade::handle<Geom2d_Curve> & L, const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****************** BRepBuilderAPI_MakeEdge2d ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
		%feature("autodoc", "	:param L:
	:type L: Geom2d_Curve
	:param V1:
	:type V1: TopoDS_Vertex
	:param V2:
	:type V2: TopoDS_Vertex
	:rtype: None
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const opencascade::handle<Geom2d_Curve> & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** BRepBuilderAPI_MakeEdge2d ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
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
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const opencascade::handle<Geom2d_Curve> & L, const gp_Pnt2d & P1, const gp_Pnt2d & P2, const Standard_Real p1, const Standard_Real p2);

		/****************** BRepBuilderAPI_MakeEdge2d ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeEdge2d;
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
") BRepBuilderAPI_MakeEdge2d;
		 BRepBuilderAPI_MakeEdge2d(const opencascade::handle<Geom2d_Curve> & L, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2, const Standard_Real p1, const Standard_Real p2);

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "	:rtype: TopoDS_Edge
") Edge;
		const TopoDS_Edge Edge();

		/****************** Error ******************/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "Returns the error description when notdone.

	:rtype: BRepBuilderAPI_EdgeError
") Error;
		BRepBuilderAPI_EdgeError Error();

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

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		virtual Standard_Boolean IsDone();

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


%extend BRepBuilderAPI_MakeEdge2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class BRepBuilderAPI_MakeFace *
********************************/
class BRepBuilderAPI_MakeFace : public BRepBuilderAPI_MakeShape {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds the wire w to the constructed face as a hole. warning w must not cross the other bounds of the face, and all the bounds must define only one area on the surface. (be careful, however, as this is not checked.) example // a cylinder gp_cylinder c = ..; // a wire topods_wire w = ...; brepbuilderapi_makeface mf(c); mf.add(w); topods_face f = mf;.

	:param W:
	:type W: TopoDS_Wire
	:rtype: None
") Add;
		void Add(const TopoDS_Wire & W);

		/****************** BRepBuilderAPI_MakeFace ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "Not done.

	:rtype: None
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace();

		/****************** BRepBuilderAPI_MakeFace ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "Load a face. usefull to add wires.

	:param F:
	:type F: TopoDS_Face
	:rtype: None
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace(const TopoDS_Face & F);

		/****************** BRepBuilderAPI_MakeFace ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "Make a face from a plane.

	:param P:
	:type P: gp_Pln
	:rtype: None
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace(const gp_Pln & P);

		/****************** BRepBuilderAPI_MakeFace ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "Make a face from a cylinder.

	:param C:
	:type C: gp_Cylinder
	:rtype: None
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace(const gp_Cylinder & C);

		/****************** BRepBuilderAPI_MakeFace ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "Make a face from a cone.

	:param C:
	:type C: gp_Cone
	:rtype: None
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace(const gp_Cone & C);

		/****************** BRepBuilderAPI_MakeFace ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "Make a face from a sphere.

	:param S:
	:type S: gp_Sphere
	:rtype: None
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace(const gp_Sphere & S);

		/****************** BRepBuilderAPI_MakeFace ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "Make a face from a torus.

	:param C:
	:type C: gp_Torus
	:rtype: None
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace(const gp_Torus & C);

		/****************** BRepBuilderAPI_MakeFace ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "Make a face from a surface. accepts tolerance value (toldegen) for resolution of degenerated edges.

	:param S:
	:type S: Geom_Surface
	:param TolDegen:
	:type TolDegen: float
	:rtype: None
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace(const opencascade::handle<Geom_Surface> & S, const Standard_Real TolDegen);

		/****************** BRepBuilderAPI_MakeFace ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
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
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace(const gp_Pln & P, const Standard_Real UMin, const Standard_Real UMax, const Standard_Real VMin, const Standard_Real VMax);

		/****************** BRepBuilderAPI_MakeFace ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
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
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace(const gp_Cylinder & C, const Standard_Real UMin, const Standard_Real UMax, const Standard_Real VMin, const Standard_Real VMax);

		/****************** BRepBuilderAPI_MakeFace ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
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
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace(const gp_Cone & C, const Standard_Real UMin, const Standard_Real UMax, const Standard_Real VMin, const Standard_Real VMax);

		/****************** BRepBuilderAPI_MakeFace ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
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
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace(const gp_Sphere & S, const Standard_Real UMin, const Standard_Real UMax, const Standard_Real VMin, const Standard_Real VMax);

		/****************** BRepBuilderAPI_MakeFace ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
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
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace(const gp_Torus & C, const Standard_Real UMin, const Standard_Real UMax, const Standard_Real VMin, const Standard_Real VMax);

		/****************** BRepBuilderAPI_MakeFace ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "Make a face from a surface. accepts tolerance value (toldegen) for resolution of degenerated edges.

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
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace(const opencascade::handle<Geom_Surface> & S, const Standard_Real UMin, const Standard_Real UMax, const Standard_Real VMin, const Standard_Real VMax, const Standard_Real TolDegen);

		/****************** BRepBuilderAPI_MakeFace ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "Find a surface from the wire and make a face. if <onlyplane> is true, the computed surface will be a plane. if it is not possible to find a plane, the flag notdone will be set.

	:param W:
	:type W: TopoDS_Wire
	:param OnlyPlane: default value is Standard_False
	:type OnlyPlane: bool
	:rtype: None
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace(const TopoDS_Wire & W, const Standard_Boolean OnlyPlane = Standard_False);

		/****************** BRepBuilderAPI_MakeFace ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "Make a face from a plane and a wire.

	:param P:
	:type P: gp_Pln
	:param W:
	:type W: TopoDS_Wire
	:param Inside: default value is Standard_True
	:type Inside: bool
	:rtype: None
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace(const gp_Pln & P, const TopoDS_Wire & W, const Standard_Boolean Inside = Standard_True);

		/****************** BRepBuilderAPI_MakeFace ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "Make a face from a cylinder and a wire.

	:param C:
	:type C: gp_Cylinder
	:param W:
	:type W: TopoDS_Wire
	:param Inside: default value is Standard_True
	:type Inside: bool
	:rtype: None
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace(const gp_Cylinder & C, const TopoDS_Wire & W, const Standard_Boolean Inside = Standard_True);

		/****************** BRepBuilderAPI_MakeFace ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "Make a face from a cone and a wire.

	:param C:
	:type C: gp_Cone
	:param W:
	:type W: TopoDS_Wire
	:param Inside: default value is Standard_True
	:type Inside: bool
	:rtype: None
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace(const gp_Cone & C, const TopoDS_Wire & W, const Standard_Boolean Inside = Standard_True);

		/****************** BRepBuilderAPI_MakeFace ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "Make a face from a sphere and a wire.

	:param S:
	:type S: gp_Sphere
	:param W:
	:type W: TopoDS_Wire
	:param Inside: default value is Standard_True
	:type Inside: bool
	:rtype: None
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace(const gp_Sphere & S, const TopoDS_Wire & W, const Standard_Boolean Inside = Standard_True);

		/****************** BRepBuilderAPI_MakeFace ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "Make a face from a torus and a wire.

	:param C:
	:type C: gp_Torus
	:param W:
	:type W: TopoDS_Wire
	:param Inside: default value is Standard_True
	:type Inside: bool
	:rtype: None
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace(const gp_Torus & C, const TopoDS_Wire & W, const Standard_Boolean Inside = Standard_True);

		/****************** BRepBuilderAPI_MakeFace ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "Make a face from a surface and a wire.

	:param S:
	:type S: Geom_Surface
	:param W:
	:type W: TopoDS_Wire
	:param Inside: default value is Standard_True
	:type Inside: bool
	:rtype: None
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace(const opencascade::handle<Geom_Surface> & S, const TopoDS_Wire & W, const Standard_Boolean Inside = Standard_True);

		/****************** BRepBuilderAPI_MakeFace ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeFace;
		%feature("autodoc", "Adds the wire <w> in the face <f> a general method to create a face is to give - a surface s as the support (the geometric domain) of the face, - and a wire w to bound it. the bounds of the face can also be defined by four parameter values umin, umax, vmin, vmax which determine isoparametric limitations on the parametric space of the surface. in this way, a patch is defined. the parameter values are optional. if they are omitted, the natural bounds of the surface are used. a wire is automatically built using the defined bounds. up to four edges and four vertices are created with this wire (no edge is created when the corresponding parameter value is infinite). wires can then be added using the function add to define other restrictions on the face. these restrictions represent holes. more than one wire may be added by this way, provided that the wires do not cross each other and that they define only one area on the surface. (be careful, however, as this is not checked). forbidden addition of wires note that in this schema, the third case is valid if edges of the wire w are declared internal to the face. as a result, these edges are no longer bounds of the face. a default tolerance (precision::confusion()) is given to the face, this tolerance may be increased during construction of the face using various algorithms. rules applied to the arguments for the surface: - the surface must not be a 'null handle'. - if the surface is a trimmed surface, the basis surface is used. - for the wire: the wire is composed of connected edges, each edge having a parametric curve description in the parametric domain of the surface; in other words, as a pcurve. for the parameters: - the parameter values must be in the parametric range of the surface (or the basis surface, if the surface is trimmed). if this condition is not satisfied, the face is not built, and the error function will return brepbuilderapi_parametersoutofrange. - the bounding parameters p1 and p2 are adjusted on a periodic surface in a given parametric direction by adding or subtracting the period to obtain p1 in the parametric range of the surface and such p2, that p2 - p1 <= period, where period is the period of the surface in this parametric direction. - a parameter value may be infinite. there will be no edge and no vertex in the corresponding direction.

	:param F:
	:type F: TopoDS_Face
	:param W:
	:type W: TopoDS_Wire
	:rtype: None
") BRepBuilderAPI_MakeFace;
		 BRepBuilderAPI_MakeFace(const TopoDS_Face & F, const TopoDS_Wire & W);

		/****************** Error ******************/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "Returns the construction status brepbuilderapi_facedone if the face is built, or - another value of the brepbuilderapi_faceerror enumeration indicating why the construction failed, in particular when the given parameters are outside the bounds of the surface.

	:rtype: BRepBuilderAPI_FaceError
") Error;
		BRepBuilderAPI_FaceError Error();

		/****************** Face ******************/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Returns the constructed face. exceptions stdfail_notdone if no face is built.

	:rtype: TopoDS_Face
") Face;
		const TopoDS_Face Face();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes (or reinitializes) the construction of a face by creating a new object which is a copy of the face f, in order to add wires to it, using the function add. note: this complete copy of the geometry is only required if you want to work on the geometries of the two faces independently.

	:param F:
	:type F: TopoDS_Face
	:rtype: None
") Init;
		void Init(const TopoDS_Face & F);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes (or reinitializes) the construction of a face on the surface s. if bound is true, a wire is automatically created from the natural bounds of the surface s and added to the face in order to bound it. if bound is false, no wire is added. this option is used when real bounds are known. these will be added to the face after this initialization, using the function add. toldegen parameter is used for resolution of degenerated edges if calculation of natural bounds is turned on.

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
		%feature("autodoc", "Initializes (or reinitializes) the construction of a face on the surface s, limited in the u parametric direction by the two parameter values umin and umax and in the v parametric direction by the two parameter values vmin and vmax. warning error returns: - brepbuilderapi_parametersoutofrange when the parameters given are outside the bounds of the surface or the basis surface of a trimmed surface. toldegen parameter is used for resolution of degenerated edges.

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

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if this algorithm has a valid face.

	:rtype: bool
") IsDone;
		virtual Standard_Boolean IsDone();

};


%extend BRepBuilderAPI_MakeFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class BRepBuilderAPI_MakePolygon *
***********************************/
class BRepBuilderAPI_MakePolygon : public BRepBuilderAPI_MakeShape {
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
		%feature("autodoc", "Adds the point p or the vertex v at the end of the polygonal wire under construction. a vertex is automatically created on the point p. warning - when p or v is coincident to the previous vertex, no edge is built. the method added can be used to test for this. neither p nor v is checked to verify that it is coincident with another vertex than the last one, of the polygonal wire under construction. it is also possible to add vertices on a closed polygon (built for example by using a constructor which declares the polygon closed, or after the use of the close function). consequently, be careful using this function: you might create: - a polygonal wire with two consecutive coincident edges, or - a non manifold polygonal wire. - p or v is not checked to verify if it is coincident with another vertex but the last one, of the polygonal wire under construction. it is also possible to add vertices on a closed polygon (built for example by using a constructor which declares the polygon closed, or after the use of the close function). consequently, be careful when using this function: you might create: - a polygonal wire with two consecutive coincident edges, or - a non-manifold polygonal wire.

	:param V:
	:type V: TopoDS_Vertex
	:rtype: None
") Add;
		void Add(const TopoDS_Vertex & V);

		/****************** Added ******************/
		%feature("compactdefaultargs") Added;
		%feature("autodoc", "Returns true if the last vertex added to the constructed polygonal wire is not coincident with the previous one.

	:rtype: bool
") Added;
		Standard_Boolean Added();

		/****************** BRepBuilderAPI_MakePolygon ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakePolygon;
		%feature("autodoc", "Initializes an empty polygonal wire, to which points or vertices are added using the add function. as soon as the polygonal wire under construction contains vertices, it can be consulted using the wire function.

	:rtype: None
") BRepBuilderAPI_MakePolygon;
		 BRepBuilderAPI_MakePolygon();

		/****************** BRepBuilderAPI_MakePolygon ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakePolygon;
		%feature("autodoc", "	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") BRepBuilderAPI_MakePolygon;
		 BRepBuilderAPI_MakePolygon(const gp_Pnt & P1, const gp_Pnt & P2);

		/****************** BRepBuilderAPI_MakePolygon ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakePolygon;
		%feature("autodoc", "	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:param P3:
	:type P3: gp_Pnt
	:param Close: default value is Standard_False
	:type Close: bool
	:rtype: None
") BRepBuilderAPI_MakePolygon;
		 BRepBuilderAPI_MakePolygon(const gp_Pnt & P1, const gp_Pnt & P2, const gp_Pnt & P3, const Standard_Boolean Close = Standard_False);

		/****************** BRepBuilderAPI_MakePolygon ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakePolygon;
		%feature("autodoc", "Constructs a polygonal wire from 2, 3 or 4 points. vertices are automatically created on the given points. the polygonal wire is closed if close is true; otherwise it is open. further vertices can be added using the add function. the polygonal wire under construction can be consulted at any time by using the wire function. example //an open polygon from four points topods_wire w = brepbuilderapi_makepolygon(p1,p2,p3,p4); warning: the process is equivalent to: - initializing an empty polygonal wire, - and adding the given points in sequence. consequently, be careful when using this function: if the sequence of points p1 - p2 - p1 is found among the arguments of the constructor, you will create a polygonal wire with two consecutive coincident edges.

	:param P1:
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
") BRepBuilderAPI_MakePolygon;
		 BRepBuilderAPI_MakePolygon(const gp_Pnt & P1, const gp_Pnt & P2, const gp_Pnt & P3, const gp_Pnt & P4, const Standard_Boolean Close = Standard_False);

		/****************** BRepBuilderAPI_MakePolygon ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakePolygon;
		%feature("autodoc", "	:param V1:
	:type V1: TopoDS_Vertex
	:param V2:
	:type V2: TopoDS_Vertex
	:rtype: None
") BRepBuilderAPI_MakePolygon;
		 BRepBuilderAPI_MakePolygon(const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** BRepBuilderAPI_MakePolygon ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakePolygon;
		%feature("autodoc", "	:param V1:
	:type V1: TopoDS_Vertex
	:param V2:
	:type V2: TopoDS_Vertex
	:param V3:
	:type V3: TopoDS_Vertex
	:param Close: default value is Standard_False
	:type Close: bool
	:rtype: None
") BRepBuilderAPI_MakePolygon;
		 BRepBuilderAPI_MakePolygon(const TopoDS_Vertex & V1, const TopoDS_Vertex & V2, const TopoDS_Vertex & V3, const Standard_Boolean Close = Standard_False);

		/****************** BRepBuilderAPI_MakePolygon ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakePolygon;
		%feature("autodoc", "Constructs a polygonal wire from 2, 3 or 4 vertices. the polygonal wire is closed if close is true; otherwise it is open (default value). further vertices can be added using the add function. the polygonal wire under construction can be consulted at any time by using the wire function. example //a closed triangle from three vertices topods_wire w = brepbuilderapi_makepolygon(v1,v2,v3,standard_true); warning the process is equivalent to: - initializing an empty polygonal wire, - then adding the given points in sequence. so be careful, as when using this function, you could create a polygonal wire with two consecutive coincident edges if the sequence of vertices v1 - v2 - v1 is found among the constructor's arguments.

	:param V1:
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
") BRepBuilderAPI_MakePolygon;
		 BRepBuilderAPI_MakePolygon(const TopoDS_Vertex & V1, const TopoDS_Vertex & V2, const TopoDS_Vertex & V3, const TopoDS_Vertex & V4, const Standard_Boolean Close = Standard_False);

		/****************** Close ******************/
		%feature("compactdefaultargs") Close;
		%feature("autodoc", "Closes the polygonal wire under construction. note - this is equivalent to adding the first vertex to the polygonal wire under construction.

	:rtype: None
") Close;
		void Close();

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Returns the edge built between the last two points or vertices added to the constructed polygonal wire under construction. warning if there is only one vertex in the polygonal wire, the result is a null edge.

	:rtype: TopoDS_Edge
") Edge;
		const TopoDS_Edge Edge();

		/****************** FirstVertex ******************/
		%feature("compactdefaultargs") FirstVertex;
		%feature("autodoc", "	:rtype: TopoDS_Vertex
") FirstVertex;
		const TopoDS_Vertex FirstVertex();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if this algorithm contains a valid polygonal wire (i.e. if there is at least one edge). isdone returns false if fewer than two vertices have been chained together by this construction algorithm.

	:rtype: bool
") IsDone;
		virtual Standard_Boolean IsDone();

		/****************** LastVertex ******************/
		%feature("compactdefaultargs") LastVertex;
		%feature("autodoc", "Returns the first or the last vertex of the polygonal wire under construction. if the constructed polygonal wire is closed, the first and the last vertices are identical.

	:rtype: TopoDS_Vertex
") LastVertex;
		const TopoDS_Vertex LastVertex();

		/****************** Wire ******************/
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", "Returns the constructed polygonal wire, or the already built part of the polygonal wire under construction. exceptions stdfail_notdone if the wire is not built, i.e. if fewer than two vertices have been chained together by this construction algorithm.

	:rtype: TopoDS_Wire
") Wire;
		const TopoDS_Wire Wire();

};


%extend BRepBuilderAPI_MakePolygon {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class BRepBuilderAPI_MakeShell *
*********************************/
class BRepBuilderAPI_MakeShell : public BRepBuilderAPI_MakeShape {
	public:
		/****************** BRepBuilderAPI_MakeShell ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeShell;
		%feature("autodoc", "Constructs an empty shell framework. the init function is used to define the construction arguments. warning the function error will return brepbuilderapi_emptyshell if it is called before the function init.

	:rtype: None
") BRepBuilderAPI_MakeShell;
		 BRepBuilderAPI_MakeShell();

		/****************** BRepBuilderAPI_MakeShell ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeShell;
		%feature("autodoc", "Constructs a shell from the surface s.

	:param S:
	:type S: Geom_Surface
	:param Segment: default value is Standard_False
	:type Segment: bool
	:rtype: None
") BRepBuilderAPI_MakeShell;
		 BRepBuilderAPI_MakeShell(const opencascade::handle<Geom_Surface> & S, const Standard_Boolean Segment = Standard_False);

		/****************** BRepBuilderAPI_MakeShell ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeShell;
		%feature("autodoc", "Constructs a shell from the surface s, limited in the u parametric direction by the two parameter values umin and umax, and limited in the v parametric direction by the two parameter values vmin and vmax.

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
") BRepBuilderAPI_MakeShell;
		 BRepBuilderAPI_MakeShell(const opencascade::handle<Geom_Surface> & S, const Standard_Real UMin, const Standard_Real UMax, const Standard_Real VMin, const Standard_Real VMax, const Standard_Boolean Segment = Standard_False);

		/****************** Error ******************/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "Returns the construction status: - brepbuilderapi_shelldone if the shell is built, or - another value of the brepbuilderapi_shellerror enumeration indicating why the construction failed. this is frequently brepbuilderapi_shellparametersoutofrange indicating that the given parameters are outside the bounds of the surface.

	:rtype: BRepBuilderAPI_ShellError
") Error;
		BRepBuilderAPI_ShellError Error();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Defines or redefines the arguments for the construction of a shell. the construction is initialized with the surface s, limited in the u parametric direction by the two parameter values umin and umax, and in the v parametric direction by the two parameter values vmin and vmax. warning the function error returns: - brepbuilderapi_shellparametersoutofrange when the given parameters are outside the bounds of the surface or the basis surface if s is trimmed.

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

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the shell is built.

	:rtype: bool
") IsDone;
		virtual Standard_Boolean IsDone();

		/****************** Shell ******************/
		%feature("compactdefaultargs") Shell;
		%feature("autodoc", "Returns the new shell.

	:rtype: TopoDS_Shell
") Shell;
		const TopoDS_Shell Shell();

};


%extend BRepBuilderAPI_MakeShell {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class BRepBuilderAPI_MakeSolid *
*********************************/
class BRepBuilderAPI_MakeSolid : public BRepBuilderAPI_MakeShape {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds the shell to the current solid. warning no check is done to verify the conditions of coherence of the resulting solid. in particular, s must not intersect other shells of the solid under construction. besides, after all shells have been added, one of these shells should constitute the outside skin of the solid. it may be closed (a finite solid) or open (an infinite solid). other shells form hollows (cavities) in these previous ones. each must bound a closed volume.

	:param S:
	:type S: TopoDS_Shell
	:rtype: None
") Add;
		void Add(const TopoDS_Shell & S);

		/****************** BRepBuilderAPI_MakeSolid ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeSolid;
		%feature("autodoc", "Initializes the construction of a solid. an empty solid is considered to cover the whole space. the add function is used to define shells to bound it.

	:rtype: None
") BRepBuilderAPI_MakeSolid;
		 BRepBuilderAPI_MakeSolid();

		/****************** BRepBuilderAPI_MakeSolid ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeSolid;
		%feature("autodoc", "Make a solid from a compsolid.

	:param S:
	:type S: TopoDS_CompSolid
	:rtype: None
") BRepBuilderAPI_MakeSolid;
		 BRepBuilderAPI_MakeSolid(const TopoDS_CompSolid & S);

		/****************** BRepBuilderAPI_MakeSolid ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeSolid;
		%feature("autodoc", "Make a solid from a shell.

	:param S:
	:type S: TopoDS_Shell
	:rtype: None
") BRepBuilderAPI_MakeSolid;
		 BRepBuilderAPI_MakeSolid(const TopoDS_Shell & S);

		/****************** BRepBuilderAPI_MakeSolid ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeSolid;
		%feature("autodoc", "Make a solid from two shells.

	:param S1:
	:type S1: TopoDS_Shell
	:param S2:
	:type S2: TopoDS_Shell
	:rtype: None
") BRepBuilderAPI_MakeSolid;
		 BRepBuilderAPI_MakeSolid(const TopoDS_Shell & S1, const TopoDS_Shell & S2);

		/****************** BRepBuilderAPI_MakeSolid ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeSolid;
		%feature("autodoc", "Make a solid from three shells. constructs a solid - covering the whole space, or - from shell s, or - from two shells s1 and s2, or - from three shells s1, s2 and s3, or warning no check is done to verify the conditions of coherence of the resulting solid. in particular, s1, s2 (and s3) must not intersect each other. besides, after all shells have been added using the add function, one of these shells should constitute the outside skin of the solid; it may be closed (a finite solid) or open (an infinite solid). other shells form hollows (cavities) in these previous ones. each must bound a closed volume.

	:param S1:
	:type S1: TopoDS_Shell
	:param S2:
	:type S2: TopoDS_Shell
	:param S3:
	:type S3: TopoDS_Shell
	:rtype: None
") BRepBuilderAPI_MakeSolid;
		 BRepBuilderAPI_MakeSolid(const TopoDS_Shell & S1, const TopoDS_Shell & S2, const TopoDS_Shell & S3);

		/****************** BRepBuilderAPI_MakeSolid ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeSolid;
		%feature("autodoc", "Make a solid from a solid. usefull for adding later.

	:param So:
	:type So: TopoDS_Solid
	:rtype: None
") BRepBuilderAPI_MakeSolid;
		 BRepBuilderAPI_MakeSolid(const TopoDS_Solid & So);

		/****************** BRepBuilderAPI_MakeSolid ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeSolid;
		%feature("autodoc", "Add a shell to a solid. //! constructs a solid: - from the solid so, to which shells can be added, or - by adding the shell s to the solid so. warning no check is done to verify the conditions of coherence of the resulting solid. in particular s must not intersect the solid s0. besides, after all shells have been added using the add function, one of these shells should constitute the outside skin of the solid. it may be closed (a finite solid) or open (an infinite solid). other shells form hollows (cavities) in the previous ones. each must bound a closed volume.

	:param So:
	:type So: TopoDS_Solid
	:param S:
	:type S: TopoDS_Shell
	:rtype: None
") BRepBuilderAPI_MakeSolid;
		 BRepBuilderAPI_MakeSolid(const TopoDS_Solid & So, const TopoDS_Shell & S);

		/****************** IsDeleted ******************/
		%feature("compactdefaultargs") IsDeleted;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape
	:rtype: bool
") IsDeleted;
		virtual Standard_Boolean IsDeleted(const TopoDS_Shape & S);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the solid is built. for this class, a solid under construction is always valid. if no shell has been added, it could be a whole-space solid. however, no check was done to verify the conditions of coherence of the resulting solid.

	:rtype: bool
") IsDone;
		virtual Standard_Boolean IsDone();

		/****************** Solid ******************/
		%feature("compactdefaultargs") Solid;
		%feature("autodoc", "Returns the new solid.

	:rtype: TopoDS_Solid
") Solid;
		const TopoDS_Solid Solid();

};


%extend BRepBuilderAPI_MakeSolid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class BRepBuilderAPI_MakeVertex *
**********************************/
class BRepBuilderAPI_MakeVertex : public BRepBuilderAPI_MakeShape {
	public:
		/****************** BRepBuilderAPI_MakeVertex ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeVertex;
		%feature("autodoc", "Constructs a vertex from point p. example create a vertex from a 3d point. gp_pnt p(0,0,10); topods_vertex v = brepbuilderapi_makevertex(p);.

	:param P:
	:type P: gp_Pnt
	:rtype: None
") BRepBuilderAPI_MakeVertex;
		 BRepBuilderAPI_MakeVertex(const gp_Pnt & P);

		/****************** Vertex ******************/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "Returns the constructed vertex.

	:rtype: TopoDS_Vertex
") Vertex;
		const TopoDS_Vertex Vertex();

};


%extend BRepBuilderAPI_MakeVertex {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class BRepBuilderAPI_MakeWire *
********************************/
class BRepBuilderAPI_MakeWire : public BRepBuilderAPI_MakeShape {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds the edge e to the wire under construction. e must be connectable to the wire under construction, and, unless it is the first edge of the wire, must satisfy the following condition: one of its vertices must be geometrically coincident with one of the vertices of the wire (provided that the highest tolerance factor is assigned to the two vertices). it could also be the same vertex. warning if e is not connectable to the wire under construction it is not added. the function error will return brepbuilderapi_disconnectedwire, the function isdone will return false and the function wire will raise an error, until a new connectable edge is added.

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
		%feature("autodoc", "Adds the edges of <l> to the current wire. the edges are not to be consecutive. but they are to be all connected geometrically or topologically. if some of them are not connected the status give disconnectedwire but the 'maker' is done() and you can get the partial result. (ie connected to the first edgeof the list <l>).

	:param L:
	:type L: TopTools_ListOfShape
	:rtype: None
") Add;
		void Add(const TopTools_ListOfShape & L);

		/****************** BRepBuilderAPI_MakeWire ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeWire;
		%feature("autodoc", "Constructs an empty wire framework, to which edges are added using the add function. as soon as the wire contains one edge, it can return with the use of the function wire. warning the function error will return brepbuilderapi_emptywire if it is called before at least one edge is added to the wire under construction.

	:rtype: None
") BRepBuilderAPI_MakeWire;
		 BRepBuilderAPI_MakeWire();

		/****************** BRepBuilderAPI_MakeWire ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeWire;
		%feature("autodoc", "Make a wire from an edge.

	:param E:
	:type E: TopoDS_Edge
	:rtype: None
") BRepBuilderAPI_MakeWire;
		 BRepBuilderAPI_MakeWire(const TopoDS_Edge & E);

		/****************** BRepBuilderAPI_MakeWire ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeWire;
		%feature("autodoc", "Make a wire from two edges.

	:param E1:
	:type E1: TopoDS_Edge
	:param E2:
	:type E2: TopoDS_Edge
	:rtype: None
") BRepBuilderAPI_MakeWire;
		 BRepBuilderAPI_MakeWire(const TopoDS_Edge & E1, const TopoDS_Edge & E2);

		/****************** BRepBuilderAPI_MakeWire ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeWire;
		%feature("autodoc", "Make a wire from three edges.

	:param E1:
	:type E1: TopoDS_Edge
	:param E2:
	:type E2: TopoDS_Edge
	:param E3:
	:type E3: TopoDS_Edge
	:rtype: None
") BRepBuilderAPI_MakeWire;
		 BRepBuilderAPI_MakeWire(const TopoDS_Edge & E1, const TopoDS_Edge & E2, const TopoDS_Edge & E3);

		/****************** BRepBuilderAPI_MakeWire ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeWire;
		%feature("autodoc", "Make a wire from four edges. constructs a wire - from the topods_wire w composed of the edge e, or - from edge e, or - from two edges e1 and e2, or - from three edges e1, e2 and e3, or - from four edges e1, e2, e3 and e4. further edges can be added using the function add. given edges are added in a sequence. each of them must be connectable to the wire under construction, and so must satisfy the following condition (unless it is the first edge of the wire): one of its vertices must be geometrically coincident with one of the vertices of the wire (provided that the highest tolerance factor is assigned to the two vertices). it could also be the same vertex. warning if an edge is not connectable to the wire under construction it is not added. the function error will return brepbuilderapi_disconnectedwire, the function isdone will return false and the function wire will raise an error, until a new connectable edge is added.

	:param E1:
	:type E1: TopoDS_Edge
	:param E2:
	:type E2: TopoDS_Edge
	:param E3:
	:type E3: TopoDS_Edge
	:param E4:
	:type E4: TopoDS_Edge
	:rtype: None
") BRepBuilderAPI_MakeWire;
		 BRepBuilderAPI_MakeWire(const TopoDS_Edge & E1, const TopoDS_Edge & E2, const TopoDS_Edge & E3, const TopoDS_Edge & E4);

		/****************** BRepBuilderAPI_MakeWire ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeWire;
		%feature("autodoc", "Make a wire from a wire. usefull for adding later.

	:param W:
	:type W: TopoDS_Wire
	:rtype: None
") BRepBuilderAPI_MakeWire;
		 BRepBuilderAPI_MakeWire(const TopoDS_Wire & W);

		/****************** BRepBuilderAPI_MakeWire ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_MakeWire;
		%feature("autodoc", "Add an edge to a wire.

	:param W:
	:type W: TopoDS_Wire
	:param E:
	:type E: TopoDS_Edge
	:rtype: None
") BRepBuilderAPI_MakeWire;
		 BRepBuilderAPI_MakeWire(const TopoDS_Wire & W, const TopoDS_Edge & E);

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Returns the last edge added to the wire under construction. warning - this edge can be different from the original one (the argument of the function add, for instance,) - a null edge is returned if there are no edges in the wire under construction, or if the last edge which you tried to add was not connectable..

	:rtype: TopoDS_Edge
") Edge;
		const TopoDS_Edge Edge();

		/****************** Error ******************/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "Returns the construction status - brepbuilderapi_wiredone if the wire is built, or - another value of the brepbuilderapi_wireerror enumeration indicating why the construction failed.

	:rtype: BRepBuilderAPI_WireError
") Error;
		BRepBuilderAPI_WireError Error();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if this algorithm contains a valid wire. isdone returns false if: - there are no edges in the wire, or - the last edge which you tried to add was not connectable.

	:rtype: bool
") IsDone;
		virtual Standard_Boolean IsDone();

		/****************** Vertex ******************/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "Returns the last vertex of the last edge added to the wire under construction. warning a null vertex is returned if there are no edges in the wire under construction, or if the last edge which you tried to add was not connectabler.

	:rtype: TopoDS_Vertex
") Vertex;
		const TopoDS_Vertex Vertex();

		/****************** Wire ******************/
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", "Returns the constructed wire; or the part of the wire under construction already built. exceptions stdfail_notdone if a wire is not built.

	:rtype: TopoDS_Wire
") Wire;
		const TopoDS_Wire Wire();

};


%extend BRepBuilderAPI_MakeWire {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class BRepBuilderAPI_ModifyShape *
***********************************/
%nodefaultctor BRepBuilderAPI_ModifyShape;
class BRepBuilderAPI_ModifyShape : public BRepBuilderAPI_MakeShape {
	public:
		/****************** Modified ******************/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "Returns the list of shapes modified from the shape <s>.

	:param S:
	:type S: TopoDS_Shape
	:rtype: TopTools_ListOfShape
") Modified;
		virtual const TopTools_ListOfShape & Modified(const TopoDS_Shape & S);

		/****************** ModifiedShape ******************/
		%feature("compactdefaultargs") ModifiedShape;
		%feature("autodoc", "Returns the modified shape corresponding to <s>. s can correspond to the entire initial shape or to its subshape. exceptions standard_nosuchobject if s is not the initial shape or a subshape of the initial shape to which the transformation has been applied. raises nosuchobject from standard if s is not the initial shape or a sub-shape of the initial shape.

	:param S:
	:type S: TopoDS_Shape
	:rtype: TopoDS_Shape
") ModifiedShape;
		virtual TopoDS_Shape ModifiedShape(const TopoDS_Shape & S);

};


%extend BRepBuilderAPI_ModifyShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class BRepBuilderAPI_Copy *
****************************/
class BRepBuilderAPI_Copy : public BRepBuilderAPI_ModifyShape {
	public:
		/****************** BRepBuilderAPI_Copy ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_Copy;
		%feature("autodoc", "Constructs an empty copy framework. use the function perform to copy shapes.

	:rtype: None
") BRepBuilderAPI_Copy;
		 BRepBuilderAPI_Copy();

		/****************** BRepBuilderAPI_Copy ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_Copy;
		%feature("autodoc", "Constructs a copy framework and copies the shape s. use the function shape to access the result. if copymesh is true, triangulation contained in original shape will be copied along with geometry (by default, triangulation gets lost). if copygeom is false, only topological objects will be copied, while geometry and triangulation will be shared with original shape. note: the constructed framework can be reused to copy other shapes: just specify them with the function perform.

	:param S:
	:type S: TopoDS_Shape
	:param copyGeom: default value is Standard_True
	:type copyGeom: bool
	:param copyMesh: default value is Standard_False
	:type copyMesh: bool
	:rtype: None
") BRepBuilderAPI_Copy;
		 BRepBuilderAPI_Copy(const TopoDS_Shape & S, const Standard_Boolean copyGeom = Standard_True, const Standard_Boolean copyMesh = Standard_False);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Copies the shape s. use the function shape to access the result. if copymesh is true, triangulation contained in original shape will be copied along with geometry (by default, triangulation gets lost). if copygeom is false, only topological objects will be copied, while geometry and triangulation will be shared with original shape.

	:param S:
	:type S: TopoDS_Shape
	:param copyGeom: default value is Standard_True
	:type copyGeom: bool
	:param copyMesh: default value is Standard_False
	:type copyMesh: bool
	:rtype: None
") Perform;
		void Perform(const TopoDS_Shape & S, const Standard_Boolean copyGeom = Standard_True, const Standard_Boolean copyMesh = Standard_False);

};


%extend BRepBuilderAPI_Copy {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class BRepBuilderAPI_GTransform *
**********************************/
class BRepBuilderAPI_GTransform : public BRepBuilderAPI_ModifyShape {
	public:
		/****************** BRepBuilderAPI_GTransform ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_GTransform;
		%feature("autodoc", "Constructs a framework for applying the geometric transformation t to a shape. use the function perform to define the shape to transform.

	:param T:
	:type T: gp_GTrsf
	:rtype: None
") BRepBuilderAPI_GTransform;
		 BRepBuilderAPI_GTransform(const gp_GTrsf & T);

		/****************** BRepBuilderAPI_GTransform ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_GTransform;
		%feature("autodoc", "Constructs a framework for applying the geometric transformation t to a shape, and applies it to the shape s. - if the transformation t is direct and isometric (i.e. if the determinant of the vectorial part of t is equal to 1.), and if copy equals false (default value), the resulting shape is the same as the original but with a new location assigned to it. - in all other cases, the transformation is applied to a duplicate of s. use the function shape to access the result. note: the constructed framework can be reused to apply the same geometric transformation to other shapes: just specify them with the function perform.

	:param S:
	:type S: TopoDS_Shape
	:param T:
	:type T: gp_GTrsf
	:param Copy: default value is Standard_False
	:type Copy: bool
	:rtype: None
") BRepBuilderAPI_GTransform;
		 BRepBuilderAPI_GTransform(const TopoDS_Shape & S, const gp_GTrsf & T, const Standard_Boolean Copy = Standard_False);

		/****************** Modified ******************/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "Returns the list of shapes modified from the shape <s>.

	:param S:
	:type S: TopoDS_Shape
	:rtype: TopTools_ListOfShape
") Modified;
		virtual const TopTools_ListOfShape & Modified(const TopoDS_Shape & S);

		/****************** ModifiedShape ******************/
		%feature("compactdefaultargs") ModifiedShape;
		%feature("autodoc", "Returns the modified shape corresponding to <s>.

	:param S:
	:type S: TopoDS_Shape
	:rtype: TopoDS_Shape
") ModifiedShape;
		virtual TopoDS_Shape ModifiedShape(const TopoDS_Shape & S);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Applies the geometric transformation defined at the time of construction of this framework to the shape s. - if the transformation t is direct and isometric (i.e. if the determinant of the vectorial part of t is equal to 1.), and if copy equals false (default value), the resulting shape is the same as the original but with a new location assigned to it. - in all other cases, the transformation is applied to a duplicate of s. use the function shape to access the result. note: this framework can be reused to apply the same geometric transformation to other shapes: just specify them by calling the function perform again.

	:param S:
	:type S: TopoDS_Shape
	:param Copy: default value is Standard_False
	:type Copy: bool
	:rtype: None
") Perform;
		void Perform(const TopoDS_Shape & S, const Standard_Boolean Copy = Standard_False);

};


%extend BRepBuilderAPI_GTransform {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class BRepBuilderAPI_NurbsConvert *
************************************/
class BRepBuilderAPI_NurbsConvert : public BRepBuilderAPI_ModifyShape {
	public:
		/****************** BRepBuilderAPI_NurbsConvert ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_NurbsConvert;
		%feature("autodoc", "Constructs a framework for converting the geometry of a shape into nurbs geometry. use the function perform to define the shape to convert.

	:rtype: None
") BRepBuilderAPI_NurbsConvert;
		 BRepBuilderAPI_NurbsConvert();

		/****************** BRepBuilderAPI_NurbsConvert ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_NurbsConvert;
		%feature("autodoc", "Builds a new shape by converting the geometry of the shape s into nurbs geometry. specifically, all curves supporting edges of s are converted into bspline curves, and all surfaces supporting its faces are converted into bspline surfaces. use the function shape to access the new shape. note: the constructed framework can be reused to convert other shapes. you specify these with the function perform.

	:param S:
	:type S: TopoDS_Shape
	:param Copy: default value is Standard_False
	:type Copy: bool
	:rtype: None
") BRepBuilderAPI_NurbsConvert;
		 BRepBuilderAPI_NurbsConvert(const TopoDS_Shape & S, const Standard_Boolean Copy = Standard_False);

		/****************** Modified ******************/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "Returns the list of shapes modified from the shape <s>.

	:param S:
	:type S: TopoDS_Shape
	:rtype: TopTools_ListOfShape
") Modified;
		virtual const TopTools_ListOfShape & Modified(const TopoDS_Shape & S);

		/****************** ModifiedShape ******************/
		%feature("compactdefaultargs") ModifiedShape;
		%feature("autodoc", "Returns the modified shape corresponding to <s>. s can correspond to the entire initial shape or to its subshape. exceptions standard_nosuchobject if s is not the initial shape or a subshape of the initial shape to which the transformation has been applied. .

	:param S:
	:type S: TopoDS_Shape
	:rtype: TopoDS_Shape
") ModifiedShape;
		virtual TopoDS_Shape ModifiedShape(const TopoDS_Shape & S);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Builds a new shape by converting the geometry of the shape s into nurbs geometry. specifically, all curves supporting edges of s are converted into bspline curves, and all surfaces supporting its faces are converted into bspline surfaces. use the function shape to access the new shape. note: this framework can be reused to convert other shapes: you specify them by calling the function perform again.

	:param S:
	:type S: TopoDS_Shape
	:param Copy: default value is Standard_False
	:type Copy: bool
	:rtype: None
") Perform;
		void Perform(const TopoDS_Shape & S, const Standard_Boolean Copy = Standard_False);

};


%extend BRepBuilderAPI_NurbsConvert {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class BRepBuilderAPI_Transform *
*********************************/
class BRepBuilderAPI_Transform : public BRepBuilderAPI_ModifyShape {
	public:
		/****************** BRepBuilderAPI_Transform ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_Transform;
		%feature("autodoc", "Constructs a framework for applying the geometric transformation t to a shape. use the function perform to define the shape to transform.

	:param T:
	:type T: gp_Trsf
	:rtype: None
") BRepBuilderAPI_Transform;
		 BRepBuilderAPI_Transform(const gp_Trsf & T);

		/****************** BRepBuilderAPI_Transform ******************/
		%feature("compactdefaultargs") BRepBuilderAPI_Transform;
		%feature("autodoc", "Creates a transformation from the gp_trsf <t>, and applies it to the shape <s>. if the transformation is direct and isometric (determinant = 1) and <copy> = standard_false, the resulting shape is <s> on which a new location has been set. otherwise, the transformation is applied on a duplication of <s>.

	:param S:
	:type S: TopoDS_Shape
	:param T:
	:type T: gp_Trsf
	:param Copy: default value is Standard_False
	:type Copy: bool
	:rtype: None
") BRepBuilderAPI_Transform;
		 BRepBuilderAPI_Transform(const TopoDS_Shape & S, const gp_Trsf & T, const Standard_Boolean Copy = Standard_False);

		/****************** Modified ******************/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "Returns the list of shapes modified from the shape <s>.

	:param S:
	:type S: TopoDS_Shape
	:rtype: TopTools_ListOfShape
") Modified;
		virtual const TopTools_ListOfShape & Modified(const TopoDS_Shape & S);

		/****************** ModifiedShape ******************/
		%feature("compactdefaultargs") ModifiedShape;
		%feature("autodoc", "Returns the modified shape corresponding to <s>.

	:param S:
	:type S: TopoDS_Shape
	:rtype: TopoDS_Shape
") ModifiedShape;
		virtual TopoDS_Shape ModifiedShape(const TopoDS_Shape & S);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Pplies the geometric transformation defined at the time of construction of this framework to the shape s. - if the transformation t is direct and isometric, in other words, if the determinant of the vectorial part of t is equal to 1., and if copy equals false (the default value), the resulting shape is the same as the original but with a new location assigned to it. - in all other cases, the transformation is applied to a duplicate of s. use the function shape to access the result. note: this framework can be reused to apply the same geometric transformation to other shapes. you only need to specify them by calling the function perform again.

	:param S:
	:type S: TopoDS_Shape
	:param Copy: default value is Standard_False
	:type Copy: bool
	:rtype: None
") Perform;
		void Perform(const TopoDS_Shape & S, const Standard_Boolean Copy = Standard_False);

};


%extend BRepBuilderAPI_Transform {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */

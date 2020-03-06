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
%define DRAFTDOCSTRING
"Draft module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_draft.html"
%enddef
%module (package="OCC.Core", docstring=DRAFTDOCSTRING) Draft


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
#include<Draft_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TopoDS_module.hxx>
#include<gp_module.hxx>
#include<Geom2d_module.hxx>
#include<Geom_module.hxx>
#include<BRepTools_module.hxx>
#include<TopTools_module.hxx>
#include<GeomAbs_module.hxx>
#include<TopLoc_module.hxx>
#include<BRep_module.hxx>
#include<Bnd_module.hxx>
#include<TShort_module.hxx>
#include<Message_module.hxx>
#include<Poly_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TopoDS.i
%import gp.i
%import Geom2d.i
%import Geom.i
%import BRepTools.i
%import TopTools.i
%import GeomAbs.i
%import TopLoc.i
/* public enums */
enum Draft_ErrorStatus {
	Draft_NoError = 0,
	Draft_FaceRecomputation = 1,
	Draft_EdgeRecomputation = 2,
	Draft_VertexRecomputation = 3,
};

/* end public enums declaration */

/* handles */
%wrap_handle(Draft_Modification)
/* end handles declaration */

/* templates */
%template(Draft_IndexedDataMapOfFaceFaceInfo) NCollection_IndexedDataMap<TopoDS_Face,Draft_FaceInfo,TopTools_ShapeMapHasher>;
%template(Draft_IndexedDataMapOfVertexVertexInfo) NCollection_IndexedDataMap<TopoDS_Vertex,Draft_VertexInfo,TopTools_ShapeMapHasher>;
%template(Draft_IndexedDataMapOfEdgeEdgeInfo) NCollection_IndexedDataMap<TopoDS_Edge,Draft_EdgeInfo,TopTools_ShapeMapHasher>;
/* end templates declaration */

/* typedefs */
typedef NCollection_IndexedDataMap<TopoDS_Face, Draft_FaceInfo, TopTools_ShapeMapHasher> Draft_IndexedDataMapOfFaceFaceInfo;
typedef NCollection_IndexedDataMap<TopoDS_Vertex, Draft_VertexInfo, TopTools_ShapeMapHasher> Draft_IndexedDataMapOfVertexVertexInfo;
typedef NCollection_IndexedDataMap<TopoDS_Edge, Draft_EdgeInfo, TopTools_ShapeMapHasher> Draft_IndexedDataMapOfEdgeEdgeInfo;
/* end typedefs declaration */

/**************
* class Draft *
**************/
%rename(draft) Draft;
class Draft {
	public:
		/****************** Angle ******************/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "Returns the draft angle of the face <f> using the direction <direction>. the method is valid for : - plane faces, - cylindrical or conical faces, when the direction of the axis of the surface is colinear with the direction. otherwise, the exception domainerror is raised.

	:param F:
	:type F: TopoDS_Face
	:param Direction:
	:type Direction: gp_Dir
	:rtype: float
") Angle;
		static Standard_Real Angle(const TopoDS_Face & F, const gp_Dir & Direction);

};


%extend Draft {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class Draft_EdgeInfo *
***********************/
class Draft_EdgeInfo {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face
	:rtype: None
") Add;
		void Add(const TopoDS_Face & F);

		/****************** ChangeFirstPC ******************/
		%feature("compactdefaultargs") ChangeFirstPC;
		%feature("autodoc", "	:rtype: opencascade::handle<Geom2d_Curve>
") ChangeFirstPC;
		opencascade::handle<Geom2d_Curve> & ChangeFirstPC();

		/****************** ChangeGeometry ******************/
		%feature("compactdefaultargs") ChangeGeometry;
		%feature("autodoc", "	:rtype: opencascade::handle<Geom_Curve>
") ChangeGeometry;
		opencascade::handle<Geom_Curve> & ChangeGeometry();

		/****************** ChangeSecondPC ******************/
		%feature("compactdefaultargs") ChangeSecondPC;
		%feature("autodoc", "	:rtype: opencascade::handle<Geom2d_Curve>
") ChangeSecondPC;
		opencascade::handle<Geom2d_Curve> & ChangeSecondPC();

		/****************** Draft_EdgeInfo ******************/
		%feature("compactdefaultargs") Draft_EdgeInfo;
		%feature("autodoc", "	:rtype: None
") Draft_EdgeInfo;
		 Draft_EdgeInfo();

		/****************** Draft_EdgeInfo ******************/
		%feature("compactdefaultargs") Draft_EdgeInfo;
		%feature("autodoc", "	:param HasNewGeometry:
	:type HasNewGeometry: bool
	:rtype: None
") Draft_EdgeInfo;
		 Draft_EdgeInfo(const Standard_Boolean HasNewGeometry);

		/****************** FirstFace ******************/
		%feature("compactdefaultargs") FirstFace;
		%feature("autodoc", "	:rtype: TopoDS_Face
") FirstFace;
		const TopoDS_Face FirstFace();

		/****************** FirstPC ******************/
		%feature("compactdefaultargs") FirstPC;
		%feature("autodoc", "	:rtype: opencascade::handle<Geom2d_Curve>
") FirstPC;
		const opencascade::handle<Geom2d_Curve> & FirstPC();

		/****************** Geometry ******************/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "	:rtype: opencascade::handle<Geom_Curve>
") Geometry;
		const opencascade::handle<Geom_Curve> & Geometry();

		/****************** IsTangent ******************/
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:rtype: bool
") IsTangent;
		Standard_Boolean IsTangent(gp_Pnt & P);

		/****************** NewGeometry ******************/
		%feature("compactdefaultargs") NewGeometry;
		%feature("autodoc", "	:rtype: bool
") NewGeometry;
		Standard_Boolean NewGeometry();

		/****************** RootFace ******************/
		%feature("compactdefaultargs") RootFace;
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face
	:rtype: None
") RootFace;
		void RootFace(const TopoDS_Face & F);

		/****************** RootFace ******************/
		%feature("compactdefaultargs") RootFace;
		%feature("autodoc", "	:rtype: TopoDS_Face
") RootFace;
		const TopoDS_Face RootFace();

		/****************** SecondFace ******************/
		%feature("compactdefaultargs") SecondFace;
		%feature("autodoc", "	:rtype: TopoDS_Face
") SecondFace;
		const TopoDS_Face SecondFace();

		/****************** SecondPC ******************/
		%feature("compactdefaultargs") SecondPC;
		%feature("autodoc", "	:rtype: opencascade::handle<Geom2d_Curve>
") SecondPC;
		const opencascade::handle<Geom2d_Curve> & SecondPC();

		/****************** SetNewGeometry ******************/
		%feature("compactdefaultargs") SetNewGeometry;
		%feature("autodoc", "	:param NewGeom:
	:type NewGeom: bool
	:rtype: None
") SetNewGeometry;
		void SetNewGeometry(const Standard_Boolean NewGeom);

		/****************** Tangent ******************/
		%feature("compactdefaultargs") Tangent;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:rtype: None
") Tangent;
		void Tangent(const gp_Pnt & P);

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "	:param tol:
	:type tol: float
	:rtype: None
") Tolerance;
		void Tolerance(const Standard_Real tol);

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "	:rtype: float
") Tolerance;
		Standard_Real Tolerance();

};


%extend Draft_EdgeInfo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class Draft_FaceInfo *
***********************/
class Draft_FaceInfo {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face
	:rtype: None
") Add;
		void Add(const TopoDS_Face & F);

		/****************** ChangeCurve ******************/
		%feature("compactdefaultargs") ChangeCurve;
		%feature("autodoc", "	:rtype: opencascade::handle<Geom_Curve>
") ChangeCurve;
		opencascade::handle<Geom_Curve> & ChangeCurve();

		/****************** ChangeGeometry ******************/
		%feature("compactdefaultargs") ChangeGeometry;
		%feature("autodoc", "	:rtype: opencascade::handle<Geom_Surface>
") ChangeGeometry;
		opencascade::handle<Geom_Surface> & ChangeGeometry();

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "	:rtype: opencascade::handle<Geom_Curve>
") Curve;
		const opencascade::handle<Geom_Curve> & Curve();

		/****************** Draft_FaceInfo ******************/
		%feature("compactdefaultargs") Draft_FaceInfo;
		%feature("autodoc", "	:rtype: None
") Draft_FaceInfo;
		 Draft_FaceInfo();

		/****************** Draft_FaceInfo ******************/
		%feature("compactdefaultargs") Draft_FaceInfo;
		%feature("autodoc", "	:param S:
	:type S: Geom_Surface
	:param HasNewGeometry:
	:type HasNewGeometry: bool
	:rtype: None
") Draft_FaceInfo;
		 Draft_FaceInfo(const opencascade::handle<Geom_Surface> & S, const Standard_Boolean HasNewGeometry);

		/****************** FirstFace ******************/
		%feature("compactdefaultargs") FirstFace;
		%feature("autodoc", "	:rtype: TopoDS_Face
") FirstFace;
		const TopoDS_Face FirstFace();

		/****************** Geometry ******************/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "	:rtype: opencascade::handle<Geom_Surface>
") Geometry;
		const opencascade::handle<Geom_Surface> & Geometry();

		/****************** NewGeometry ******************/
		%feature("compactdefaultargs") NewGeometry;
		%feature("autodoc", "	:rtype: bool
") NewGeometry;
		Standard_Boolean NewGeometry();

		/****************** RootFace ******************/
		%feature("compactdefaultargs") RootFace;
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face
	:rtype: None
") RootFace;
		void RootFace(const TopoDS_Face & F);

		/****************** RootFace ******************/
		%feature("compactdefaultargs") RootFace;
		%feature("autodoc", "	:rtype: TopoDS_Face
") RootFace;
		const TopoDS_Face RootFace();

		/****************** SecondFace ******************/
		%feature("compactdefaultargs") SecondFace;
		%feature("autodoc", "	:rtype: TopoDS_Face
") SecondFace;
		const TopoDS_Face SecondFace();

};


%extend Draft_FaceInfo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class Draft_Modification *
***************************/
class Draft_Modification : public BRepTools_Modification {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds the face f and propagates the draft modification to its neighbour faces if they are tangent. if an error occurs, will return false and problematicshape will return the 'bad' face.

	:param F:
	:type F: TopoDS_Face
	:param Direction:
	:type Direction: gp_Dir
	:param Angle:
	:type Angle: float
	:param NeutralPlane:
	:type NeutralPlane: gp_Pln
	:param Flag: default value is Standard_True
	:type Flag: bool
	:rtype: bool
") Add;
		Standard_Boolean Add(const TopoDS_Face & F, const gp_Dir & Direction, const Standard_Real Angle, const gp_Pln & NeutralPlane, const Standard_Boolean Flag = Standard_True);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Resets on the same shape.

	:rtype: None
") Clear;
		void Clear();

		/****************** ConnectedFaces ******************/
		%feature("compactdefaultargs") ConnectedFaces;
		%feature("autodoc", "Returns all the faces which have been added together with the face <f>.

	:param F:
	:type F: TopoDS_Face
	:rtype: TopTools_ListOfShape
") ConnectedFaces;
		const TopTools_ListOfShape & ConnectedFaces(const TopoDS_Face & F);

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Returns the continuity of <newe> between <newf1> and <newf2>. //! <newe> is the new edge created from <e>. <newf1> (resp. <newf2>) is the new face created from <f1> (resp. <f2>).

	:param E:
	:type E: TopoDS_Edge
	:param F1:
	:type F1: TopoDS_Face
	:param F2:
	:type F2: TopoDS_Face
	:param NewE:
	:type NewE: TopoDS_Edge
	:param NewF1:
	:type NewF1: TopoDS_Face
	:param NewF2:
	:type NewF2: TopoDS_Face
	:rtype: GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity(const TopoDS_Edge & E, const TopoDS_Face & F1, const TopoDS_Face & F2, const TopoDS_Edge & NewE, const TopoDS_Face & NewF1, const TopoDS_Face & NewF2);

		/****************** Draft_Modification ******************/
		%feature("compactdefaultargs") Draft_Modification;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape
	:rtype: None
") Draft_Modification;
		 Draft_Modification(const TopoDS_Shape & S);

		/****************** Error ******************/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "	:rtype: Draft_ErrorStatus
") Error;
		Draft_ErrorStatus Error();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Changes the basis shape and resets.

	:param S:
	:type S: TopoDS_Shape
	:rtype: None
") Init;
		void Init(const TopoDS_Shape & S);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if perform has been succesfully called. otherwise more information can be obtained using the methods error() and problematicshape().

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** ModifiedFaces ******************/
		%feature("compactdefaultargs") ModifiedFaces;
		%feature("autodoc", "Returns all the faces on which a modification has been given.

	:rtype: TopTools_ListOfShape
") ModifiedFaces;
		const TopTools_ListOfShape & ModifiedFaces();

		/****************** NewCurve ******************/
		%feature("compactdefaultargs") NewCurve;
		%feature("autodoc", "Returns standard_true if the edge <e> has been modified. in this case, <c> is the new geometric support of the edge, <l> the new location, <tol> the new tolerance. otherwise, returns standard_false, and <c>, <l>, <tol> are not significant.

	:param E:
	:type E: TopoDS_Edge
	:param C:
	:type C: Geom_Curve
	:param L:
	:type L: TopLoc_Location
	:param Tol:
	:type Tol: float
	:rtype: bool
") NewCurve;
		Standard_Boolean NewCurve(const TopoDS_Edge & E, opencascade::handle<Geom_Curve> & C, TopLoc_Location & L, Standard_Real &OutValue);

		/****************** NewCurve2d ******************/
		%feature("compactdefaultargs") NewCurve2d;
		%feature("autodoc", "Returns standard_true if the edge <e> has a new curve on surface on the face <f>.in this case, <c> is the new geometric support of the edge, <l> the new location, <tol> the new tolerance. //! otherwise, returns standard_false, and <c>, <l>, <tol> are not significant. //! <newe> is the new edge created from <e>. <newf> is the new face created from <f>. they may be usefull.

	:param E:
	:type E: TopoDS_Edge
	:param F:
	:type F: TopoDS_Face
	:param NewE:
	:type NewE: TopoDS_Edge
	:param NewF:
	:type NewF: TopoDS_Face
	:param C:
	:type C: Geom2d_Curve
	:param Tol:
	:type Tol: float
	:rtype: bool
") NewCurve2d;
		Standard_Boolean NewCurve2d(const TopoDS_Edge & E, const TopoDS_Face & F, const TopoDS_Edge & NewE, const TopoDS_Face & NewF, opencascade::handle<Geom2d_Curve> & C, Standard_Real &OutValue);

		/****************** NewParameter ******************/
		%feature("compactdefaultargs") NewParameter;
		%feature("autodoc", "Returns standard_true if the vertex <v> has a new parameter on the edge <e>. in this case, <p> is the parameter, <tol> the new tolerance. otherwise, returns standard_false, and <p>, <tol> are not significant.

	:param V:
	:type V: TopoDS_Vertex
	:param E:
	:type E: TopoDS_Edge
	:param P:
	:type P: float
	:param Tol:
	:type Tol: float
	:rtype: bool
") NewParameter;
		Standard_Boolean NewParameter(const TopoDS_Vertex & V, const TopoDS_Edge & E, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** NewPoint ******************/
		%feature("compactdefaultargs") NewPoint;
		%feature("autodoc", "Returns standard_true if the vertex <v> has been modified. in this case, <p> is the new geometric support of the vertex, <tol> the new tolerance. otherwise, returns standard_false, and <p>, <tol> are not significant.

	:param V:
	:type V: TopoDS_Vertex
	:param P:
	:type P: gp_Pnt
	:param Tol:
	:type Tol: float
	:rtype: bool
") NewPoint;
		Standard_Boolean NewPoint(const TopoDS_Vertex & V, gp_Pnt & P, Standard_Real &OutValue);

		/****************** NewSurface ******************/
		%feature("compactdefaultargs") NewSurface;
		%feature("autodoc", "Returns standard_true if the face <f> has been modified. in this case, <s> is the new geometric support of the face, <l> the new location,<tol> the new tolerance.<revwires> has to be set to standard_true when the modification reverses the normal of the surface.(the wires have to be reversed). <revface> has to be set to standard_true if the orientation of the modified face changes in the shells which contain it. here it will be set to standard_false. //! otherwise, returns standard_false, and <s>, <l>, <tol> , <revwires> ,<revface> are not significant.

	:param F:
	:type F: TopoDS_Face
	:param S:
	:type S: Geom_Surface
	:param L:
	:type L: TopLoc_Location
	:param Tol:
	:type Tol: float
	:param RevWires:
	:type RevWires: bool
	:param RevFace:
	:type RevFace: bool
	:rtype: bool
") NewSurface;
		Standard_Boolean NewSurface(const TopoDS_Face & F, opencascade::handle<Geom_Surface> & S, TopLoc_Location & L, Standard_Real &OutValue, Standard_Boolean &OutValue, Standard_Boolean &OutValue);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs the draft angle modification and sets the value returned by the method isdone. if an error occurs, isdone will return standard_false, and an error status will be given by the method error, and the shape on which the problem appeared will be given by problematicshape.

	:rtype: None
") Perform;
		void Perform();

		/****************** ProblematicShape ******************/
		%feature("compactdefaultargs") ProblematicShape;
		%feature("autodoc", "Returns the shape (face, edge or vertex) on which an error occured.

	:rtype: TopoDS_Shape
") ProblematicShape;
		const TopoDS_Shape ProblematicShape();

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Removes the face f and the neighbour faces if they are tangent. it will be necessary to call this method if the method add returns standard_false, to unset problematicface.

	:param F:
	:type F: TopoDS_Face
	:rtype: None
") Remove;
		void Remove(const TopoDS_Face & F);

};


%make_alias(Draft_Modification)

%extend Draft_Modification {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Draft_VertexInfo *
*************************/
class Draft_VertexInfo {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Edge
	:rtype: None
") Add;
		void Add(const TopoDS_Edge & E);

		/****************** ChangeGeometry ******************/
		%feature("compactdefaultargs") ChangeGeometry;
		%feature("autodoc", "	:rtype: gp_Pnt
") ChangeGeometry;
		gp_Pnt ChangeGeometry();


        %feature("autodoc","1");
        %extend {
            Standard_Real GetChangeParameter(const TopoDS_Edge & E) {
            return (Standard_Real) $self->ChangeParameter(E);
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetChangeParameter(const TopoDS_Edge & E,Standard_Real value) {
            $self->ChangeParameter(E)=value;
            }
        };
		/****************** Draft_VertexInfo ******************/
		%feature("compactdefaultargs") Draft_VertexInfo;
		%feature("autodoc", "	:rtype: None
") Draft_VertexInfo;
		 Draft_VertexInfo();

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "	:rtype: TopoDS_Edge
") Edge;
		const TopoDS_Edge Edge();

		/****************** Geometry ******************/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "	:rtype: gp_Pnt
") Geometry;
		const gp_Pnt Geometry();

		/****************** InitEdgeIterator ******************/
		%feature("compactdefaultargs") InitEdgeIterator;
		%feature("autodoc", "	:rtype: None
") InitEdgeIterator;
		void InitEdgeIterator();

		/****************** MoreEdge ******************/
		%feature("compactdefaultargs") MoreEdge;
		%feature("autodoc", "	:rtype: bool
") MoreEdge;
		Standard_Boolean MoreEdge();

		/****************** NextEdge ******************/
		%feature("compactdefaultargs") NextEdge;
		%feature("autodoc", "	:rtype: None
") NextEdge;
		void NextEdge();

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Edge
	:rtype: float
") Parameter;
		Standard_Real Parameter(const TopoDS_Edge & E);

};


%extend Draft_VertexInfo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */

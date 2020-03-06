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
%define BREPTOOLSDOCSTRING
"BRepTools module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_breptools.html"
%enddef
%module (package="OCC.Core", docstring=BREPTOOLSDOCSTRING) BRepTools


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
#include<BRepTools_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TopoDS_module.hxx>
#include<Bnd_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<TopTools_module.hxx>
#include<BRep_module.hxx>
#include<Message_module.hxx>
#include<GeomAbs_module.hxx>
#include<TopLoc_module.hxx>
#include<gp_module.hxx>
#include<Poly_module.hxx>
#include<TopAbs_module.hxx>
#include<TShort_module.hxx>
#include<Poly_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TopoDS.i
%import Bnd.i
%import Geom.i
%import Geom2d.i
%import TopTools.i
%import BRep.i
%import Message.i
%import GeomAbs.i
%import TopLoc.i
%import gp.i
%import Poly.i
%import TopAbs.i
/* public enums */
/* end public enums declaration */

/* handles */
%wrap_handle(BRepTools_History)
%wrap_handle(BRepTools_Modification)
%wrap_handle(BRepTools_ReShape)
%wrap_handle(BRepTools_GTrsfModification)
%wrap_handle(BRepTools_NurbsConvertModification)
%wrap_handle(BRepTools_TrsfModification)
/* end handles declaration */

/* templates */
%template(BRepTools_MapOfVertexPnt2d) NCollection_DataMap<TopoDS_Shape,TColgp_SequenceOfPnt2d,TopTools_ShapeMapHasher>;
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap<TopoDS_Shape, TColgp_SequenceOfPnt2d, TopTools_ShapeMapHasher> BRepTools_MapOfVertexPnt2d;
typedef NCollection_DataMap<TopoDS_Shape, TColgp_SequenceOfPnt2d, TopTools_ShapeMapHasher>::Iterator BRepTools_DataMapIteratorOfMapOfVertexPnt2d;
/* end typedefs declaration */

/******************
* class BRepTools *
******************/
%rename(breptools) BRepTools;
class BRepTools {
	public:
		/****************** AddUVBounds ******************/
		%feature("compactdefaultargs") AddUVBounds;
		%feature("autodoc", "Adds to the box <b> the bounding values in the parametric space of f.

	:param F:
	:type F: TopoDS_Face
	:param B:
	:type B: Bnd_Box2d
	:rtype: None
") AddUVBounds;
		static void AddUVBounds(const TopoDS_Face & F, Bnd_Box2d & B);

		/****************** AddUVBounds ******************/
		%feature("compactdefaultargs") AddUVBounds;
		%feature("autodoc", "Adds to the box <b> the bounding values of the wire in the parametric space of f.

	:param F:
	:type F: TopoDS_Face
	:param W:
	:type W: TopoDS_Wire
	:param B:
	:type B: Bnd_Box2d
	:rtype: None
") AddUVBounds;
		static void AddUVBounds(const TopoDS_Face & F, const TopoDS_Wire & W, Bnd_Box2d & B);

		/****************** AddUVBounds ******************/
		%feature("compactdefaultargs") AddUVBounds;
		%feature("autodoc", "Adds to the box <b> the bounding values of the edge in the parametric space of f.

	:param F:
	:type F: TopoDS_Face
	:param E:
	:type E: TopoDS_Edge
	:param B:
	:type B: Bnd_Box2d
	:rtype: None
") AddUVBounds;
		static void AddUVBounds(const TopoDS_Face & F, const TopoDS_Edge & E, Bnd_Box2d & B);

		/****************** Clean ******************/
		%feature("compactdefaultargs") Clean;
		%feature("autodoc", "Removes all the triangulations of the faces of <s> and removes all polygons on triangulations of the edges.

	:param S:
	:type S: TopoDS_Shape
	:rtype: None
") Clean;
		static void Clean(const TopoDS_Shape & S);

		/****************** CleanGeometry ******************/
		%feature("compactdefaultargs") CleanGeometry;
		%feature("autodoc", "Removes geometry (curves and surfaces) from all edges and faces of the shape.

	:param theShape:
	:type theShape: TopoDS_Shape
	:rtype: None
") CleanGeometry;
		static void CleanGeometry(const TopoDS_Shape & theShape);

		/****************** Compare ******************/
		%feature("compactdefaultargs") Compare;
		%feature("autodoc", "Returns true if the distance between the two vertices is lower than their tolerance.

	:param V1:
	:type V1: TopoDS_Vertex
	:param V2:
	:type V2: TopoDS_Vertex
	:rtype: bool
") Compare;
		static Standard_Boolean Compare(const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****************** Compare ******************/
		%feature("compactdefaultargs") Compare;
		%feature("autodoc", "Returns true if the distance between the two edges is lower than their tolerance.

	:param E1:
	:type E1: TopoDS_Edge
	:param E2:
	:type E2: TopoDS_Edge
	:rtype: bool
") Compare;
		static Standard_Boolean Compare(const TopoDS_Edge & E1, const TopoDS_Edge & E2);

		/****************** DetectClosedness ******************/
		%feature("compactdefaultargs") DetectClosedness;
		%feature("autodoc", "Detect closedness of face in u and v directions.

	:param theFace:
	:type theFace: TopoDS_Face
	:param theUclosed:
	:type theUclosed: bool
	:param theVclosed:
	:type theVclosed: bool
	:rtype: None
") DetectClosedness;
		static void DetectClosedness(const TopoDS_Face & theFace, Standard_Boolean &OutValue, Standard_Boolean &OutValue);

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Dumps the topological structure and the geometry of <sh> on the stream <s>.

	:param Sh:
	:type Sh: TopoDS_Shape
	:param S:
	:type S: Standard_OStream
	:rtype: None
") Dump;
		static void Dump(const TopoDS_Shape & Sh, Standard_OStream & S);

		/****************** EvalAndUpdateTol ******************/
		%feature("compactdefaultargs") EvalAndUpdateTol;
		%feature("autodoc", "Evals real tolerance of edge <thee>. <thec3d>, <thec2d>, <thes>, <thef>, <thel> are correspondently 3d curve of edge, 2d curve on surface <thes> and rang of edge if calculated tolerance is more then current edge tolerance, edge is updated. method returns actual tolerance of edge.

	:param theE:
	:type theE: TopoDS_Edge
	:param theC3d:
	:type theC3d: Geom_Curve
	:param theC2d:
	:type theC2d: Geom2d_Curve
	:param theS:
	:type theS: Geom_Surface
	:param theF:
	:type theF: float
	:param theL:
	:type theL: float
	:rtype: float
") EvalAndUpdateTol;
		static Standard_Real EvalAndUpdateTol(const TopoDS_Edge & theE, const opencascade::handle<Geom_Curve> & theC3d, const opencascade::handle<Geom2d_Curve > theC2d, const opencascade::handle<Geom_Surface> & theS, const Standard_Real theF, const Standard_Real theL);

		/****************** IsReallyClosed ******************/
		%feature("compactdefaultargs") IsReallyClosed;
		%feature("autodoc", "Verifies that the edge <e> is found two times on the face <f> before calling brep_tool::isclosed.

	:param E:
	:type E: TopoDS_Edge
	:param F:
	:type F: TopoDS_Face
	:rtype: bool
") IsReallyClosed;
		static Standard_Boolean IsReallyClosed(const TopoDS_Edge & E, const TopoDS_Face & F);

		/****************** Map3DEdges ******************/
		%feature("compactdefaultargs") Map3DEdges;
		%feature("autodoc", "Stores in the map <m> all the 3d topology edges of <s>.

	:param S:
	:type S: TopoDS_Shape
	:param M:
	:type M: TopTools_IndexedMapOfShape
	:rtype: None
") Map3DEdges;
		static void Map3DEdges(const TopoDS_Shape & S, TopTools_IndexedMapOfShape & M);

		/****************** OuterWire ******************/
		%feature("compactdefaultargs") OuterWire;
		%feature("autodoc", "Returns the outer most wire of <f>. returns a null wire if <f> has no wires.

	:param F:
	:type F: TopoDS_Face
	:rtype: TopoDS_Wire
") OuterWire;
		static TopoDS_Wire OuterWire(const TopoDS_Face & F);

		/****************** Read ******************/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "Reads a shape from <s> in returns it in <sh>. <b> is used to build the shape.

	:param Sh:
	:type Sh: TopoDS_Shape
	:param S:
	:type S: Standard_IStream
	:param B:
	:type B: BRep_Builder
	:param PR: default value is NULL
	:type PR: Message_ProgressIndicator
	:rtype: None
") Read;
		static void Read(TopoDS_Shape & Sh, Standard_IStream & S, const BRep_Builder & B, const opencascade::handle<Message_ProgressIndicator> & PR = NULL);

		/****************** Read ******************/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "Reads a shape from <file>, returns it in <sh>. <b> is used to build the shape.

	:param Sh:
	:type Sh: TopoDS_Shape
	:param File:
	:type File: char *
	:param B:
	:type B: BRep_Builder
	:param PR: default value is NULL
	:type PR: Message_ProgressIndicator
	:rtype: bool
") Read;
		static Standard_Boolean Read(TopoDS_Shape & Sh, const char * File, const BRep_Builder & B, const opencascade::handle<Message_ProgressIndicator> & PR = NULL);

		/****************** RemoveUnusedPCurves ******************/
		%feature("compactdefaultargs") RemoveUnusedPCurves;
		%feature("autodoc", "Removes all the pcurves of the edges of <s> that refer to surfaces not belonging to any face of <s>.

	:param S:
	:type S: TopoDS_Shape
	:rtype: None
") RemoveUnusedPCurves;
		static void RemoveUnusedPCurves(const TopoDS_Shape & S);

		/****************** Triangulation ******************/
		%feature("compactdefaultargs") Triangulation;
		%feature("autodoc", "Verifies that each face from the shape <s> has got a triangulation with a deflection <= deflec and the edges a discretisation on this triangulation.

	:param S:
	:type S: TopoDS_Shape
	:param deflec:
	:type deflec: float
	:rtype: bool
") Triangulation;
		static Standard_Boolean Triangulation(const TopoDS_Shape & S, const Standard_Real deflec);

		/****************** UVBounds ******************/
		%feature("compactdefaultargs") UVBounds;
		%feature("autodoc", "Returns in umin, umax, vmin, vmax the bounding values in the parametric space of f.

	:param F:
	:type F: TopoDS_Face
	:param UMin:
	:type UMin: float
	:param UMax:
	:type UMax: float
	:param VMin:
	:type VMin: float
	:param VMax:
	:type VMax: float
	:rtype: None
") UVBounds;
		static void UVBounds(const TopoDS_Face & F, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** UVBounds ******************/
		%feature("compactdefaultargs") UVBounds;
		%feature("autodoc", "Returns in umin, umax, vmin, vmax the bounding values of the wire in the parametric space of f.

	:param F:
	:type F: TopoDS_Face
	:param W:
	:type W: TopoDS_Wire
	:param UMin:
	:type UMin: float
	:param UMax:
	:type UMax: float
	:param VMin:
	:type VMin: float
	:param VMax:
	:type VMax: float
	:rtype: None
") UVBounds;
		static void UVBounds(const TopoDS_Face & F, const TopoDS_Wire & W, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** UVBounds ******************/
		%feature("compactdefaultargs") UVBounds;
		%feature("autodoc", "Returns in umin, umax, vmin, vmax the bounding values of the edge in the parametric space of f.

	:param F:
	:type F: TopoDS_Face
	:param E:
	:type E: TopoDS_Edge
	:param UMin:
	:type UMin: float
	:param UMax:
	:type UMax: float
	:param VMin:
	:type VMin: float
	:param VMax:
	:type VMax: float
	:rtype: None
") UVBounds;
		static void UVBounds(const TopoDS_Face & F, const TopoDS_Edge & E, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "Update a vertex (nothing is done).

	:param V:
	:type V: TopoDS_Vertex
	:rtype: None
") Update;
		static void Update(const TopoDS_Vertex & V);

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "Update an edge, compute 2d bounding boxes.

	:param E:
	:type E: TopoDS_Edge
	:rtype: None
") Update;
		static void Update(const TopoDS_Edge & E);

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "Update a wire (nothing is done).

	:param W:
	:type W: TopoDS_Wire
	:rtype: None
") Update;
		static void Update(const TopoDS_Wire & W);

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "Update a face, update uv points.

	:param F:
	:type F: TopoDS_Face
	:rtype: None
") Update;
		static void Update(const TopoDS_Face & F);

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "Update a shell (nothing is done).

	:param S:
	:type S: TopoDS_Shell
	:rtype: None
") Update;
		static void Update(const TopoDS_Shell & S);

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "Update a solid (nothing is done).

	:param S:
	:type S: TopoDS_Solid
	:rtype: None
") Update;
		static void Update(const TopoDS_Solid & S);

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "Update a composite solid (nothing is done).

	:param C:
	:type C: TopoDS_CompSolid
	:rtype: None
") Update;
		static void Update(const TopoDS_CompSolid & C);

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "Update a compound (nothing is done).

	:param C:
	:type C: TopoDS_Compound
	:rtype: None
") Update;
		static void Update(const TopoDS_Compound & C);

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "Update a shape, call the corect update.

	:param S:
	:type S: TopoDS_Shape
	:rtype: None
") Update;
		static void Update(const TopoDS_Shape & S);

		/****************** UpdateFaceUVPoints ******************/
		%feature("compactdefaultargs") UpdateFaceUVPoints;
		%feature("autodoc", "For each edge of the face <f> reset the uv points to the bounding points of the parametric curve of the edge on the face.

	:param theF:
	:type theF: TopoDS_Face
	:rtype: None
") UpdateFaceUVPoints;
		static void UpdateFaceUVPoints(const TopoDS_Face & theF);

		/****************** Write ******************/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "Writes <sh> on <s> in an ascii format.

	:param Sh:
	:type Sh: TopoDS_Shape
	:param S:
	:type S: Standard_OStream
	:param PR: default value is NULL
	:type PR: Message_ProgressIndicator
	:rtype: None
") Write;
		static void Write(const TopoDS_Shape & Sh, Standard_OStream & S, const opencascade::handle<Message_ProgressIndicator> & PR = NULL);

		/****************** Write ******************/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "Writes <sh> in <file>.

	:param Sh:
	:type Sh: TopoDS_Shape
	:param File:
	:type File: char *
	:param PR: default value is NULL
	:type PR: Message_ProgressIndicator
	:rtype: bool
") Write;
		static Standard_Boolean Write(const TopoDS_Shape & Sh, const char * File, const opencascade::handle<Message_ProgressIndicator> & PR = NULL);

};


%extend BRepTools {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class BRepTools_History *
**************************/
class BRepTools_History : public Standard_Transient {
	public:
/* public enums */
enum TRelationType {
	TRelationType_Removed = 0,
	TRelationType_Generated = 1,
	TRelationType_Modified = 2,
};

/* end public enums declaration */

		/****************** AddGenerated ******************/
		%feature("compactdefaultargs") AddGenerated;
		%feature("autodoc", "Set the second shape as generated one from the first shape.

	:param theInitial:
	:type theInitial: TopoDS_Shape
	:param theGenerated:
	:type theGenerated: TopoDS_Shape
	:rtype: None
") AddGenerated;
		void AddGenerated(const TopoDS_Shape & theInitial, const TopoDS_Shape & theGenerated);

		/****************** AddModified ******************/
		%feature("compactdefaultargs") AddModified;
		%feature("autodoc", "Set the second shape as modified one from the first shape.

	:param theInitial:
	:type theInitial: TopoDS_Shape
	:param theModified:
	:type theModified: TopoDS_Shape
	:rtype: None
") AddModified;
		void AddModified(const TopoDS_Shape & theInitial, const TopoDS_Shape & theModified);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears the history.

	:rtype: None
") Clear;
		void Clear();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** Generated ******************/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "	:param theInitial:
	:type theInitial: TopoDS_Shape
	:rtype: TopTools_ListOfShape
") Generated;
		const TopTools_ListOfShape & Generated(const TopoDS_Shape & theInitial);

		/****************** HasGenerated ******************/
		%feature("compactdefaultargs") HasGenerated;
		%feature("autodoc", "Returns 'true' if there any shapes with generated elements present.

	:rtype: bool
") HasGenerated;
		Standard_Boolean HasGenerated();

		/****************** HasModified ******************/
		%feature("compactdefaultargs") HasModified;
		%feature("autodoc", "Returns 'true' if there any modified shapes present.

	:rtype: bool
") HasModified;
		Standard_Boolean HasModified();

		/****************** HasRemoved ******************/
		%feature("compactdefaultargs") HasRemoved;
		%feature("autodoc", "Returns 'true' if there any removed shapes present.

	:rtype: bool
") HasRemoved;
		Standard_Boolean HasRemoved();

		/****************** IsRemoved ******************/
		%feature("compactdefaultargs") IsRemoved;
		%feature("autodoc", "	:param theInitial:
	:type theInitial: TopoDS_Shape
	:rtype: bool
") IsRemoved;
		Standard_Boolean IsRemoved(const TopoDS_Shape & theInitial);

		/****************** IsSupportedType ******************/
		%feature("compactdefaultargs") IsSupportedType;
		%feature("autodoc", "Returns 'true' if the type of the shape is supported by the history.

	:param theShape:
	:type theShape: TopoDS_Shape
	:rtype: bool
") IsSupportedType;
		static Standard_Boolean IsSupportedType(const TopoDS_Shape & theShape);

		/****************** Modified ******************/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "	:param theInitial:
	:type theInitial: TopoDS_Shape
	:rtype: TopTools_ListOfShape
") Modified;
		const TopTools_ListOfShape & Modified(const TopoDS_Shape & theInitial);

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Set the shape as removed one.

	:param theRemoved:
	:type theRemoved: TopoDS_Shape
	:rtype: None
") Remove;
		void Remove(const TopoDS_Shape & theRemoved);

		/****************** ReplaceGenerated ******************/
		%feature("compactdefaultargs") ReplaceGenerated;
		%feature("autodoc", "Set the second shape as the only generated one from the first one.

	:param theInitial:
	:type theInitial: TopoDS_Shape
	:param theGenerated:
	:type theGenerated: TopoDS_Shape
	:rtype: None
") ReplaceGenerated;
		void ReplaceGenerated(const TopoDS_Shape & theInitial, const TopoDS_Shape & theGenerated);

		/****************** ReplaceModified ******************/
		%feature("compactdefaultargs") ReplaceModified;
		%feature("autodoc", "Set the second shape as the only modified one from the first one.

	:param theInitial:
	:type theInitial: TopoDS_Shape
	:param theModified:
	:type theModified: TopoDS_Shape
	:rtype: None
") ReplaceModified;
		void ReplaceModified(const TopoDS_Shape & theInitial, const TopoDS_Shape & theModified);

};


%make_alias(BRepTools_History)

%extend BRepTools_History {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class BRepTools_Modification *
*******************************/
%nodefaultctor BRepTools_Modification;
class BRepTools_Modification : public Standard_Transient {
	public:
		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Returns the continuity of <newe> between <newf1> and <newf2>. <newe> is the new edge created from <e>. <newf1> (resp. <newf2>) is the new face created from <f1> (resp. <f2>).

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
		virtual GeomAbs_Shape Continuity(const TopoDS_Edge & E, const TopoDS_Face & F1, const TopoDS_Face & F2, const TopoDS_Edge & NewE, const TopoDS_Face & NewF1, const TopoDS_Face & NewF2);

		/****************** NewCurve ******************/
		%feature("compactdefaultargs") NewCurve;
		%feature("autodoc", "Returns true if the edge, e, has been modified. if the edge has been modified: - c is the new geometry associated with the edge, - l is its new location, and - tol is the new tolerance. if the edge has not been modified, this function returns false, and the values of c, l and tol are not significant.

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
		virtual Standard_Boolean NewCurve(const TopoDS_Edge & E, opencascade::handle<Geom_Curve> & C, TopLoc_Location & L, Standard_Real &OutValue);

		/****************** NewCurve2d ******************/
		%feature("compactdefaultargs") NewCurve2d;
		%feature("autodoc", "Returns true if the edge, e, has a new curve on surface on the face, f. if a new curve exists: - c is the new geometry of the edge, - l is the new location, and - tol is the new tolerance. newe is the new edge created from e, and newf is the new face created from f. if there is no new curve on the face, this function returns false, and the values of c, l and tol are not significant.

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
		virtual Standard_Boolean NewCurve2d(const TopoDS_Edge & E, const TopoDS_Face & F, const TopoDS_Edge & NewE, const TopoDS_Face & NewF, opencascade::handle<Geom2d_Curve> & C, Standard_Real &OutValue);

		/****************** NewParameter ******************/
		%feature("compactdefaultargs") NewParameter;
		%feature("autodoc", "Returns true if the vertex v has a new parameter on the edge e. if a new parameter exists: - p is the parameter, and - tol is the new tolerance. if there is no new parameter this function returns false, and the values of p and tol are not significant.

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
		virtual Standard_Boolean NewParameter(const TopoDS_Vertex & V, const TopoDS_Edge & E, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** NewPoint ******************/
		%feature("compactdefaultargs") NewPoint;
		%feature("autodoc", "Returns true if the vertex v has been modified. if v has been modified: - p is the new geometry of the vertex, and - tol is the new tolerance. if the vertex has not been modified this function returns false, and the values of p and tol are not significant.

	:param V:
	:type V: TopoDS_Vertex
	:param P:
	:type P: gp_Pnt
	:param Tol:
	:type Tol: float
	:rtype: bool
") NewPoint;
		virtual Standard_Boolean NewPoint(const TopoDS_Vertex & V, gp_Pnt & P, Standard_Real &OutValue);

		/****************** NewPolygon ******************/
		%feature("compactdefaultargs") NewPolygon;
		%feature("autodoc", "Returns true if the edge has been modified according to changed polygon. if the edge has been modified: - p is a new polygon.

	:param E:
	:type E: TopoDS_Edge
	:param P:
	:type P: Poly_Polygon3D
	:rtype: bool
") NewPolygon;
		virtual Standard_Boolean NewPolygon(const TopoDS_Edge & E, opencascade::handle<Poly_Polygon3D> & P);

		/****************** NewPolygonOnTriangulation ******************/
		%feature("compactdefaultargs") NewPolygonOnTriangulation;
		%feature("autodoc", "Returns true if the edge has been modified according to changed polygon on triangulation. if the edge has been modified: - p is a new polygon on triangulation.

	:param E:
	:type E: TopoDS_Edge
	:param F:
	:type F: TopoDS_Face
	:param P:
	:type P: Poly_PolygonOnTriangulation
	:rtype: bool
") NewPolygonOnTriangulation;
		virtual Standard_Boolean NewPolygonOnTriangulation(const TopoDS_Edge & E, const TopoDS_Face & F, opencascade::handle<Poly_PolygonOnTriangulation> & P);

		/****************** NewSurface ******************/
		%feature("compactdefaultargs") NewSurface;
		%feature("autodoc", "Returns true if the face, f, has been modified. if the face has been modified: - s is the new geometry of the face, - l is its new location, and - tol is the new tolerance. the flag, revwires, is set to true when the modification reverses the normal of the surface, (i.e. the wires have to be reversed). the flag, revface, is set to true if the orientation of the modified face changes in the shells which contain it. if the face has not been modified this function returns false, and the values of s, l, tol, revwires and revface are not significant.

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
		virtual Standard_Boolean NewSurface(const TopoDS_Face & F, opencascade::handle<Geom_Surface> & S, TopLoc_Location & L, Standard_Real &OutValue, Standard_Boolean &OutValue, Standard_Boolean &OutValue);

		/****************** NewTriangulation ******************/
		%feature("compactdefaultargs") NewTriangulation;
		%feature("autodoc", "Returns true if the face has been modified according to changed triangulation. if the face has been modified: - t is a new triangulation on the face.

	:param F:
	:type F: TopoDS_Face
	:param T:
	:type T: Poly_Triangulation
	:rtype: bool
") NewTriangulation;
		virtual Standard_Boolean NewTriangulation(const TopoDS_Face & F, opencascade::handle<Poly_Triangulation> & T);

};


%make_alias(BRepTools_Modification)

%extend BRepTools_Modification {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class BRepTools_Modifier *
***************************/
class BRepTools_Modifier {
	public:
		class NewCurveInfo {};
		class NewSurfaceInfo {};
		/****************** BRepTools_Modifier ******************/
		%feature("compactdefaultargs") BRepTools_Modifier;
		%feature("autodoc", "Creates an empty modifier.

	:param theMutableInput: default value is Standard_False
	:type theMutableInput: bool
	:rtype: None
") BRepTools_Modifier;
		 BRepTools_Modifier(Standard_Boolean theMutableInput = Standard_False);

		/****************** BRepTools_Modifier ******************/
		%feature("compactdefaultargs") BRepTools_Modifier;
		%feature("autodoc", "Creates a modifier on the shape <s>.

	:param S:
	:type S: TopoDS_Shape
	:rtype: None
") BRepTools_Modifier;
		 BRepTools_Modifier(const TopoDS_Shape & S);

		/****************** BRepTools_Modifier ******************/
		%feature("compactdefaultargs") BRepTools_Modifier;
		%feature("autodoc", "Creates a modifier on the shape <s>, and performs the modifications described by <m>.

	:param S:
	:type S: TopoDS_Shape
	:param M:
	:type M: BRepTools_Modification
	:rtype: None
") BRepTools_Modifier;
		 BRepTools_Modifier(const TopoDS_Shape & S, const opencascade::handle<BRepTools_Modification> & M);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes the modifier with the shape <s>.

	:param S:
	:type S: TopoDS_Shape
	:rtype: None
") Init;
		void Init(const TopoDS_Shape & S);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns standard_true if the modification has been computed successfully.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsMutableInput ******************/
		%feature("compactdefaultargs") IsMutableInput;
		%feature("autodoc", "Returns the current mutable input state.

	:rtype: bool
") IsMutableInput;
		Standard_Boolean IsMutableInput();

		/****************** ModifiedShape ******************/
		%feature("compactdefaultargs") ModifiedShape;
		%feature("autodoc", "Returns the modified shape corresponding to <s>.

	:param S:
	:type S: TopoDS_Shape
	:rtype: TopoDS_Shape
") ModifiedShape;
		const TopoDS_Shape ModifiedShape(const TopoDS_Shape & S);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs the modifications described by <m>.

	:param M:
	:type M: BRepTools_Modification
	:param aProgress: default value is NULL
	:type aProgress: Message_ProgressIndicator
	:rtype: None
") Perform;
		void Perform(const opencascade::handle<BRepTools_Modification> & M, const opencascade::handle<Message_ProgressIndicator> & aProgress = NULL);

		/****************** SetMutableInput ******************/
		%feature("compactdefaultargs") SetMutableInput;
		%feature("autodoc", "Sets the mutable input state if true then the input (original) shape can be modified during modification process.

	:param theMutableInput:
	:type theMutableInput: bool
	:rtype: None
") SetMutableInput;
		void SetMutableInput(Standard_Boolean theMutableInput);

};


%extend BRepTools_Modifier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class BRepTools_Quilt *
************************/
class BRepTools_Quilt {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Add the faces of <s> to the quilt, the faces containing bounded edges are copied.

	:param S:
	:type S: TopoDS_Shape
	:rtype: None
") Add;
		void Add(const TopoDS_Shape & S);

		/****************** BRepTools_Quilt ******************/
		%feature("compactdefaultargs") BRepTools_Quilt;
		%feature("autodoc", "	:rtype: None
") BRepTools_Quilt;
		 BRepTools_Quilt();

		/****************** Bind ******************/
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "Binds <enew> to be the new edge instead of <eold>. //! the faces of the added shape containing <eold> will be copied to substitute <eold> by <enew>. //! the vertices of <eold> will be bound to the vertices of <enew> with the same orientation. //! if <eold> and <enew> have different orientations the curves are considered to be opposite and the pcurves of <eold> will be copied and reversed in the new faces. //! <eold> must belong to the next added shape, <enew> must belong to a shape added before.

	:param Eold:
	:type Eold: TopoDS_Edge
	:param Enew:
	:type Enew: TopoDS_Edge
	:rtype: None
") Bind;
		void Bind(const TopoDS_Edge & Eold, const TopoDS_Edge & Enew);

		/****************** Bind ******************/
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "Binds <vnew> to be a new vertex instead of <vold>. //! the faces of the added shape containing <vold> will be copied to substitute <vold> by <vnew>.

	:param Vold:
	:type Vold: TopoDS_Vertex
	:param Vnew:
	:type Vnew: TopoDS_Vertex
	:rtype: None
") Bind;
		void Bind(const TopoDS_Vertex & Vold, const TopoDS_Vertex & Vnew);

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Returns the shape substitued to <s> in the quilt.

	:param S:
	:type S: TopoDS_Shape
	:rtype: TopoDS_Shape
") Copy;
		const TopoDS_Shape Copy(const TopoDS_Shape & S);

		/****************** IsCopied ******************/
		%feature("compactdefaultargs") IsCopied;
		%feature("autodoc", "Returns true if <s> has been copied (<s> is a vertex, an edge or a face).

	:param S:
	:type S: TopoDS_Shape
	:rtype: bool
") IsCopied;
		Standard_Boolean IsCopied(const TopoDS_Shape & S);

		/****************** Shells ******************/
		%feature("compactdefaultargs") Shells;
		%feature("autodoc", "Returns a compound of shells made from the current set of faces. the shells will be flagged as closed or not closed.

	:rtype: TopoDS_Shape
") Shells;
		TopoDS_Shape Shells();

};


%extend BRepTools_Quilt {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class BRepTools_ReShape *
**************************/
class BRepTools_ReShape : public Standard_Transient {
	public:
		class TReplacement {};
		/****************** Apply ******************/
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "Applies the substitutions requests to a shape. //! <until> gives the level of type until which requests are taken into account. for subshapes of the type <until> no rebuild and futher exploring are done. //! note: each subshape can be replaced by shape of the same type or by shape containing only shapes of that type (for example, topods_edge can be replaced by topods_edge, topods_wire or topods_compound containing topods_edges). if incompatible shape type is encountered, it is ignored and flag fail1 is set in status.

	:param shape:
	:type shape: TopoDS_Shape
	:param until: default value is TopAbs_SHAPE
	:type until: TopAbs_ShapeEnum
	:rtype: TopoDS_Shape
") Apply;
		virtual TopoDS_Shape Apply(const TopoDS_Shape & shape, const TopAbs_ShapeEnum until = TopAbs_SHAPE);

		/****************** BRepTools_ReShape ******************/
		%feature("compactdefaultargs") BRepTools_ReShape;
		%feature("autodoc", "Returns an empty reshape.

	:rtype: None
") BRepTools_ReShape;
		 BRepTools_ReShape();

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears all substitutions requests.

	:rtype: None
") Clear;
		virtual void Clear();

		/****************** CopyVertex ******************/
		%feature("compactdefaultargs") CopyVertex;
		%feature("autodoc", "Returns modified copy of vertex if original one is not recorded or returns modified original vertex otherwise.

	:param theV:
	:type theV: TopoDS_Vertex
	:param theTol: default value is -1.0
	:type theTol: float
	:rtype: TopoDS_Vertex
") CopyVertex;
		TopoDS_Vertex CopyVertex(const TopoDS_Vertex & theV, const Standard_Real theTol = -1.0);

		/****************** CopyVertex ******************/
		%feature("compactdefaultargs") CopyVertex;
		%feature("autodoc", "Returns modified copy of vertex if original one is not recorded or returns modified original vertex otherwise.

	:param theV:
	:type theV: TopoDS_Vertex
	:param theNewPos:
	:type theNewPos: gp_Pnt
	:param aTol:
	:type aTol: float
	:rtype: TopoDS_Vertex
") CopyVertex;
		TopoDS_Vertex CopyVertex(const TopoDS_Vertex & theV, const gp_Pnt & theNewPos, const Standard_Real aTol);

		/****************** History ******************/
		%feature("compactdefaultargs") History;
		%feature("autodoc", "Returns the history of the substituted shapes.

	:rtype: opencascade::handle<BRepTools_History>
") History;
		opencascade::handle<BRepTools_History> History();

		/****************** IsNewShape ******************/
		%feature("compactdefaultargs") IsNewShape;
		%feature("autodoc", "Checks if shape has been recorded by reshaper as a value.

	:param theShape:
	:type theShape: TopoDS_Shape
	:rtype: bool
") IsNewShape;
		Standard_Boolean IsNewShape(const TopoDS_Shape & theShape);

		/****************** IsRecorded ******************/
		%feature("compactdefaultargs") IsRecorded;
		%feature("autodoc", "Tells if a shape is recorded for replace/remove.

	:param shape:
	:type shape: TopoDS_Shape
	:rtype: bool
") IsRecorded;
		virtual Standard_Boolean IsRecorded(const TopoDS_Shape & shape);

		/****************** ModeConsiderLocation ******************/
		%feature("compactdefaultargs") ModeConsiderLocation;
		%feature("autodoc", "Returns (modifiable) the flag which defines whether location of shape take into account during replacing shapes.

	:rtype: bool
") ModeConsiderLocation;
		virtual Standard_Boolean & ModeConsiderLocation();

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Sets a request to remove a shape whatever the orientation.

	:param shape:
	:type shape: TopoDS_Shape
	:rtype: None
") Remove;
		virtual void Remove(const TopoDS_Shape & shape);

		/****************** Replace ******************/
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "Sets a request to replace a shape by a new one.

	:param shape:
	:type shape: TopoDS_Shape
	:param newshape:
	:type newshape: TopoDS_Shape
	:rtype: None
") Replace;
		virtual void Replace(const TopoDS_Shape & shape, const TopoDS_Shape & newshape);

		/****************** Status ******************/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "Returns a complete substitution status for a shape 0 : not recorded, <newsh> = original <shape> < 0: to be removed, <newsh> is null > 0: to be replaced, <newsh> is a new item if <last> is false, returns status and new shape recorded in the map directly for the shape, if true and status > 0 then recursively searches for the last status and new shape.

	:param shape:
	:type shape: TopoDS_Shape
	:param newsh:
	:type newsh: TopoDS_Shape
	:param last: default value is Standard_False
	:type last: bool
	:rtype: int
") Status;
		virtual Standard_Integer Status(const TopoDS_Shape & shape, TopoDS_Shape & newsh, const Standard_Boolean last = Standard_False);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the new value for an individual shape if not recorded, returns the original shape itself if to be removed, returns a null shape else, returns the replacing item.

	:param shape:
	:type shape: TopoDS_Shape
	:rtype: TopoDS_Shape
") Value;
		virtual TopoDS_Shape Value(const TopoDS_Shape & shape);

};


%make_alias(BRepTools_ReShape)

%extend BRepTools_ReShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class BRepTools_ShapeSet *
***************************/
class BRepTools_ShapeSet : public TopTools_ShapeSet {
	public:
		/****************** AddGeometry ******************/
		%feature("compactdefaultargs") AddGeometry;
		%feature("autodoc", "Stores the goemetry of <s>.

	:param S:
	:type S: TopoDS_Shape
	:rtype: None
") AddGeometry;
		virtual void AddGeometry(const TopoDS_Shape & S);

		/****************** AddShapes ******************/
		%feature("compactdefaultargs") AddShapes;
		%feature("autodoc", "Inserts the shape <s2> in the shape <s1>. this method must be redefined to use the correct builder.

	:param S1:
	:type S1: TopoDS_Shape
	:param S2:
	:type S2: TopoDS_Shape
	:rtype: None
") AddShapes;
		virtual void AddShapes(TopoDS_Shape & S1, const TopoDS_Shape & S2);

		/****************** BRepTools_ShapeSet ******************/
		%feature("compactdefaultargs") BRepTools_ShapeSet;
		%feature("autodoc", "Builds an empty shapeset. parameter <iswithtriangles> is added for xml persistence.

	:param isWithTriangles: default value is Standard_True
	:type isWithTriangles: bool
	:rtype: None
") BRepTools_ShapeSet;
		 BRepTools_ShapeSet(const Standard_Boolean isWithTriangles = Standard_True);

		/****************** BRepTools_ShapeSet ******************/
		%feature("compactdefaultargs") BRepTools_ShapeSet;
		%feature("autodoc", "Builds an empty shapeset. parameter <iswithtriangles> is added for xml persistence.

	:param B:
	:type B: BRep_Builder
	:param isWithTriangles: default value is Standard_True
	:type isWithTriangles: bool
	:rtype: None
") BRepTools_ShapeSet;
		 BRepTools_ShapeSet(const BRep_Builder & B, const Standard_Boolean isWithTriangles = Standard_True);

		/****************** Check ******************/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "	:param T:
	:type T: TopAbs_ShapeEnum
	:param S:
	:type S: TopoDS_Shape
	:rtype: None
") Check;
		virtual void Check(const TopAbs_ShapeEnum T, TopoDS_Shape & S);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears the content of the set.

	:rtype: None
") Clear;
		virtual void Clear();


        %feature("autodoc", "1");
        %extend{
            std::string DumpGeometryToString() {
            std::stringstream s;
            self->DumpGeometry(s);
            return s.str();}
        };
		/****************** DumpGeometry ******************/
		%feature("compactdefaultargs") DumpGeometry;
		%feature("autodoc", "Dumps the geometry of <s> on the stream <os>.

	:param S:
	:type S: TopoDS_Shape
	:param OS:
	:type OS: Standard_OStream
	:rtype: None
") DumpGeometry;
		virtual void DumpGeometry(const TopoDS_Shape & S, Standard_OStream & OS);


        %feature("autodoc", "1");
        %extend{
            std::string DumpPolygon3DToString() {
            std::stringstream s;
            self->DumpPolygon3D(s);
            return s.str();}
        };

        %feature("autodoc", "1");
        %extend{
            std::string DumpPolygonOnTriangulationToString() {
            std::stringstream s;
            self->DumpPolygonOnTriangulation(s);
            return s.str();}
        };

        %feature("autodoc", "1");
        %extend{
            std::string DumpTriangulationToString() {
            std::stringstream s;
            self->DumpTriangulation(s);
            return s.str();}
        };

            %feature("autodoc", "1");
            %extend{
                void ReadGeometryFromString(std::string src) {
                std::stringstream s(src);
                self->ReadGeometry(s);}
            };
		/****************** ReadGeometry ******************/
		%feature("compactdefaultargs") ReadGeometry;
		%feature("autodoc", "Reads the geometry of a shape of type <t> from the stream <is> and returns it in <s>.

	:param T:
	:type T: TopAbs_ShapeEnum
	:param IS:
	:type IS: Standard_IStream
	:param S:
	:type S: TopoDS_Shape
	:rtype: None
") ReadGeometry;
		virtual void ReadGeometry(const TopAbs_ShapeEnum T, Standard_IStream & IS, TopoDS_Shape & S);


            %feature("autodoc", "1");
            %extend{
                void ReadPolygon3DFromString(std::string src) {
                std::stringstream s(src);
                self->ReadPolygon3D(s);}
            };

            %feature("autodoc", "1");
            %extend{
                void ReadPolygonOnTriangulationFromString(std::string src) {
                std::stringstream s(src);
                self->ReadPolygonOnTriangulation(s);}
            };

            %feature("autodoc", "1");
            %extend{
                void ReadTriangulationFromString(std::string src) {
                std::stringstream s(src);
                self->ReadTriangulation(s);}
            };

        %feature("autodoc", "1");
        %extend{
            std::string WriteGeometryToString() {
            std::stringstream s;
            self->WriteGeometry(s);
            return s.str();}
        };
		/****************** WriteGeometry ******************/
		%feature("compactdefaultargs") WriteGeometry;
		%feature("autodoc", "Writes the geometry of <s> on the stream <os> in a format that can be read back by read.

	:param S:
	:type S: TopoDS_Shape
	:param OS:
	:type OS: Standard_OStream
	:rtype: None
") WriteGeometry;
		virtual void WriteGeometry(const TopoDS_Shape & S, Standard_OStream & OS);

		/****************** WritePolygon3D ******************/
		%feature("compactdefaultargs") WritePolygon3D;
		%feature("autodoc", "Writes the 3d polygons on the stream <os> in a format that can be read back by read.

	:param OS:
	:type OS: Standard_OStream
	:param Compact: default value is Standard_True
	:type Compact: bool
	:rtype: None
") WritePolygon3D;
		void WritePolygon3D(Standard_OStream & OS, const Standard_Boolean Compact = Standard_True);

		/****************** WritePolygonOnTriangulation ******************/
		%feature("compactdefaultargs") WritePolygonOnTriangulation;
		%feature("autodoc", "Writes the polygons on triangulation on the stream <os> in a format that can be read back by read.

	:param OS:
	:type OS: Standard_OStream
	:param Compact: default value is Standard_True
	:type Compact: bool
	:rtype: None
") WritePolygonOnTriangulation;
		void WritePolygonOnTriangulation(Standard_OStream & OS, const Standard_Boolean Compact = Standard_True);

		/****************** WriteTriangulation ******************/
		%feature("compactdefaultargs") WriteTriangulation;
		%feature("autodoc", "Writes the triangulation on the stream <os> in a format that can be read back by read.

	:param OS:
	:type OS: Standard_OStream
	:param Compact: default value is Standard_True
	:type Compact: bool
	:rtype: None
") WriteTriangulation;
		void WriteTriangulation(Standard_OStream & OS, const Standard_Boolean Compact = Standard_True);

};


%extend BRepTools_ShapeSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class BRepTools_Substitution *
*******************************/
class BRepTools_Substitution {
	public:
		/****************** BRepTools_Substitution ******************/
		%feature("compactdefaultargs") BRepTools_Substitution;
		%feature("autodoc", "	:rtype: None
") BRepTools_Substitution;
		 BRepTools_Substitution();

		/****************** Build ******************/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "Build newshape from <s> if its subshapes has modified. //! the methods <iscopied> and <copy> allows you to keep the resul of <build>.

	:param S:
	:type S: TopoDS_Shape
	:rtype: None
") Build;
		void Build(const TopoDS_Shape & S);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Reset all the fields.

	:rtype: None
") Clear;
		void Clear();

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Returns the set of shapes substitued to <s> .

	:param S:
	:type S: TopoDS_Shape
	:rtype: TopTools_ListOfShape
") Copy;
		const TopTools_ListOfShape & Copy(const TopoDS_Shape & S);

		/****************** IsCopied ******************/
		%feature("compactdefaultargs") IsCopied;
		%feature("autodoc", "Returns true if <s> has been replaced .

	:param S:
	:type S: TopoDS_Shape
	:rtype: bool
") IsCopied;
		Standard_Boolean IsCopied(const TopoDS_Shape & S);

		/****************** Substitute ******************/
		%feature("compactdefaultargs") Substitute;
		%feature("autodoc", "<oldshape> will be replaced by <newshapes>. //! <newshapes> can be empty , in this case <oldshape> will disparate from its ancestors. //! if an item of <newshapes> is oriented forward. it will be oriented as <oldshape> in its ancestors. else it will be reversed.

	:param OldShape:
	:type OldShape: TopoDS_Shape
	:param NewShapes:
	:type NewShapes: TopTools_ListOfShape
	:rtype: None
") Substitute;
		void Substitute(const TopoDS_Shape & OldShape, const TopTools_ListOfShape & NewShapes);

};


%extend BRepTools_Substitution {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class BRepTools_WireExplorer *
*******************************/
class BRepTools_WireExplorer {
	public:
		/****************** BRepTools_WireExplorer ******************/
		%feature("compactdefaultargs") BRepTools_WireExplorer;
		%feature("autodoc", "Constructs an empty explorer (which can be initialized using init).

	:rtype: None
") BRepTools_WireExplorer;
		 BRepTools_WireExplorer();

		/****************** BRepTools_WireExplorer ******************/
		%feature("compactdefaultargs") BRepTools_WireExplorer;
		%feature("autodoc", "Iinitializes an exploration of the wire <w>.

	:param W:
	:type W: TopoDS_Wire
	:rtype: None
") BRepTools_WireExplorer;
		 BRepTools_WireExplorer(const TopoDS_Wire & W);

		/****************** BRepTools_WireExplorer ******************/
		%feature("compactdefaultargs") BRepTools_WireExplorer;
		%feature("autodoc", "Initializes an exploration of the wire <w>. f is used to select the edge connected to the previous in the parametric representation of <f>.

	:param W:
	:type W: TopoDS_Wire
	:param F:
	:type F: TopoDS_Face
	:rtype: None
") BRepTools_WireExplorer;
		 BRepTools_WireExplorer(const TopoDS_Wire & W, const TopoDS_Face & F);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears the content of the explorer.

	:rtype: None
") Clear;
		void Clear();

		/****************** Current ******************/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "Returns the current edge.

	:rtype: TopoDS_Edge
") Current;
		const TopoDS_Edge Current();

		/****************** CurrentVertex ******************/
		%feature("compactdefaultargs") CurrentVertex;
		%feature("autodoc", "Returns the vertex connecting the current edge to the previous one.

	:rtype: TopoDS_Vertex
") CurrentVertex;
		const TopoDS_Vertex CurrentVertex();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes an exploration of the wire <w>.

	:param W:
	:type W: TopoDS_Wire
	:rtype: None
") Init;
		void Init(const TopoDS_Wire & W);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes an exploration of the wire <w>. f is used to select the edge connected to the previous in the parametric representation of <f>.

	:param W:
	:type W: TopoDS_Wire
	:param F:
	:type F: TopoDS_Face
	:rtype: None
") Init;
		void Init(const TopoDS_Wire & W, const TopoDS_Face & F);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes an exploration of the wire <w>. f is used to select the edge connected to the previous in the parametric representation of <f>. <umin>, <umax>, <vmin>, <vmax> - the uv bounds of the face <f>.

	:param W:
	:type W: TopoDS_Wire
	:param F:
	:type F: TopoDS_Face
	:param UMin:
	:type UMin: float
	:param UMax:
	:type UMax: float
	:param VMin:
	:type VMin: float
	:param VMax:
	:type VMax: float
	:rtype: None
") Init;
		void Init(const TopoDS_Wire & W, const TopoDS_Face & F, const Standard_Real UMin, const Standard_Real UMax, const Standard_Real VMin, const Standard_Real VMax);

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Returns true if there is a current edge.

	:rtype: bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Proceeds to the next edge.

	:rtype: None
") Next;
		void Next();

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Returns an orientation for the current edge.

	:rtype: TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation();

};


%extend BRepTools_WireExplorer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class BRepTools_GTrsfModification *
************************************/
class BRepTools_GTrsfModification : public BRepTools_Modification {
	public:
		/****************** BRepTools_GTrsfModification ******************/
		%feature("compactdefaultargs") BRepTools_GTrsfModification;
		%feature("autodoc", "	:param T:
	:type T: gp_GTrsf
	:rtype: None
") BRepTools_GTrsfModification;
		 BRepTools_GTrsfModification(const gp_GTrsf & T);

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

		/****************** GTrsf ******************/
		%feature("compactdefaultargs") GTrsf;
		%feature("autodoc", "Gives an access on the gtrsf.

	:rtype: gp_GTrsf
") GTrsf;
		gp_GTrsf GTrsf();

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
		%feature("autodoc", "Returns standard_true if the edge <e> has a new curve on surface on the face <f>.in this case, <c> is the new geometric support of the edge, <l> the new location, <tol> the new tolerance. otherwise, returns standard_false, and <c>, <l>, <tol> are not significant.

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
		%feature("autodoc", "Returns standard_true if the face <f> has been modified. in this case, <s> is the new geometric support of the face, <l> the new location,<tol> the new tolerance.<revwires> has to be set to standard_true when the modification reverses the normal of the surface.(the wires have to be reversed). <revface> has to be set to standard_true if the orientation of the modified face changes in the shells which contain it. -- here, <revface> will return standard_true if the -- gp_trsf is negative.

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

};


%make_alias(BRepTools_GTrsfModification)

%extend BRepTools_GTrsfModification {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class BRepTools_NurbsConvertModification *
*******************************************/
class BRepTools_NurbsConvertModification : public BRepTools_Modification {
	public:
		/****************** BRepTools_NurbsConvertModification ******************/
		%feature("compactdefaultargs") BRepTools_NurbsConvertModification;
		%feature("autodoc", "	:rtype: None
") BRepTools_NurbsConvertModification;
		 BRepTools_NurbsConvertModification();

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

		/****************** GetUpdatedEdges ******************/
		%feature("compactdefaultargs") GetUpdatedEdges;
		%feature("autodoc", "	:rtype: TopTools_ListOfShape
") GetUpdatedEdges;
		const TopTools_ListOfShape & GetUpdatedEdges();

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
		%feature("autodoc", "Returns standard_true if the edge <e> has a new curve on surface on the face <f>.in this case, <c> is the new geometric support of the edge, <l> the new location, <tol> the new tolerance. otherwise, returns standard_false, and <c>, <l>, <tol> are not significant.

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
		%feature("autodoc", "Returns standard_true if the face <f> has been modified. in this case, <s> is the new geometric support of the face, <l> the new location,<tol> the new tolerance.<revwires> has to be set to standard_true when the modification reverses the normal of the surface.(the wires have to be reversed). <revface> has to be set to standard_true if the orientation of the modified face changes in the shells which contain it. -- here, <revface> will return standard_true if the -- gp_trsf is negative.

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

};


%make_alias(BRepTools_NurbsConvertModification)

%extend BRepTools_NurbsConvertModification {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class BRepTools_TrsfModification *
***********************************/
class BRepTools_TrsfModification : public BRepTools_Modification {
	public:
		/****************** BRepTools_TrsfModification ******************/
		%feature("compactdefaultargs") BRepTools_TrsfModification;
		%feature("autodoc", "	:param T:
	:type T: gp_Trsf
	:rtype: None
") BRepTools_TrsfModification;
		 BRepTools_TrsfModification(const gp_Trsf & T);

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

		/****************** NewCurve ******************/
		%feature("compactdefaultargs") NewCurve;
		%feature("autodoc", "Returns true if the edge e has been modified. if the edge has been modified: - c is the new geometric support of the edge, - l is the new location, and - tol is the new tolerance. if the edge has not been modified, this function returns false, and the values of c, l and tol are not significant.

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
		%feature("autodoc", "Returns true if the edge e has a new curve on surface on the face f. if a new curve exists: - c is the new geometric support of the edge, - l is the new location, and - tol the new tolerance. if no new curve exists, this function returns false, and the values of c, l and tol are not significant.

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
		%feature("autodoc", "Returns true if the vertex v has a new parameter on the edge e. if a new parameter exists: - p is the parameter, and - tol is the new tolerance. if no new parameter exists, this function returns false, and the values of p and tol are not significant.

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
		%feature("autodoc", "Returns true if the vertex v has been modified. if the vertex has been modified: - p is the new geometry of the vertex, and - tol is the new tolerance. if the vertex has not been modified this function returns false, and the values of p and tol are not significant.

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
		%feature("autodoc", "Returns true if the face f has been modified. if the face has been modified: - s is the new geometry of the face, - l is its new location, and - tol is the new tolerance. revwires is set to true when the modification reverses the normal of the surface (the wires have to be reversed). revface is set to true if the orientation of the modified face changes in the shells which contain it. for this class, revface returns true if the gp_trsf associated with this modification is negative.

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

		/****************** Trsf ******************/
		%feature("compactdefaultargs") Trsf;
		%feature("autodoc", "Provides access to the gp_trsf associated with this modification. the transformation can be changed.

	:rtype: gp_Trsf
") Trsf;
		gp_Trsf Trsf();

};


%make_alias(BRepTools_TrsfModification)

%extend BRepTools_TrsfModification {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */

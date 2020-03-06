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
%define XCAFDOCDOCSTRING
"XCAFDoc module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_xcafdoc.html"
%enddef
%module (package="OCC.Core", docstring=XCAFDOCDOCSTRING) XCAFDoc


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
#include<XCAFDoc_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TCollection_module.hxx>
#include<TDF_module.hxx>
#include<TColStd_module.hxx>
#include<gp_module.hxx>
#include<Quantity_module.hxx>
#include<TopoDS_module.hxx>
#include<XCAFDimTolObjects_module.hxx>
#include<TDocStd_module.hxx>
#include<TopLoc_module.hxx>
#include<XCAFNoteObjects_module.hxx>
#include<OSD_module.hxx>
#include<TopTools_module.hxx>
#include<TDataStd_module.hxx>
#include<XCAFView_module.hxx>
#include<Resource_module.hxx>
#include<Message_module.hxx>
#include<CDF_module.hxx>
#include<CDM_module.hxx>
#include<PCDM_module.hxx>
#include<TDF_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TCollection.i
%import TDF.i
%import TColStd.i
%import gp.i
%import Quantity.i
%import TopoDS.i
%import XCAFDimTolObjects.i
%import TDocStd.i
%import TopLoc.i
%import XCAFNoteObjects.i
%import OSD.i
%import TopTools.i
%import TDataStd.i
%import XCAFView.i
/* public enums */
enum XCAFDoc_ColorType {
	XCAFDoc_ColorGen = 0,
	XCAFDoc_ColorSurf = 1,
	XCAFDoc_ColorCurv = 2,
};

/* end public enums declaration */

/* handles */
%wrap_handle(XCAFDoc_Area)
%wrap_handle(XCAFDoc_AssemblyItemRef)
%wrap_handle(XCAFDoc_Centroid)
%wrap_handle(XCAFDoc_ClippingPlaneTool)
%wrap_handle(XCAFDoc_Color)
%wrap_handle(XCAFDoc_ColorTool)
%wrap_handle(XCAFDoc_Datum)
%wrap_handle(XCAFDoc_DimTol)
%wrap_handle(XCAFDoc_Dimension)
%wrap_handle(XCAFDoc_DocumentTool)
%wrap_handle(XCAFDoc_GraphNode)
%wrap_handle(XCAFDoc_LayerTool)
%wrap_handle(XCAFDoc_Location)
%wrap_handle(XCAFDoc_Material)
%wrap_handle(XCAFDoc_MaterialTool)
%wrap_handle(XCAFDoc_Note)
%wrap_handle(XCAFDoc_NotesTool)
%wrap_handle(XCAFDoc_ShapeMapTool)
%wrap_handle(XCAFDoc_ShapeTool)
%wrap_handle(XCAFDoc_View)
%wrap_handle(XCAFDoc_ViewTool)
%wrap_handle(XCAFDoc_Volume)
%wrap_handle(XCAFDoc_NoteBinData)
%wrap_handle(XCAFDoc_NoteComment)
%wrap_handle(XCAFDoc_NoteBalloon)
/* end handles declaration */

/* templates */
%template(XCAFDoc_DataMapOfShapeLabel) NCollection_DataMap<TopoDS_Shape,TDF_Label,TopTools_ShapeMapHasher>;
%template(XCAFDoc_GraphNodeSequence) NCollection_Sequence<opencascade::handle<XCAFDoc_GraphNode>>;
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap<TopoDS_Shape, TDF_Label, TopTools_ShapeMapHasher> XCAFDoc_DataMapOfShapeLabel;
typedef NCollection_DataMap<TopoDS_Shape, TDF_Label, TopTools_ShapeMapHasher>::Iterator XCAFDoc_DataMapIteratorOfDataMapOfShapeLabel;
typedef NCollection_Sequence<opencascade::handle<XCAFDoc_GraphNode>> XCAFDoc_GraphNodeSequence;
typedef TCollection_AsciiString XCAFDoc_PartId;
/* end typedefs declaration */

/****************
* class XCAFDoc *
****************/
%rename(xcafdoc) XCAFDoc;
class XCAFDoc {
	public:
		/****************** AssemblyGUID ******************/
		%feature("compactdefaultargs") AssemblyGUID;
		%feature("autodoc", "Class for containing graphnodes. returns guid for uattribute identifying assembly.

	:rtype: Standard_GUID
") AssemblyGUID;
		static const Standard_GUID & AssemblyGUID();

		/****************** ColorByLayerGUID ******************/
		%feature("compactdefaultargs") ColorByLayerGUID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ColorByLayerGUID;
		static const Standard_GUID & ColorByLayerGUID();

		/****************** ColorRefGUID ******************/
		%feature("compactdefaultargs") ColorRefGUID;
		%feature("autodoc", "Return guids for treenode representing specified types of colors.

	:param type:
	:type type: XCAFDoc_ColorType
	:rtype: Standard_GUID
") ColorRefGUID;
		static const Standard_GUID & ColorRefGUID(const XCAFDoc_ColorType type);

		/****************** DatumRefGUID ******************/
		%feature("compactdefaultargs") DatumRefGUID;
		%feature("autodoc", "Return guids for treenode representing specified types of datum.

	:rtype: Standard_GUID
") DatumRefGUID;
		static const Standard_GUID & DatumRefGUID();

		/****************** DatumTolRefGUID ******************/
		%feature("compactdefaultargs") DatumTolRefGUID;
		%feature("autodoc", "Return guids for treenode representing connections datum-toler.

	:rtype: Standard_GUID
") DatumTolRefGUID;
		static const Standard_GUID & DatumTolRefGUID();

		/****************** DimTolRefGUID ******************/
		%feature("compactdefaultargs") DimTolRefGUID;
		%feature("autodoc", "Return guids for treenode representing specified types of dgt.

	:rtype: Standard_GUID
") DimTolRefGUID;
		static const Standard_GUID & DimTolRefGUID();

		/****************** DimensionRefFirstGUID ******************/
		%feature("compactdefaultargs") DimensionRefFirstGUID;
		%feature("autodoc", "Return guids for treenode representing specified types of dimension.

	:rtype: Standard_GUID
") DimensionRefFirstGUID;
		static const Standard_GUID & DimensionRefFirstGUID();

		/****************** DimensionRefSecondGUID ******************/
		%feature("compactdefaultargs") DimensionRefSecondGUID;
		%feature("autodoc", "Return guids for treenode representing specified types of dimension.

	:rtype: Standard_GUID
") DimensionRefSecondGUID;
		static const Standard_GUID & DimensionRefSecondGUID();

		/****************** ExternRefGUID ******************/
		%feature("compactdefaultargs") ExternRefGUID;
		%feature("autodoc", "Returns guid for uattribute identifying external reference on no-step file.

	:rtype: Standard_GUID
") ExternRefGUID;
		static const Standard_GUID & ExternRefGUID();

		/****************** GeomToleranceRefGUID ******************/
		%feature("compactdefaultargs") GeomToleranceRefGUID;
		%feature("autodoc", "Return guids for treenode representing specified types of geomtolerance.

	:rtype: Standard_GUID
") GeomToleranceRefGUID;
		static const Standard_GUID & GeomToleranceRefGUID();

		/****************** InvisibleGUID ******************/
		%feature("compactdefaultargs") InvisibleGUID;
		%feature("autodoc", "	:rtype: Standard_GUID
") InvisibleGUID;
		static const Standard_GUID & InvisibleGUID();

		/****************** LayerRefGUID ******************/
		%feature("compactdefaultargs") LayerRefGUID;
		%feature("autodoc", "	:rtype: Standard_GUID
") LayerRefGUID;
		static const Standard_GUID & LayerRefGUID();

		/****************** LockGUID ******************/
		%feature("compactdefaultargs") LockGUID;
		%feature("autodoc", "Returns guid for uattribute identifying lock flag.

	:rtype: Standard_GUID
") LockGUID;
		static const Standard_GUID & LockGUID();

		/****************** MaterialRefGUID ******************/
		%feature("compactdefaultargs") MaterialRefGUID;
		%feature("autodoc", "	:rtype: Standard_GUID
") MaterialRefGUID;
		static const Standard_GUID & MaterialRefGUID();

		/****************** NoteRefGUID ******************/
		%feature("compactdefaultargs") NoteRefGUID;
		%feature("autodoc", "Return guids for representing notes.

	:rtype: Standard_GUID
") NoteRefGUID;
		static const Standard_GUID & NoteRefGUID();

		/****************** SHUORefGUID ******************/
		%feature("compactdefaultargs") SHUORefGUID;
		%feature("autodoc", "Returns guid for uattribute identifying specified higher usage occurrence.

	:rtype: Standard_GUID
") SHUORefGUID;
		static const Standard_GUID & SHUORefGUID();

		/****************** ShapeRefGUID ******************/
		%feature("compactdefaultargs") ShapeRefGUID;
		%feature("autodoc", "Returns guid for treenode representing assembly link.

	:rtype: Standard_GUID
") ShapeRefGUID;
		static const Standard_GUID & ShapeRefGUID();

		/****************** ViewRefAnnotationGUID ******************/
		%feature("compactdefaultargs") ViewRefAnnotationGUID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ViewRefAnnotationGUID;
		static const Standard_GUID & ViewRefAnnotationGUID();

		/****************** ViewRefGDTGUID ******************/
		%feature("compactdefaultargs") ViewRefGDTGUID;
		%feature("autodoc", "Return guids for treenode representing specified types of view.

	:rtype: Standard_GUID
") ViewRefGDTGUID;
		static const Standard_GUID & ViewRefGDTGUID();

		/****************** ViewRefGUID ******************/
		%feature("compactdefaultargs") ViewRefGUID;
		%feature("autodoc", "Return guids for treenode representing specified types of view.

	:rtype: Standard_GUID
") ViewRefGUID;
		static const Standard_GUID & ViewRefGUID();

		/****************** ViewRefNoteGUID ******************/
		%feature("compactdefaultargs") ViewRefNoteGUID;
		%feature("autodoc", "Return guids for graphnode representing specified types of view.

	:rtype: Standard_GUID
") ViewRefNoteGUID;
		static const Standard_GUID & ViewRefNoteGUID();

		/****************** ViewRefPlaneGUID ******************/
		%feature("compactdefaultargs") ViewRefPlaneGUID;
		%feature("autodoc", "Return guids for treenode representing specified types of view.

	:rtype: Standard_GUID
") ViewRefPlaneGUID;
		static const Standard_GUID & ViewRefPlaneGUID();

		/****************** ViewRefShapeGUID ******************/
		%feature("compactdefaultargs") ViewRefShapeGUID;
		%feature("autodoc", "Return guids for treenode representing specified types of view.

	:rtype: Standard_GUID
") ViewRefShapeGUID;
		static const Standard_GUID & ViewRefShapeGUID();

};


%extend XCAFDoc {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class XCAFDoc_Area *
*********************/
class XCAFDoc_Area : public TDF_Attribute {
	public:

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** Get ******************/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "	:rtype: float
") Get;
		Standard_Real Get();

		/****************** Get ******************/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Returns volume of area as argument and succes status returns false if no such attribute at the <label>.

	:param label:
	:type label: TDF_Label
	:param area:
	:type area: float
	:rtype: bool
") Get;
		static Standard_Boolean Get(const TDF_Label & label, Standard_Real &OutValue);

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Into:
	:type Into: TDF_Attribute
	:param RT:
	:type RT: TDF_RelocationTable
	:rtype: None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param With:
	:type With: TDF_Attribute
	:rtype: None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets a value of volume.

	:param vol:
	:type vol: float
	:rtype: None
") Set;
		void Set(const Standard_Real vol);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Find, or create, an area attribute and set its value.

	:param label:
	:type label: TDF_Label
	:param area:
	:type area: float
	:rtype: opencascade::handle<XCAFDoc_Area>
") Set;
		static opencascade::handle<XCAFDoc_Area> Set(const TDF_Label & label, const Standard_Real area);

		/****************** XCAFDoc_Area ******************/
		%feature("compactdefaultargs") XCAFDoc_Area;
		%feature("autodoc", "Class methods =============.

	:rtype: None
") XCAFDoc_Area;
		 XCAFDoc_Area();

};


%make_alias(XCAFDoc_Area)

%extend XCAFDoc_Area {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class XCAFDoc_AssemblyItemId *
*******************************/
class XCAFDoc_AssemblyItemId {
	public:
		class Hasher {};
		/****************** GetPath ******************/
		%feature("compactdefaultargs") GetPath;
		%feature("autodoc", "Returns the full path as a list of label entries.

	:rtype: TColStd_ListOfAsciiString
") GetPath;
		const TColStd_ListOfAsciiString & GetPath();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes the item id from a list of strings, where every string is a label entry. \param [in] thepath - list of label entries.

	:param thePath:
	:type thePath: TColStd_ListOfAsciiString
	:rtype: None
") Init;
		void Init(const TColStd_ListOfAsciiString & thePath);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes the item id from a formatted path, where label entries are separated by '/' symbol. \param [in] thestring - formatted full path.

	:param theString:
	:type theString: TCollection_AsciiString
	:rtype: None
") Init;
		void Init(const TCollection_AsciiString & theString);

		/****************** IsChild ******************/
		%feature("compactdefaultargs") IsChild;
		%feature("autodoc", "Checks if this item is a child of the given item. \param [in] theother - potentially ancestor item. eturn true if the item is a child of theother item, otherwise - false.

	:param theOther:
	:type theOther: XCAFDoc_AssemblyItemId
	:rtype: bool
") IsChild;
		Standard_Boolean IsChild(const XCAFDoc_AssemblyItemId & theOther);

		/****************** IsDirectChild ******************/
		%feature("compactdefaultargs") IsDirectChild;
		%feature("autodoc", "Checks if this item is a direct child of the given item. \param [in] theother - potentially parent item. eturn true if the item is a direct child of theother item, otherwise - false.

	:param theOther:
	:type theOther: XCAFDoc_AssemblyItemId
	:rtype: bool
") IsDirectChild;
		Standard_Boolean IsDirectChild(const XCAFDoc_AssemblyItemId & theOther);

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "Checks for item ids equality. \param [in] theother - the item id to check equality with. eturn true if this id is equal to theother, otherwise - false.

	:param theOther:
	:type theOther: XCAFDoc_AssemblyItemId
	:rtype: bool
") IsEqual;
		Standard_Boolean IsEqual(const XCAFDoc_AssemblyItemId & theOther);

		/****************** IsNull ******************/
		%feature("compactdefaultargs") IsNull;
		%feature("autodoc", "Returns true if the full path is empty, otherwise - false.

	:rtype: bool
") IsNull;
		Standard_Boolean IsNull();

		/****************** Nullify ******************/
		%feature("compactdefaultargs") Nullify;
		%feature("autodoc", "Clears the full path.

	:rtype: None
") Nullify;
		void Nullify();

		/****************** ToString ******************/
		%feature("compactdefaultargs") ToString;
		%feature("autodoc", "Returns the full pass as a formatted string.

	:rtype: TCollection_AsciiString
") ToString;
		TCollection_AsciiString ToString();

		/****************** XCAFDoc_AssemblyItemId ******************/
		%feature("compactdefaultargs") XCAFDoc_AssemblyItemId;
		%feature("autodoc", "Constructs an empty item id.

	:rtype: None
") XCAFDoc_AssemblyItemId;
		 XCAFDoc_AssemblyItemId();

		/****************** XCAFDoc_AssemblyItemId ******************/
		%feature("compactdefaultargs") XCAFDoc_AssemblyItemId;
		%feature("autodoc", "Constructs an item id from a list of strings, where every string is a label entry. \param [in] thepath - list of label entries.

	:param thePath:
	:type thePath: TColStd_ListOfAsciiString
	:rtype: None
") XCAFDoc_AssemblyItemId;
		 XCAFDoc_AssemblyItemId(const TColStd_ListOfAsciiString & thePath);

		/****************** XCAFDoc_AssemblyItemId ******************/
		%feature("compactdefaultargs") XCAFDoc_AssemblyItemId;
		%feature("autodoc", "Constructs an item id from a formatted path, where label entries are separated by '/' symbol. \param [in] thestring - formatted full path.

	:param theString:
	:type theString: TCollection_AsciiString
	:rtype: None
") XCAFDoc_AssemblyItemId;
		 XCAFDoc_AssemblyItemId(const TCollection_AsciiString & theString);

};


%extend XCAFDoc_AssemblyItemId {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class XCAFDoc_AssemblyItemRef *
********************************/
class XCAFDoc_AssemblyItemRef : public TDF_Attribute {
	public:
		/****************** ClearExtraRef ******************/
		%feature("compactdefaultargs") ClearExtraRef;
		%feature("autodoc", "Reverts the reference to empty state.

	:rtype: None
") ClearExtraRef;
		void ClearExtraRef();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** Get ******************/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Finds a reference attribute on the given label and returns it, if it is found.

	:param theLabel:
	:type theLabel: TDF_Label
	:rtype: opencascade::handle<XCAFDoc_AssemblyItemRef>
") Get;
		static opencascade::handle<XCAFDoc_AssemblyItemRef> Get(const TDF_Label & theLabel);

		/****************** GetGUID ******************/
		%feature("compactdefaultargs") GetGUID;
		%feature("autodoc", "Returns the assembly item's attribute that the reference points to. if the reference doesn't point to an attribute, returns an empty guid.

	:rtype: Standard_GUID
") GetGUID;
		Standard_GUID GetGUID();

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** GetItem ******************/
		%feature("compactdefaultargs") GetItem;
		%feature("autodoc", "Returns the assembly item id that the reference points to.

	:rtype: XCAFDoc_AssemblyItemId
") GetItem;
		const XCAFDoc_AssemblyItemId & GetItem();

		/****************** GetSubshapeIndex ******************/
		%feature("compactdefaultargs") GetSubshapeIndex;
		%feature("autodoc", "Returns the assembly item's subshape that the reference points to. if the reference doesn't point to a subshape, returns 0.

	:rtype: int
") GetSubshapeIndex;
		Standard_Integer GetSubshapeIndex();

		/****************** HasExtraRef ******************/
		%feature("compactdefaultargs") HasExtraRef;
		%feature("autodoc", "Checks if the reference points on an item's shapeindex or attribute.

	:rtype: bool
") HasExtraRef;
		Standard_Boolean HasExtraRef();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** IsGUID ******************/
		%feature("compactdefaultargs") IsGUID;
		%feature("autodoc", "Checks is the reference points to an item's attribute.

	:rtype: bool
") IsGUID;
		Standard_Boolean IsGUID();

		/****************** IsOrphan ******************/
		%feature("compactdefaultargs") IsOrphan;
		%feature("autodoc", "Checks if the reference points to a really existing item in xde document.

	:rtype: bool
") IsOrphan;
		Standard_Boolean IsOrphan();

		/****************** IsSubshapeIndex ******************/
		%feature("compactdefaultargs") IsSubshapeIndex;
		%feature("autodoc", "Checks is the reference points to an item's subshape.

	:rtype: bool
") IsSubshapeIndex;
		Standard_Boolean IsSubshapeIndex();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theAttrInto:
	:type theAttrInto: TDF_Attribute
	:param theRT:
	:type theRT: TDF_RelocationTable
	:rtype: None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & theAttrInto, const opencascade::handle<TDF_RelocationTable> & theRT);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param theAttrFrom:
	:type theAttrFrom: TDF_Attribute
	:rtype: None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & theAttrFrom);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Create (if not exist) a reference to an assembly item. \param [in] thelabel - label to add the attribute. \param [in] theitemid - assembly item id. eturn a handle to the attribute instance.

	:param theLabel:
	:type theLabel: TDF_Label
	:param theItemId:
	:type theItemId: XCAFDoc_AssemblyItemId
	:rtype: opencascade::handle<XCAFDoc_AssemblyItemRef>
") Set;
		static opencascade::handle<XCAFDoc_AssemblyItemRef> Set(const TDF_Label & theLabel, const XCAFDoc_AssemblyItemId & theItemId);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Create (if not exist) a reference to an assembly item's label attribute. \param [in] thelabel - label to add the attribute. \param [in] theitemid - assembly item id. \param [in] theguid - assembly item's label attribute id. eturn a handle to the attribute instance.

	:param theLabel:
	:type theLabel: TDF_Label
	:param theItemId:
	:type theItemId: XCAFDoc_AssemblyItemId
	:param theGUID:
	:type theGUID: Standard_GUID
	:rtype: opencascade::handle<XCAFDoc_AssemblyItemRef>
") Set;
		static opencascade::handle<XCAFDoc_AssemblyItemRef> Set(const TDF_Label & theLabel, const XCAFDoc_AssemblyItemId & theItemId, const Standard_GUID & theGUID);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Create (if not exist) a reference to an assembly item's subshape. \param [in] thelabel - label to add the attribute. \param [in] theitemid - assembly item id. \param [in] theshapeindex - assembly item's subshape index. eturn a handle to the attribute instance.

	:param theLabel:
	:type theLabel: TDF_Label
	:param theItemId:
	:type theItemId: XCAFDoc_AssemblyItemId
	:param theShapeIndex:
	:type theShapeIndex: int
	:rtype: opencascade::handle<XCAFDoc_AssemblyItemRef>
") Set;
		static opencascade::handle<XCAFDoc_AssemblyItemRef> Set(const TDF_Label & theLabel, const XCAFDoc_AssemblyItemId & theItemId, const Standard_Integer theShapeIndex);

		/****************** SetGUID ******************/
		%feature("compactdefaultargs") SetGUID;
		%feature("autodoc", "Sets the assembly item's label attribute that the reference points to. the base assembly item will not change.

	:param theAttrGUID:
	:type theAttrGUID: Standard_GUID
	:rtype: None
") SetGUID;
		void SetGUID(const Standard_GUID & theAttrGUID);

		/****************** SetItem ******************/
		%feature("compactdefaultargs") SetItem;
		%feature("autodoc", "Sets the assembly item id that the reference points to. extra reference data (if any) will be cleared.

	:param theItemId:
	:type theItemId: XCAFDoc_AssemblyItemId
	:rtype: None
") SetItem;
		void SetItem(const XCAFDoc_AssemblyItemId & theItemId);

		/****************** SetItem ******************/
		%feature("compactdefaultargs") SetItem;
		%feature("autodoc", "Sets the assembly item id from a list of label entries that the reference points to. extra reference data (if any) will be cleared.

	:param thePath:
	:type thePath: TColStd_ListOfAsciiString
	:rtype: None
") SetItem;
		void SetItem(const TColStd_ListOfAsciiString & thePath);

		/****************** SetItem ******************/
		%feature("compactdefaultargs") SetItem;
		%feature("autodoc", "Sets the assembly item id from a formatted path that the reference points to. extra reference data (if any) will be cleared.

	:param theString:
	:type theString: TCollection_AsciiString
	:rtype: None
") SetItem;
		void SetItem(const TCollection_AsciiString & theString);

		/****************** SetSubshapeIndex ******************/
		%feature("compactdefaultargs") SetSubshapeIndex;
		%feature("autodoc", "Sets the assembly item's subshape that the reference points to. the base assembly item will not change.

	:param theShapeIndex:
	:type theShapeIndex: int
	:rtype: None
") SetSubshapeIndex;
		void SetSubshapeIndex(Standard_Integer theShapeIndex);

		/****************** XCAFDoc_AssemblyItemRef ******************/
		%feature("compactdefaultargs") XCAFDoc_AssemblyItemRef;
		%feature("autodoc", "Creates an empty reference attribute.

	:rtype: None
") XCAFDoc_AssemblyItemRef;
		 XCAFDoc_AssemblyItemRef();

};


%make_alias(XCAFDoc_AssemblyItemRef)

%extend XCAFDoc_AssemblyItemRef {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class XCAFDoc_Centroid *
*************************/
class XCAFDoc_Centroid : public TDF_Attribute {
	public:

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** Get ******************/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "	:rtype: gp_Pnt
") Get;
		gp_Pnt Get();

		/****************** Get ******************/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Returns point as argument returns false if no such attribute at the <label>.

	:param label:
	:type label: TDF_Label
	:param pnt:
	:type pnt: gp_Pnt
	:rtype: bool
") Get;
		static Standard_Boolean Get(const TDF_Label & label, gp_Pnt & pnt);

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Into:
	:type Into: TDF_Attribute
	:param RT:
	:type RT: TDF_RelocationTable
	:rtype: None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param With:
	:type With: TDF_Attribute
	:rtype: None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Find, or create, a location attribute and set it's value the location attribute is returned. location methods ===============.

	:param label:
	:type label: TDF_Label
	:param pnt:
	:type pnt: gp_Pnt
	:rtype: opencascade::handle<XCAFDoc_Centroid>
") Set;
		static opencascade::handle<XCAFDoc_Centroid> Set(const TDF_Label & label, const gp_Pnt & pnt);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param pnt:
	:type pnt: gp_Pnt
	:rtype: None
") Set;
		void Set(const gp_Pnt & pnt);

		/****************** XCAFDoc_Centroid ******************/
		%feature("compactdefaultargs") XCAFDoc_Centroid;
		%feature("autodoc", "Class methods =============.

	:rtype: None
") XCAFDoc_Centroid;
		 XCAFDoc_Centroid();

};


%make_alias(XCAFDoc_Centroid)

%extend XCAFDoc_Centroid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class XCAFDoc_ClippingPlaneTool *
**********************************/
class XCAFDoc_ClippingPlaneTool : public TDF_Attribute {
	public:
		/****************** AddClippingPlane ******************/
		%feature("compactdefaultargs") AddClippingPlane;
		%feature("autodoc", "Adds a clipping plane definition to a clippingplane table and returns its label (returns existing label if the same clipping plane is already defined).

	:param thePlane:
	:type thePlane: gp_Pln
	:param theName:
	:type theName: TCollection_ExtendedString
	:param theCapping:
	:type theCapping: bool
	:rtype: TDF_Label
") AddClippingPlane;
		TDF_Label AddClippingPlane(const gp_Pln thePlane, const TCollection_ExtendedString theName, const Standard_Boolean theCapping);

		/****************** AddClippingPlane ******************/
		%feature("compactdefaultargs") AddClippingPlane;
		%feature("autodoc", "Adds a clipping plane definition to a clippingplane table and returns its label (returns existing label if the same clipping plane is already defined).

	:param thePlane:
	:type thePlane: gp_Pln
	:param theName:
	:type theName: TCollection_HAsciiString
	:param theCapping:
	:type theCapping: bool
	:rtype: TDF_Label
") AddClippingPlane;
		TDF_Label AddClippingPlane(const gp_Pln thePlane, const opencascade::handle<TCollection_HAsciiString> & theName, const Standard_Boolean theCapping);

		/****************** AddClippingPlane ******************/
		%feature("compactdefaultargs") AddClippingPlane;
		%feature("autodoc", "Adds a clipping plane definition to a clippingplane table and returns its label (returns existing label if the same clipping plane is already defined).

	:param thePlane:
	:type thePlane: gp_Pln
	:param theName:
	:type theName: TCollection_ExtendedString
	:rtype: TDF_Label
") AddClippingPlane;
		TDF_Label AddClippingPlane(const gp_Pln thePlane, const TCollection_ExtendedString theName);

		/****************** AddClippingPlane ******************/
		%feature("compactdefaultargs") AddClippingPlane;
		%feature("autodoc", "Adds a clipping plane definition to a clippingplane table and returns its label (returns existing label if the same clipping plane is already defined).

	:param thePlane:
	:type thePlane: gp_Pln
	:param theName:
	:type theName: TCollection_HAsciiString
	:rtype: TDF_Label
") AddClippingPlane;
		TDF_Label AddClippingPlane(const gp_Pln thePlane, const opencascade::handle<TCollection_HAsciiString> & theName);

		/****************** BaseLabel ******************/
		%feature("compactdefaultargs") BaseLabel;
		%feature("autodoc", "Returns the label under which clippingplanes are stored.

	:rtype: TDF_Label
") BaseLabel;
		TDF_Label BaseLabel();

		/****************** GetCapping ******************/
		%feature("compactdefaultargs") GetCapping;
		%feature("autodoc", "Get capping value for given clipping plane label return capping value.

	:param theClippingPlaneL:
	:type theClippingPlaneL: TDF_Label
	:rtype: bool
") GetCapping;
		Standard_Boolean GetCapping(const TDF_Label & theClippingPlaneL);

		/****************** GetCapping ******************/
		%feature("compactdefaultargs") GetCapping;
		%feature("autodoc", "Get capping value for given clipping plane label return true if label is valid abd capping is exist.

	:param theClippingPlaneL:
	:type theClippingPlaneL: TDF_Label
	:param theCapping:
	:type theCapping: bool
	:rtype: bool
") GetCapping;
		Standard_Boolean GetCapping(const TDF_Label & theClippingPlaneL, Standard_Boolean &OutValue);

		/****************** GetClippingPlane ******************/
		%feature("compactdefaultargs") GetClippingPlane;
		%feature("autodoc", "Returns clippingplane defined by label lab returns false if the label is not in clippingplane table or does not define a clippingplane.

	:param theLabel:
	:type theLabel: TDF_Label
	:param thePlane:
	:type thePlane: gp_Pln
	:param theName:
	:type theName: TCollection_ExtendedString
	:param theCapping:
	:type theCapping: bool
	:rtype: bool
") GetClippingPlane;
		Standard_Boolean GetClippingPlane(const TDF_Label & theLabel, gp_Pln & thePlane, TCollection_ExtendedString & theName, Standard_Boolean &OutValue);

		/****************** GetClippingPlane ******************/
		%feature("compactdefaultargs") GetClippingPlane;
		%feature("autodoc", "Returns clippingplane defined by label lab returns false if the label is not in clippingplane table or does not define a clippingplane.

	:param theLabel:
	:type theLabel: TDF_Label
	:param thePlane:
	:type thePlane: gp_Pln
	:param theName:
	:type theName: TCollection_HAsciiString
	:param theCapping:
	:type theCapping: bool
	:rtype: bool
") GetClippingPlane;
		Standard_Boolean GetClippingPlane(const TDF_Label & theLabel, gp_Pln & thePlane, opencascade::handle<TCollection_HAsciiString> & theName, Standard_Boolean &OutValue);

		/****************** GetClippingPlanes ******************/
		%feature("compactdefaultargs") GetClippingPlanes;
		%feature("autodoc", "Returns a sequence of clipping planes currently stored in the clippingplane table.

	:param Labels:
	:type Labels: TDF_LabelSequence
	:rtype: None
") GetClippingPlanes;
		void GetClippingPlanes(TDF_LabelSequence & Labels);

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** IsClippingPlane ******************/
		%feature("compactdefaultargs") IsClippingPlane;
		%feature("autodoc", "Returns true if label belongs to a clippingplane table and is a clippingplane definition.

	:param theLabel:
	:type theLabel: TDF_Label
	:rtype: bool
") IsClippingPlane;
		Standard_Boolean IsClippingPlane(const TDF_Label & theLabel);

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param into:
	:type into: TDF_Attribute
	:param RT:
	:type RT: TDF_RelocationTable
	:rtype: None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** RemoveClippingPlane ******************/
		%feature("compactdefaultargs") RemoveClippingPlane;
		%feature("autodoc", "Removes clipping plane from the clippingplane table return false and do nothing if clipping plane is referenced in at least one view.

	:param theLabel:
	:type theLabel: TDF_Label
	:rtype: bool
") RemoveClippingPlane;
		Standard_Boolean RemoveClippingPlane(const TDF_Label & theLabel);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param with:
	:type with: TDF_Attribute
	:rtype: None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & with);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Creates (if not exist) clippingplanetool.

	:param theLabel:
	:type theLabel: TDF_Label
	:rtype: opencascade::handle<XCAFDoc_ClippingPlaneTool>
") Set;
		static opencascade::handle<XCAFDoc_ClippingPlaneTool> Set(const TDF_Label & theLabel);

		/****************** SetCapping ******************/
		%feature("compactdefaultargs") SetCapping;
		%feature("autodoc", "Set new value of capping for given clipping plane label.

	:param theClippingPlaneL:
	:type theClippingPlaneL: TDF_Label
	:param theCapping:
	:type theCapping: bool
	:rtype: None
") SetCapping;
		void SetCapping(const TDF_Label & theClippingPlaneL, const Standard_Boolean theCapping);

		/****************** UpdateClippingPlane ******************/
		%feature("compactdefaultargs") UpdateClippingPlane;
		%feature("autodoc", "Sets new value of plane and name to the given clipping plane label or do nothing, if the given label is not a clipping plane label.

	:param theLabelL:
	:type theLabelL: TDF_Label
	:param thePlane:
	:type thePlane: gp_Pln
	:param theName:
	:type theName: TCollection_ExtendedString
	:rtype: None
") UpdateClippingPlane;
		void UpdateClippingPlane(const TDF_Label & theLabelL, const gp_Pln thePlane, const TCollection_ExtendedString theName);

		/****************** XCAFDoc_ClippingPlaneTool ******************/
		%feature("compactdefaultargs") XCAFDoc_ClippingPlaneTool;
		%feature("autodoc", "	:rtype: None
") XCAFDoc_ClippingPlaneTool;
		 XCAFDoc_ClippingPlaneTool();

};


%make_alias(XCAFDoc_ClippingPlaneTool)

%extend XCAFDoc_ClippingPlaneTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class XCAFDoc_Color *
**********************/
class XCAFDoc_Color : public TDF_Attribute {
	public:
		/****************** GetAlpha ******************/
		%feature("compactdefaultargs") GetAlpha;
		%feature("autodoc", "	:rtype: Standard_ShortReal
") GetAlpha;
		Standard_ShortReal GetAlpha();

		/****************** GetColor ******************/
		%feature("compactdefaultargs") GetColor;
		%feature("autodoc", "	:rtype: Quantity_Color
") GetColor;
		const Quantity_Color & GetColor();

		/****************** GetColorRGBA ******************/
		%feature("compactdefaultargs") GetColorRGBA;
		%feature("autodoc", "	:rtype: Quantity_ColorRGBA
") GetColorRGBA;
		const Quantity_ColorRGBA & GetColorRGBA();

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** GetNOC ******************/
		%feature("compactdefaultargs") GetNOC;
		%feature("autodoc", "	:rtype: Quantity_NameOfColor
") GetNOC;
		Quantity_NameOfColor GetNOC();

		/****************** GetRGB ******************/
		%feature("compactdefaultargs") GetRGB;
		%feature("autodoc", "	:param R:
	:type R: float
	:param G:
	:type G: float
	:param B:
	:type B: float
	:rtype: None
") GetRGB;
		void GetRGB(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Into:
	:type Into: TDF_Attribute
	:param RT:
	:type RT: TDF_RelocationTable
	:rtype: None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param With:
	:type With: TDF_Attribute
	:rtype: None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param label:
	:type label: TDF_Label
	:param C:
	:type C: Quantity_Color
	:rtype: opencascade::handle<XCAFDoc_Color>
") Set;
		static opencascade::handle<XCAFDoc_Color> Set(const TDF_Label & label, const Quantity_Color & C);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param label:
	:type label: TDF_Label
	:param C:
	:type C: Quantity_ColorRGBA
	:rtype: opencascade::handle<XCAFDoc_Color>
") Set;
		static opencascade::handle<XCAFDoc_Color> Set(const TDF_Label & label, const Quantity_ColorRGBA & C);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param label:
	:type label: TDF_Label
	:param C:
	:type C: Quantity_NameOfColor
	:rtype: opencascade::handle<XCAFDoc_Color>
") Set;
		static opencascade::handle<XCAFDoc_Color> Set(const TDF_Label & label, const Quantity_NameOfColor C);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Find, or create, a color attribute and set it's value the color attribute is returned.

	:param label:
	:type label: TDF_Label
	:param R:
	:type R: float
	:param G:
	:type G: float
	:param B:
	:type B: float
	:param alpha: default value is 1.0
	:type alpha: float
	:rtype: opencascade::handle<XCAFDoc_Color>
") Set;
		static opencascade::handle<XCAFDoc_Color> Set(const TDF_Label & label, const Standard_Real R, const Standard_Real G, const Standard_Real B, const Standard_Real alpha = 1.0);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param C:
	:type C: Quantity_Color
	:rtype: None
") Set;
		void Set(const Quantity_Color & C);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param C:
	:type C: Quantity_ColorRGBA
	:rtype: None
") Set;
		void Set(const Quantity_ColorRGBA & C);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param C:
	:type C: Quantity_NameOfColor
	:rtype: None
") Set;
		void Set(const Quantity_NameOfColor C);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param R:
	:type R: float
	:param G:
	:type G: float
	:param B:
	:type B: float
	:param alpha: default value is 1.0
	:type alpha: float
	:rtype: None
") Set;
		void Set(const Standard_Real R, const Standard_Real G, const Standard_Real B, const Standard_Real alpha = 1.0);

		/****************** XCAFDoc_Color ******************/
		%feature("compactdefaultargs") XCAFDoc_Color;
		%feature("autodoc", "	:rtype: None
") XCAFDoc_Color;
		 XCAFDoc_Color();

};


%make_alias(XCAFDoc_Color)

%extend XCAFDoc_Color {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class XCAFDoc_ColorTool *
**************************/
class XCAFDoc_ColorTool : public TDF_Attribute {
	public:
		/****************** AddColor ******************/
		%feature("compactdefaultargs") AddColor;
		%feature("autodoc", "Adds a color definition to a colortable and returns its label (returns existing label if the same color is already defined).

	:param col:
	:type col: Quantity_Color
	:rtype: TDF_Label
") AddColor;
		TDF_Label AddColor(const Quantity_Color & col);

		/****************** AddColor ******************/
		%feature("compactdefaultargs") AddColor;
		%feature("autodoc", "Adds a color definition to a colortable and returns its label (returns existing label if the same color is already defined).

	:param col:
	:type col: Quantity_ColorRGBA
	:rtype: TDF_Label
") AddColor;
		TDF_Label AddColor(const Quantity_ColorRGBA & col);

		/****************** BaseLabel ******************/
		%feature("compactdefaultargs") BaseLabel;
		%feature("autodoc", "Returns the label under which colors are stored.

	:rtype: TDF_Label
") BaseLabel;
		TDF_Label BaseLabel();

		/****************** FindColor ******************/
		%feature("compactdefaultargs") FindColor;
		%feature("autodoc", "Finds a color definition in a colortable and returns its label if found returns false if color is not found in colortable.

	:param col:
	:type col: Quantity_Color
	:param lab:
	:type lab: TDF_Label
	:rtype: bool
") FindColor;
		Standard_Boolean FindColor(const Quantity_Color & col, TDF_Label & lab);

		/****************** FindColor ******************/
		%feature("compactdefaultargs") FindColor;
		%feature("autodoc", "Finds a color definition in a colortable and returns its label if found returns false if color is not found in colortable.

	:param col:
	:type col: Quantity_ColorRGBA
	:param lab:
	:type lab: TDF_Label
	:rtype: bool
") FindColor;
		Standard_Boolean FindColor(const Quantity_ColorRGBA & col, TDF_Label & lab);

		/****************** FindColor ******************/
		%feature("compactdefaultargs") FindColor;
		%feature("autodoc", "Finds a color definition in a colortable and returns its label if found (or null label else).

	:param col:
	:type col: Quantity_Color
	:rtype: TDF_Label
") FindColor;
		TDF_Label FindColor(const Quantity_Color & col);

		/****************** FindColor ******************/
		%feature("compactdefaultargs") FindColor;
		%feature("autodoc", "Finds a color definition in a colortable and returns its label if found (or null label else).

	:param col:
	:type col: Quantity_ColorRGBA
	:rtype: TDF_Label
") FindColor;
		TDF_Label FindColor(const Quantity_ColorRGBA & col);

		/****************** GetColor ******************/
		%feature("compactdefaultargs") GetColor;
		%feature("autodoc", "Returns color defined by label lab returns false if the label is not in colortable or does not define a color.

	:param lab:
	:type lab: TDF_Label
	:param col:
	:type col: Quantity_Color
	:rtype: bool
") GetColor;
		Standard_Boolean GetColor(const TDF_Label & lab, Quantity_Color & col);

		/****************** GetColor ******************/
		%feature("compactdefaultargs") GetColor;
		%feature("autodoc", "Returns color defined by label lab returns false if the label is not in colortable or does not define a color.

	:param lab:
	:type lab: TDF_Label
	:param col:
	:type col: Quantity_ColorRGBA
	:rtype: bool
") GetColor;
		Standard_Boolean GetColor(const TDF_Label & lab, Quantity_ColorRGBA & col);

		/****************** GetColor ******************/
		%feature("compactdefaultargs") GetColor;
		%feature("autodoc", "Returns label with color assigned to <l> as <type> returns false if no such color is assigned.

	:param L:
	:type L: TDF_Label
	:param type:
	:type type: XCAFDoc_ColorType
	:param colorL:
	:type colorL: TDF_Label
	:rtype: bool
") GetColor;
		static Standard_Boolean GetColor(const TDF_Label & L, const XCAFDoc_ColorType type, TDF_Label & colorL);

		/****************** GetColor ******************/
		%feature("compactdefaultargs") GetColor;
		%feature("autodoc", "Returns color assigned to <l> as <type> returns false if no such color is assigned.

	:param L:
	:type L: TDF_Label
	:param type:
	:type type: XCAFDoc_ColorType
	:param color:
	:type color: Quantity_Color
	:rtype: bool
") GetColor;
		Standard_Boolean GetColor(const TDF_Label & L, const XCAFDoc_ColorType type, Quantity_Color & color);

		/****************** GetColor ******************/
		%feature("compactdefaultargs") GetColor;
		%feature("autodoc", "Returns color assigned to <l> as <type> returns false if no such color is assigned.

	:param L:
	:type L: TDF_Label
	:param type:
	:type type: XCAFDoc_ColorType
	:param color:
	:type color: Quantity_ColorRGBA
	:rtype: bool
") GetColor;
		Standard_Boolean GetColor(const TDF_Label & L, const XCAFDoc_ColorType type, Quantity_ColorRGBA & color);

		/****************** GetColor ******************/
		%feature("compactdefaultargs") GetColor;
		%feature("autodoc", "Returns label with color assigned to <l> as <type> returns false if no such color is assigned.

	:param S:
	:type S: TopoDS_Shape
	:param type:
	:type type: XCAFDoc_ColorType
	:param colorL:
	:type colorL: TDF_Label
	:rtype: bool
") GetColor;
		Standard_Boolean GetColor(const TopoDS_Shape & S, const XCAFDoc_ColorType type, TDF_Label & colorL);

		/****************** GetColor ******************/
		%feature("compactdefaultargs") GetColor;
		%feature("autodoc", "Returns color assigned to <l> as <type> returns false if no such color is assigned.

	:param S:
	:type S: TopoDS_Shape
	:param type:
	:type type: XCAFDoc_ColorType
	:param color:
	:type color: Quantity_Color
	:rtype: bool
") GetColor;
		Standard_Boolean GetColor(const TopoDS_Shape & S, const XCAFDoc_ColorType type, Quantity_Color & color);

		/****************** GetColor ******************/
		%feature("compactdefaultargs") GetColor;
		%feature("autodoc", "Returns color assigned to <l> as <type> returns false if no such color is assigned.

	:param S:
	:type S: TopoDS_Shape
	:param type:
	:type type: XCAFDoc_ColorType
	:param color:
	:type color: Quantity_ColorRGBA
	:rtype: bool
") GetColor;
		Standard_Boolean GetColor(const TopoDS_Shape & S, const XCAFDoc_ColorType type, Quantity_ColorRGBA & color);

		/****************** GetColors ******************/
		%feature("compactdefaultargs") GetColors;
		%feature("autodoc", "Returns a sequence of colors currently stored in the colortable.

	:param Labels:
	:type Labels: TDF_LabelSequence
	:rtype: None
") GetColors;
		void GetColors(TDF_LabelSequence & Labels);

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** GetInstanceColor ******************/
		%feature("compactdefaultargs") GetInstanceColor;
		%feature("autodoc", "Gets the color of component that styled with shuo structure returns false if no sush component or color type.

	:param theShape:
	:type theShape: TopoDS_Shape
	:param type:
	:type type: XCAFDoc_ColorType
	:param color:
	:type color: Quantity_Color
	:rtype: bool
") GetInstanceColor;
		Standard_Boolean GetInstanceColor(const TopoDS_Shape & theShape, const XCAFDoc_ColorType type, Quantity_Color & color);

		/****************** GetInstanceColor ******************/
		%feature("compactdefaultargs") GetInstanceColor;
		%feature("autodoc", "Gets the color of component that styled with shuo structure returns false if no sush component or color type.

	:param theShape:
	:type theShape: TopoDS_Shape
	:param type:
	:type type: XCAFDoc_ColorType
	:param color:
	:type color: Quantity_ColorRGBA
	:rtype: bool
") GetInstanceColor;
		Standard_Boolean GetInstanceColor(const TopoDS_Shape & theShape, const XCAFDoc_ColorType type, Quantity_ColorRGBA & color);

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** IsColor ******************/
		%feature("compactdefaultargs") IsColor;
		%feature("autodoc", "Returns true if label belongs to a colortable and is a color definition.

	:param lab:
	:type lab: TDF_Label
	:rtype: bool
") IsColor;
		Standard_Boolean IsColor(const TDF_Label & lab);

		/****************** IsColorByLayer ******************/
		%feature("compactdefaultargs") IsColorByLayer;
		%feature("autodoc", "Return true if object color defined by its layer, false if not.

	:param L:
	:type L: TDF_Label
	:rtype: bool
") IsColorByLayer;
		Standard_Boolean IsColorByLayer(const TDF_Label & L);

		/****************** IsInstanceVisible ******************/
		%feature("compactdefaultargs") IsInstanceVisible;
		%feature("autodoc", "Gets the visibility status of component that styled with shuo structure returns false if no sush component.

	:param theShape:
	:type theShape: TopoDS_Shape
	:rtype: bool
") IsInstanceVisible;
		Standard_Boolean IsInstanceVisible(const TopoDS_Shape & theShape);

		/****************** IsSet ******************/
		%feature("compactdefaultargs") IsSet;
		%feature("autodoc", "Returns true if label <l> has a color assignment of the type <type>.

	:param L:
	:type L: TDF_Label
	:param type:
	:type type: XCAFDoc_ColorType
	:rtype: bool
") IsSet;
		Standard_Boolean IsSet(const TDF_Label & L, const XCAFDoc_ColorType type);

		/****************** IsSet ******************/
		%feature("compactdefaultargs") IsSet;
		%feature("autodoc", "Returns true if label <l> has a color assignment of the type <type>.

	:param S:
	:type S: TopoDS_Shape
	:param type:
	:type type: XCAFDoc_ColorType
	:rtype: bool
") IsSet;
		Standard_Boolean IsSet(const TopoDS_Shape & S, const XCAFDoc_ColorType type);

		/****************** IsVisible ******************/
		%feature("compactdefaultargs") IsVisible;
		%feature("autodoc", "Return true if object on this label is visible, false if invisible.

	:param L:
	:type L: TDF_Label
	:rtype: bool
") IsVisible;
		Standard_Boolean IsVisible(const TDF_Label & L);

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param into:
	:type into: TDF_Attribute
	:param RT:
	:type RT: TDF_RelocationTable
	:rtype: None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** RemoveColor ******************/
		%feature("compactdefaultargs") RemoveColor;
		%feature("autodoc", "Removes color from the colortable.

	:param lab:
	:type lab: TDF_Label
	:rtype: None
") RemoveColor;
		void RemoveColor(const TDF_Label & lab);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param with:
	:type with: TDF_Attribute
	:rtype: None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & with);

		/****************** ReverseChainsOfTreeNodes ******************/
		%feature("compactdefaultargs") ReverseChainsOfTreeNodes;
		%feature("autodoc", "Reverses order in chains of treenodes (from last to first) under each color label since we became to use function ::prepend() instead of ::append() in method setcolor() for acceleration.

	:rtype: bool
") ReverseChainsOfTreeNodes;
		Standard_Boolean ReverseChainsOfTreeNodes();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Creates (if not exist) colortool.

	:param L:
	:type L: TDF_Label
	:rtype: opencascade::handle<XCAFDoc_ColorTool>
") Set;
		static opencascade::handle<XCAFDoc_ColorTool> Set(const TDF_Label & L);

		/****************** SetColor ******************/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "Sets a link with guid defined by <type> (see xcafdoc::colorrefguid()) from label <l> to color defined by <colorl>. color of shape is defined following way in dependance with type of color. if type of color is xcafdoc_colorgen - then this color defines default color for surfaces and curves. if for shape color with types xcafdoc_colorsurf or xcafdoc_colorcurv is specified then such color overrides generic color.

	:param L:
	:type L: TDF_Label
	:param colorL:
	:type colorL: TDF_Label
	:param type:
	:type type: XCAFDoc_ColorType
	:rtype: None
") SetColor;
		void SetColor(const TDF_Label & L, const TDF_Label & colorL, const XCAFDoc_ColorType type);

		/****************** SetColor ******************/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "Sets a link with guid defined by <type> (see xcafdoc::colorrefguid()) from label <l> to color <color> in the colortable adds a color as necessary.

	:param L:
	:type L: TDF_Label
	:param Color:
	:type Color: Quantity_Color
	:param type:
	:type type: XCAFDoc_ColorType
	:rtype: None
") SetColor;
		void SetColor(const TDF_Label & L, const Quantity_Color & Color, const XCAFDoc_ColorType type);

		/****************** SetColor ******************/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "Sets a link with guid defined by <type> (see xcafdoc::colorrefguid()) from label <l> to color <color> in the colortable adds a color as necessary.

	:param L:
	:type L: TDF_Label
	:param Color:
	:type Color: Quantity_ColorRGBA
	:param type:
	:type type: XCAFDoc_ColorType
	:rtype: None
") SetColor;
		void SetColor(const TDF_Label & L, const Quantity_ColorRGBA & Color, const XCAFDoc_ColorType type);

		/****************** SetColor ******************/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "Sets a link with guid defined by <type> (see xcafdoc::colorrefguid()) from label <l> to color defined by <colorl> returns false if cannot find a label for shape s.

	:param S:
	:type S: TopoDS_Shape
	:param colorL:
	:type colorL: TDF_Label
	:param type:
	:type type: XCAFDoc_ColorType
	:rtype: bool
") SetColor;
		Standard_Boolean SetColor(const TopoDS_Shape & S, const TDF_Label & colorL, const XCAFDoc_ColorType type);

		/****************** SetColor ******************/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "Sets a link with guid defined by <type> (see xcafdoc::colorrefguid()) from label <l> to color <color> in the colortable adds a color as necessary returns false if cannot find a label for shape s.

	:param S:
	:type S: TopoDS_Shape
	:param Color:
	:type Color: Quantity_Color
	:param type:
	:type type: XCAFDoc_ColorType
	:rtype: bool
") SetColor;
		Standard_Boolean SetColor(const TopoDS_Shape & S, const Quantity_Color & Color, const XCAFDoc_ColorType type);

		/****************** SetColor ******************/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "Sets a link with guid defined by <type> (see xcafdoc::colorrefguid()) from label <l> to color <color> in the colortable adds a color as necessary returns false if cannot find a label for shape s.

	:param S:
	:type S: TopoDS_Shape
	:param Color:
	:type Color: Quantity_ColorRGBA
	:param type:
	:type type: XCAFDoc_ColorType
	:rtype: bool
") SetColor;
		Standard_Boolean SetColor(const TopoDS_Shape & S, const Quantity_ColorRGBA & Color, const XCAFDoc_ColorType type);

		/****************** SetColorByLayer ******************/
		%feature("compactdefaultargs") SetColorByLayer;
		%feature("autodoc", "Set the color defined by layer flag on label. do nothing if there no any object. set uattribute with corresponding guid.

	:param shapeLabel:
	:type shapeLabel: TDF_Label
	:param isColorByLayer: default value is Standard_False
	:type isColorByLayer: bool
	:rtype: None
") SetColorByLayer;
		void SetColorByLayer(const TDF_Label & shapeLabel, const Standard_Boolean isColorByLayer = Standard_False);

		/****************** SetInstanceColor ******************/
		%feature("compactdefaultargs") SetInstanceColor;
		%feature("autodoc", "Sets the color of component that styled with shuo structure returns false if no sush component found note: create shuo structeure if it is necessary and if <iscreateshuo>.

	:param theShape:
	:type theShape: TopoDS_Shape
	:param type:
	:type type: XCAFDoc_ColorType
	:param color:
	:type color: Quantity_Color
	:param isCreateSHUO: default value is Standard_True
	:type isCreateSHUO: bool
	:rtype: bool
") SetInstanceColor;
		Standard_Boolean SetInstanceColor(const TopoDS_Shape & theShape, const XCAFDoc_ColorType type, const Quantity_Color & color, const Standard_Boolean isCreateSHUO = Standard_True);

		/****************** SetInstanceColor ******************/
		%feature("compactdefaultargs") SetInstanceColor;
		%feature("autodoc", "Sets the color of component that styled with shuo structure returns false if no sush component found note: create shuo structeure if it is necessary and if <iscreateshuo>.

	:param theShape:
	:type theShape: TopoDS_Shape
	:param type:
	:type type: XCAFDoc_ColorType
	:param color:
	:type color: Quantity_ColorRGBA
	:param isCreateSHUO: default value is Standard_True
	:type isCreateSHUO: bool
	:rtype: bool
") SetInstanceColor;
		Standard_Boolean SetInstanceColor(const TopoDS_Shape & theShape, const XCAFDoc_ColorType type, const Quantity_ColorRGBA & color, const Standard_Boolean isCreateSHUO = Standard_True);

		/****************** SetVisibility ******************/
		%feature("compactdefaultargs") SetVisibility;
		%feature("autodoc", "Set the visibility of object on label. do nothing if there no any object. set uattribute with corresponding guid.

	:param shapeLabel:
	:type shapeLabel: TDF_Label
	:param isvisible: default value is Standard_True
	:type isvisible: bool
	:rtype: None
") SetVisibility;
		void SetVisibility(const TDF_Label & shapeLabel, const Standard_Boolean isvisible = Standard_True);

		/****************** ShapeTool ******************/
		%feature("compactdefaultargs") ShapeTool;
		%feature("autodoc", "Returns internal xcafdoc_shapetool tool.

	:rtype: opencascade::handle<XCAFDoc_ShapeTool>
") ShapeTool;
		const opencascade::handle<XCAFDoc_ShapeTool> & ShapeTool();

		/****************** UnSetColor ******************/
		%feature("compactdefaultargs") UnSetColor;
		%feature("autodoc", "Removes a link with guid defined by <type> (see xcafdoc::colorrefguid()) from label <l> to color.

	:param L:
	:type L: TDF_Label
	:param type:
	:type type: XCAFDoc_ColorType
	:rtype: None
") UnSetColor;
		void UnSetColor(const TDF_Label & L, const XCAFDoc_ColorType type);

		/****************** UnSetColor ******************/
		%feature("compactdefaultargs") UnSetColor;
		%feature("autodoc", "Removes a link with guid defined by <type> (see xcafdoc::colorrefguid()) from label <l> to color returns true if such link existed.

	:param S:
	:type S: TopoDS_Shape
	:param type:
	:type type: XCAFDoc_ColorType
	:rtype: bool
") UnSetColor;
		Standard_Boolean UnSetColor(const TopoDS_Shape & S, const XCAFDoc_ColorType type);

		/****************** XCAFDoc_ColorTool ******************/
		%feature("compactdefaultargs") XCAFDoc_ColorTool;
		%feature("autodoc", "	:rtype: None
") XCAFDoc_ColorTool;
		 XCAFDoc_ColorTool();

};


%make_alias(XCAFDoc_ColorTool)

%extend XCAFDoc_ColorTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class XCAFDoc_Datum *
**********************/
class XCAFDoc_Datum : public TDF_Attribute {
	public:
		/****************** GetDescription ******************/
		%feature("compactdefaultargs") GetDescription;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") GetDescription;
		opencascade::handle<TCollection_HAsciiString> GetDescription();

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** GetIdentification ******************/
		%feature("compactdefaultargs") GetIdentification;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") GetIdentification;
		opencascade::handle<TCollection_HAsciiString> GetIdentification();

		/****************** GetName ******************/
		%feature("compactdefaultargs") GetName;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") GetName;
		opencascade::handle<TCollection_HAsciiString> GetName();

		/****************** GetObject ******************/
		%feature("compactdefaultargs") GetObject;
		%feature("autodoc", "Returns dimension object data taken from the paren's label and its sub-labels.

	:rtype: opencascade::handle<XCAFDimTolObjects_DatumObject>
") GetObject;
		opencascade::handle<XCAFDimTolObjects_DatumObject> GetObject();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Into:
	:type Into: TDF_Attribute
	:param RT:
	:type RT: TDF_RelocationTable
	:rtype: None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param With:
	:type With: TDF_Attribute
	:rtype: None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param label:
	:type label: TDF_Label
	:param aName:
	:type aName: TCollection_HAsciiString
	:param aDescription:
	:type aDescription: TCollection_HAsciiString
	:param anIdentification:
	:type anIdentification: TCollection_HAsciiString
	:rtype: opencascade::handle<XCAFDoc_Datum>
") Set;
		static opencascade::handle<XCAFDoc_Datum> Set(const TDF_Label & label, const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<TCollection_HAsciiString> & anIdentification);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param theLabel:
	:type theLabel: TDF_Label
	:rtype: opencascade::handle<XCAFDoc_Datum>
") Set;
		static opencascade::handle<XCAFDoc_Datum> Set(const TDF_Label & theLabel);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param aName:
	:type aName: TCollection_HAsciiString
	:param aDescription:
	:type aDescription: TCollection_HAsciiString
	:param anIdentification:
	:type anIdentification: TCollection_HAsciiString
	:rtype: None
") Set;
		void Set(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<TCollection_HAsciiString> & anIdentification);

		/****************** SetObject ******************/
		%feature("compactdefaultargs") SetObject;
		%feature("autodoc", "Updates parent's label and its sub-labels with data taken from thedatumobject. old data associated with the label will be lost.

	:param theDatumObject:
	:type theDatumObject: XCAFDimTolObjects_DatumObject
	:rtype: None
") SetObject;
		void SetObject(const opencascade::handle<XCAFDimTolObjects_DatumObject> & theDatumObject);

		/****************** XCAFDoc_Datum ******************/
		%feature("compactdefaultargs") XCAFDoc_Datum;
		%feature("autodoc", "	:rtype: None
") XCAFDoc_Datum;
		 XCAFDoc_Datum();

};


%make_alias(XCAFDoc_Datum)

%extend XCAFDoc_Datum {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class XCAFDoc_DimTol *
***********************/
class XCAFDoc_DimTol : public TDF_Attribute {
	public:
		/****************** GetDescription ******************/
		%feature("compactdefaultargs") GetDescription;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") GetDescription;
		opencascade::handle<TCollection_HAsciiString> GetDescription();

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** GetKind ******************/
		%feature("compactdefaultargs") GetKind;
		%feature("autodoc", "	:rtype: int
") GetKind;
		Standard_Integer GetKind();

		/****************** GetName ******************/
		%feature("compactdefaultargs") GetName;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") GetName;
		opencascade::handle<TCollection_HAsciiString> GetName();

		/****************** GetVal ******************/
		%feature("compactdefaultargs") GetVal;
		%feature("autodoc", "	:rtype: opencascade::handle<TColStd_HArray1OfReal>
") GetVal;
		opencascade::handle<TColStd_HArray1OfReal> GetVal();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Into:
	:type Into: TDF_Attribute
	:param RT:
	:type RT: TDF_RelocationTable
	:rtype: None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param With:
	:type With: TDF_Attribute
	:rtype: None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param label:
	:type label: TDF_Label
	:param kind:
	:type kind: int
	:param aVal:
	:type aVal: TColStd_HArray1OfReal
	:param aName:
	:type aName: TCollection_HAsciiString
	:param aDescription:
	:type aDescription: TCollection_HAsciiString
	:rtype: opencascade::handle<XCAFDoc_DimTol>
") Set;
		static opencascade::handle<XCAFDoc_DimTol> Set(const TDF_Label & label, const Standard_Integer kind, const opencascade::handle<TColStd_HArray1OfReal> & aVal, const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param kind:
	:type kind: int
	:param aVal:
	:type aVal: TColStd_HArray1OfReal
	:param aName:
	:type aName: TCollection_HAsciiString
	:param aDescription:
	:type aDescription: TCollection_HAsciiString
	:rtype: None
") Set;
		void Set(const Standard_Integer kind, const opencascade::handle<TColStd_HArray1OfReal> & aVal, const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****************** XCAFDoc_DimTol ******************/
		%feature("compactdefaultargs") XCAFDoc_DimTol;
		%feature("autodoc", "	:rtype: None
") XCAFDoc_DimTol;
		 XCAFDoc_DimTol();

};


%make_alias(XCAFDoc_DimTol)

%extend XCAFDoc_DimTol {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class XCAFDoc_DimTolTool *
***************************/
/**************************
* class XCAFDoc_Dimension *
**************************/
class XCAFDoc_Dimension : public TDF_Attribute {
	public:
		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** GetObject ******************/
		%feature("compactdefaultargs") GetObject;
		%feature("autodoc", "Returns dimension object data taken from the paren's label and its sub-labels.

	:rtype: opencascade::handle<XCAFDimTolObjects_DimensionObject>
") GetObject;
		opencascade::handle<XCAFDimTolObjects_DimensionObject> GetObject();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Into:
	:type Into: TDF_Attribute
	:param RT:
	:type RT: TDF_RelocationTable
	:rtype: None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param With:
	:type With: TDF_Attribute
	:rtype: None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param theLabel:
	:type theLabel: TDF_Label
	:rtype: opencascade::handle<XCAFDoc_Dimension>
") Set;
		static opencascade::handle<XCAFDoc_Dimension> Set(const TDF_Label & theLabel);

		/****************** SetObject ******************/
		%feature("compactdefaultargs") SetObject;
		%feature("autodoc", "Updates parent's label and its sub-labels with data taken from thedimensionobject. old data associated with the label will be lost.

	:param theDimensionObject:
	:type theDimensionObject: XCAFDimTolObjects_DimensionObject
	:rtype: None
") SetObject;
		void SetObject(const opencascade::handle<XCAFDimTolObjects_DimensionObject> & theDimensionObject);

		/****************** XCAFDoc_Dimension ******************/
		%feature("compactdefaultargs") XCAFDoc_Dimension;
		%feature("autodoc", "	:rtype: None
") XCAFDoc_Dimension;
		 XCAFDoc_Dimension();

};


%make_alias(XCAFDoc_Dimension)

%extend XCAFDoc_Dimension {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class XCAFDoc_DocumentTool *
*****************************/
class XCAFDoc_DocumentTool : public TDF_Attribute {
	public:
		/****************** ClippingPlaneTool ******************/
		%feature("compactdefaultargs") ClippingPlaneTool;
		%feature("autodoc", "Creates (if it does not exist) clippingplanetool attribute on clippingplaneslabel().

	:param acces:
	:type acces: TDF_Label
	:rtype: opencascade::handle<XCAFDoc_ClippingPlaneTool>
") ClippingPlaneTool;
		static opencascade::handle<XCAFDoc_ClippingPlaneTool> ClippingPlaneTool(const TDF_Label & acces);

		/****************** ClippingPlanesLabel ******************/
		%feature("compactdefaultargs") ClippingPlanesLabel;
		%feature("autodoc", "Returns sub-label of doclabel() with tag 8.

	:param acces:
	:type acces: TDF_Label
	:rtype: TDF_Label
") ClippingPlanesLabel;
		static TDF_Label ClippingPlanesLabel(const TDF_Label & acces);

		/****************** ColorTool ******************/
		%feature("compactdefaultargs") ColorTool;
		%feature("autodoc", "Creates (if it does not exist) colortool attribute on colorslabel().

	:param acces:
	:type acces: TDF_Label
	:rtype: opencascade::handle<XCAFDoc_ColorTool>
") ColorTool;
		static opencascade::handle<XCAFDoc_ColorTool> ColorTool(const TDF_Label & acces);

		/****************** ColorsLabel ******************/
		%feature("compactdefaultargs") ColorsLabel;
		%feature("autodoc", "Returns sub-label of doclabel() with tag 2.

	:param acces:
	:type acces: TDF_Label
	:rtype: TDF_Label
") ColorsLabel;
		static TDF_Label ColorsLabel(const TDF_Label & acces);

		/****************** DGTsLabel ******************/
		%feature("compactdefaultargs") DGTsLabel;
		%feature("autodoc", "Returns sub-label of doclabel() with tag 4.

	:param acces:
	:type acces: TDF_Label
	:rtype: TDF_Label
") DGTsLabel;
		static TDF_Label DGTsLabel(const TDF_Label & acces);

		/****************** DimTolTool ******************/
		%feature("compactdefaultargs") DimTolTool;
		%feature("autodoc", "Creates (if it does not exist) dimtoltool attribute on dgtslabel().

	:param acces:
	:type acces: TDF_Label
	:rtype: opencascade::handle<XCAFDoc_DimTolTool>
") DimTolTool;
		static opencascade::handle<XCAFDoc_DimTolTool> DimTolTool(const TDF_Label & acces);

		/****************** DocLabel ******************/
		%feature("compactdefaultargs") DocLabel;
		%feature("autodoc", "Returns label where the documenttool attribute is or 0.1 if documenttool is not yet set.

	:param acces:
	:type acces: TDF_Label
	:rtype: TDF_Label
") DocLabel;
		static TDF_Label DocLabel(const TDF_Label & acces);

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "To be called when reading this attribute from file.

	:rtype: None
") Init;
		void Init();

		/****************** IsXCAFDocument ******************/
		%feature("compactdefaultargs") IsXCAFDocument;
		%feature("autodoc", "	:param Doc:
	:type Doc: TDocStd_Document
	:rtype: bool
") IsXCAFDocument;
		static Standard_Boolean IsXCAFDocument(const opencascade::handle<TDocStd_Document> & Doc);

		/****************** LayerTool ******************/
		%feature("compactdefaultargs") LayerTool;
		%feature("autodoc", "Creates (if it does not exist) layertool attribute on layerslabel().

	:param acces:
	:type acces: TDF_Label
	:rtype: opencascade::handle<XCAFDoc_LayerTool>
") LayerTool;
		static opencascade::handle<XCAFDoc_LayerTool> LayerTool(const TDF_Label & acces);

		/****************** LayersLabel ******************/
		%feature("compactdefaultargs") LayersLabel;
		%feature("autodoc", "Returns sub-label of doclabel() with tag 3.

	:param acces:
	:type acces: TDF_Label
	:rtype: TDF_Label
") LayersLabel;
		static TDF_Label LayersLabel(const TDF_Label & acces);

		/****************** MaterialTool ******************/
		%feature("compactdefaultargs") MaterialTool;
		%feature("autodoc", "Creates (if it does not exist) dimtoltool attribute on dgtslabel().

	:param acces:
	:type acces: TDF_Label
	:rtype: opencascade::handle<XCAFDoc_MaterialTool>
") MaterialTool;
		static opencascade::handle<XCAFDoc_MaterialTool> MaterialTool(const TDF_Label & acces);

		/****************** MaterialsLabel ******************/
		%feature("compactdefaultargs") MaterialsLabel;
		%feature("autodoc", "Returns sub-label of doclabel() with tag 5.

	:param acces:
	:type acces: TDF_Label
	:rtype: TDF_Label
") MaterialsLabel;
		static TDF_Label MaterialsLabel(const TDF_Label & acces);

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** NotesLabel ******************/
		%feature("compactdefaultargs") NotesLabel;
		%feature("autodoc", "Returns sub-label of doclabel() with tag 9.

	:param acces:
	:type acces: TDF_Label
	:rtype: TDF_Label
") NotesLabel;
		static TDF_Label NotesLabel(const TDF_Label & acces);

		/****************** NotesTool ******************/
		%feature("compactdefaultargs") NotesTool;
		%feature("autodoc", "Creates (if it does not exist) notestool attribute on noteslabel().

	:param acces:
	:type acces: TDF_Label
	:rtype: opencascade::handle<XCAFDoc_NotesTool>
") NotesTool;
		static opencascade::handle<XCAFDoc_NotesTool> NotesTool(const TDF_Label & acces);

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param into:
	:type into: TDF_Attribute
	:param RT:
	:type RT: TDF_RelocationTable
	:rtype: None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param with:
	:type with: TDF_Attribute
	:rtype: None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & with);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Create (if not exist) documenttool attribute on 0.1 label if <isacces> is true, else on <l> label. this label will be returned by doclabel(); if the attribute is already set it won't be reset on <l> even if <isacces> is false. colortool and shapetool attributes are also set by this method.

	:param L:
	:type L: TDF_Label
	:param IsAcces: default value is Standard_True
	:type IsAcces: bool
	:rtype: opencascade::handle<XCAFDoc_DocumentTool>
") Set;
		static opencascade::handle<XCAFDoc_DocumentTool> Set(const TDF_Label & L, const Standard_Boolean IsAcces = Standard_True);

		/****************** ShapeTool ******************/
		%feature("compactdefaultargs") ShapeTool;
		%feature("autodoc", "Creates (if it does not exist) shapetool attribute on shapeslabel().

	:param acces:
	:type acces: TDF_Label
	:rtype: opencascade::handle<XCAFDoc_ShapeTool>
") ShapeTool;
		static opencascade::handle<XCAFDoc_ShapeTool> ShapeTool(const TDF_Label & acces);

		/****************** ShapesLabel ******************/
		%feature("compactdefaultargs") ShapesLabel;
		%feature("autodoc", "Returns sub-label of doclabel() with tag 1.

	:param acces:
	:type acces: TDF_Label
	:rtype: TDF_Label
") ShapesLabel;
		static TDF_Label ShapesLabel(const TDF_Label & acces);

		/****************** ViewTool ******************/
		%feature("compactdefaultargs") ViewTool;
		%feature("autodoc", "Creates (if it does not exist) viewtool attribute on viewslabel().

	:param acces:
	:type acces: TDF_Label
	:rtype: opencascade::handle<XCAFDoc_ViewTool>
") ViewTool;
		static opencascade::handle<XCAFDoc_ViewTool> ViewTool(const TDF_Label & acces);

		/****************** ViewsLabel ******************/
		%feature("compactdefaultargs") ViewsLabel;
		%feature("autodoc", "Returns sub-label of doclabel() with tag 7.

	:param acces:
	:type acces: TDF_Label
	:rtype: TDF_Label
") ViewsLabel;
		static TDF_Label ViewsLabel(const TDF_Label & acces);

		/****************** XCAFDoc_DocumentTool ******************/
		%feature("compactdefaultargs") XCAFDoc_DocumentTool;
		%feature("autodoc", "	:rtype: None
") XCAFDoc_DocumentTool;
		 XCAFDoc_DocumentTool();

};


%make_alias(XCAFDoc_DocumentTool)

%extend XCAFDoc_DocumentTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class XCAFDoc_Editor *
***********************/
class XCAFDoc_Editor {
	public:
		/****************** Expand ******************/
		%feature("compactdefaultargs") Expand;
		%feature("autodoc", "Convert shape (compound/compsolid/shell/wire) to assembly. only compounds expanded recursively.

	:param Doc:
	:type Doc: TDF_Label
	:param Shape:
	:type Shape: TDF_Label
	:param recursively: default value is Standard_True
	:type recursively: bool
	:rtype: bool
") Expand;
		static Standard_Boolean Expand(const TDF_Label & Doc, const TDF_Label & Shape, const Standard_Boolean recursively = Standard_True);

		/****************** Expand ******************/
		%feature("compactdefaultargs") Expand;
		%feature("autodoc", "Convert all compounds in doc to assembly.

	:param Doc:
	:type Doc: TDF_Label
	:param recursively: default value is Standard_True
	:type recursively: bool
	:rtype: bool
") Expand;
		static Standard_Boolean Expand(const TDF_Label & Doc, const Standard_Boolean recursively = Standard_True);

};


%extend XCAFDoc_Editor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class XCAFDoc_GeomTolerance *
******************************/
/**************************
* class XCAFDoc_GraphNode *
**************************/
class XCAFDoc_GraphNode : public TDF_Attribute {
	public:
		/****************** BeforeForget ******************/
		%feature("compactdefaultargs") BeforeForget;
		%feature("autodoc", "	:rtype: None
") BeforeForget;
		virtual void BeforeForget();

		/****************** ChildIndex ******************/
		%feature("compactdefaultargs") ChildIndex;
		%feature("autodoc", "Return index of <ch>, or zero if there is no such graphnode.

	:param Ch:
	:type Ch: XCAFDoc_GraphNode
	:rtype: int
") ChildIndex;
		Standard_Integer ChildIndex(const opencascade::handle<XCAFDoc_GraphNode> & Ch);


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** FatherIndex ******************/
		%feature("compactdefaultargs") FatherIndex;
		%feature("autodoc", "Return index of <f>, or zero if there is no such graphnode.

	:param F:
	:type F: XCAFDoc_GraphNode
	:rtype: int
") FatherIndex;
		Standard_Integer FatherIndex(const opencascade::handle<XCAFDoc_GraphNode> & F);

		/****************** Find ******************/
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "Class methods working on the node =================================== shortcut to search a graph node attribute with default graphid. returns true if found.

	:param L:
	:type L: TDF_Label
	:param G:
	:type G: XCAFDoc_GraphNode
	:rtype: bool
") Find;
		static Standard_Boolean Find(const TDF_Label & L, opencascade::handle<XCAFDoc_GraphNode> & G);

		/****************** GetChild ******************/
		%feature("compactdefaultargs") GetChild;
		%feature("autodoc", "Return graphnode by index from graphnodesequence.

	:param Chindex:
	:type Chindex: int
	:rtype: opencascade::handle<XCAFDoc_GraphNode>
") GetChild;
		opencascade::handle<XCAFDoc_GraphNode> GetChild(const Standard_Integer Chindex);

		/****************** GetDefaultGraphID ******************/
		%feature("compactdefaultargs") GetDefaultGraphID;
		%feature("autodoc", "Returns a default graph id. this id is used by the <set> method without explicit tree id. instance methods: ================.

	:rtype: Standard_GUID
") GetDefaultGraphID;
		static const Standard_GUID & GetDefaultGraphID();

		/****************** GetFather ******************/
		%feature("compactdefaultargs") GetFather;
		%feature("autodoc", "Return graphnode by index from graphnodesequence.

	:param Findex:
	:type Findex: int
	:rtype: opencascade::handle<XCAFDoc_GraphNode>
") GetFather;
		opencascade::handle<XCAFDoc_GraphNode> GetFather(const Standard_Integer Findex);

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Returns the graph id (default or explicit one depending onthe set method used).

	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** IsChild ******************/
		%feature("compactdefaultargs") IsChild;
		%feature("autodoc", "Returns true if <self> is child of <f>.

	:param F:
	:type F: XCAFDoc_GraphNode
	:rtype: bool
") IsChild;
		Standard_Boolean IsChild(const opencascade::handle<XCAFDoc_GraphNode> & F);

		/****************** IsFather ******************/
		%feature("compactdefaultargs") IsFather;
		%feature("autodoc", "Returns true if <self> is father of <ch>.

	:param Ch:
	:type Ch: XCAFDoc_GraphNode
	:rtype: bool
") IsFather;
		Standard_Boolean IsFather(const opencascade::handle<XCAFDoc_GraphNode> & Ch);

		/****************** NbChildren ******************/
		%feature("compactdefaultargs") NbChildren;
		%feature("autodoc", "Return number of childrens graphnodes. implementation of attribute methods: ===================================.

	:rtype: int
") NbChildren;
		Standard_Integer NbChildren();

		/****************** NbFathers ******************/
		%feature("compactdefaultargs") NbFathers;
		%feature("autodoc", "Return number of fathers graphnodes.

	:rtype: int
") NbFathers;
		Standard_Integer NbFathers();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param into:
	:type into: TDF_Attribute
	:param RT:
	:type RT: TDF_RelocationTable
	:rtype: None
") Paste;
		virtual void Paste(const opencascade::handle<TDF_Attribute> & into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** References ******************/
		%feature("compactdefaultargs") References;
		%feature("autodoc", "	:param aDataSet:
	:type aDataSet: TDF_DataSet
	:rtype: None
") References;
		virtual void References(const opencascade::handle<TDF_DataSet> & aDataSet);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param with:
	:type with: TDF_Attribute
	:rtype: None
") Restore;
		virtual void Restore(const opencascade::handle<TDF_Attribute> & with);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Finds or creates a graphnode attribute on the label <l> with the default graph id, returned by the method <getdefaultgraphid>. returns the created/found graphnode attribute.

	:param L:
	:type L: TDF_Label
	:rtype: opencascade::handle<XCAFDoc_GraphNode>
") Set;
		static opencascade::handle<XCAFDoc_GraphNode> Set(const TDF_Label & L);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Finds or creates a graphnode attribute on the label <l>, with an explicit tree id. <explicitgraphid> is the id returned by <tdf_attribute::id> method. returns the found/created graphnode attribute.

	:param L:
	:type L: TDF_Label
	:param ExplicitGraphID:
	:type ExplicitGraphID: Standard_GUID
	:rtype: opencascade::handle<XCAFDoc_GraphNode>
") Set;
		static opencascade::handle<XCAFDoc_GraphNode> Set(const TDF_Label & L, const Standard_GUID & ExplicitGraphID);

		/****************** SetChild ******************/
		%feature("compactdefaultargs") SetChild;
		%feature("autodoc", "Set graphnode <ch> as child of me and returns index of <ch> in sequence that containing children graphnodes. return index of <ch> from graphnodesequnece.

	:param Ch:
	:type Ch: XCAFDoc_GraphNode
	:rtype: int
") SetChild;
		Standard_Integer SetChild(const opencascade::handle<XCAFDoc_GraphNode> & Ch);

		/****************** SetFather ******************/
		%feature("compactdefaultargs") SetFather;
		%feature("autodoc", "Set graphnode <f> as father of me and returns index of <f> in sequence that containing fathers graphnodes. return index of <f> from graphnodesequnece.

	:param F:
	:type F: XCAFDoc_GraphNode
	:rtype: int
") SetFather;
		Standard_Integer SetFather(const opencascade::handle<XCAFDoc_GraphNode> & F);

		/****************** SetGraphID ******************/
		%feature("compactdefaultargs") SetGraphID;
		%feature("autodoc", "	:param explicitID:
	:type explicitID: Standard_GUID
	:rtype: None
") SetGraphID;
		void SetGraphID(const Standard_GUID & explicitID);

		/****************** UnSetChild ******************/
		%feature("compactdefaultargs") UnSetChild;
		%feature("autodoc", "Remove <ch> from graphnodesequence. and remove link between father and child.

	:param Ch:
	:type Ch: XCAFDoc_GraphNode
	:rtype: None
") UnSetChild;
		void UnSetChild(const opencascade::handle<XCAFDoc_GraphNode> & Ch);

		/****************** UnSetChild ******************/
		%feature("compactdefaultargs") UnSetChild;
		%feature("autodoc", "Remove child graphnode by index from children graphnodesequence. and remove link between father and child.

	:param Chindex:
	:type Chindex: int
	:rtype: None
") UnSetChild;
		void UnSetChild(const Standard_Integer Chindex);

		/****************** UnSetFather ******************/
		%feature("compactdefaultargs") UnSetFather;
		%feature("autodoc", "Remove <f> from fathers graphnodesequence. and remove link between father and child.

	:param F:
	:type F: XCAFDoc_GraphNode
	:rtype: None
") UnSetFather;
		void UnSetFather(const opencascade::handle<XCAFDoc_GraphNode> & F);

		/****************** UnSetFather ******************/
		%feature("compactdefaultargs") UnSetFather;
		%feature("autodoc", "Remove father graphnode by index from fathers graphnodesequence. and remove link between father and child.

	:param Findex:
	:type Findex: int
	:rtype: None
") UnSetFather;
		void UnSetFather(const Standard_Integer Findex);

		/****************** XCAFDoc_GraphNode ******************/
		%feature("compactdefaultargs") XCAFDoc_GraphNode;
		%feature("autodoc", "	:rtype: None
") XCAFDoc_GraphNode;
		 XCAFDoc_GraphNode();

};


%make_alias(XCAFDoc_GraphNode)

%extend XCAFDoc_GraphNode {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class XCAFDoc_LayerTool *
**************************/
class XCAFDoc_LayerTool : public TDF_Attribute {
	public:
		/****************** AddLayer ******************/
		%feature("compactdefaultargs") AddLayer;
		%feature("autodoc", "Adds a layer definition to a layertable and returns its label (returns existing label if the same layer is already defined).

	:param aLayer:
	:type aLayer: TCollection_ExtendedString
	:rtype: TDF_Label
") AddLayer;
		TDF_Label AddLayer(const TCollection_ExtendedString & aLayer);

		/****************** BaseLabel ******************/
		%feature("compactdefaultargs") BaseLabel;
		%feature("autodoc", "Returns the label under which layers are stored.

	:rtype: TDF_Label
") BaseLabel;
		TDF_Label BaseLabel();

		/****************** FindLayer ******************/
		%feature("compactdefaultargs") FindLayer;
		%feature("autodoc", "Finds a layer definition in a layertable and returns its label if found returns false if layer is not found in layertable.

	:param aLayer:
	:type aLayer: TCollection_ExtendedString
	:param lab:
	:type lab: TDF_Label
	:rtype: bool
") FindLayer;
		Standard_Boolean FindLayer(const TCollection_ExtendedString & aLayer, TDF_Label & lab);

		/****************** FindLayer ******************/
		%feature("compactdefaultargs") FindLayer;
		%feature("autodoc", "Finds a layer definition in a layertable and returns its label if found (or null label else).

	:param aLayer:
	:type aLayer: TCollection_ExtendedString
	:rtype: TDF_Label
") FindLayer;
		TDF_Label FindLayer(const TCollection_ExtendedString & aLayer);

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** GetLayer ******************/
		%feature("compactdefaultargs") GetLayer;
		%feature("autodoc", "Returns layer defined by label lab returns false if the label is not in layertable or does not define a layer.

	:param lab:
	:type lab: TDF_Label
	:param aLayer:
	:type aLayer: TCollection_ExtendedString
	:rtype: bool
") GetLayer;
		Standard_Boolean GetLayer(const TDF_Label & lab, TCollection_ExtendedString & aLayer);

		/****************** GetLayerLabels ******************/
		%feature("compactdefaultargs") GetLayerLabels;
		%feature("autodoc", "Returns a sequence of layers currently stored in the layertable.

	:param Labels:
	:type Labels: TDF_LabelSequence
	:rtype: None
") GetLayerLabels;
		void GetLayerLabels(TDF_LabelSequence & Labels);

		/****************** GetLayers ******************/
		%feature("compactdefaultargs") GetLayers;
		%feature("autodoc", "Return sequence of strings <alayers> that assosiated with label <l>.

	:param L:
	:type L: TDF_Label
	:param aLayerS:
	:type aLayerS: TColStd_HSequenceOfExtendedString
	:rtype: bool
") GetLayers;
		Standard_Boolean GetLayers(const TDF_Label & L, opencascade::handle<TColStd_HSequenceOfExtendedString> & aLayerS);

		/****************** GetLayers ******************/
		%feature("compactdefaultargs") GetLayers;
		%feature("autodoc", "Return sequence of labels <alayersl> that assosiated with label <l>.

	:param L:
	:type L: TDF_Label
	:param aLayerLS:
	:type aLayerLS: TDF_LabelSequence
	:rtype: bool
") GetLayers;
		Standard_Boolean GetLayers(const TDF_Label & L, TDF_LabelSequence & aLayerLS);

		/****************** GetLayers ******************/
		%feature("compactdefaultargs") GetLayers;
		%feature("autodoc", "Return sequence of strings that assosiated with label <l>.

	:param L:
	:type L: TDF_Label
	:rtype: opencascade::handle<TColStd_HSequenceOfExtendedString>
") GetLayers;
		opencascade::handle<TColStd_HSequenceOfExtendedString> GetLayers(const TDF_Label & L);

		/****************** GetLayers ******************/
		%feature("compactdefaultargs") GetLayers;
		%feature("autodoc", "Return sequence of strings <alayers> that assosiated with shape <sh>.

	:param Sh:
	:type Sh: TopoDS_Shape
	:param aLayerS:
	:type aLayerS: TColStd_HSequenceOfExtendedString
	:rtype: bool
") GetLayers;
		Standard_Boolean GetLayers(const TopoDS_Shape & Sh, opencascade::handle<TColStd_HSequenceOfExtendedString> & aLayerS);

		/****************** GetLayers ******************/
		%feature("compactdefaultargs") GetLayers;
		%feature("autodoc", "Return sequence of labels <alayerls> that assosiated with shape <sh>.

	:param Sh:
	:type Sh: TopoDS_Shape
	:param aLayerLS:
	:type aLayerLS: TDF_LabelSequence
	:rtype: bool
") GetLayers;
		Standard_Boolean GetLayers(const TopoDS_Shape & Sh, TDF_LabelSequence & aLayerLS);

		/****************** GetLayers ******************/
		%feature("compactdefaultargs") GetLayers;
		%feature("autodoc", "Return sequence of strings that assosiated with shape <sh>.

	:param Sh:
	:type Sh: TopoDS_Shape
	:rtype: opencascade::handle<TColStd_HSequenceOfExtendedString>
") GetLayers;
		opencascade::handle<TColStd_HSequenceOfExtendedString> GetLayers(const TopoDS_Shape & Sh);

		/****************** GetShapesOfLayer ******************/
		%feature("compactdefaultargs") GetShapesOfLayer;
		%feature("autodoc", "Return sequanese of shape labels that assigned with layers to <shlabels>.

	:param layerL:
	:type layerL: TDF_Label
	:param ShLabels:
	:type ShLabels: TDF_LabelSequence
	:rtype: None
") GetShapesOfLayer;
		void GetShapesOfLayer(const TDF_Label & layerL, TDF_LabelSequence & ShLabels);

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** IsLayer ******************/
		%feature("compactdefaultargs") IsLayer;
		%feature("autodoc", "Returns true if label belongs to a layertable and is a layer definition.

	:param lab:
	:type lab: TDF_Label
	:rtype: bool
") IsLayer;
		Standard_Boolean IsLayer(const TDF_Label & lab);

		/****************** IsSet ******************/
		%feature("compactdefaultargs") IsSet;
		%feature("autodoc", "Returns true if label <l> has a layer assosiated with the <alayer>.

	:param L:
	:type L: TDF_Label
	:param aLayer:
	:type aLayer: TCollection_ExtendedString
	:rtype: bool
") IsSet;
		Standard_Boolean IsSet(const TDF_Label & L, const TCollection_ExtendedString & aLayer);

		/****************** IsSet ******************/
		%feature("compactdefaultargs") IsSet;
		%feature("autodoc", "Returns true if label <l> has a layer assosiated with the <alayerl> label.

	:param L:
	:type L: TDF_Label
	:param aLayerL:
	:type aLayerL: TDF_Label
	:rtype: bool
") IsSet;
		Standard_Boolean IsSet(const TDF_Label & L, const TDF_Label & aLayerL);

		/****************** IsSet ******************/
		%feature("compactdefaultargs") IsSet;
		%feature("autodoc", "Returns true if shape <sh> has a layer assosiated with the <alayer>.

	:param Sh:
	:type Sh: TopoDS_Shape
	:param aLayer:
	:type aLayer: TCollection_ExtendedString
	:rtype: bool
") IsSet;
		Standard_Boolean IsSet(const TopoDS_Shape & Sh, const TCollection_ExtendedString & aLayer);

		/****************** IsSet ******************/
		%feature("compactdefaultargs") IsSet;
		%feature("autodoc", "Returns true if shape <sh> has a layer assosiated with the <alayerl>.

	:param Sh:
	:type Sh: TopoDS_Shape
	:param aLayerL:
	:type aLayerL: TDF_Label
	:rtype: bool
") IsSet;
		Standard_Boolean IsSet(const TopoDS_Shape & Sh, const TDF_Label & aLayerL);

		/****************** IsVisible ******************/
		%feature("compactdefaultargs") IsVisible;
		%feature("autodoc", "Return true if layer is visible, false if invisible.

	:param layerL:
	:type layerL: TDF_Label
	:rtype: bool
") IsVisible;
		Standard_Boolean IsVisible(const TDF_Label & layerL);

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param into:
	:type into: TDF_Attribute
	:param RT:
	:type RT: TDF_RelocationTable
	:rtype: None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** RemoveLayer ******************/
		%feature("compactdefaultargs") RemoveLayer;
		%feature("autodoc", "Removes layer from the layertable.

	:param lab:
	:type lab: TDF_Label
	:rtype: None
") RemoveLayer;
		void RemoveLayer(const TDF_Label & lab);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param with:
	:type with: TDF_Attribute
	:rtype: None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & with);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Creates (if not exist) layertool.

	:param L:
	:type L: TDF_Label
	:rtype: opencascade::handle<XCAFDoc_LayerTool>
") Set;
		static opencascade::handle<XCAFDoc_LayerTool> Set(const TDF_Label & L);

		/****************** SetLayer ******************/
		%feature("compactdefaultargs") SetLayer;
		%feature("autodoc", "Sets a link from label <l> to layer defined by <layerl> optional parametr <shapeinonelayer> show could shape be in number of layers or only in one.

	:param L:
	:type L: TDF_Label
	:param LayerL:
	:type LayerL: TDF_Label
	:param shapeInOneLayer: default value is Standard_False
	:type shapeInOneLayer: bool
	:rtype: None
") SetLayer;
		void SetLayer(const TDF_Label & L, const TDF_Label & LayerL, const Standard_Boolean shapeInOneLayer = Standard_False);

		/****************** SetLayer ******************/
		%feature("compactdefaultargs") SetLayer;
		%feature("autodoc", "Sets a link from label <l> to layer <alayer> in the layertable adds a layer as necessary optional parametr <shapeinonelayer> show could shape be in number of layers or only in one.

	:param L:
	:type L: TDF_Label
	:param aLayer:
	:type aLayer: TCollection_ExtendedString
	:param shapeInOneLayer: default value is Standard_False
	:type shapeInOneLayer: bool
	:rtype: None
") SetLayer;
		void SetLayer(const TDF_Label & L, const TCollection_ExtendedString & aLayer, const Standard_Boolean shapeInOneLayer = Standard_False);

		/****************** SetLayer ******************/
		%feature("compactdefaultargs") SetLayer;
		%feature("autodoc", "Sets a link from label that containig shape <sh> with layer that situated at label <layerl>. optional parametr <shapeinonelayer> show could shape be in number of layers or only in one. return false if no such shape <sh> or label <layerl>.

	:param Sh:
	:type Sh: TopoDS_Shape
	:param LayerL:
	:type LayerL: TDF_Label
	:param shapeInOneLayer: default value is Standard_False
	:type shapeInOneLayer: bool
	:rtype: bool
") SetLayer;
		Standard_Boolean SetLayer(const TopoDS_Shape & Sh, const TDF_Label & LayerL, const Standard_Boolean shapeInOneLayer = Standard_False);

		/****************** SetLayer ******************/
		%feature("compactdefaultargs") SetLayer;
		%feature("autodoc", "Sets a link from label that containig shape <sh> with layer <alayer>. add <alayer> to layertable if nessesery. optional parametr <shapeinonelayer> show could shape be in number of layers or only in one. return false if no such shape <sh>.

	:param Sh:
	:type Sh: TopoDS_Shape
	:param aLayer:
	:type aLayer: TCollection_ExtendedString
	:param shapeInOneLayer: default value is Standard_False
	:type shapeInOneLayer: bool
	:rtype: bool
") SetLayer;
		Standard_Boolean SetLayer(const TopoDS_Shape & Sh, const TCollection_ExtendedString & aLayer, const Standard_Boolean shapeInOneLayer = Standard_False);

		/****************** SetVisibility ******************/
		%feature("compactdefaultargs") SetVisibility;
		%feature("autodoc", "Set the visibility of layer. if layer is invisible when on it's layer will set uattribute with corresponding guid.

	:param layerL:
	:type layerL: TDF_Label
	:param isvisible: default value is Standard_True
	:type isvisible: bool
	:rtype: None
") SetVisibility;
		void SetVisibility(const TDF_Label & layerL, const Standard_Boolean isvisible = Standard_True);

		/****************** ShapeTool ******************/
		%feature("compactdefaultargs") ShapeTool;
		%feature("autodoc", "Returns internal xcafdoc_shapetool tool.

	:rtype: opencascade::handle<XCAFDoc_ShapeTool>
") ShapeTool;
		const opencascade::handle<XCAFDoc_ShapeTool> & ShapeTool();

		/****************** UnSetLayers ******************/
		%feature("compactdefaultargs") UnSetLayers;
		%feature("autodoc", "Removes a link from label <l> to all layers.

	:param L:
	:type L: TDF_Label
	:rtype: None
") UnSetLayers;
		void UnSetLayers(const TDF_Label & L);

		/****************** UnSetLayers ******************/
		%feature("compactdefaultargs") UnSetLayers;
		%feature("autodoc", "Remove link between shape <sh> and all layers at layertable. return false if no such shape <sh> in xcaf document.

	:param Sh:
	:type Sh: TopoDS_Shape
	:rtype: bool
") UnSetLayers;
		Standard_Boolean UnSetLayers(const TopoDS_Shape & Sh);

		/****************** UnSetOneLayer ******************/
		%feature("compactdefaultargs") UnSetOneLayer;
		%feature("autodoc", "Remove link from label <l> and layer <alayer>. returns false if no such layer.

	:param L:
	:type L: TDF_Label
	:param aLayer:
	:type aLayer: TCollection_ExtendedString
	:rtype: bool
") UnSetOneLayer;
		Standard_Boolean UnSetOneLayer(const TDF_Label & L, const TCollection_ExtendedString & aLayer);

		/****************** UnSetOneLayer ******************/
		%feature("compactdefaultargs") UnSetOneLayer;
		%feature("autodoc", "Remove link from label <l> and layer <alayerl>. returns false if <alayerl> is not a layer label.

	:param L:
	:type L: TDF_Label
	:param aLayerL:
	:type aLayerL: TDF_Label
	:rtype: bool
") UnSetOneLayer;
		Standard_Boolean UnSetOneLayer(const TDF_Label & L, const TDF_Label & aLayerL);

		/****************** UnSetOneLayer ******************/
		%feature("compactdefaultargs") UnSetOneLayer;
		%feature("autodoc", "Remove link between shape <sh> and layer <alayer>. returns false if no such layer <alayer> or shape <sh>.

	:param Sh:
	:type Sh: TopoDS_Shape
	:param aLayer:
	:type aLayer: TCollection_ExtendedString
	:rtype: bool
") UnSetOneLayer;
		Standard_Boolean UnSetOneLayer(const TopoDS_Shape & Sh, const TCollection_ExtendedString & aLayer);

		/****************** UnSetOneLayer ******************/
		%feature("compactdefaultargs") UnSetOneLayer;
		%feature("autodoc", "Remove link between shape <sh> and layer <alayerl>. returns false if no such layer <alayerl> or shape <sh>.

	:param Sh:
	:type Sh: TopoDS_Shape
	:param aLayerL:
	:type aLayerL: TDF_Label
	:rtype: bool
") UnSetOneLayer;
		Standard_Boolean UnSetOneLayer(const TopoDS_Shape & Sh, const TDF_Label & aLayerL);

		/****************** XCAFDoc_LayerTool ******************/
		%feature("compactdefaultargs") XCAFDoc_LayerTool;
		%feature("autodoc", "	:rtype: None
") XCAFDoc_LayerTool;
		 XCAFDoc_LayerTool();

};


%make_alias(XCAFDoc_LayerTool)

%extend XCAFDoc_LayerTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class XCAFDoc_Location *
*************************/
class XCAFDoc_Location : public TDF_Attribute {
	public:
		/****************** Get ******************/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Returns true if there is a reference on the same label.

	:rtype: TopLoc_Location
") Get;
		const TopLoc_Location & Get();

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Into:
	:type Into: TDF_Attribute
	:param RT:
	:type RT: TDF_RelocationTable
	:rtype: None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param With:
	:type With: TDF_Attribute
	:rtype: None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Find, or create, a location attribute and set it's value the location attribute is returned. location methods ===============.

	:param label:
	:type label: TDF_Label
	:param Loc:
	:type Loc: TopLoc_Location
	:rtype: opencascade::handle<XCAFDoc_Location>
") Set;
		static opencascade::handle<XCAFDoc_Location> Set(const TDF_Label & label, const TopLoc_Location & Loc);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param Loc:
	:type Loc: TopLoc_Location
	:rtype: None
") Set;
		void Set(const TopLoc_Location & Loc);

		/****************** XCAFDoc_Location ******************/
		%feature("compactdefaultargs") XCAFDoc_Location;
		%feature("autodoc", "Class methods =============.

	:rtype: None
") XCAFDoc_Location;
		 XCAFDoc_Location();

};


%make_alias(XCAFDoc_Location)

%extend XCAFDoc_Location {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class XCAFDoc_Material *
*************************/
class XCAFDoc_Material : public TDF_Attribute {
	public:
		/****************** GetDensName ******************/
		%feature("compactdefaultargs") GetDensName;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") GetDensName;
		opencascade::handle<TCollection_HAsciiString> GetDensName();

		/****************** GetDensValType ******************/
		%feature("compactdefaultargs") GetDensValType;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") GetDensValType;
		opencascade::handle<TCollection_HAsciiString> GetDensValType();

		/****************** GetDensity ******************/
		%feature("compactdefaultargs") GetDensity;
		%feature("autodoc", "	:rtype: float
") GetDensity;
		Standard_Real GetDensity();

		/****************** GetDescription ******************/
		%feature("compactdefaultargs") GetDescription;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") GetDescription;
		opencascade::handle<TCollection_HAsciiString> GetDescription();

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** GetName ******************/
		%feature("compactdefaultargs") GetName;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") GetName;
		opencascade::handle<TCollection_HAsciiString> GetName();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Into:
	:type Into: TDF_Attribute
	:param RT:
	:type RT: TDF_RelocationTable
	:rtype: None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param With:
	:type With: TDF_Attribute
	:rtype: None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param label:
	:type label: TDF_Label
	:param aName:
	:type aName: TCollection_HAsciiString
	:param aDescription:
	:type aDescription: TCollection_HAsciiString
	:param aDensity:
	:type aDensity: float
	:param aDensName:
	:type aDensName: TCollection_HAsciiString
	:param aDensValType:
	:type aDensValType: TCollection_HAsciiString
	:rtype: opencascade::handle<XCAFDoc_Material>
") Set;
		static opencascade::handle<XCAFDoc_Material> Set(const TDF_Label & label, const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription, const Standard_Real aDensity, const opencascade::handle<TCollection_HAsciiString> & aDensName, const opencascade::handle<TCollection_HAsciiString> & aDensValType);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param aName:
	:type aName: TCollection_HAsciiString
	:param aDescription:
	:type aDescription: TCollection_HAsciiString
	:param aDensity:
	:type aDensity: float
	:param aDensName:
	:type aDensName: TCollection_HAsciiString
	:param aDensValType:
	:type aDensValType: TCollection_HAsciiString
	:rtype: None
") Set;
		void Set(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription, const Standard_Real aDensity, const opencascade::handle<TCollection_HAsciiString> & aDensName, const opencascade::handle<TCollection_HAsciiString> & aDensValType);

		/****************** XCAFDoc_Material ******************/
		%feature("compactdefaultargs") XCAFDoc_Material;
		%feature("autodoc", "	:rtype: None
") XCAFDoc_Material;
		 XCAFDoc_Material();

};


%make_alias(XCAFDoc_Material)

%extend XCAFDoc_Material {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class XCAFDoc_MaterialTool *
*****************************/
class XCAFDoc_MaterialTool : public TDF_Attribute {
	public:
		/****************** AddMaterial ******************/
		%feature("compactdefaultargs") AddMaterial;
		%feature("autodoc", "Adds a material definition to a table and returns its label.

	:param aName:
	:type aName: TCollection_HAsciiString
	:param aDescription:
	:type aDescription: TCollection_HAsciiString
	:param aDensity:
	:type aDensity: float
	:param aDensName:
	:type aDensName: TCollection_HAsciiString
	:param aDensValType:
	:type aDensValType: TCollection_HAsciiString
	:rtype: TDF_Label
") AddMaterial;
		TDF_Label AddMaterial(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription, const Standard_Real aDensity, const opencascade::handle<TCollection_HAsciiString> & aDensName, const opencascade::handle<TCollection_HAsciiString> & aDensValType);

		/****************** BaseLabel ******************/
		%feature("compactdefaultargs") BaseLabel;
		%feature("autodoc", "Returns the label under which colors are stored.

	:rtype: TDF_Label
") BaseLabel;
		TDF_Label BaseLabel();

		/****************** GetDensityForShape ******************/
		%feature("compactdefaultargs") GetDensityForShape;
		%feature("autodoc", "Find referred material and return density from it if no material --> return 0.

	:param ShapeL:
	:type ShapeL: TDF_Label
	:rtype: float
") GetDensityForShape;
		static Standard_Real GetDensityForShape(const TDF_Label & ShapeL);

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** GetMaterial ******************/
		%feature("compactdefaultargs") GetMaterial;
		%feature("autodoc", "Returns material assigned to <matl> returns false if no such material is assigned.

	:param MatL:
	:type MatL: TDF_Label
	:param aName:
	:type aName: TCollection_HAsciiString
	:param aDescription:
	:type aDescription: TCollection_HAsciiString
	:param aDensity:
	:type aDensity: float
	:param aDensName:
	:type aDensName: TCollection_HAsciiString
	:param aDensValType:
	:type aDensValType: TCollection_HAsciiString
	:rtype: bool
") GetMaterial;
		Standard_Boolean GetMaterial(const TDF_Label & MatL, opencascade::handle<TCollection_HAsciiString> & aName, opencascade::handle<TCollection_HAsciiString> & aDescription, Standard_Real &OutValue, opencascade::handle<TCollection_HAsciiString> & aDensName, opencascade::handle<TCollection_HAsciiString> & aDensValType);

		/****************** GetMaterialLabels ******************/
		%feature("compactdefaultargs") GetMaterialLabels;
		%feature("autodoc", "Returns a sequence of materials currently stored in the material table.

	:param Labels:
	:type Labels: TDF_LabelSequence
	:rtype: None
") GetMaterialLabels;
		void GetMaterialLabels(TDF_LabelSequence & Labels);

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** IsMaterial ******************/
		%feature("compactdefaultargs") IsMaterial;
		%feature("autodoc", "Returns true if label belongs to a material table and is a material definition.

	:param lab:
	:type lab: TDF_Label
	:rtype: bool
") IsMaterial;
		Standard_Boolean IsMaterial(const TDF_Label & lab);

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param into:
	:type into: TDF_Attribute
	:param RT:
	:type RT: TDF_RelocationTable
	:rtype: None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param with:
	:type with: TDF_Attribute
	:rtype: None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & with);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Creates (if not exist) materialtool.

	:param L:
	:type L: TDF_Label
	:rtype: opencascade::handle<XCAFDoc_MaterialTool>
") Set;
		static opencascade::handle<XCAFDoc_MaterialTool> Set(const TDF_Label & L);

		/****************** SetMaterial ******************/
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "Sets a link with guid.

	:param L:
	:type L: TDF_Label
	:param MatL:
	:type MatL: TDF_Label
	:rtype: None
") SetMaterial;
		void SetMaterial(const TDF_Label & L, const TDF_Label & MatL);

		/****************** SetMaterial ******************/
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "Sets a link with guid adds a material as necessary.

	:param L:
	:type L: TDF_Label
	:param aName:
	:type aName: TCollection_HAsciiString
	:param aDescription:
	:type aDescription: TCollection_HAsciiString
	:param aDensity:
	:type aDensity: float
	:param aDensName:
	:type aDensName: TCollection_HAsciiString
	:param aDensValType:
	:type aDensValType: TCollection_HAsciiString
	:rtype: None
") SetMaterial;
		void SetMaterial(const TDF_Label & L, const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription, const Standard_Real aDensity, const opencascade::handle<TCollection_HAsciiString> & aDensName, const opencascade::handle<TCollection_HAsciiString> & aDensValType);

		/****************** ShapeTool ******************/
		%feature("compactdefaultargs") ShapeTool;
		%feature("autodoc", "Returns internal xcafdoc_shapetool tool.

	:rtype: opencascade::handle<XCAFDoc_ShapeTool>
") ShapeTool;
		const opencascade::handle<XCAFDoc_ShapeTool> & ShapeTool();

		/****************** XCAFDoc_MaterialTool ******************/
		%feature("compactdefaultargs") XCAFDoc_MaterialTool;
		%feature("autodoc", "	:rtype: None
") XCAFDoc_MaterialTool;
		 XCAFDoc_MaterialTool();

};


%make_alias(XCAFDoc_MaterialTool)

%extend XCAFDoc_MaterialTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class XCAFDoc_Note *
*********************/
%nodefaultctor XCAFDoc_Note;
class XCAFDoc_Note : public TDF_Attribute {
	public:

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** Get ******************/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Finds a reference attribute on the given label and returns it, if it is found.

	:param theLabel:
	:type theLabel: TDF_Label
	:rtype: opencascade::handle<XCAFDoc_Note>
") Get;
		static opencascade::handle<XCAFDoc_Note> Get(const TDF_Label & theLabel);

		/****************** GetObject ******************/
		%feature("compactdefaultargs") GetObject;
		%feature("autodoc", "Returns auxiliary data object.

	:rtype: opencascade::handle<XCAFNoteObjects_NoteObject>
") GetObject;
		opencascade::handle<XCAFNoteObjects_NoteObject> GetObject();

		/****************** IsMine ******************/
		%feature("compactdefaultargs") IsMine;
		%feature("autodoc", "Checks if the given label represents a note.

	:param theLabel:
	:type theLabel: TDF_Label
	:rtype: bool
") IsMine;
		static Standard_Boolean IsMine(const TDF_Label & theLabel);

		/****************** IsOrphan ******************/
		%feature("compactdefaultargs") IsOrphan;
		%feature("autodoc", "Checks if the note isn't linked to annotated items.

	:rtype: bool
") IsOrphan;
		Standard_Boolean IsOrphan();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theAttrInto:
	:type theAttrInto: TDF_Attribute
	:param theRT:
	:type theRT: TDF_RelocationTable
	:rtype: None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & theAttrInto, const opencascade::handle<TDF_RelocationTable> & theRT);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param theAttrFrom:
	:type theAttrFrom: TDF_Attribute
	:rtype: None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & theAttrFrom);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets the user name and the timestamp of the note. \param [in] theusername - the user associated with the note. \param [in] thetimestamp - timestamp of the note. eturn a handle to the attribute instance.

	:param theUserName:
	:type theUserName: TCollection_ExtendedString
	:param theTimeStamp:
	:type theTimeStamp: TCollection_ExtendedString
	:rtype: None
") Set;
		void Set(const TCollection_ExtendedString & theUserName, const TCollection_ExtendedString & theTimeStamp);

		/****************** SetObject ******************/
		%feature("compactdefaultargs") SetObject;
		%feature("autodoc", "Updates auxiliary data.

	:param theObject:
	:type theObject: XCAFNoteObjects_NoteObject
	:rtype: None
") SetObject;
		void SetObject(const opencascade::handle<XCAFNoteObjects_NoteObject> & theObject);

		/****************** TimeStamp ******************/
		%feature("compactdefaultargs") TimeStamp;
		%feature("autodoc", "Returns the timestamp of the note.

	:rtype: TCollection_ExtendedString
") TimeStamp;
		const TCollection_ExtendedString & TimeStamp();

		/****************** UserName ******************/
		%feature("compactdefaultargs") UserName;
		%feature("autodoc", "Returns the user name, who created the note.

	:rtype: TCollection_ExtendedString
") UserName;
		const TCollection_ExtendedString & UserName();

};


%make_alias(XCAFDoc_Note)

%extend XCAFDoc_Note {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class XCAFDoc_NotesTool *
**************************/
class XCAFDoc_NotesTool : public TDF_Attribute {
	public:
		/****************** AddNote ******************/
		%feature("compactdefaultargs") AddNote;
		%feature("autodoc", "Adds the given note to the assembly item. \param [in] thenotelabel - note label. \param [in] theitemid - assembly item id. eturn a handle to the assembly reference attribute.

	:param theNoteLabel:
	:type theNoteLabel: TDF_Label
	:param theItemId:
	:type theItemId: XCAFDoc_AssemblyItemId
	:rtype: opencascade::handle<XCAFDoc_AssemblyItemRef>
") AddNote;
		opencascade::handle<XCAFDoc_AssemblyItemRef> AddNote(const TDF_Label & theNoteLabel, const XCAFDoc_AssemblyItemId & theItemId);

		/****************** AddNote ******************/
		%feature("compactdefaultargs") AddNote;
		%feature("autodoc", "Adds the given note to the labeled item. \param [in] thenotelabel - note label. \param [in] theitemlabel - item label. eturn a handle to the assembly reference attribute.

	:param theNoteLabel:
	:type theNoteLabel: TDF_Label
	:param theItemLabel:
	:type theItemLabel: TDF_Label
	:rtype: opencascade::handle<XCAFDoc_AssemblyItemRef>
") AddNote;
		opencascade::handle<XCAFDoc_AssemblyItemRef> AddNote(const TDF_Label & theNoteLabel, const TDF_Label & theItemLabel);

		/****************** AddNoteToAttr ******************/
		%feature("compactdefaultargs") AddNoteToAttr;
		%feature("autodoc", "Adds the given note to the assembly item's attribute. \param [in] thenotelabel - note label. \param [in] theitemid - assembly item id. \param [in] theguid - assembly item's attribute guid. eturn a handle to the assembly reference attribute.

	:param theNoteLabel:
	:type theNoteLabel: TDF_Label
	:param theItemId:
	:type theItemId: XCAFDoc_AssemblyItemId
	:param theGUID:
	:type theGUID: Standard_GUID
	:rtype: opencascade::handle<XCAFDoc_AssemblyItemRef>
") AddNoteToAttr;
		opencascade::handle<XCAFDoc_AssemblyItemRef> AddNoteToAttr(const TDF_Label & theNoteLabel, const XCAFDoc_AssemblyItemId & theItemId, const Standard_GUID & theGUID);

		/****************** AddNoteToAttr ******************/
		%feature("compactdefaultargs") AddNoteToAttr;
		%feature("autodoc", "Adds the given note to the labeled item's attribute. \param [in] thenotelabel - note label. \param [in] theitemlabel - item label. \param [in] theguid - assembly item's attribute guid. eturn a handle to the assembly reference attribute.

	:param theNoteLabel:
	:type theNoteLabel: TDF_Label
	:param theItemLabel:
	:type theItemLabel: TDF_Label
	:param theGUID:
	:type theGUID: Standard_GUID
	:rtype: opencascade::handle<XCAFDoc_AssemblyItemRef>
") AddNoteToAttr;
		opencascade::handle<XCAFDoc_AssemblyItemRef> AddNoteToAttr(const TDF_Label & theNoteLabel, const TDF_Label & theItemLabel, const Standard_GUID & theGUID);

		/****************** AddNoteToSubshape ******************/
		%feature("compactdefaultargs") AddNoteToSubshape;
		%feature("autodoc", "Adds the given note to the assembly item's subshape. \param [in] thenotelabel - note label. \param [in] theitemid - assembly item id. \param [in] thesubshapeindex - assembly item's subshape index. eturn a handle to the assembly reference attribute.

	:param theNoteLabel:
	:type theNoteLabel: TDF_Label
	:param theItemId:
	:type theItemId: XCAFDoc_AssemblyItemId
	:param theSubshapeIndex:
	:type theSubshapeIndex: int
	:rtype: opencascade::handle<XCAFDoc_AssemblyItemRef>
") AddNoteToSubshape;
		opencascade::handle<XCAFDoc_AssemblyItemRef> AddNoteToSubshape(const TDF_Label & theNoteLabel, const XCAFDoc_AssemblyItemId & theItemId, Standard_Integer theSubshapeIndex);

		/****************** AddNoteToSubshape ******************/
		%feature("compactdefaultargs") AddNoteToSubshape;
		%feature("autodoc", "Adds the given note to the labeled item's subshape. \param [in] thenotelabel - note label. \param [in] theitemlabel - item label. \param [in] thesubshapeindex - assembly item's subshape index. eturn a handle to the assembly reference attribute.

	:param theNoteLabel:
	:type theNoteLabel: TDF_Label
	:param theItemLabel:
	:type theItemLabel: TDF_Label
	:param theSubshapeIndex:
	:type theSubshapeIndex: int
	:rtype: opencascade::handle<XCAFDoc_AssemblyItemRef>
") AddNoteToSubshape;
		opencascade::handle<XCAFDoc_AssemblyItemRef> AddNoteToSubshape(const TDF_Label & theNoteLabel, const TDF_Label & theItemLabel, Standard_Integer theSubshapeIndex);

		/****************** CreateBalloon ******************/
		%feature("compactdefaultargs") CreateBalloon;
		%feature("autodoc", "Create a new 'balloon' note. creates a new label under the notes hive and attaches ef xcafdoc_noteballoon attribute (derived ftom ef xcafdoc_note). \param [in] theusername - the user associated with the note. \param [in] thetimestamp - timestamp of the note. \param [in] thecomment - textual comment. eturn a handle to the base note attribute.

	:param theUserName:
	:type theUserName: TCollection_ExtendedString
	:param theTimeStamp:
	:type theTimeStamp: TCollection_ExtendedString
	:param theComment:
	:type theComment: TCollection_ExtendedString
	:rtype: opencascade::handle<XCAFDoc_Note>
") CreateBalloon;
		opencascade::handle<XCAFDoc_Note> CreateBalloon(const TCollection_ExtendedString & theUserName, const TCollection_ExtendedString & theTimeStamp, const TCollection_ExtendedString & theComment);

		/****************** CreateBinData ******************/
		%feature("compactdefaultargs") CreateBinData;
		%feature("autodoc", "Create a new note with data loaded from a binary file. creates a new label under the notes hive and attaches ef xcafdoc_notecomment attribute (derived ftom ef xcafdoc_note). \param [in] theusername - the user associated with the note. \param [in] thetimestamp - timestamp of the note. \param [in] thetitle - file title. \param [in] themimetype - mime type of the file. \param [in] thefile - input binary file. eturn a handle to the base note attribute.

	:param theUserName:
	:type theUserName: TCollection_ExtendedString
	:param theTimeStamp:
	:type theTimeStamp: TCollection_ExtendedString
	:param theTitle:
	:type theTitle: TCollection_ExtendedString
	:param theMIMEtype:
	:type theMIMEtype: TCollection_AsciiString
	:param theFile:
	:type theFile: OSD_File
	:rtype: opencascade::handle<XCAFDoc_Note>
") CreateBinData;
		opencascade::handle<XCAFDoc_Note> CreateBinData(const TCollection_ExtendedString & theUserName, const TCollection_ExtendedString & theTimeStamp, const TCollection_ExtendedString & theTitle, const TCollection_AsciiString & theMIMEtype, OSD_File & theFile);

		/****************** CreateBinData ******************/
		%feature("compactdefaultargs") CreateBinData;
		%feature("autodoc", "Create a new note with data loaded from a byte data array. creates a new label under the notes hive and attaches ef xcafdoc_notecomment attribute (derived ftom ef xcafdoc_note). \param [in] theusername - the user associated with the note. \param [in] thetimestamp - timestamp of the note. \param [in] thetitle - data title. \param [in] themimetype - mime type of the file. \param [in] thedata - byte data array. eturn a handle to the base note attribute.

	:param theUserName:
	:type theUserName: TCollection_ExtendedString
	:param theTimeStamp:
	:type theTimeStamp: TCollection_ExtendedString
	:param theTitle:
	:type theTitle: TCollection_ExtendedString
	:param theMIMEtype:
	:type theMIMEtype: TCollection_AsciiString
	:param theData:
	:type theData: TColStd_HArray1OfByte
	:rtype: opencascade::handle<XCAFDoc_Note>
") CreateBinData;
		opencascade::handle<XCAFDoc_Note> CreateBinData(const TCollection_ExtendedString & theUserName, const TCollection_ExtendedString & theTimeStamp, const TCollection_ExtendedString & theTitle, const TCollection_AsciiString & theMIMEtype, const opencascade::handle<TColStd_HArray1OfByte> & theData);

		/****************** CreateComment ******************/
		%feature("compactdefaultargs") CreateComment;
		%feature("autodoc", "Create a new comment note. creates a new label under the notes hive and attaches ef xcafdoc_notecomment attribute (derived ftom ef xcafdoc_note). \param [in] theusername - the user associated with the note. \param [in] thetimestamp - timestamp of the note. \param [in] thecomment - textual comment. eturn a handle to the base note attribute.

	:param theUserName:
	:type theUserName: TCollection_ExtendedString
	:param theTimeStamp:
	:type theTimeStamp: TCollection_ExtendedString
	:param theComment:
	:type theComment: TCollection_ExtendedString
	:rtype: opencascade::handle<XCAFDoc_Note>
") CreateComment;
		opencascade::handle<XCAFDoc_Note> CreateComment(const TCollection_ExtendedString & theUserName, const TCollection_ExtendedString & theTimeStamp, const TCollection_ExtendedString & theComment);

		/****************** DeleteAllNotes ******************/
		%feature("compactdefaultargs") DeleteAllNotes;
		%feature("autodoc", "Deletes all notes. clears all annotations. eturn number of deleted notes.

	:rtype: int
") DeleteAllNotes;
		Standard_Integer DeleteAllNotes();

		/****************** DeleteNote ******************/
		%feature("compactdefaultargs") DeleteNote;
		%feature("autodoc", "Deletes the given note. removes all links with items annotated by the note. \param [in] thenotelabel - note label. eturn true if the note is deleted, otherwise - false.

	:param theNoteLabel:
	:type theNoteLabel: TDF_Label
	:rtype: bool
") DeleteNote;
		Standard_Boolean DeleteNote(const TDF_Label & theNoteLabel);

		/****************** DeleteNotes ******************/
		%feature("compactdefaultargs") DeleteNotes;
		%feature("autodoc", "Deletes the given notes. removes all links with items annotated by the notes. \param [in] thenotelabels - note label sequence. eturn number of deleted notes.

	:param theNoteLabels:
	:type theNoteLabels: TDF_LabelSequence
	:rtype: int
") DeleteNotes;
		Standard_Integer DeleteNotes(TDF_LabelSequence & theNoteLabels);

		/****************** DeleteOrphanNotes ******************/
		%feature("compactdefaultargs") DeleteOrphanNotes;
		%feature("autodoc", "Deletes all notes that aren't linked to annotated items. eturn number of deleted notes.

	:rtype: int
") DeleteOrphanNotes;
		Standard_Integer DeleteOrphanNotes();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** FindAnnotatedItem ******************/
		%feature("compactdefaultargs") FindAnnotatedItem;
		%feature("autodoc", "Finds a label of the given assembly item id in the annotated items hive. \param [in] theitemid - assembly item id. eturn annotated item label if it is found, otherwise - null label.

	:param theItemId:
	:type theItemId: XCAFDoc_AssemblyItemId
	:rtype: TDF_Label
") FindAnnotatedItem;
		TDF_Label FindAnnotatedItem(const XCAFDoc_AssemblyItemId & theItemId);

		/****************** FindAnnotatedItem ******************/
		%feature("compactdefaultargs") FindAnnotatedItem;
		%feature("autodoc", "Finds a label of the given labeled item in the annotated items hive. \param [in] theitemlabel - item label. eturn annotated item label if it is found, otherwise - null label.

	:param theItemLabel:
	:type theItemLabel: TDF_Label
	:rtype: TDF_Label
") FindAnnotatedItem;
		TDF_Label FindAnnotatedItem(const TDF_Label & theItemLabel);

		/****************** FindAnnotatedItemAttr ******************/
		%feature("compactdefaultargs") FindAnnotatedItemAttr;
		%feature("autodoc", "Finds a label of the given assembly item's attribute in the annotated items hive. \param [in] theitemid - assembly item id. \param [in] theguid - assembly item's attribute guid. eturn annotated item label if it is found, otherwise - null label.

	:param theItemId:
	:type theItemId: XCAFDoc_AssemblyItemId
	:param theGUID:
	:type theGUID: Standard_GUID
	:rtype: TDF_Label
") FindAnnotatedItemAttr;
		TDF_Label FindAnnotatedItemAttr(const XCAFDoc_AssemblyItemId & theItemId, const Standard_GUID & theGUID);

		/****************** FindAnnotatedItemAttr ******************/
		%feature("compactdefaultargs") FindAnnotatedItemAttr;
		%feature("autodoc", "Finds a label of the given labeled item's attribute in the annotated items hive. \param [in] theitemlabel - item label. \param [in] theguid - item's attribute guid. eturn annotated item label if it is found, otherwise - null label.

	:param theItemLabel:
	:type theItemLabel: TDF_Label
	:param theGUID:
	:type theGUID: Standard_GUID
	:rtype: TDF_Label
") FindAnnotatedItemAttr;
		TDF_Label FindAnnotatedItemAttr(const TDF_Label & theItemLabel, const Standard_GUID & theGUID);

		/****************** FindAnnotatedItemSubshape ******************/
		%feature("compactdefaultargs") FindAnnotatedItemSubshape;
		%feature("autodoc", "Finds a label of the given assembly item's subshape in the annotated items hive. \param [in] theitemid - assembly item id. \param [in] thesubshapeindex - assembly item's subshape index. eturn annotated item label if it is found, otherwise - null label.

	:param theItemId:
	:type theItemId: XCAFDoc_AssemblyItemId
	:param theSubshapeIndex:
	:type theSubshapeIndex: int
	:rtype: TDF_Label
") FindAnnotatedItemSubshape;
		TDF_Label FindAnnotatedItemSubshape(const XCAFDoc_AssemblyItemId & theItemId, Standard_Integer theSubshapeIndex);

		/****************** FindAnnotatedItemSubshape ******************/
		%feature("compactdefaultargs") FindAnnotatedItemSubshape;
		%feature("autodoc", "Finds a label of the given labeled item's subshape in the annotated items hive. \param [in] theitemlabel - item label. \param [in] thesubshapeindex - labeled item's subshape index. eturn annotated item label if it is found, otherwise - null label.

	:param theItemLabel:
	:type theItemLabel: TDF_Label
	:param theSubshapeIndex:
	:type theSubshapeIndex: int
	:rtype: TDF_Label
") FindAnnotatedItemSubshape;
		TDF_Label FindAnnotatedItemSubshape(const TDF_Label & theItemLabel, Standard_Integer theSubshapeIndex);

		/****************** GetAnnotatedItems ******************/
		%feature("compactdefaultargs") GetAnnotatedItems;
		%feature("autodoc", "Returns all labels from the annotated items hive. the label sequence isn't cleared beforehand. \param [out] thenotelabels - sequence of labels.

	:param theLabels:
	:type theLabels: TDF_LabelSequence
	:rtype: None
") GetAnnotatedItems;
		void GetAnnotatedItems(TDF_LabelSequence & theLabels);

		/****************** GetAnnotatedItemsLabel ******************/
		%feature("compactdefaultargs") GetAnnotatedItemsLabel;
		%feature("autodoc", "Returns the label of the annotated items hive.

	:rtype: TDF_Label
") GetAnnotatedItemsLabel;
		TDF_Label GetAnnotatedItemsLabel();

		/****************** GetAttrNotes ******************/
		%feature("compactdefaultargs") GetAttrNotes;
		%feature("autodoc", "Gets all note labels of the assembly item's attribute. notes linked to the item itself or to item's subshapes aren't taken into account. the label sequence isn't cleared beforehand. \param [in] theitemid - assembly item id. \param [in] theguid - assembly item's attribute guid. \param [out] thenotelabels - sequence of labels. eturn number of added labels.

	:param theItemId:
	:type theItemId: XCAFDoc_AssemblyItemId
	:param theGUID:
	:type theGUID: Standard_GUID
	:param theNoteLabels:
	:type theNoteLabels: TDF_LabelSequence
	:rtype: int
") GetAttrNotes;
		Standard_Integer GetAttrNotes(const XCAFDoc_AssemblyItemId & theItemId, const Standard_GUID & theGUID, TDF_LabelSequence & theNoteLabels);

		/****************** GetAttrNotes ******************/
		%feature("compactdefaultargs") GetAttrNotes;
		%feature("autodoc", "Gets all note labels of the labeled item's attribute. notes linked to the item itself or to item's subshapes aren't taken into account. the label sequence isn't cleared beforehand. \param [in] theitemlabel - item label. \param [in] theguid - item's attribute guid. \param [out] thenotelabels - sequence of labels. eturn number of added labels.

	:param theItemLabel:
	:type theItemLabel: TDF_Label
	:param theGUID:
	:type theGUID: Standard_GUID
	:param theNoteLabels:
	:type theNoteLabels: TDF_LabelSequence
	:rtype: int
") GetAttrNotes;
		Standard_Integer GetAttrNotes(const TDF_Label & theItemLabel, const Standard_GUID & theGUID, TDF_LabelSequence & theNoteLabels);

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Returns default attribute guid.

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** GetNotes ******************/
		%feature("compactdefaultargs") GetNotes;
		%feature("autodoc", "Returns all labels from the notes hive. the label sequence isn't cleared beforehand. \param [out] thenotelabels - sequence of labels.

	:param theNoteLabels:
	:type theNoteLabels: TDF_LabelSequence
	:rtype: None
") GetNotes;
		void GetNotes(TDF_LabelSequence & theNoteLabels);

		/****************** GetNotes ******************/
		%feature("compactdefaultargs") GetNotes;
		%feature("autodoc", "Gets all note labels of the assembly item. notes linked to item's subshapes or attributes aren't taken into account. the label sequence isn't cleared beforehand. \param [in] theitemid - assembly item id. \param [out] thenotelabels - sequence of labels. eturn number of added labels.

	:param theItemId:
	:type theItemId: XCAFDoc_AssemblyItemId
	:param theNoteLabels:
	:type theNoteLabels: TDF_LabelSequence
	:rtype: int
") GetNotes;
		Standard_Integer GetNotes(const XCAFDoc_AssemblyItemId & theItemId, TDF_LabelSequence & theNoteLabels);

		/****************** GetNotes ******************/
		%feature("compactdefaultargs") GetNotes;
		%feature("autodoc", "Gets all note labels of the labeled item. notes linked to item's attributes aren't taken into account. the label sequence isn't cleared beforehand. \param [in] theitemlabel - item label. \param [out] thenotelabels - sequence of labels. eturn number of added labels.

	:param theItemLabel:
	:type theItemLabel: TDF_Label
	:param theNoteLabels:
	:type theNoteLabels: TDF_LabelSequence
	:rtype: int
") GetNotes;
		Standard_Integer GetNotes(const TDF_Label & theItemLabel, TDF_LabelSequence & theNoteLabels);

		/****************** GetNotesLabel ******************/
		%feature("compactdefaultargs") GetNotesLabel;
		%feature("autodoc", "Returns the label of the notes hive.

	:rtype: TDF_Label
") GetNotesLabel;
		TDF_Label GetNotesLabel();

		/****************** GetOrphanNotes ******************/
		%feature("compactdefaultargs") GetOrphanNotes;
		%feature("autodoc", "Returns note labels that aren't linked to annotated items. the label sequence isn't cleared beforehand. \param [out] thenotelabels - sequence of labels.

	:param theNoteLabels:
	:type theNoteLabels: TDF_LabelSequence
	:rtype: None
") GetOrphanNotes;
		void GetOrphanNotes(TDF_LabelSequence & theNoteLabels);

		/****************** GetSubshapeNotes ******************/
		%feature("compactdefaultargs") GetSubshapeNotes;
		%feature("autodoc", "Gets all note labels of the annotated item. notes linked to the item itself or to item's attributes taken into account. the label sequence isn't cleared beforehand. \param [in] theitemid - assembly item id. \param [in] thesubshapeindex - assembly item's subshape index. \param [out] thenotelabels - sequence of labels. eturn number of added labels.

	:param theItemId:
	:type theItemId: XCAFDoc_AssemblyItemId
	:param theSubshapeIndex:
	:type theSubshapeIndex: int
	:param theNoteLabels:
	:type theNoteLabels: TDF_LabelSequence
	:rtype: int
") GetSubshapeNotes;
		Standard_Integer GetSubshapeNotes(const XCAFDoc_AssemblyItemId & theItemId, Standard_Integer theSubshapeIndex, TDF_LabelSequence & theNoteLabels);

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** IsAnnotatedItem ******************/
		%feature("compactdefaultargs") IsAnnotatedItem;
		%feature("autodoc", "Checks if the given assembly item is annotated. \param [in] theitemid - assembly item id. eturn true if the item is annotated, otherwise - false.

	:param theItemId:
	:type theItemId: XCAFDoc_AssemblyItemId
	:rtype: bool
") IsAnnotatedItem;
		Standard_Boolean IsAnnotatedItem(const XCAFDoc_AssemblyItemId & theItemId);

		/****************** IsAnnotatedItem ******************/
		%feature("compactdefaultargs") IsAnnotatedItem;
		%feature("autodoc", "Checks if the given labeled item is annotated. \param [in] theitemlabel - item label. eturn true if the item is annotated, otherwise - false.

	:param theItemLabel:
	:type theItemLabel: TDF_Label
	:rtype: bool
") IsAnnotatedItem;
		Standard_Boolean IsAnnotatedItem(const TDF_Label & theItemLabel);

		/****************** NbAnnotatedItems ******************/
		%feature("compactdefaultargs") NbAnnotatedItems;
		%feature("autodoc", "Returns the number of labels in the annotated items hive.

	:rtype: int
") NbAnnotatedItems;
		Standard_Integer NbAnnotatedItems();

		/****************** NbNotes ******************/
		%feature("compactdefaultargs") NbNotes;
		%feature("autodoc", "Returns the number of labels in the notes hive.

	:rtype: int
") NbNotes;
		Standard_Integer NbNotes();

		/****************** NbOrphanNotes ******************/
		%feature("compactdefaultargs") NbOrphanNotes;
		%feature("autodoc", "Returns number of notes that aren't linked to annotated items.

	:rtype: int
") NbOrphanNotes;
		Standard_Integer NbOrphanNotes();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theAttrInto:
	:type theAttrInto: TDF_Attribute
	:param theRT:
	:type theRT: TDF_RelocationTable
	:rtype: None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & theAttrInto, const opencascade::handle<TDF_RelocationTable> & theRT);

		/****************** RemoveAllAttrNotes ******************/
		%feature("compactdefaultargs") RemoveAllAttrNotes;
		%feature("autodoc", "Removes all notes from the assembly item's attribute. \param [in] theitemid - assembly item id. \param [in] theguid - assembly item's attribute guid. \param [in] thedeliforphan - deletes removed notes from the notes  hive if there are no more annotated items  linked with the notes. eturn true if the notes are removed, otherwise - false.

	:param theItemId:
	:type theItemId: XCAFDoc_AssemblyItemId
	:param theGUID:
	:type theGUID: Standard_GUID
	:param theDelIfOrphan: default value is Standard_False
	:type theDelIfOrphan: bool
	:rtype: bool
") RemoveAllAttrNotes;
		Standard_Boolean RemoveAllAttrNotes(const XCAFDoc_AssemblyItemId & theItemId, const Standard_GUID & theGUID, Standard_Boolean theDelIfOrphan = Standard_False);

		/****************** RemoveAllAttrNotes ******************/
		%feature("compactdefaultargs") RemoveAllAttrNotes;
		%feature("autodoc", "Removes all notes from the labeled item's attribute. \param [in] theitemlabel - item label. \param [in] theguid - labeled item's attribute guid. \param [in] thedeliforphan - deletes removed notes from the notes  hive if there are no more annotated items  linked with the notes. eturn true if the notes are removed, otherwise - false.

	:param theItemLabel:
	:type theItemLabel: TDF_Label
	:param theGUID:
	:type theGUID: Standard_GUID
	:param theDelIfOrphan: default value is Standard_False
	:type theDelIfOrphan: bool
	:rtype: bool
") RemoveAllAttrNotes;
		Standard_Boolean RemoveAllAttrNotes(const TDF_Label & theItemLabel, const Standard_GUID & theGUID, Standard_Boolean theDelIfOrphan = Standard_False);

		/****************** RemoveAllNotes ******************/
		%feature("compactdefaultargs") RemoveAllNotes;
		%feature("autodoc", "Removes all notes from the assembly item. \param [in] theitemid - assembly item id. \param [in] thedeliforphan - deletes removed notes from the notes  hive if there are no more annotated items  linked with the notes. eturn true if the notes are removed, otherwise - false.

	:param theItemId:
	:type theItemId: XCAFDoc_AssemblyItemId
	:param theDelIfOrphan: default value is Standard_False
	:type theDelIfOrphan: bool
	:rtype: bool
") RemoveAllNotes;
		Standard_Boolean RemoveAllNotes(const XCAFDoc_AssemblyItemId & theItemId, Standard_Boolean theDelIfOrphan = Standard_False);

		/****************** RemoveAllNotes ******************/
		%feature("compactdefaultargs") RemoveAllNotes;
		%feature("autodoc", "Removes all notes from the labeled item. \param [in] theitemlabel - item label. \param [in] thedeliforphan - deletes removed notes from the notes  hive if there are no more annotated items  linked with the notes. eturn true if the notes are removed, otherwise - false.

	:param theItemLabel:
	:type theItemLabel: TDF_Label
	:param theDelIfOrphan: default value is Standard_False
	:type theDelIfOrphan: bool
	:rtype: bool
") RemoveAllNotes;
		Standard_Boolean RemoveAllNotes(const TDF_Label & theItemLabel, Standard_Boolean theDelIfOrphan = Standard_False);

		/****************** RemoveAllSubshapeNotes ******************/
		%feature("compactdefaultargs") RemoveAllSubshapeNotes;
		%feature("autodoc", "Removes all notes from the assembly item's subshape. \param [in] theitemid - assembly item id. \param [in] thesubshapeindex - assembly item's subshape index. \param [in] thedeliforphan - deletes removed notes from the notes  hive if there are no more annotated items  linked with the notes. eturn true if the notes are removed, otherwise - false.

	:param theItemId:
	:type theItemId: XCAFDoc_AssemblyItemId
	:param theSubshapeIndex:
	:type theSubshapeIndex: int
	:param theDelIfOrphan: default value is Standard_False
	:type theDelIfOrphan: bool
	:rtype: bool
") RemoveAllSubshapeNotes;
		Standard_Boolean RemoveAllSubshapeNotes(const XCAFDoc_AssemblyItemId & theItemId, Standard_Integer theSubshapeIndex, Standard_Boolean theDelIfOrphan = Standard_False);

		/****************** RemoveAttrNote ******************/
		%feature("compactdefaultargs") RemoveAttrNote;
		%feature("autodoc", "Removes a note from the assembly item's attribute. \param [in] thenotelabel - note label. \param [in] theitemid - assembly item id. \param [in] theguid - assembly item's attribute guid. \param [in] thedeliforphan - deletes the note from the notes hive  if there are no more assembly item's  attribute linked with the note. eturn true if the note is removed, otherwise - false.

	:param theNoteLabel:
	:type theNoteLabel: TDF_Label
	:param theItemId:
	:type theItemId: XCAFDoc_AssemblyItemId
	:param theGUID:
	:type theGUID: Standard_GUID
	:param theDelIfOrphan: default value is Standard_False
	:type theDelIfOrphan: bool
	:rtype: bool
") RemoveAttrNote;
		Standard_Boolean RemoveAttrNote(const TDF_Label & theNoteLabel, const XCAFDoc_AssemblyItemId & theItemId, const Standard_GUID & theGUID, Standard_Boolean theDelIfOrphan = Standard_False);

		/****************** RemoveAttrNote ******************/
		%feature("compactdefaultargs") RemoveAttrNote;
		%feature("autodoc", "Removes a note from the labeled item's attribute. \param [in] thenotelabel - note label. \param [in] theitemlabel - item label. \param [in] theguid - labeled item's attribute guid. \param [in] thedeliforphan - deletes the note from the notes hive  if there are no more assembly item's  attribute linked with the note. eturn true if the note is removed, otherwise - false.

	:param theNoteLabel:
	:type theNoteLabel: TDF_Label
	:param theItemLabel:
	:type theItemLabel: TDF_Label
	:param theGUID:
	:type theGUID: Standard_GUID
	:param theDelIfOrphan: default value is Standard_False
	:type theDelIfOrphan: bool
	:rtype: bool
") RemoveAttrNote;
		Standard_Boolean RemoveAttrNote(const TDF_Label & theNoteLabel, const TDF_Label & theItemLabel, const Standard_GUID & theGUID, Standard_Boolean theDelIfOrphan = Standard_False);

		/****************** RemoveNote ******************/
		%feature("compactdefaultargs") RemoveNote;
		%feature("autodoc", "Removes the given note from the assembly item. \param [in] thenotelabel - note label. \param [in] theitemid - assembly item id. \param [in] thedeliforphan - deletes the note from the notes hive  if there are no more assembly items  linked with the note. eturn true if the note is removed, otherwise - false.

	:param theNoteLabel:
	:type theNoteLabel: TDF_Label
	:param theItemId:
	:type theItemId: XCAFDoc_AssemblyItemId
	:param theDelIfOrphan: default value is Standard_False
	:type theDelIfOrphan: bool
	:rtype: bool
") RemoveNote;
		Standard_Boolean RemoveNote(const TDF_Label & theNoteLabel, const XCAFDoc_AssemblyItemId & theItemId, Standard_Boolean theDelIfOrphan = Standard_False);

		/****************** RemoveNote ******************/
		%feature("compactdefaultargs") RemoveNote;
		%feature("autodoc", "Removes the given note from the labeled item. \param [in] thenotelabel - note label. \param [in] theitemlabel - item label. \param [in] thedeliforphan - deletes the note from the notes hive  if there are no more labeled items  linked with the note. eturn true if the note is removed, otherwise - false.

	:param theNoteLabel:
	:type theNoteLabel: TDF_Label
	:param theItemLabel:
	:type theItemLabel: TDF_Label
	:param theDelIfOrphan: default value is Standard_False
	:type theDelIfOrphan: bool
	:rtype: bool
") RemoveNote;
		Standard_Boolean RemoveNote(const TDF_Label & theNoteLabel, const TDF_Label & theItemLabel, Standard_Boolean theDelIfOrphan = Standard_False);

		/****************** RemoveSubshapeNote ******************/
		%feature("compactdefaultargs") RemoveSubshapeNote;
		%feature("autodoc", "Removes the given note from the assembly item's subshape. \param [in] thenotelabel - note label. \param [in] theitemid - assembly item id. \param [in] thesubshapeindex - assembly item's subshape index. \param [in] thedeliforphan - deletes the note from the notes hive  if there are no more assembly item's  subshape linked with the note. eturn true if the note is removed, otherwise - false.

	:param theNoteLabel:
	:type theNoteLabel: TDF_Label
	:param theItemId:
	:type theItemId: XCAFDoc_AssemblyItemId
	:param theSubshapeIndex:
	:type theSubshapeIndex: int
	:param theDelIfOrphan: default value is Standard_False
	:type theDelIfOrphan: bool
	:rtype: bool
") RemoveSubshapeNote;
		Standard_Boolean RemoveSubshapeNote(const TDF_Label & theNoteLabel, const XCAFDoc_AssemblyItemId & theItemId, Standard_Integer theSubshapeIndex, Standard_Boolean theDelIfOrphan = Standard_False);

		/****************** RemoveSubshapeNote ******************/
		%feature("compactdefaultargs") RemoveSubshapeNote;
		%feature("autodoc", "Removes the given note from the labeled item's subshape. \param [in] thenotelabel - note label. \param [in] theitemlabel - item label. \param [in] thesubshapeindex - labeled item's subshape index. \param [in] thedeliforphan - deletes the note from the notes hive  if there are no more assembly item's  subshape linked with the note. eturn true if the note is removed, otherwise - false.

	:param theNoteLabel:
	:type theNoteLabel: TDF_Label
	:param theItemLabel:
	:type theItemLabel: TDF_Label
	:param theSubshapeIndex:
	:type theSubshapeIndex: int
	:param theDelIfOrphan: default value is Standard_False
	:type theDelIfOrphan: bool
	:rtype: bool
") RemoveSubshapeNote;
		Standard_Boolean RemoveSubshapeNote(const TDF_Label & theNoteLabel, const TDF_Label & theItemLabel, Standard_Integer theSubshapeIndex, Standard_Boolean theDelIfOrphan = Standard_False);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param theAttrFrom:
	:type theAttrFrom: TDF_Attribute
	:rtype: None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & theAttrFrom);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Create (if not exist) a notes tool from xcafdoc on thelabel.

	:param theLabel:
	:type theLabel: TDF_Label
	:rtype: opencascade::handle<XCAFDoc_NotesTool>
") Set;
		static opencascade::handle<XCAFDoc_NotesTool> Set(const TDF_Label & theLabel);

		/****************** XCAFDoc_NotesTool ******************/
		%feature("compactdefaultargs") XCAFDoc_NotesTool;
		%feature("autodoc", "Creates an empty notes tool.

	:rtype: None
") XCAFDoc_NotesTool;
		 XCAFDoc_NotesTool();

};


%make_alias(XCAFDoc_NotesTool)

%extend XCAFDoc_NotesTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class XCAFDoc_ShapeMapTool *
*****************************/
class XCAFDoc_ShapeMapTool : public TDF_Attribute {
	public:
		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** GetMap ******************/
		%feature("compactdefaultargs") GetMap;
		%feature("autodoc", "	:rtype: TopTools_IndexedMapOfShape
") GetMap;
		const TopTools_IndexedMapOfShape & GetMap();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** IsSubShape ******************/
		%feature("compactdefaultargs") IsSubShape;
		%feature("autodoc", "Checks whether shape <sub> is subshape of shape stored on label shapel.

	:param sub:
	:type sub: TopoDS_Shape
	:rtype: bool
") IsSubShape;
		Standard_Boolean IsSubShape(const TopoDS_Shape & sub);

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param into:
	:type into: TDF_Attribute
	:param RT:
	:type RT: TDF_RelocationTable
	:rtype: None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param with:
	:type with: TDF_Attribute
	:rtype: None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & with);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Create (if not exist) shapetool from xcafdoc on <l>.

	:param L:
	:type L: TDF_Label
	:rtype: opencascade::handle<XCAFDoc_ShapeMapTool>
") Set;
		static opencascade::handle<XCAFDoc_ShapeMapTool> Set(const TDF_Label & L);

		/****************** SetShape ******************/
		%feature("compactdefaultargs") SetShape;
		%feature("autodoc", "Sets representation (topods_shape) for top-level shape.

	:param S:
	:type S: TopoDS_Shape
	:rtype: None
") SetShape;
		void SetShape(const TopoDS_Shape & S);

		/****************** XCAFDoc_ShapeMapTool ******************/
		%feature("compactdefaultargs") XCAFDoc_ShapeMapTool;
		%feature("autodoc", "Creates an empty tool.

	:rtype: None
") XCAFDoc_ShapeMapTool;
		 XCAFDoc_ShapeMapTool();

};


%make_alias(XCAFDoc_ShapeMapTool)

%extend XCAFDoc_ShapeMapTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class XCAFDoc_ShapeTool *
**************************/
class XCAFDoc_ShapeTool : public TDF_Attribute {
	public:
		/****************** AddComponent ******************/
		%feature("compactdefaultargs") AddComponent;
		%feature("autodoc", "Adds a component given by its label and location to the assembly note: assembly must be isassembly() or issimpleshape().

	:param assembly:
	:type assembly: TDF_Label
	:param comp:
	:type comp: TDF_Label
	:param Loc:
	:type Loc: TopLoc_Location
	:rtype: TDF_Label
") AddComponent;
		TDF_Label AddComponent(const TDF_Label & assembly, const TDF_Label & comp, const TopLoc_Location & Loc);

		/****************** AddComponent ******************/
		%feature("compactdefaultargs") AddComponent;
		%feature("autodoc", "Adds a shape (located) as a component to the assembly if necessary, creates an additional top-level shape for component and return the label of component. if expand is true and component is compound, it will be created as assembly also note: assembly must be isassembly() or issimpleshape().

	:param assembly:
	:type assembly: TDF_Label
	:param comp:
	:type comp: TopoDS_Shape
	:param expand: default value is Standard_False
	:type expand: bool
	:rtype: TDF_Label
") AddComponent;
		TDF_Label AddComponent(const TDF_Label & assembly, const TopoDS_Shape & comp, const Standard_Boolean expand = Standard_False);

		/****************** AddShape ******************/
		%feature("compactdefaultargs") AddShape;
		%feature("autodoc", "Adds a new top-level (creates and returns a new label) if makeassembly is true, treats topabs_compound shapes as assemblies (creates assembly structure). note: <makeprepare> replace components without location in assmebly by located components to avoid some problems. if autonaming() is true then automatically attaches names.

	:param S:
	:type S: TopoDS_Shape
	:param makeAssembly: default value is Standard_True
	:type makeAssembly: bool
	:param makePrepare: default value is Standard_True
	:type makePrepare: bool
	:rtype: TDF_Label
") AddShape;
		TDF_Label AddShape(const TopoDS_Shape & S, const Standard_Boolean makeAssembly = Standard_True, const Standard_Boolean makePrepare = Standard_True);

		/****************** AddSubShape ******************/
		%feature("compactdefaultargs") AddSubShape;
		%feature("autodoc", "Adds a label for subshape <sub> of shape stored on label shapel returns null label if it is not subshape.

	:param shapeL:
	:type shapeL: TDF_Label
	:param sub:
	:type sub: TopoDS_Shape
	:rtype: TDF_Label
") AddSubShape;
		TDF_Label AddSubShape(const TDF_Label & shapeL, const TopoDS_Shape & sub);

		/****************** AddSubShape ******************/
		%feature("compactdefaultargs") AddSubShape;
		%feature("autodoc", "Adds (of finds already existed) a label for subshape <sub> of shape stored on label shapel. label addedsubshapel returns added (found) label or empty in case of wrong subshape. returns true, if new shape was added, false in case of already existed subshape/wrong subshape.

	:param shapeL:
	:type shapeL: TDF_Label
	:param sub:
	:type sub: TopoDS_Shape
	:param addedSubShapeL:
	:type addedSubShapeL: TDF_Label
	:rtype: bool
") AddSubShape;
		Standard_Boolean AddSubShape(const TDF_Label & shapeL, const TopoDS_Shape & sub, TDF_Label & addedSubShapeL);

		/****************** AutoNaming ******************/
		%feature("compactdefaultargs") AutoNaming;
		%feature("autodoc", "Returns current auto-naming mode. see setautonaming() for description.

	:rtype: bool
") AutoNaming;
		static Standard_Boolean AutoNaming();

		/****************** BaseLabel ******************/
		%feature("compactdefaultargs") BaseLabel;
		%feature("autodoc", "Returns the label under which shapes are stored.

	:rtype: TDF_Label
") BaseLabel;
		TDF_Label BaseLabel();

		/****************** ComputeShapes ******************/
		%feature("compactdefaultargs") ComputeShapes;
		%feature("autodoc", "Recursive.

	:param L:
	:type L: TDF_Label
	:rtype: None
") ComputeShapes;
		void ComputeShapes(const TDF_Label & L);

		/****************** ComputeSimpleShapes ******************/
		%feature("compactdefaultargs") ComputeSimpleShapes;
		%feature("autodoc", "Compute a sequence of simple shapes.

	:rtype: None
") ComputeSimpleShapes;
		void ComputeSimpleShapes();

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	:param theDumpLog:
	:type theDumpLog: Standard_OStream
	:param deep:
	:type deep: bool
	:rtype: Standard_OStream
") Dump;
		Standard_OStream & Dump(Standard_OStream & theDumpLog, const Standard_Boolean deep);


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** DumpShape ******************/
		%feature("compactdefaultargs") DumpShape;
		%feature("autodoc", "Print to std::ostream <thedumplog> type of shape found on <l> label and the entry of <l>, with <level> tabs before. if <deep>, print also tshape and location addresses.

	:param theDumpLog:
	:type theDumpLog: Standard_OStream
	:param L:
	:type L: TDF_Label
	:param level: default value is 0
	:type level: int
	:param deep: default value is Standard_False
	:type deep: bool
	:rtype: None
") DumpShape;
		static void DumpShape(Standard_OStream & theDumpLog, const TDF_Label & L, const Standard_Integer level = 0, const Standard_Boolean deep = Standard_False);

		/****************** Expand ******************/
		%feature("compactdefaultargs") Expand;
		%feature("autodoc", "Convert shape (compound/compsolid/shell/wire) to assembly.

	:param Shape:
	:type Shape: TDF_Label
	:rtype: bool
") Expand;
		Standard_Boolean Expand(const TDF_Label & Shape);

		/****************** FindComponent ******************/
		%feature("compactdefaultargs") FindComponent;
		%feature("autodoc", "Serach the path of labels in the document, that corresponds the component from any assembly try to search the sequence of labels with location that produce this shape as component of any assembly note: clear sequence of labels before filling.

	:param theShape:
	:type theShape: TopoDS_Shape
	:param Labels:
	:type Labels: TDF_LabelSequence
	:rtype: bool
") FindComponent;
		Standard_Boolean FindComponent(const TopoDS_Shape & theShape, TDF_LabelSequence & Labels);

		/****************** FindMainShape ******************/
		%feature("compactdefaultargs") FindMainShape;
		%feature("autodoc", "Performs a search among top-level shapes to find the shape containing <sub> as subshape checks only simple shapes, and returns the first found label (which should be the only one for valid model).

	:param sub:
	:type sub: TopoDS_Shape
	:rtype: TDF_Label
") FindMainShape;
		TDF_Label FindMainShape(const TopoDS_Shape & sub);

		/****************** FindMainShapeUsingMap ******************/
		%feature("compactdefaultargs") FindMainShapeUsingMap;
		%feature("autodoc", "	:param sub:
	:type sub: TopoDS_Shape
	:rtype: TDF_Label
") FindMainShapeUsingMap;
		TDF_Label FindMainShapeUsingMap(const TopoDS_Shape & sub);

		/****************** FindSHUO ******************/
		%feature("compactdefaultargs") FindSHUO;
		%feature("autodoc", "Searchs the shuo by labels of components from upper_usage componet to next_usage returns null attribute if no shuo found.

	:param Labels:
	:type Labels: TDF_LabelSequence
	:param theSHUOAttr:
	:type theSHUOAttr: XCAFDoc_GraphNode
	:rtype: bool
") FindSHUO;
		static Standard_Boolean FindSHUO(const TDF_LabelSequence & Labels, opencascade::handle<XCAFDoc_GraphNode> & theSHUOAttr);

		/****************** FindShape ******************/
		%feature("compactdefaultargs") FindShape;
		%feature("autodoc", "Returns the label corresponding to shape s (searches among top-level shapes, not including subcomponents of assemblies and subshapes) if findinstance is false (default), seach for the input shape without location if findinstance is true, searches for the input shape as is. return true if <s> is found.

	:param S:
	:type S: TopoDS_Shape
	:param L:
	:type L: TDF_Label
	:param findInstance: default value is Standard_False
	:type findInstance: bool
	:rtype: bool
") FindShape;
		Standard_Boolean FindShape(const TopoDS_Shape & S, TDF_Label & L, const Standard_Boolean findInstance = Standard_False);

		/****************** FindShape ******************/
		%feature("compactdefaultargs") FindShape;
		%feature("autodoc", "Does the same as previous method returns null label if not found.

	:param S:
	:type S: TopoDS_Shape
	:param findInstance: default value is Standard_False
	:type findInstance: bool
	:rtype: TDF_Label
") FindShape;
		TDF_Label FindShape(const TopoDS_Shape & S, const Standard_Boolean findInstance = Standard_False);

		/****************** FindSubShape ******************/
		%feature("compactdefaultargs") FindSubShape;
		%feature("autodoc", "Finds a label for subshape <sub> of shape stored on label shapel returns null label if it is not found.

	:param shapeL:
	:type shapeL: TDF_Label
	:param sub:
	:type sub: TopoDS_Shape
	:param L:
	:type L: TDF_Label
	:rtype: bool
") FindSubShape;
		Standard_Boolean FindSubShape(const TDF_Label & shapeL, const TopoDS_Shape & sub, TDF_Label & L);

		/****************** GetAllComponentSHUO ******************/
		%feature("compactdefaultargs") GetAllComponentSHUO;
		%feature("autodoc", "Returns founded shuo graphnodes of indicated component returns false in other case.

	:param CompLabel:
	:type CompLabel: TDF_Label
	:param SHUOAttrs:
	:type SHUOAttrs: TDF_AttributeSequence
	:rtype: bool
") GetAllComponentSHUO;
		static Standard_Boolean GetAllComponentSHUO(const TDF_Label & CompLabel, TDF_AttributeSequence & SHUOAttrs);

		/****************** GetAllSHUOInstances ******************/
		%feature("compactdefaultargs") GetAllSHUOInstances;
		%feature("autodoc", "Seaching for component shapes that styled by shuo returns empty sequence of shape if no any shape is found.

	:param theSHUO:
	:type theSHUO: XCAFDoc_GraphNode
	:param theSHUOShapeSeq:
	:type theSHUOShapeSeq: TopTools_SequenceOfShape
	:rtype: bool
") GetAllSHUOInstances;
		Standard_Boolean GetAllSHUOInstances(const opencascade::handle<XCAFDoc_GraphNode> & theSHUO, TopTools_SequenceOfShape & theSHUOShapeSeq);

		/****************** GetComponents ******************/
		%feature("compactdefaultargs") GetComponents;
		%feature("autodoc", "Returns list of components of assembly returns false if label is not assembly.

	:param L:
	:type L: TDF_Label
	:param Labels:
	:type Labels: TDF_LabelSequence
	:param getsubchilds: default value is Standard_False
	:type getsubchilds: bool
	:rtype: bool
") GetComponents;
		static Standard_Boolean GetComponents(const TDF_Label & L, TDF_LabelSequence & Labels, const Standard_Boolean getsubchilds = Standard_False);

		/****************** GetExternRefs ******************/
		%feature("compactdefaultargs") GetExternRefs;
		%feature("autodoc", "Gets the names of references on the no-step files.

	:param L:
	:type L: TDF_Label
	:param SHAS:
	:type SHAS: TColStd_SequenceOfHAsciiString
	:rtype: None
") GetExternRefs;
		static void GetExternRefs(const TDF_Label & L, TColStd_SequenceOfHAsciiString & SHAS);

		/****************** GetFreeShapes ******************/
		%feature("compactdefaultargs") GetFreeShapes;
		%feature("autodoc", "Returns a sequence of all top-level shapes which are free (i.e. not referred by any other).

	:param FreeLabels:
	:type FreeLabels: TDF_LabelSequence
	:rtype: None
") GetFreeShapes;
		void GetFreeShapes(TDF_LabelSequence & FreeLabels);

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** GetLocation ******************/
		%feature("compactdefaultargs") GetLocation;
		%feature("autodoc", "Returns location of instance.

	:param L:
	:type L: TDF_Label
	:rtype: TopLoc_Location
") GetLocation;
		static TopLoc_Location GetLocation(const TDF_Label & L);

		/****************** GetNamedProperties ******************/
		%feature("compactdefaultargs") GetNamedProperties;
		%feature("autodoc", "Method to get nameddata attribute assigned to the given shape label. @param thelabel [in] the shape label @param thetocreate [in] create and assign attribute if it doesn't exist returns handle to the nameddata attribute or null if there is none.

	:param theLabel:
	:type theLabel: TDF_Label
	:param theToCreate: default value is Standard_False
	:type theToCreate: bool
	:rtype: opencascade::handle<TDataStd_NamedData>
") GetNamedProperties;
		opencascade::handle<TDataStd_NamedData> GetNamedProperties(const TDF_Label & theLabel, const Standard_Boolean theToCreate = Standard_False);

		/****************** GetNamedProperties ******************/
		%feature("compactdefaultargs") GetNamedProperties;
		%feature("autodoc", "Method to get nameddata attribute assigned to a label of the given shape. @param theshape [in] input shape @param thetocreate [in] create and assign attribute if it doesn't exist returns handle to the nameddata attribute or null if there is none.

	:param theShape:
	:type theShape: TopoDS_Shape
	:param theToCreate: default value is Standard_False
	:type theToCreate: bool
	:rtype: opencascade::handle<TDataStd_NamedData>
") GetNamedProperties;
		opencascade::handle<TDataStd_NamedData> GetNamedProperties(const TopoDS_Shape & theShape, const Standard_Boolean theToCreate = Standard_False);

		/****************** GetReferredShape ******************/
		%feature("compactdefaultargs") GetReferredShape;
		%feature("autodoc", "Returns label which corresponds to a shape referred by l returns false if label is not reference.

	:param L:
	:type L: TDF_Label
	:param Label:
	:type Label: TDF_Label
	:rtype: bool
") GetReferredShape;
		static Standard_Boolean GetReferredShape(const TDF_Label & L, TDF_Label & Label);

		/****************** GetSHUO ******************/
		%feature("compactdefaultargs") GetSHUO;
		%feature("autodoc", "Returns founded shuo graphnode attribute <ashuoattr> returns false in other case.

	:param SHUOLabel:
	:type SHUOLabel: TDF_Label
	:param aSHUOAttr:
	:type aSHUOAttr: XCAFDoc_GraphNode
	:rtype: bool
") GetSHUO;
		static Standard_Boolean GetSHUO(const TDF_Label & SHUOLabel, opencascade::handle<XCAFDoc_GraphNode> & aSHUOAttr);

		/****************** GetSHUOInstance ******************/
		%feature("compactdefaultargs") GetSHUOInstance;
		%feature("autodoc", "Search for the component shape that styled by shuo returns null shape if no any shape is found.

	:param theSHUO:
	:type theSHUO: XCAFDoc_GraphNode
	:rtype: TopoDS_Shape
") GetSHUOInstance;
		TopoDS_Shape GetSHUOInstance(const opencascade::handle<XCAFDoc_GraphNode> & theSHUO);

		/****************** GetSHUONextUsage ******************/
		%feature("compactdefaultargs") GetSHUONextUsage;
		%feature("autodoc", "Returns the sequence of labels of shuo attributes, which is next_usage for this upper_usage shuo attribute (that indicated by label) note: returns next_usages only on one level (not recurse) note: do not clear the sequence before filling.

	:param UpperUsageL:
	:type UpperUsageL: TDF_Label
	:param Labels:
	:type Labels: TDF_LabelSequence
	:rtype: bool
") GetSHUONextUsage;
		static Standard_Boolean GetSHUONextUsage(const TDF_Label & UpperUsageL, TDF_LabelSequence & Labels);

		/****************** GetSHUOUpperUsage ******************/
		%feature("compactdefaultargs") GetSHUOUpperUsage;
		%feature("autodoc", "Returns the sequence of labels of shuo attributes, which is upper_usage for this next_usage shuo attribute (that indicated by label) note: returns upper_usages only on one level (not recurse) note: do not clear the sequence before filling.

	:param NextUsageL:
	:type NextUsageL: TDF_Label
	:param Labels:
	:type Labels: TDF_LabelSequence
	:rtype: bool
") GetSHUOUpperUsage;
		static Standard_Boolean GetSHUOUpperUsage(const TDF_Label & NextUsageL, TDF_LabelSequence & Labels);

		/****************** GetShape ******************/
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "To get topods_shape from shape's label for component, returns new shape with correct location returns false if label does not contain shape.

	:param L:
	:type L: TDF_Label
	:param S:
	:type S: TopoDS_Shape
	:rtype: bool
") GetShape;
		static Standard_Boolean GetShape(const TDF_Label & L, TopoDS_Shape & S);

		/****************** GetShape ******************/
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "To get topods_shape from shape's label for component, returns new shape with correct location returns null shape if label does not contain shape.

	:param L:
	:type L: TDF_Label
	:rtype: TopoDS_Shape
") GetShape;
		static TopoDS_Shape GetShape(const TDF_Label & L);

		/****************** GetShapes ******************/
		%feature("compactdefaultargs") GetShapes;
		%feature("autodoc", "Returns a sequence of all top-level shapes.

	:param Labels:
	:type Labels: TDF_LabelSequence
	:rtype: None
") GetShapes;
		void GetShapes(TDF_LabelSequence & Labels);

		/****************** GetSubShapes ******************/
		%feature("compactdefaultargs") GetSubShapes;
		%feature("autodoc", "Returns list of labels identifying subshapes of the given shape returns false if no subshapes are placed on that label.

	:param L:
	:type L: TDF_Label
	:param Labels:
	:type Labels: TDF_LabelSequence
	:rtype: bool
") GetSubShapes;
		static Standard_Boolean GetSubShapes(const TDF_Label & L, TDF_LabelSequence & Labels);

		/****************** GetUsers ******************/
		%feature("compactdefaultargs") GetUsers;
		%feature("autodoc", "Returns list of labels which refer shape l as component returns number of users (0 if shape is free).

	:param L:
	:type L: TDF_Label
	:param Labels:
	:type Labels: TDF_LabelSequence
	:param getsubchilds: default value is Standard_False
	:type getsubchilds: bool
	:rtype: int
") GetUsers;
		static Standard_Integer GetUsers(const TDF_Label & L, TDF_LabelSequence & Labels, const Standard_Boolean getsubchilds = Standard_False);

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Set hascomponents into false.

	:rtype: None
") Init;
		void Init();

		/****************** IsAssembly ******************/
		%feature("compactdefaultargs") IsAssembly;
		%feature("autodoc", "Returns true if the label is a label of assembly, i.e. contains sublabels which are assembly components this is relevant only if isshape() is true.

	:param L:
	:type L: TDF_Label
	:rtype: bool
") IsAssembly;
		static Standard_Boolean IsAssembly(const TDF_Label & L);

		/****************** IsComponent ******************/
		%feature("compactdefaultargs") IsComponent;
		%feature("autodoc", "Return true if <l> is reference serving as component of assembly.

	:param L:
	:type L: TDF_Label
	:rtype: bool
") IsComponent;
		static Standard_Boolean IsComponent(const TDF_Label & L);

		/****************** IsCompound ******************/
		%feature("compactdefaultargs") IsCompound;
		%feature("autodoc", "Returns true if the label is a label of compound, i.e. contains some sublabels this is relevant only if isshape() is true.

	:param L:
	:type L: TDF_Label
	:rtype: bool
") IsCompound;
		static Standard_Boolean IsCompound(const TDF_Label & L);

		/****************** IsExternRef ******************/
		%feature("compactdefaultargs") IsExternRef;
		%feature("autodoc", "Returns true if the label is a label of external references, i.e. there are some reference on the no-step files, which are described in document only their names.

	:param L:
	:type L: TDF_Label
	:rtype: bool
") IsExternRef;
		static Standard_Boolean IsExternRef(const TDF_Label & L);

		/****************** IsFree ******************/
		%feature("compactdefaultargs") IsFree;
		%feature("autodoc", "Returns true if the label is not used by any assembly, i.e. contains sublabels which are assembly components this is relevant only if isshape() is true (there is no father treenode on this <l>).

	:param L:
	:type L: TDF_Label
	:rtype: bool
") IsFree;
		static Standard_Boolean IsFree(const TDF_Label & L);

		/****************** IsReference ******************/
		%feature("compactdefaultargs") IsReference;
		%feature("autodoc", "Return true if <l> is a located instance of other shape i.e. reference.

	:param L:
	:type L: TDF_Label
	:rtype: bool
") IsReference;
		static Standard_Boolean IsReference(const TDF_Label & L);

		/****************** IsShape ******************/
		%feature("compactdefaultargs") IsShape;
		%feature("autodoc", "Returns true if the label represents a shape (simple shape, assembly or reference).

	:param L:
	:type L: TDF_Label
	:rtype: bool
") IsShape;
		static Standard_Boolean IsShape(const TDF_Label & L);

		/****************** IsSimpleShape ******************/
		%feature("compactdefaultargs") IsSimpleShape;
		%feature("autodoc", "Returns true if the label is a label of simple shape.

	:param L:
	:type L: TDF_Label
	:rtype: bool
") IsSimpleShape;
		static Standard_Boolean IsSimpleShape(const TDF_Label & L);

		/****************** IsSubShape ******************/
		%feature("compactdefaultargs") IsSubShape;
		%feature("autodoc", "Return true if <l> is subshape of the top-level shape.

	:param L:
	:type L: TDF_Label
	:rtype: bool
") IsSubShape;
		static Standard_Boolean IsSubShape(const TDF_Label & L);

		/****************** IsSubShape ******************/
		%feature("compactdefaultargs") IsSubShape;
		%feature("autodoc", "Checks whether shape <sub> is subshape of shape stored on label shapel.

	:param shapeL:
	:type shapeL: TDF_Label
	:param sub:
	:type sub: TopoDS_Shape
	:rtype: bool
") IsSubShape;
		Standard_Boolean IsSubShape(const TDF_Label & shapeL, const TopoDS_Shape & sub);

		/****************** IsTopLevel ******************/
		%feature("compactdefaultargs") IsTopLevel;
		%feature("autodoc", "Returns true if the label is a label of top-level shape, as opposed to component of assembly or subshape.

	:param L:
	:type L: TDF_Label
	:rtype: bool
") IsTopLevel;
		Standard_Boolean IsTopLevel(const TDF_Label & L);

		/****************** NbComponents ******************/
		%feature("compactdefaultargs") NbComponents;
		%feature("autodoc", "Returns number of assembles components.

	:param L:
	:type L: TDF_Label
	:param getsubchilds: default value is Standard_False
	:type getsubchilds: bool
	:rtype: int
") NbComponents;
		static Standard_Integer NbComponents(const TDF_Label & L, const Standard_Boolean getsubchilds = Standard_False);

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** NewShape ******************/
		%feature("compactdefaultargs") NewShape;
		%feature("autodoc", "Creates new (empty) top-level shape. initially it holds empty topods_compound.

	:rtype: TDF_Label
") NewShape;
		TDF_Label NewShape();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param into:
	:type into: TDF_Attribute
	:param RT:
	:type RT: TDF_RelocationTable
	:rtype: None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** RemoveComponent ******************/
		%feature("compactdefaultargs") RemoveComponent;
		%feature("autodoc", "Removes a component from its assembly.

	:param comp:
	:type comp: TDF_Label
	:rtype: None
") RemoveComponent;
		void RemoveComponent(const TDF_Label & comp);

		/****************** RemoveSHUO ******************/
		%feature("compactdefaultargs") RemoveSHUO;
		%feature("autodoc", "Remove shuo from component sublabel, remove all dependencies on other shuo. returns false if cannot remove shuo dependencies. note: remove any styles that associated with this shuo.

	:param SHUOLabel:
	:type SHUOLabel: TDF_Label
	:rtype: bool
") RemoveSHUO;
		Standard_Boolean RemoveSHUO(const TDF_Label & SHUOLabel);

		/****************** RemoveShape ******************/
		%feature("compactdefaultargs") RemoveShape;
		%feature("autodoc", "Removes shape (whole label and all its sublabels) if removecompletely is true, removes complete shape if removecompletely is false, removes instance(location) only returns false (and does nothing) if shape is not free or is not top-level shape.

	:param L:
	:type L: TDF_Label
	:param removeCompletely: default value is Standard_True
	:type removeCompletely: bool
	:rtype: bool
") RemoveShape;
		Standard_Boolean RemoveShape(const TDF_Label & L, const Standard_Boolean removeCompletely = Standard_True);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param with:
	:type with: TDF_Attribute
	:rtype: None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & with);

		/****************** Search ******************/
		%feature("compactdefaultargs") Search;
		%feature("autodoc", "General tool to find a (sub) shape in the document * if findinstance is true, and s has a non-null location, first tries to find the shape among the top-level shapes with this location * if not found, and findcomponent is true, tries to find the shape among the components of assemblies * if not found, tries to find the shape without location among top-level shapes * if not found and findsubshape is true, tries to find a shape as a subshape of top-level simple shapes returns false if nothing is found.

	:param S:
	:type S: TopoDS_Shape
	:param L:
	:type L: TDF_Label
	:param findInstance: default value is Standard_True
	:type findInstance: bool
	:param findComponent: default value is Standard_True
	:type findComponent: bool
	:param findSubshape: default value is Standard_True
	:type findSubshape: bool
	:rtype: bool
") Search;
		Standard_Boolean Search(const TopoDS_Shape & S, TDF_Label & L, const Standard_Boolean findInstance = Standard_True, const Standard_Boolean findComponent = Standard_True, const Standard_Boolean findSubshape = Standard_True);

		/****************** SearchUsingMap ******************/
		%feature("compactdefaultargs") SearchUsingMap;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape
	:param L:
	:type L: TDF_Label
	:param findWithoutLoc:
	:type findWithoutLoc: bool
	:param findSubshape:
	:type findSubshape: bool
	:rtype: bool
") SearchUsingMap;
		Standard_Boolean SearchUsingMap(const TopoDS_Shape & S, TDF_Label & L, const Standard_Boolean findWithoutLoc, const Standard_Boolean findSubshape);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Create (if not exist) shapetool from xcafdoc on <l>.

	:param L:
	:type L: TDF_Label
	:rtype: opencascade::handle<XCAFDoc_ShapeTool>
") Set;
		static opencascade::handle<XCAFDoc_ShapeTool> Set(const TDF_Label & L);

		/****************** SetAutoNaming ******************/
		%feature("compactdefaultargs") SetAutoNaming;
		%feature("autodoc", "Sets auto-naming mode to <v>. if true then for added shapes, links, assemblies and shuo's, the tdatastd_name attribute is automatically added. for shapes it contains a shape type (e.g. 'solid', 'shell', etc); for links it has a form '=>[0:1:1:2]' (where a tag is a label containing a shape without a location); for assemblies it is 'assembly', and 'shuo' for shuo's. this setting is global; it cannot be made a member function as it is used by static methods as well. by default, auto-naming is enabled. see also autonaming().

	:param V:
	:type V: bool
	:rtype: None
") SetAutoNaming;
		static void SetAutoNaming(const Standard_Boolean V);

		/****************** SetExternRefs ******************/
		%feature("compactdefaultargs") SetExternRefs;
		%feature("autodoc", "Sets the names of references on the no-step files.

	:param SHAS:
	:type SHAS: TColStd_SequenceOfHAsciiString
	:rtype: TDF_Label
") SetExternRefs;
		TDF_Label SetExternRefs(const TColStd_SequenceOfHAsciiString & SHAS);

		/****************** SetExternRefs ******************/
		%feature("compactdefaultargs") SetExternRefs;
		%feature("autodoc", "Sets the names of references on the no-step files.

	:param L:
	:type L: TDF_Label
	:param SHAS:
	:type SHAS: TColStd_SequenceOfHAsciiString
	:rtype: None
") SetExternRefs;
		void SetExternRefs(const TDF_Label & L, const TColStd_SequenceOfHAsciiString & SHAS);

		/****************** SetInstanceSHUO ******************/
		%feature("compactdefaultargs") SetInstanceSHUO;
		%feature("autodoc", "Search for the component shape by labelks path and set shuo structure for founded label structure returns null attribute if no component in any assembly found.

	:param theShape:
	:type theShape: TopoDS_Shape
	:rtype: opencascade::handle<XCAFDoc_GraphNode>
") SetInstanceSHUO;
		opencascade::handle<XCAFDoc_GraphNode> SetInstanceSHUO(const TopoDS_Shape & theShape);

		/****************** SetSHUO ******************/
		%feature("compactdefaultargs") SetSHUO;
		%feature("autodoc", "Sets the shuo structure between upper_usage and next_usage create multy-level (if number of labels > 2) shuo from first to last initialise out <mainshuoattr> by main upper_usage shuo attribute. returns false if some of labels in not component label.

	:param Labels:
	:type Labels: TDF_LabelSequence
	:param MainSHUOAttr:
	:type MainSHUOAttr: XCAFDoc_GraphNode
	:rtype: bool
") SetSHUO;
		Standard_Boolean SetSHUO(const TDF_LabelSequence & Labels, opencascade::handle<XCAFDoc_GraphNode> & MainSHUOAttr);

		/****************** SetShape ******************/
		%feature("compactdefaultargs") SetShape;
		%feature("autodoc", "Sets representation (topods_shape) for top-level shape.

	:param L:
	:type L: TDF_Label
	:param S:
	:type S: TopoDS_Shape
	:rtype: None
") SetShape;
		void SetShape(const TDF_Label & L, const TopoDS_Shape & S);

		/****************** UpdateAssemblies ******************/
		%feature("compactdefaultargs") UpdateAssemblies;
		%feature("autodoc", "Top-down update for all assembly compounds stored in the document.

	:rtype: None
") UpdateAssemblies;
		void UpdateAssemblies();

		/****************** XCAFDoc_ShapeTool ******************/
		%feature("compactdefaultargs") XCAFDoc_ShapeTool;
		%feature("autodoc", "Creates an empty tool creates a tool to work with a document <doc> attaches to label xcafdoc::labelshapes().

	:rtype: None
") XCAFDoc_ShapeTool;
		 XCAFDoc_ShapeTool();

};


%make_alias(XCAFDoc_ShapeTool)

%extend XCAFDoc_ShapeTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class XCAFDoc_View *
*********************/
class XCAFDoc_View : public TDF_Attribute {
	public:
		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** GetObject ******************/
		%feature("compactdefaultargs") GetObject;
		%feature("autodoc", "Returns view object data taken from the paren's label and its sub-labels.

	:rtype: opencascade::handle<XCAFView_Object>
") GetObject;
		opencascade::handle<XCAFView_Object> GetObject();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Into:
	:type Into: TDF_Attribute
	:param RT:
	:type RT: TDF_RelocationTable
	:rtype: None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param With:
	:type With: TDF_Attribute
	:rtype: None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param theLabel:
	:type theLabel: TDF_Label
	:rtype: opencascade::handle<XCAFDoc_View>
") Set;
		static opencascade::handle<XCAFDoc_View> Set(const TDF_Label & theLabel);

		/****************** SetObject ******************/
		%feature("compactdefaultargs") SetObject;
		%feature("autodoc", "Updates parent's label and its sub-labels with data taken from theviewobject. old data associated with the label will be lost.

	:param theViewObject:
	:type theViewObject: XCAFView_Object
	:rtype: None
") SetObject;
		void SetObject(const opencascade::handle<XCAFView_Object> & theViewObject);

		/****************** XCAFDoc_View ******************/
		%feature("compactdefaultargs") XCAFDoc_View;
		%feature("autodoc", "	:rtype: None
") XCAFDoc_View;
		 XCAFDoc_View();

};


%make_alias(XCAFDoc_View)

%extend XCAFDoc_View {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class XCAFDoc_ViewTool *
*************************/
class XCAFDoc_ViewTool : public TDF_Attribute {
	public:
		/****************** AddView ******************/
		%feature("compactdefaultargs") AddView;
		%feature("autodoc", "Adds a view definition to a view table and returns its label.

	:rtype: TDF_Label
") AddView;
		TDF_Label AddView();

		/****************** BaseLabel ******************/
		%feature("compactdefaultargs") BaseLabel;
		%feature("autodoc", "Returns the label under which views are stored.

	:rtype: TDF_Label
") BaseLabel;
		TDF_Label BaseLabel();

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** GetRefAnnotationLabel ******************/
		%feature("compactdefaultargs") GetRefAnnotationLabel;
		%feature("autodoc", "Returns annotation labels defined for label theviewl returns false if the theviewl is not in view table.

	:param theViewL:
	:type theViewL: TDF_Label
	:param theAnnotationLabels:
	:type theAnnotationLabels: TDF_LabelSequence
	:rtype: bool
") GetRefAnnotationLabel;
		Standard_Boolean GetRefAnnotationLabel(const TDF_Label & theViewL, TDF_LabelSequence & theAnnotationLabels);

		/****************** GetRefClippingPlaneLabel ******************/
		%feature("compactdefaultargs") GetRefClippingPlaneLabel;
		%feature("autodoc", "Returns clippingplane labels defined for label theviewl returns false if the theviewl is not in view table.

	:param theViewL:
	:type theViewL: TDF_Label
	:param theClippingPlaneLabels:
	:type theClippingPlaneLabels: TDF_LabelSequence
	:rtype: bool
") GetRefClippingPlaneLabel;
		Standard_Boolean GetRefClippingPlaneLabel(const TDF_Label & theViewL, TDF_LabelSequence & theClippingPlaneLabels);

		/****************** GetRefGDTLabel ******************/
		%feature("compactdefaultargs") GetRefGDTLabel;
		%feature("autodoc", "Returns gdt labels defined for label theviewl returns false if the theviewl is not in view table.

	:param theViewL:
	:type theViewL: TDF_Label
	:param theGDTLabels:
	:type theGDTLabels: TDF_LabelSequence
	:rtype: bool
") GetRefGDTLabel;
		Standard_Boolean GetRefGDTLabel(const TDF_Label & theViewL, TDF_LabelSequence & theGDTLabels);

		/****************** GetRefNoteLabel ******************/
		%feature("compactdefaultargs") GetRefNoteLabel;
		%feature("autodoc", "Returns notes labels defined for label theviewl returns false if the theviewl is not in view table.

	:param theViewL:
	:type theViewL: TDF_Label
	:param theNoteLabels:
	:type theNoteLabels: TDF_LabelSequence
	:rtype: bool
") GetRefNoteLabel;
		Standard_Boolean GetRefNoteLabel(const TDF_Label & theViewL, TDF_LabelSequence & theNoteLabels);

		/****************** GetRefShapeLabel ******************/
		%feature("compactdefaultargs") GetRefShapeLabel;
		%feature("autodoc", "Returns shape labels defined for label theviewl returns false if the theviewl is not in view table.

	:param theViewL:
	:type theViewL: TDF_Label
	:param theShapeLabels:
	:type theShapeLabels: TDF_LabelSequence
	:rtype: bool
") GetRefShapeLabel;
		Standard_Boolean GetRefShapeLabel(const TDF_Label & theViewL, TDF_LabelSequence & theShapeLabels);

		/****************** GetViewLabels ******************/
		%feature("compactdefaultargs") GetViewLabels;
		%feature("autodoc", "Returns a sequence of view labels currently stored in the view table.

	:param theLabels:
	:type theLabels: TDF_LabelSequence
	:rtype: None
") GetViewLabels;
		void GetViewLabels(TDF_LabelSequence & theLabels);

		/****************** GetViewLabelsForAnnotation ******************/
		%feature("compactdefaultargs") GetViewLabelsForAnnotation;
		%feature("autodoc", "Returns all view labels defined for label annotationl.

	:param theAnnotationL:
	:type theAnnotationL: TDF_Label
	:param theViews:
	:type theViews: TDF_LabelSequence
	:rtype: bool
") GetViewLabelsForAnnotation;
		Standard_Boolean GetViewLabelsForAnnotation(const TDF_Label & theAnnotationL, TDF_LabelSequence & theViews);

		/****************** GetViewLabelsForClippingPlane ******************/
		%feature("compactdefaultargs") GetViewLabelsForClippingPlane;
		%feature("autodoc", "Returns all view labels defined for label clippingplanel.

	:param theClippingPlaneL:
	:type theClippingPlaneL: TDF_Label
	:param theViews:
	:type theViews: TDF_LabelSequence
	:rtype: bool
") GetViewLabelsForClippingPlane;
		Standard_Boolean GetViewLabelsForClippingPlane(const TDF_Label & theClippingPlaneL, TDF_LabelSequence & theViews);

		/****************** GetViewLabelsForGDT ******************/
		%feature("compactdefaultargs") GetViewLabelsForGDT;
		%feature("autodoc", "Returns all view labels defined for label gdtl.

	:param theGDTL:
	:type theGDTL: TDF_Label
	:param theViews:
	:type theViews: TDF_LabelSequence
	:rtype: bool
") GetViewLabelsForGDT;
		Standard_Boolean GetViewLabelsForGDT(const TDF_Label & theGDTL, TDF_LabelSequence & theViews);

		/****************** GetViewLabelsForNote ******************/
		%feature("compactdefaultargs") GetViewLabelsForNote;
		%feature("autodoc", "Returns all view labels defined for label notel.

	:param theNoteL:
	:type theNoteL: TDF_Label
	:param theViews:
	:type theViews: TDF_LabelSequence
	:rtype: bool
") GetViewLabelsForNote;
		Standard_Boolean GetViewLabelsForNote(const TDF_Label & theNoteL, TDF_LabelSequence & theViews);

		/****************** GetViewLabelsForShape ******************/
		%feature("compactdefaultargs") GetViewLabelsForShape;
		%feature("autodoc", "Returns all view labels defined for label shapel.

	:param theShapeL:
	:type theShapeL: TDF_Label
	:param theViews:
	:type theViews: TDF_LabelSequence
	:rtype: bool
") GetViewLabelsForShape;
		Standard_Boolean GetViewLabelsForShape(const TDF_Label & theShapeL, TDF_LabelSequence & theViews);

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** IsLocked ******************/
		%feature("compactdefaultargs") IsLocked;
		%feature("autodoc", "Returns true if the given view is marked as locked.

	:param theViewL:
	:type theViewL: TDF_Label
	:rtype: bool
") IsLocked;
		Standard_Boolean IsLocked(const TDF_Label & theViewL);

		/****************** IsView ******************/
		%feature("compactdefaultargs") IsView;
		%feature("autodoc", "Returns true if label belongs to a view table and is a view definition.

	:param theLabel:
	:type theLabel: TDF_Label
	:rtype: bool
") IsView;
		Standard_Boolean IsView(const TDF_Label & theLabel);

		/****************** Lock ******************/
		%feature("compactdefaultargs") Lock;
		%feature("autodoc", "Mark the given view as locked.

	:param theViewL:
	:type theViewL: TDF_Label
	:rtype: None
") Lock;
		void Lock(const TDF_Label & theViewL);

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param into:
	:type into: TDF_Attribute
	:param RT:
	:type RT: TDF_RelocationTable
	:rtype: None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** RemoveView ******************/
		%feature("compactdefaultargs") RemoveView;
		%feature("autodoc", "Remove view.

	:param theViewL:
	:type theViewL: TDF_Label
	:rtype: None
") RemoveView;
		void RemoveView(const TDF_Label & theViewL);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param with:
	:type with: TDF_Attribute
	:rtype: None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & with);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Creates (if not exist) viewtool.

	:param L:
	:type L: TDF_Label
	:rtype: opencascade::handle<XCAFDoc_ViewTool>
") Set;
		static opencascade::handle<XCAFDoc_ViewTool> Set(const TDF_Label & L);

		/****************** SetClippingPlanes ******************/
		%feature("compactdefaultargs") SetClippingPlanes;
		%feature("autodoc", "Set clipping planes to given view.

	:param theClippingPlaneLabels:
	:type theClippingPlaneLabels: TDF_LabelSequence
	:param theViewL:
	:type theViewL: TDF_Label
	:rtype: None
") SetClippingPlanes;
		void SetClippingPlanes(const TDF_LabelSequence & theClippingPlaneLabels, const TDF_Label & theViewL);

		/****************** SetView ******************/
		%feature("compactdefaultargs") SetView;
		%feature("autodoc", "Sets a link with guid.

	:param theShapes:
	:type theShapes: TDF_LabelSequence
	:param theGDTs:
	:type theGDTs: TDF_LabelSequence
	:param theClippingPlanes:
	:type theClippingPlanes: TDF_LabelSequence
	:param theNotes:
	:type theNotes: TDF_LabelSequence
	:param theAnnotations:
	:type theAnnotations: TDF_LabelSequence
	:param theViewL:
	:type theViewL: TDF_Label
	:rtype: None
") SetView;
		void SetView(const TDF_LabelSequence & theShapes, const TDF_LabelSequence & theGDTs, const TDF_LabelSequence & theClippingPlanes, const TDF_LabelSequence & theNotes, const TDF_LabelSequence & theAnnotations, const TDF_Label & theViewL);

		/****************** SetView ******************/
		%feature("compactdefaultargs") SetView;
		%feature("autodoc", "Sets a link with guid.

	:param theShapes:
	:type theShapes: TDF_LabelSequence
	:param theGDTs:
	:type theGDTs: TDF_LabelSequence
	:param theClippingPlanes:
	:type theClippingPlanes: TDF_LabelSequence
	:param theViewL:
	:type theViewL: TDF_Label
	:rtype: None
") SetView;
		void SetView(const TDF_LabelSequence & theShapes, const TDF_LabelSequence & theGDTs, const TDF_LabelSequence & theClippingPlanes, const TDF_Label & theViewL);

		/****************** SetView ******************/
		%feature("compactdefaultargs") SetView;
		%feature("autodoc", "Sets a link with guid.

	:param theShapes:
	:type theShapes: TDF_LabelSequence
	:param theGDTs:
	:type theGDTs: TDF_LabelSequence
	:param theViewL:
	:type theViewL: TDF_Label
	:rtype: None
") SetView;
		void SetView(const TDF_LabelSequence & theShapes, const TDF_LabelSequence & theGDTs, const TDF_Label & theViewL);

		/****************** Unlock ******************/
		%feature("compactdefaultargs") Unlock;
		%feature("autodoc", "Unlock the given view.

	:param theViewL:
	:type theViewL: TDF_Label
	:rtype: None
") Unlock;
		void Unlock(const TDF_Label & theViewL);

		/****************** XCAFDoc_ViewTool ******************/
		%feature("compactdefaultargs") XCAFDoc_ViewTool;
		%feature("autodoc", "	:rtype: None
") XCAFDoc_ViewTool;
		 XCAFDoc_ViewTool();

};


%make_alias(XCAFDoc_ViewTool)

%extend XCAFDoc_ViewTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class XCAFDoc_Volume *
***********************/
class XCAFDoc_Volume : public TDF_Attribute {
	public:

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** Get ******************/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "	:rtype: float
") Get;
		Standard_Real Get();

		/****************** Get ******************/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Returns volume as argument returns false if no such attribute at the <label>.

	:param label:
	:type label: TDF_Label
	:param vol:
	:type vol: float
	:rtype: bool
") Get;
		static Standard_Boolean Get(const TDF_Label & label, Standard_Real &OutValue);

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Into:
	:type Into: TDF_Attribute
	:param RT:
	:type RT: TDF_RelocationTable
	:rtype: None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param With:
	:type With: TDF_Attribute
	:rtype: None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets a value of volume.

	:param vol:
	:type vol: float
	:rtype: None
") Set;
		void Set(const Standard_Real vol);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Find, or create, an volume attribute and set its value.

	:param label:
	:type label: TDF_Label
	:param vol:
	:type vol: float
	:rtype: opencascade::handle<XCAFDoc_Volume>
") Set;
		static opencascade::handle<XCAFDoc_Volume> Set(const TDF_Label & label, const Standard_Real vol);

		/****************** XCAFDoc_Volume ******************/
		%feature("compactdefaultargs") XCAFDoc_Volume;
		%feature("autodoc", "Class methods =============.

	:rtype: None
") XCAFDoc_Volume;
		 XCAFDoc_Volume();

};


%make_alias(XCAFDoc_Volume)

%extend XCAFDoc_Volume {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class XCAFDoc_NoteBinData *
****************************/
class XCAFDoc_NoteBinData : public XCAFDoc_Note {
	public:
		/****************** Data ******************/
		%feature("compactdefaultargs") Data;
		%feature("autodoc", "Returns byte data array.

	:rtype: opencascade::handle<TColStd_HArray1OfByte>
") Data;
		const opencascade::handle<TColStd_HArray1OfByte> & Data();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** Get ******************/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Finds a binary data attribute on the given label and returns it, if it is found.

	:param theLabel:
	:type theLabel: TDF_Label
	:rtype: opencascade::handle<XCAFDoc_NoteBinData>
") Get;
		static opencascade::handle<XCAFDoc_NoteBinData> Get(const TDF_Label & theLabel);

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Returns default attribute guid.

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** MIMEtype ******************/
		%feature("compactdefaultargs") MIMEtype;
		%feature("autodoc", "Returns data mime type.

	:rtype: TCollection_AsciiString
") MIMEtype;
		const TCollection_AsciiString & MIMEtype();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theAttrInto:
	:type theAttrInto: TDF_Attribute
	:param theRT:
	:type theRT: TDF_RelocationTable
	:rtype: None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & theAttrInto, const opencascade::handle<TDF_RelocationTable> & theRT);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param theAttrFrom:
	:type theAttrFrom: TDF_Attribute
	:rtype: None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & theAttrFrom);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Create (if not exist) a binary note with data loaded from a binary file. \param [in] thelabel - label to add the attribute. \param [in] theusername - the name of the user, who created the note. \param [in] thetimestamp - creation timestamp of the note. \param [in] thetitle - file title. \param [in] themimetype - mime type of the file. \param [in] thefile - input binary file. eturn a handle to the attribute instance.

	:param theLabel:
	:type theLabel: TDF_Label
	:param theUserName:
	:type theUserName: TCollection_ExtendedString
	:param theTimeStamp:
	:type theTimeStamp: TCollection_ExtendedString
	:param theTitle:
	:type theTitle: TCollection_ExtendedString
	:param theMIMEtype:
	:type theMIMEtype: TCollection_AsciiString
	:param theFile:
	:type theFile: OSD_File
	:rtype: opencascade::handle<XCAFDoc_NoteBinData>
") Set;
		static opencascade::handle<XCAFDoc_NoteBinData> Set(const TDF_Label & theLabel, const TCollection_ExtendedString & theUserName, const TCollection_ExtendedString & theTimeStamp, const TCollection_ExtendedString & theTitle, const TCollection_AsciiString & theMIMEtype, OSD_File & theFile);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Create (if not exist) a binary note byte data array. \param [in] thelabel - label to add the attribute. \param [in] theusername - the name of the user, who created the note. \param [in] thetimestamp - creation timestamp of the note. \param [in] thetitle - data title. \param [in] themimetype - mime type of data. \param [in] thedata - byte data array. eturn a handle to the attribute instance.

	:param theLabel:
	:type theLabel: TDF_Label
	:param theUserName:
	:type theUserName: TCollection_ExtendedString
	:param theTimeStamp:
	:type theTimeStamp: TCollection_ExtendedString
	:param theTitle:
	:type theTitle: TCollection_ExtendedString
	:param theMIMEtype:
	:type theMIMEtype: TCollection_AsciiString
	:param theData:
	:type theData: TColStd_HArray1OfByte
	:rtype: opencascade::handle<XCAFDoc_NoteBinData>
") Set;
		static opencascade::handle<XCAFDoc_NoteBinData> Set(const TDF_Label & theLabel, const TCollection_ExtendedString & theUserName, const TCollection_ExtendedString & theTimeStamp, const TCollection_ExtendedString & theTitle, const TCollection_AsciiString & theMIMEtype, const opencascade::handle<TColStd_HArray1OfByte> & theData);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets title, mime type and data from a binary file. \param [in] thetitle - file title. \param [in] themimetype - mime type of the file. \param [in] thefile - input binary file.

	:param theTitle:
	:type theTitle: TCollection_ExtendedString
	:param theMIMEtype:
	:type theMIMEtype: TCollection_AsciiString
	:param theFile:
	:type theFile: OSD_File
	:rtype: bool
") Set;
		Standard_Boolean Set(const TCollection_ExtendedString & theTitle, const TCollection_AsciiString & theMIMEtype, OSD_File & theFile);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets title, mime type and data from a byte array. \param [in] thetitle - data title. \param [in] themimetype - mime type of data. \param [in] thedata - byte data array.

	:param theTitle:
	:type theTitle: TCollection_ExtendedString
	:param theMIMEtype:
	:type theMIMEtype: TCollection_AsciiString
	:param theData:
	:type theData: TColStd_HArray1OfByte
	:rtype: None
") Set;
		void Set(const TCollection_ExtendedString & theTitle, const TCollection_AsciiString & theMIMEtype, const opencascade::handle<TColStd_HArray1OfByte> & theData);

		/****************** Size ******************/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "Size of data in bytes.

	:rtype: int
") Size;
		Standard_Integer Size();

		/****************** Title ******************/
		%feature("compactdefaultargs") Title;
		%feature("autodoc", "Returns the note title.

	:rtype: TCollection_ExtendedString
") Title;
		const TCollection_ExtendedString & Title();

		/****************** XCAFDoc_NoteBinData ******************/
		%feature("compactdefaultargs") XCAFDoc_NoteBinData;
		%feature("autodoc", "Creates an empty binary data note.

	:rtype: None
") XCAFDoc_NoteBinData;
		 XCAFDoc_NoteBinData();

};


%make_alias(XCAFDoc_NoteBinData)

%extend XCAFDoc_NoteBinData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class XCAFDoc_NoteComment *
****************************/
class XCAFDoc_NoteComment : public XCAFDoc_Note {
	public:
		/****************** Comment ******************/
		%feature("compactdefaultargs") Comment;
		%feature("autodoc", "Returns the comment text.

	:rtype: TCollection_ExtendedString
") Comment;
		const TCollection_ExtendedString & Comment();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** Get ******************/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Finds a reference attribute on the given label and returns it, if it is found.

	:param theLabel:
	:type theLabel: TDF_Label
	:rtype: opencascade::handle<XCAFDoc_NoteComment>
") Get;
		static opencascade::handle<XCAFDoc_NoteComment> Get(const TDF_Label & theLabel);

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Returns default attribute guid.

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theAttrInto:
	:type theAttrInto: TDF_Attribute
	:param theRT:
	:type theRT: TDF_RelocationTable
	:rtype: None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & theAttrInto, const opencascade::handle<TDF_RelocationTable> & theRT);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param theAttrFrom:
	:type theAttrFrom: TDF_Attribute
	:rtype: None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & theAttrFrom);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Create (if not exist) a comment note on the given label. \param [in] thelabel - note label. \param [in] theusername - the name of the user, who created the note. \param [in] thetimestamp - creation timestamp of the note. \param [in] thecomment - comment text.

	:param theLabel:
	:type theLabel: TDF_Label
	:param theUserName:
	:type theUserName: TCollection_ExtendedString
	:param theTimeStamp:
	:type theTimeStamp: TCollection_ExtendedString
	:param theComment:
	:type theComment: TCollection_ExtendedString
	:rtype: opencascade::handle<XCAFDoc_NoteComment>
") Set;
		static opencascade::handle<XCAFDoc_NoteComment> Set(const TDF_Label & theLabel, const TCollection_ExtendedString & theUserName, const TCollection_ExtendedString & theTimeStamp, const TCollection_ExtendedString & theComment);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets the comment text.

	:param theComment:
	:type theComment: TCollection_ExtendedString
	:rtype: None
") Set;
		void Set(const TCollection_ExtendedString & theComment);

		/****************** XCAFDoc_NoteComment ******************/
		%feature("compactdefaultargs") XCAFDoc_NoteComment;
		%feature("autodoc", "Creates an empty comment note.

	:rtype: None
") XCAFDoc_NoteComment;
		 XCAFDoc_NoteComment();

};


%make_alias(XCAFDoc_NoteComment)

%extend XCAFDoc_NoteComment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class XCAFDoc_NoteBalloon *
****************************/
class XCAFDoc_NoteBalloon : public XCAFDoc_NoteComment {
	public:
		/****************** Get ******************/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Finds a reference attribute on the given label and returns it, if it is found.

	:param theLabel:
	:type theLabel: TDF_Label
	:rtype: opencascade::handle<XCAFDoc_NoteBalloon>
") Get;
		static opencascade::handle<XCAFDoc_NoteBalloon> Get(const TDF_Label & theLabel);

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Returns default attribute guid.

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Create (if not exist) a comment note on the given label. \param [in] thelabel - note label. \param [in] theusername - the name of the user, who created the note. \param [in] thetimestamp - creation timestamp of the note. \param [in] thecomment - comment text.

	:param theLabel:
	:type theLabel: TDF_Label
	:param theUserName:
	:type theUserName: TCollection_ExtendedString
	:param theTimeStamp:
	:type theTimeStamp: TCollection_ExtendedString
	:param theComment:
	:type theComment: TCollection_ExtendedString
	:rtype: opencascade::handle<XCAFDoc_NoteBalloon>
") Set;
		static opencascade::handle<XCAFDoc_NoteBalloon> Set(const TDF_Label & theLabel, const TCollection_ExtendedString & theUserName, const TCollection_ExtendedString & theTimeStamp, const TCollection_ExtendedString & theComment);

		/****************** XCAFDoc_NoteBalloon ******************/
		%feature("compactdefaultargs") XCAFDoc_NoteBalloon;
		%feature("autodoc", "Creates an empty comment note.

	:rtype: None
") XCAFDoc_NoteBalloon;
		 XCAFDoc_NoteBalloon();

};


%make_alias(XCAFDoc_NoteBalloon)

%extend XCAFDoc_NoteBalloon {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */

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
%define TOPODSDOCSTRING
"TopoDS module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_topods.html"
%enddef
%module (package="OCC.Core", docstring=TOPODSDOCSTRING) TopoDS


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
#include<TopoDS_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Message_module.hxx>
#include<TopAbs_module.hxx>
#include<TopLoc_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Message.i
%import TopAbs.i
%import TopLoc.i
/* public enums */
/* end public enums declaration */

/* handles */
%wrap_handle(TopoDS_HShape)
%wrap_handle(TopoDS_TShape)
%wrap_handle(TopoDS_TCompSolid)
%wrap_handle(TopoDS_TCompound)
%wrap_handle(TopoDS_TEdge)
%wrap_handle(TopoDS_TFace)
%wrap_handle(TopoDS_TShell)
%wrap_handle(TopoDS_TSolid)
%wrap_handle(TopoDS_TVertex)
%wrap_handle(TopoDS_TWire)
/* end handles declaration */

/* templates */
%template(TopoDS_ListOfShape) NCollection_List<TopoDS_Shape>;
%template(TopoDS_ListIteratorOfListOfShape) NCollection_TListIterator<TopoDS_Shape>;
/* end templates declaration */

/* typedefs */
typedef NCollection_List<TopoDS_Shape> TopoDS_ListOfShape;
typedef NCollection_List<TopoDS_Shape>::Iterator TopoDS_ListIteratorOfListOfShape;
/* end typedefs declaration */

/***************
* class TopoDS *
***************/
%rename(topods) TopoDS;
class TopoDS {
	public:
		/****************** CompSolid ******************/
		%feature("compactdefaultargs") CompSolid;
		%feature("autodoc", "Casts shape s to the more specialized return type, compsolid. exceptions standard_typemismatch if s cannot be cast to this return type.

	:param S:
	:type S: TopoDS_Shape
	:rtype: TopoDS_CompSolid
") CompSolid;
		static const TopoDS_CompSolid CompSolid(const TopoDS_Shape & S);

		/****************** CompSolid ******************/
		%feature("compactdefaultargs") CompSolid;
		%feature("autodoc", "	:param &:
	:type &: TopoDS_Shape
	:rtype: TopoDS_CompSolid
") CompSolid;
		static TopoDS_CompSolid CompSolid(TopoDS_Shape &);

		/****************** Compound ******************/
		%feature("compactdefaultargs") Compound;
		%feature("autodoc", "Casts shape s to the more specialized return type, compound. exceptions standard_typemismatch if s cannot be cast to this return type.

	:param S:
	:type S: TopoDS_Shape
	:rtype: TopoDS_Compound
") Compound;
		static const TopoDS_Compound Compound(const TopoDS_Shape & S);

		/****************** Compound ******************/
		%feature("compactdefaultargs") Compound;
		%feature("autodoc", "	:param &:
	:type &: TopoDS_Shape
	:rtype: TopoDS_Compound
") Compound;
		static TopoDS_Compound Compound(TopoDS_Shape &);

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Casts shape s to the more specialized return type, edge exceptions standard_typemismatch if s cannot be cast to this return type.

	:param S:
	:type S: TopoDS_Shape
	:rtype: TopoDS_Edge
") Edge;
		static const TopoDS_Edge Edge(const TopoDS_Shape & S);

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "	:param &:
	:type &: TopoDS_Shape
	:rtype: TopoDS_Edge
") Edge;
		static TopoDS_Edge Edge(TopoDS_Shape &);

		/****************** Face ******************/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Casts shape s to the more specialized return type, face. exceptions standard_typemismatch if s cannot be cast to this return type.

	:param S:
	:type S: TopoDS_Shape
	:rtype: TopoDS_Face
") Face;
		static const TopoDS_Face Face(const TopoDS_Shape & S);

		/****************** Face ******************/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "	:param &:
	:type &: TopoDS_Shape
	:rtype: TopoDS_Face
") Face;
		static TopoDS_Face Face(TopoDS_Shape &);

		/****************** Shell ******************/
		%feature("compactdefaultargs") Shell;
		%feature("autodoc", "Casts shape s to the more specialized return type, shell. exceptions standard_typemismatch if s cannot be cast to this return type.

	:param S:
	:type S: TopoDS_Shape
	:rtype: TopoDS_Shell
") Shell;
		static const TopoDS_Shell Shell(const TopoDS_Shape & S);

		/****************** Shell ******************/
		%feature("compactdefaultargs") Shell;
		%feature("autodoc", "	:param &:
	:type &: TopoDS_Shape
	:rtype: TopoDS_Shell
") Shell;
		static TopoDS_Shell Shell(TopoDS_Shape &);

		/****************** Solid ******************/
		%feature("compactdefaultargs") Solid;
		%feature("autodoc", "Casts shape s to the more specialized return type, solid. exceptions standard_typemismatch if s cannot be cast to this return type.

	:param S:
	:type S: TopoDS_Shape
	:rtype: TopoDS_Solid
") Solid;
		static const TopoDS_Solid Solid(const TopoDS_Shape & S);

		/****************** Solid ******************/
		%feature("compactdefaultargs") Solid;
		%feature("autodoc", "	:param &:
	:type &: TopoDS_Shape
	:rtype: TopoDS_Solid
") Solid;
		static TopoDS_Solid Solid(TopoDS_Shape &);

		/****************** Vertex ******************/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "Basic tool to access the data structure. casts shape s to the more specialized return type, vertex. exceptions standard_typemismatch if s cannot be cast to this return type.

	:param S:
	:type S: TopoDS_Shape
	:rtype: TopoDS_Vertex
") Vertex;
		static const TopoDS_Vertex Vertex(const TopoDS_Shape & S);

		/****************** Vertex ******************/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "	:param &:
	:type &: TopoDS_Shape
	:rtype: TopoDS_Vertex
") Vertex;
		static TopoDS_Vertex Vertex(TopoDS_Shape &);

		/****************** Wire ******************/
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", "Casts shape s to the more specialized return type, wire. exceptions standard_typemismatch if s cannot be cast to this return type.

	:param S:
	:type S: TopoDS_Shape
	:rtype: TopoDS_Wire
") Wire;
		static const TopoDS_Wire Wire(const TopoDS_Shape & S);

		/****************** Wire ******************/
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", "	:param &:
	:type &: TopoDS_Shape
	:rtype: TopoDS_Wire
") Wire;
		static TopoDS_Wire Wire(TopoDS_Shape &);

};


%extend TopoDS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class TopoDS_AlertWithShape *
******************************/
class TopoDS_AlertWithShape : public Message_Alert {
	public:
		/****************** GetShape ******************/
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "Returns contained shape.

	:rtype: TopoDS_Shape
") GetShape;
		const TopoDS_Shape GetShape();

		/****************** Merge ******************/
		%feature("compactdefaultargs") Merge;
		%feature("autodoc", "Returns false.

	:param theTarget:
	:type theTarget: Message_Alert
	:rtype: bool
") Merge;
		virtual Standard_Boolean Merge(const opencascade::handle<Message_Alert> & theTarget);

		/****************** SetShape ******************/
		%feature("compactdefaultargs") SetShape;
		%feature("autodoc", "Sets the shape.

	:param theShape:
	:type theShape: TopoDS_Shape
	:rtype: None
") SetShape;
		void SetShape(const TopoDS_Shape & theShape);

		/****************** SupportsMerge ******************/
		%feature("compactdefaultargs") SupportsMerge;
		%feature("autodoc", "Returns false.

	:rtype: bool
") SupportsMerge;
		virtual Standard_Boolean SupportsMerge();

		/****************** TopoDS_AlertWithShape ******************/
		%feature("compactdefaultargs") TopoDS_AlertWithShape;
		%feature("autodoc", "Constructor with shape argument.

	:param theShape:
	:type theShape: TopoDS_Shape
	:rtype: None
") TopoDS_AlertWithShape;
		 TopoDS_AlertWithShape(const TopoDS_Shape & theShape);

};


%extend TopoDS_AlertWithShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class TopoDS_Builder *
***********************/
class TopoDS_Builder {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Add the shape c in the shape s. exceptions - topods_frozenshape if s is not free and cannot be modified. - topods__uncompatibleshapes if s and c are not compatible.

	:param S:
	:type S: TopoDS_Shape
	:param C:
	:type C: TopoDS_Shape
	:rtype: None
") Add;
		void Add(TopoDS_Shape & S, const TopoDS_Shape & C);

		/****************** MakeCompSolid ******************/
		%feature("compactdefaultargs") MakeCompSolid;
		%feature("autodoc", "Make an empty composite solid.

	:param C:
	:type C: TopoDS_CompSolid
	:rtype: None
") MakeCompSolid;
		void MakeCompSolid(TopoDS_CompSolid & C);

		/****************** MakeCompound ******************/
		%feature("compactdefaultargs") MakeCompound;
		%feature("autodoc", "Make an empty compound.

	:param C:
	:type C: TopoDS_Compound
	:rtype: None
") MakeCompound;
		void MakeCompound(TopoDS_Compound & C);

		/****************** MakeShell ******************/
		%feature("compactdefaultargs") MakeShell;
		%feature("autodoc", "Make an empty shell.

	:param S:
	:type S: TopoDS_Shell
	:rtype: None
") MakeShell;
		void MakeShell(TopoDS_Shell & S);

		/****************** MakeSolid ******************/
		%feature("compactdefaultargs") MakeSolid;
		%feature("autodoc", "Make a solid covering the whole 3d space.

	:param S:
	:type S: TopoDS_Solid
	:rtype: None
") MakeSolid;
		void MakeSolid(TopoDS_Solid & S);

		/****************** MakeWire ******************/
		%feature("compactdefaultargs") MakeWire;
		%feature("autodoc", "Make an empty wire.

	:param W:
	:type W: TopoDS_Wire
	:rtype: None
") MakeWire;
		void MakeWire(TopoDS_Wire & W);

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Remove the shape c from the shape s. exceptions topods_frozenshape if s is frozen and cannot be modified.

	:param S:
	:type S: TopoDS_Shape
	:param C:
	:type C: TopoDS_Shape
	:rtype: None
") Remove;
		void Remove(TopoDS_Shape & S, const TopoDS_Shape & C);

};


%extend TopoDS_Builder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class TopoDS_HShape *
**********************/
class TopoDS_HShape : public Standard_Transient {
	public:
		/****************** ChangeShape ******************/
		%feature("compactdefaultargs") ChangeShape;
		%feature("autodoc", "Exchanges the topods_shape object defining this shape for another one referencing the same underlying shape accesses the list of shapes within the underlying shape referenced by the topods_shape object. returns a reference to a topods_shape based on this shape. the topods_shape can be modified.

	:rtype: TopoDS_Shape
") ChangeShape;
		TopoDS_Shape ChangeShape();

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Loads this shape with the shape ashape.

	:param aShape:
	:type aShape: TopoDS_Shape
	:rtype: None
") Shape;
		void Shape(const TopoDS_Shape & aShape);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Returns a reference to a constant topods_shape based on this shape.

	:rtype: TopoDS_Shape
") Shape;
		const TopoDS_Shape Shape();

		/****************** TopoDS_HShape ******************/
		%feature("compactdefaultargs") TopoDS_HShape;
		%feature("autodoc", "Constructs an empty shape object.

	:rtype: None
") TopoDS_HShape;
		 TopoDS_HShape();

		/****************** TopoDS_HShape ******************/
		%feature("compactdefaultargs") TopoDS_HShape;
		%feature("autodoc", "Constructs a shape object defined by the shape ashape.

	:param aShape:
	:type aShape: TopoDS_Shape
	:rtype: None
") TopoDS_HShape;
		 TopoDS_HShape(const TopoDS_Shape & aShape);

};


%make_alias(TopoDS_HShape)

%extend TopoDS_HShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class TopoDS_Iterator *
************************/
class TopoDS_Iterator {
	public:
		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initializes this iterator with shape s. note: - if cumori is true, the function composes all sub-shapes with the orientation of s. - if cumloc is true, the function multiplies all sub-shapes by the location of s, i.e. it applies to each sub-shape the transformation that is associated with s.

	:param S:
	:type S: TopoDS_Shape
	:param cumOri: default value is Standard_True
	:type cumOri: bool
	:param cumLoc: default value is Standard_True
	:type cumLoc: bool
	:rtype: None
") Initialize;
		void Initialize(const TopoDS_Shape & S, const Standard_Boolean cumOri = Standard_True, const Standard_Boolean cumLoc = Standard_True);

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Returns true if there is another sub-shape in the shape which this iterator is scanning.

	:rtype: bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Moves on to the next sub-shape in the shape which this iterator is scanning. exceptions standard_nomoreobject if there are no more sub-shapes in the shape.

	:rtype: None
") Next;
		void Next();

		/****************** TopoDS_Iterator ******************/
		%feature("compactdefaultargs") TopoDS_Iterator;
		%feature("autodoc", "Creates an empty iterator.

	:rtype: None
") TopoDS_Iterator;
		 TopoDS_Iterator();

		/****************** TopoDS_Iterator ******************/
		%feature("compactdefaultargs") TopoDS_Iterator;
		%feature("autodoc", "Creates an iterator on <s> sub-shapes. note: - if cumori is true, the function composes all sub-shapes with the orientation of s. - if cumloc is true, the function multiplies all sub-shapes by the location of s, i.e. it applies to each sub-shape the transformation that is associated with s.

	:param S:
	:type S: TopoDS_Shape
	:param cumOri: default value is Standard_True
	:type cumOri: bool
	:param cumLoc: default value is Standard_True
	:type cumLoc: bool
	:rtype: None
") TopoDS_Iterator;
		 TopoDS_Iterator(const TopoDS_Shape & S, const Standard_Boolean cumOri = Standard_True, const Standard_Boolean cumLoc = Standard_True);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the current sub-shape in the shape which this iterator is scanning. exceptions standard_nosuchobject if there is no current sub-shape.

	:rtype: TopoDS_Shape
") Value;
		const TopoDS_Shape Value();

};


%extend TopoDS_Iterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class TopoDS_Shape *
*********************/
class TopoDS_Shape {
	public:
		%feature("autodoc", "1");
		TopoDS_Shape(const TopoDS_Shape arg0);
		/****************** Checked ******************/
		%feature("compactdefaultargs") Checked;
		%feature("autodoc", "Returns the checked flag.

	:rtype: bool
") Checked;
		Standard_Boolean Checked();

		/****************** Checked ******************/
		%feature("compactdefaultargs") Checked;
		%feature("autodoc", "Sets the checked flag.

	:param theIsChecked:
	:type theIsChecked: bool
	:rtype: None
") Checked;
		void Checked(Standard_Boolean theIsChecked);

		/****************** Closed ******************/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "Returns the closedness flag.

	:rtype: bool
") Closed;
		Standard_Boolean Closed();

		/****************** Closed ******************/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "Sets the closedness flag.

	:param theIsClosed:
	:type theIsClosed: bool
	:rtype: None
") Closed;
		void Closed(Standard_Boolean theIsClosed);

		/****************** Complement ******************/
		%feature("compactdefaultargs") Complement;
		%feature("autodoc", "Complements the orientation, using the complement method from the topabs package.

	:rtype: None
") Complement;
		void Complement();

		/****************** Complemented ******************/
		%feature("compactdefaultargs") Complemented;
		%feature("autodoc", "Returns a shape similar to <self> with the orientation complemented, using the complement method from the topabs package.

	:rtype: TopoDS_Shape
") Complemented;
		TopoDS_Shape Complemented();

		/****************** Compose ******************/
		%feature("compactdefaultargs") Compose;
		%feature("autodoc", "Updates the shape orientation by composition with theorient, using the compose method from the topabs package.

	:param theOrient:
	:type theOrient: TopAbs_Orientation
	:rtype: None
") Compose;
		void Compose(TopAbs_Orientation theOrient);

		/****************** Composed ******************/
		%feature("compactdefaultargs") Composed;
		%feature("autodoc", "Returns a shape similar to <self> with the orientation composed with theorient, using the compose method from the topabs package.

	:param theOrient:
	:type theOrient: TopAbs_Orientation
	:rtype: TopoDS_Shape
") Composed;
		TopoDS_Shape Composed(TopAbs_Orientation theOrient);

		/****************** Convex ******************/
		%feature("compactdefaultargs") Convex;
		%feature("autodoc", "Returns the convexness flag.

	:rtype: bool
") Convex;
		Standard_Boolean Convex();

		/****************** Convex ******************/
		%feature("compactdefaultargs") Convex;
		%feature("autodoc", "Sets the convexness flag.

	:param theIsConvex:
	:type theIsConvex: bool
	:rtype: None
") Convex;
		void Convex(Standard_Boolean theIsConvex);


            %feature("autodoc", "1");
            %extend{
                std::string DumpJsonToString(int depth=-1) {
                std::stringstream s;
                self->DumpJson(s, depth);
                return s.str();}
            };
		/****************** EmptyCopied ******************/
		%feature("compactdefaultargs") EmptyCopied;
		%feature("autodoc", "Returns a new shape with the same orientation and location and a new tshape with the same geometry and no sub-shapes.

	:rtype: TopoDS_Shape
") EmptyCopied;
		TopoDS_Shape EmptyCopied();

		/****************** EmptyCopy ******************/
		%feature("compactdefaultargs") EmptyCopy;
		%feature("autodoc", "Replace <self> by a new shape with the same orientation and location and a new tshape with the same geometry and no sub-shapes.

	:rtype: None
") EmptyCopy;
		void EmptyCopy();

		/****************** Free ******************/
		%feature("compactdefaultargs") Free;
		%feature("autodoc", "Returns the free flag.

	:rtype: bool
") Free;
		Standard_Boolean Free();

		/****************** Free ******************/
		%feature("compactdefaultargs") Free;
		%feature("autodoc", "Sets the free flag.

	:param theIsFree:
	:type theIsFree: bool
	:rtype: None
") Free;
		void Free(Standard_Boolean theIsFree);

		/****************** HashCode ******************/
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "Returns a hashed value denoting <self>. this value is in the range [1, theupperbound]. it is computed from the tshape and the location. the orientation is not used. @param theupperbound the upper bound of the range a computing hash code must be within returns a computed hash code, in the range [1, theupperbound].

	:param theUpperBound:
	:type theUpperBound: int
	:rtype: int
") HashCode;
		Standard_Integer HashCode(Standard_Integer theUpperBound);

        %extend {
            Standard_Integer __hash__() {
            return $self->HashCode(2147483647);
            }
        };

		/****************** Infinite ******************/
		%feature("compactdefaultargs") Infinite;
		%feature("autodoc", "Returns the infinity flag.

	:rtype: bool
") Infinite;
		Standard_Boolean Infinite();

		/****************** Infinite ******************/
		%feature("compactdefaultargs") Infinite;
		%feature("autodoc", "Sets the infinity flag.

	:param theIsInfinite:
	:type theIsInfinite: bool
	:rtype: None
") Infinite;
		void Infinite(Standard_Boolean theIsInfinite);

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "Returns true if two shapes are equal, i.e. if they share the same tshape with the same locations and orientations.

	:param theOther:
	:type theOther: TopoDS_Shape
	:rtype: bool
") IsEqual;
		Standard_Boolean IsEqual(const TopoDS_Shape & theOther);

		/****************** IsNotEqual ******************/
		%feature("compactdefaultargs") IsNotEqual;
		%feature("autodoc", "Negation of the isequal method.

	:param theOther:
	:type theOther: TopoDS_Shape
	:rtype: bool
") IsNotEqual;
		Standard_Boolean IsNotEqual(const TopoDS_Shape & theOther);

		/****************** IsNull ******************/
		%feature("compactdefaultargs") IsNull;
		%feature("autodoc", "Returns true if this shape is null. in other words, it references no underlying shape with the potential to be given a location and an orientation.

	:rtype: bool
") IsNull;
		Standard_Boolean IsNull();

		/****************** IsPartner ******************/
		%feature("compactdefaultargs") IsPartner;
		%feature("autodoc", "Returns true if two shapes are partners, i.e. if they share the same tshape. locations and orientations may differ.

	:param theOther:
	:type theOther: TopoDS_Shape
	:rtype: bool
") IsPartner;
		Standard_Boolean IsPartner(const TopoDS_Shape & theOther);

		/****************** IsSame ******************/
		%feature("compactdefaultargs") IsSame;
		%feature("autodoc", "Returns true if two shapes are same, i.e. if they share the same tshape with the same locations. orientations may differ.

	:param theOther:
	:type theOther: TopoDS_Shape
	:rtype: bool
") IsSame;
		Standard_Boolean IsSame(const TopoDS_Shape & theOther);

		/****************** Located ******************/
		%feature("compactdefaultargs") Located;
		%feature("autodoc", "Returns a shape similar to <self> with the local coordinate system set to <loc>.

	:param theLoc:
	:type theLoc: TopLoc_Location
	:rtype: TopoDS_Shape
") Located;
		TopoDS_Shape Located(const TopLoc_Location & theLoc);

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Returns the shape local coordinate system.

	:rtype: TopLoc_Location
") Location;
		const TopLoc_Location & Location();

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Sets the shape local coordinate system.

	:param theLoc:
	:type theLoc: TopLoc_Location
	:rtype: None
") Location;
		void Location(const TopLoc_Location & theLoc);

		/****************** Locked ******************/
		%feature("compactdefaultargs") Locked;
		%feature("autodoc", "Returns the locked flag.

	:rtype: bool
") Locked;
		Standard_Boolean Locked();

		/****************** Locked ******************/
		%feature("compactdefaultargs") Locked;
		%feature("autodoc", "Sets the locked flag.

	:param theIsLocked:
	:type theIsLocked: bool
	:rtype: None
") Locked;
		void Locked(Standard_Boolean theIsLocked);

		/****************** Modified ******************/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "Returns the modification flag.

	:rtype: bool
") Modified;
		Standard_Boolean Modified();

		/****************** Modified ******************/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "Sets the modification flag.

	:param theIsModified:
	:type theIsModified: bool
	:rtype: None
") Modified;
		void Modified(Standard_Boolean theIsModified);

		/****************** Move ******************/
		%feature("compactdefaultargs") Move;
		%feature("autodoc", "Multiplies the shape location by theposition.

	:param thePosition:
	:type thePosition: TopLoc_Location
	:rtype: None
") Move;
		void Move(const TopLoc_Location & thePosition);

		/****************** Moved ******************/
		%feature("compactdefaultargs") Moved;
		%feature("autodoc", "Returns a shape similar to <self> with a location multiplied by theposition.

	:param thePosition:
	:type thePosition: TopLoc_Location
	:rtype: TopoDS_Shape
") Moved;
		TopoDS_Shape Moved(const TopLoc_Location & thePosition);

		/****************** NbChildren ******************/
		%feature("compactdefaultargs") NbChildren;
		%feature("autodoc", "Returns the number of direct sub-shapes (children). @sa topods_iterator for accessing sub-shapes.

	:rtype: int
") NbChildren;
		Standard_Integer NbChildren();

		/****************** Nullify ******************/
		%feature("compactdefaultargs") Nullify;
		%feature("autodoc", "Destroys the reference to the underlying shape stored in this shape. as a result, this shape becomes null.

	:rtype: None
") Nullify;
		void Nullify();

		/****************** Orientable ******************/
		%feature("compactdefaultargs") Orientable;
		%feature("autodoc", "Returns the orientability flag.

	:rtype: bool
") Orientable;
		Standard_Boolean Orientable();

		/****************** Orientable ******************/
		%feature("compactdefaultargs") Orientable;
		%feature("autodoc", "Sets the orientability flag.

	:param theIsOrientable:
	:type theIsOrientable: bool
	:rtype: None
") Orientable;
		void Orientable(const Standard_Boolean theIsOrientable);

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Returns the shape orientation.

	:rtype: TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation();

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Sets the shape orientation.

	:param theOrient:
	:type theOrient: TopAbs_Orientation
	:rtype: None
") Orientation;
		void Orientation(TopAbs_Orientation theOrient);

		/****************** Oriented ******************/
		%feature("compactdefaultargs") Oriented;
		%feature("autodoc", "Returns a shape similar to <self> with the orientation set to <or>.

	:param theOrient:
	:type theOrient: TopAbs_Orientation
	:rtype: TopoDS_Shape
") Oriented;
		TopoDS_Shape Oriented(TopAbs_Orientation theOrient);

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Reverses the orientation, using the reverse method from the topabs package.

	:rtype: None
") Reverse;
		void Reverse();

		/****************** Reversed ******************/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Returns a shape similar to <self> with the orientation reversed, using the reverse method from the topabs package.

	:rtype: TopoDS_Shape
") Reversed;
		TopoDS_Shape Reversed();

		/****************** ShapeType ******************/
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "Returns the value of the topabs_shapeenum enumeration that corresponds to this shape, for example vertex, edge, and so on. exceptions standard_nullobject if this shape is null.

	:rtype: TopAbs_ShapeEnum
") ShapeType;
		TopAbs_ShapeEnum ShapeType();

		/****************** TShape ******************/
		%feature("compactdefaultargs") TShape;
		%feature("autodoc", "Returns a handle to the actual shape implementation.

	:rtype: opencascade::handle<TopoDS_TShape>
") TShape;
		const opencascade::handle<TopoDS_TShape> TShape();

		/****************** TShape ******************/
		%feature("compactdefaultargs") TShape;
		%feature("autodoc", "	:param theTShape:
	:type theTShape: TopoDS_TShape
	:rtype: None
") TShape;
		void TShape(const opencascade::handle<TopoDS_TShape> & theTShape);

		/****************** TopoDS_Shape ******************/
		%feature("compactdefaultargs") TopoDS_Shape;
		%feature("autodoc", "Creates a null shape referring to nothing.

	:rtype: None
") TopoDS_Shape;
		 TopoDS_Shape();


            %extend{
                bool __ne_wrapper__(const TopoDS_Shape other) {
                if (*self!=other) return true;
                else return false;
                }
            }
            %pythoncode {
            def __ne__(self, right):
                try:
                    return self.__ne_wrapper__(right)
                except:
                    return True
            }

            %extend{
                bool __eq_wrapper__(const TopoDS_Shape other) {
                if (*self==other) return true;
                else return false;
                }
            }
            %pythoncode {
            def __eq__(self, right):
                try:
                    return self.__eq_wrapper__(right)
                except:
                    return False
            }
};


%extend TopoDS_Shape {
%pythoncode {
	def __getstate__(self):
		from .BRepTools import BRepTools_ShapeSet
		ss = BRepTools_ShapeSet()
		ss.Add(self)
		str_shape = ss.WriteToString()
		indx = ss.Locations().Index(self.Location())
		return str_shape, indx
	def __setstate__(self, state):
		from .BRepTools import BRepTools_ShapeSet
		topods_str, indx = state
		ss = BRepTools_ShapeSet()
		ss.ReadFromString(topods_str)
		the_shape = ss.Shape(ss.NbShapes())
		location = ss.Locations().Location(indx)
		the_shape.Location(location)
		self.this = the_shape.this
	}
};
%extend TopoDS_Shape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class TopoDS_TShape *
**********************/
%nodefaultctor TopoDS_TShape;
class TopoDS_TShape : public Standard_Transient {
	public:
		/****************** Checked ******************/
		%feature("compactdefaultargs") Checked;
		%feature("autodoc", "Returns the checked flag.

	:rtype: bool
") Checked;
		Standard_Boolean Checked();

		/****************** Checked ******************/
		%feature("compactdefaultargs") Checked;
		%feature("autodoc", "Sets the checked flag.

	:param theIsChecked:
	:type theIsChecked: bool
	:rtype: None
") Checked;
		void Checked(Standard_Boolean theIsChecked);

		/****************** Closed ******************/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "Returns the closedness flag.

	:rtype: bool
") Closed;
		Standard_Boolean Closed();

		/****************** Closed ******************/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "Sets the closedness flag.

	:param theIsClosed:
	:type theIsClosed: bool
	:rtype: None
") Closed;
		void Closed(Standard_Boolean theIsClosed);

		/****************** Convex ******************/
		%feature("compactdefaultargs") Convex;
		%feature("autodoc", "Returns the convexness flag.

	:rtype: bool
") Convex;
		Standard_Boolean Convex();

		/****************** Convex ******************/
		%feature("compactdefaultargs") Convex;
		%feature("autodoc", "Sets the convexness flag.

	:param theIsConvex:
	:type theIsConvex: bool
	:rtype: None
") Convex;
		void Convex(Standard_Boolean theIsConvex);


            %feature("autodoc", "1");
            %extend{
                std::string DumpJsonToString(int depth=-1) {
                std::stringstream s;
                self->DumpJson(s, depth);
                return s.str();}
            };
		/****************** EmptyCopy ******************/
		%feature("compactdefaultargs") EmptyCopy;
		%feature("autodoc", "Returns a copy of the tshape with no sub-shapes.

	:rtype: opencascade::handle<TopoDS_TShape>
") EmptyCopy;
		virtual opencascade::handle<TopoDS_TShape> EmptyCopy();

		/****************** Free ******************/
		%feature("compactdefaultargs") Free;
		%feature("autodoc", "Returns the free flag.

	:rtype: bool
") Free;
		Standard_Boolean Free();

		/****************** Free ******************/
		%feature("compactdefaultargs") Free;
		%feature("autodoc", "Sets the free flag.

	:param theIsFree:
	:type theIsFree: bool
	:rtype: None
") Free;
		void Free(Standard_Boolean theIsFree);

		/****************** Infinite ******************/
		%feature("compactdefaultargs") Infinite;
		%feature("autodoc", "Returns the infinity flag.

	:rtype: bool
") Infinite;
		Standard_Boolean Infinite();

		/****************** Infinite ******************/
		%feature("compactdefaultargs") Infinite;
		%feature("autodoc", "Sets the infinity flag.

	:param theIsInfinite:
	:type theIsInfinite: bool
	:rtype: None
") Infinite;
		void Infinite(Standard_Boolean theIsInfinite);

		/****************** Locked ******************/
		%feature("compactdefaultargs") Locked;
		%feature("autodoc", "Returns the locked flag.

	:rtype: bool
") Locked;
		Standard_Boolean Locked();

		/****************** Locked ******************/
		%feature("compactdefaultargs") Locked;
		%feature("autodoc", "Sets the locked flag.

	:param theIsLocked:
	:type theIsLocked: bool
	:rtype: None
") Locked;
		void Locked(Standard_Boolean theIsLocked);

		/****************** Modified ******************/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "Returns the modification flag.

	:rtype: bool
") Modified;
		Standard_Boolean Modified();

		/****************** Modified ******************/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "Sets the modification flag.

	:param theIsModified:
	:type theIsModified: bool
	:rtype: None
") Modified;
		void Modified(Standard_Boolean theIsModified);

		/****************** NbChildren ******************/
		%feature("compactdefaultargs") NbChildren;
		%feature("autodoc", "Returns the number of direct sub-shapes (children). @sa topods_iterator for accessing sub-shapes.

	:rtype: int
") NbChildren;
		Standard_Integer NbChildren();

		/****************** Orientable ******************/
		%feature("compactdefaultargs") Orientable;
		%feature("autodoc", "Returns the orientability flag.

	:rtype: bool
") Orientable;
		Standard_Boolean Orientable();

		/****************** Orientable ******************/
		%feature("compactdefaultargs") Orientable;
		%feature("autodoc", "Sets the orientability flag.

	:param theIsOrientable:
	:type theIsOrientable: bool
	:rtype: None
") Orientable;
		void Orientable(Standard_Boolean theIsOrientable);

		/****************** ShapeType ******************/
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "Returns the type as a term of the shapeenum enum : vertex, edge, wire, face, ....

	:rtype: TopAbs_ShapeEnum
") ShapeType;
		virtual TopAbs_ShapeEnum ShapeType();

};


%make_alias(TopoDS_TShape)

%extend TopoDS_TShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class TopoDS_CompSolid *
*************************/
class TopoDS_CompSolid : public TopoDS_Shape {
	public:
		/****************** TopoDS_CompSolid ******************/
		%feature("compactdefaultargs") TopoDS_CompSolid;
		%feature("autodoc", "Constructs an undefined compsolid.

	:rtype: None
") TopoDS_CompSolid;
		 TopoDS_CompSolid();

};


%extend TopoDS_CompSolid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class TopoDS_Compound *
************************/
class TopoDS_Compound : public TopoDS_Shape {
	public:
		/****************** TopoDS_Compound ******************/
		%feature("compactdefaultargs") TopoDS_Compound;
		%feature("autodoc", "Constructs an undefined compound.

	:rtype: None
") TopoDS_Compound;
		 TopoDS_Compound();

};


%extend TopoDS_Compound {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class TopoDS_Edge *
********************/
class TopoDS_Edge : public TopoDS_Shape {
	public:
		/****************** TopoDS_Edge ******************/
		%feature("compactdefaultargs") TopoDS_Edge;
		%feature("autodoc", "Undefined edge.

	:rtype: None
") TopoDS_Edge;
		 TopoDS_Edge();

};


%extend TopoDS_Edge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class TopoDS_Face *
********************/
class TopoDS_Face : public TopoDS_Shape {
	public:
		/****************** TopoDS_Face ******************/
		%feature("compactdefaultargs") TopoDS_Face;
		%feature("autodoc", "Undefined face.

	:rtype: None
") TopoDS_Face;
		 TopoDS_Face();

};


%extend TopoDS_Face {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class TopoDS_Shell *
*********************/
class TopoDS_Shell : public TopoDS_Shape {
	public:
		/****************** TopoDS_Shell ******************/
		%feature("compactdefaultargs") TopoDS_Shell;
		%feature("autodoc", "Constructs an undefined shell.

	:rtype: None
") TopoDS_Shell;
		 TopoDS_Shell();

};


%extend TopoDS_Shell {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class TopoDS_Solid *
*********************/
class TopoDS_Solid : public TopoDS_Shape {
	public:
		/****************** TopoDS_Solid ******************/
		%feature("compactdefaultargs") TopoDS_Solid;
		%feature("autodoc", "Constructs an undefined solid.

	:rtype: None
") TopoDS_Solid;
		 TopoDS_Solid();

};


%extend TopoDS_Solid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class TopoDS_TCompSolid *
**************************/
class TopoDS_TCompSolid : public TopoDS_TShape {
	public:
		/****************** EmptyCopy ******************/
		%feature("compactdefaultargs") EmptyCopy;
		%feature("autodoc", "Returns an empty tcompsolid.

	:rtype: opencascade::handle<TopoDS_TShape>
") EmptyCopy;
		opencascade::handle<TopoDS_TShape> EmptyCopy();

		/****************** ShapeType ******************/
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "Returns compsolid.

	:rtype: TopAbs_ShapeEnum
") ShapeType;
		TopAbs_ShapeEnum ShapeType();

		/****************** TopoDS_TCompSolid ******************/
		%feature("compactdefaultargs") TopoDS_TCompSolid;
		%feature("autodoc", "Creates an empty tcompsolid.

	:rtype: None
") TopoDS_TCompSolid;
		 TopoDS_TCompSolid();

};


%make_alias(TopoDS_TCompSolid)

%extend TopoDS_TCompSolid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class TopoDS_TCompound *
*************************/
class TopoDS_TCompound : public TopoDS_TShape {
	public:
		/****************** EmptyCopy ******************/
		%feature("compactdefaultargs") EmptyCopy;
		%feature("autodoc", "Returns an empty tcompound.

	:rtype: opencascade::handle<TopoDS_TShape>
") EmptyCopy;
		opencascade::handle<TopoDS_TShape> EmptyCopy();

		/****************** ShapeType ******************/
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "Returns compound.

	:rtype: TopAbs_ShapeEnum
") ShapeType;
		TopAbs_ShapeEnum ShapeType();

		/****************** TopoDS_TCompound ******************/
		%feature("compactdefaultargs") TopoDS_TCompound;
		%feature("autodoc", "Creates an empty tcompound.

	:rtype: None
") TopoDS_TCompound;
		 TopoDS_TCompound();

};


%make_alias(TopoDS_TCompound)

%extend TopoDS_TCompound {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class TopoDS_TEdge *
*********************/
%nodefaultctor TopoDS_TEdge;
class TopoDS_TEdge : public TopoDS_TShape {
	public:
		/****************** ShapeType ******************/
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "Returns edge.

	:rtype: TopAbs_ShapeEnum
") ShapeType;
		TopAbs_ShapeEnum ShapeType();

};


%make_alias(TopoDS_TEdge)

%extend TopoDS_TEdge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class TopoDS_TFace *
*********************/
class TopoDS_TFace : public TopoDS_TShape {
	public:
		/****************** EmptyCopy ******************/
		%feature("compactdefaultargs") EmptyCopy;
		%feature("autodoc", "Returns an empty tface.

	:rtype: opencascade::handle<TopoDS_TShape>
") EmptyCopy;
		virtual opencascade::handle<TopoDS_TShape> EmptyCopy();

		/****************** ShapeType ******************/
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "Returns face.

	:rtype: TopAbs_ShapeEnum
") ShapeType;
		TopAbs_ShapeEnum ShapeType();

		/****************** TopoDS_TFace ******************/
		%feature("compactdefaultargs") TopoDS_TFace;
		%feature("autodoc", "Creates an empty tface.

	:rtype: None
") TopoDS_TFace;
		 TopoDS_TFace();

};


%make_alias(TopoDS_TFace)

%extend TopoDS_TFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class TopoDS_TShell *
**********************/
class TopoDS_TShell : public TopoDS_TShape {
	public:
		/****************** EmptyCopy ******************/
		%feature("compactdefaultargs") EmptyCopy;
		%feature("autodoc", "Returns an empty tshell.

	:rtype: opencascade::handle<TopoDS_TShape>
") EmptyCopy;
		opencascade::handle<TopoDS_TShape> EmptyCopy();

		/****************** ShapeType ******************/
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "Returns shell.

	:rtype: TopAbs_ShapeEnum
") ShapeType;
		TopAbs_ShapeEnum ShapeType();

		/****************** TopoDS_TShell ******************/
		%feature("compactdefaultargs") TopoDS_TShell;
		%feature("autodoc", "Creates an empty tshell.

	:rtype: None
") TopoDS_TShell;
		 TopoDS_TShell();

};


%make_alias(TopoDS_TShell)

%extend TopoDS_TShell {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class TopoDS_TSolid *
**********************/
class TopoDS_TSolid : public TopoDS_TShape {
	public:
		/****************** EmptyCopy ******************/
		%feature("compactdefaultargs") EmptyCopy;
		%feature("autodoc", "Returns an empty tsolid.

	:rtype: opencascade::handle<TopoDS_TShape>
") EmptyCopy;
		opencascade::handle<TopoDS_TShape> EmptyCopy();

		/****************** ShapeType ******************/
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "Returns solid.

	:rtype: TopAbs_ShapeEnum
") ShapeType;
		TopAbs_ShapeEnum ShapeType();

		/****************** TopoDS_TSolid ******************/
		%feature("compactdefaultargs") TopoDS_TSolid;
		%feature("autodoc", "Creates an empty tsolid.

	:rtype: None
") TopoDS_TSolid;
		 TopoDS_TSolid();

};


%make_alias(TopoDS_TSolid)

%extend TopoDS_TSolid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class TopoDS_TVertex *
***********************/
%nodefaultctor TopoDS_TVertex;
class TopoDS_TVertex : public TopoDS_TShape {
	public:
		/****************** ShapeType ******************/
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "Returns vertex.

	:rtype: TopAbs_ShapeEnum
") ShapeType;
		TopAbs_ShapeEnum ShapeType();

};


%make_alias(TopoDS_TVertex)

%extend TopoDS_TVertex {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class TopoDS_TWire *
*********************/
class TopoDS_TWire : public TopoDS_TShape {
	public:
		/****************** EmptyCopy ******************/
		%feature("compactdefaultargs") EmptyCopy;
		%feature("autodoc", "Returns an empty twire.

	:rtype: opencascade::handle<TopoDS_TShape>
") EmptyCopy;
		opencascade::handle<TopoDS_TShape> EmptyCopy();

		/****************** ShapeType ******************/
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "Returns wire.

	:rtype: TopAbs_ShapeEnum
") ShapeType;
		TopAbs_ShapeEnum ShapeType();

		/****************** TopoDS_TWire ******************/
		%feature("compactdefaultargs") TopoDS_TWire;
		%feature("autodoc", "Creates an empty twire.

	:rtype: None
") TopoDS_TWire;
		 TopoDS_TWire();

};


%make_alias(TopoDS_TWire)

%extend TopoDS_TWire {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class TopoDS_Vertex *
**********************/
class TopoDS_Vertex : public TopoDS_Shape {
	public:
		%feature("autodoc", "1");
		TopoDS_Vertex(const TopoDS_Vertex arg0);
		/****************** TopoDS_Vertex ******************/
		%feature("compactdefaultargs") TopoDS_Vertex;
		%feature("autodoc", "Undefined vertex.

	:rtype: None
") TopoDS_Vertex;
		 TopoDS_Vertex();

};


%extend TopoDS_Vertex {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class TopoDS_Wire *
********************/
class TopoDS_Wire : public TopoDS_Shape {
	public:
		/****************** TopoDS_Wire ******************/
		%feature("compactdefaultargs") TopoDS_Wire;
		%feature("autodoc", "Undefined wire.

	:rtype: None
") TopoDS_Wire;
		 TopoDS_Wire();

};


%extend TopoDS_Wire {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */

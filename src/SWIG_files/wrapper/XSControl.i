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
%define XSCONTROLDOCSTRING
"XSControl module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_xscontrol.html"
%enddef
%module (package="OCC.Core", docstring=XSCONTROLDOCSTRING) XSControl


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
#include<XSControl_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<IFSelect_module.hxx>
#include<TopoDS_module.hxx>
#include<Transfer_module.hxx>
#include<TopAbs_module.hxx>
#include<TColStd_module.hxx>
#include<Interface_module.hxx>
#include<TCollection_module.hxx>
#include<TopTools_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<gp_module.hxx>
#include<Message_module.hxx>
#include<Message_module.hxx>
#include<TopLoc_module.hxx>
#include<Transfer_module.hxx>
#include<MoniTool_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import IFSelect.i
%import TopoDS.i
%import Transfer.i
%import TopAbs.i
%import TColStd.i
%import Interface.i
%import TCollection.i
%import TopTools.i
%import Geom.i
%import Geom2d.i
%import gp.i
%import Message.i
/* public enums */
/* end public enums declaration */

/* handles */
%wrap_handle(XSControl_ConnectedShapes)
%wrap_handle(XSControl_Controller)
%wrap_handle(XSControl_SelectForTransfer)
%wrap_handle(XSControl_SignTransferStatus)
%wrap_handle(XSControl_TransferReader)
%wrap_handle(XSControl_TransferWriter)
%wrap_handle(XSControl_Vars)
%wrap_handle(XSControl_WorkSession)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/******************
* class XSControl *
******************/
%rename(xscontrol) XSControl;
class XSControl {
	public:
		/****************** Session ******************/
		%feature("compactdefaultargs") Session;
		%feature("autodoc", "Returns the worksession of a sessionpilot, but casts it as from xscontrol : it then gives access to control & transfers.

	:param pilot:
	:type pilot: IFSelect_SessionPilot
	:rtype: opencascade::handle<XSControl_WorkSession>
") Session;
		static opencascade::handle<XSControl_WorkSession> Session(const opencascade::handle<IFSelect_SessionPilot> & pilot);

		/****************** Vars ******************/
		%feature("compactdefaultargs") Vars;
		%feature("autodoc", "Returns the vars of a sessionpilot, it is brought by session it provides access to external variables.

	:param pilot:
	:type pilot: IFSelect_SessionPilot
	:rtype: opencascade::handle<XSControl_Vars>
") Vars;
		static opencascade::handle<XSControl_Vars> Vars(const opencascade::handle<IFSelect_SessionPilot> & pilot);

};


%extend XSControl {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class XSControl_ConnectedShapes *
**********************************/
class XSControl_ConnectedShapes : public IFSelect_SelectExplore {
	public:
		/****************** AdjacentEntities ******************/
		%feature("compactdefaultargs") AdjacentEntities;
		%feature("autodoc", "This functions considers a shape from a transfer and performs the search function explained above.

	:param ashape:
	:type ashape: TopoDS_Shape
	:param TP:
	:type TP: Transfer_TransientProcess
	:param type:
	:type type: TopAbs_ShapeEnum
	:rtype: opencascade::handle<TColStd_HSequenceOfTransient>
") AdjacentEntities;
		static opencascade::handle<TColStd_HSequenceOfTransient> AdjacentEntities(const TopoDS_Shape & ashape, const opencascade::handle<Transfer_TransientProcess> & TP, const TopAbs_ShapeEnum type);

		/****************** Explore ******************/
		%feature("compactdefaultargs") Explore;
		%feature("autodoc", "Explores an entity : entities from which are connected to that produced by this entity, including itself.

	:param level:
	:type level: int
	:param ent:
	:type ent: Standard_Transient
	:param G:
	:type G: Interface_Graph
	:param explored:
	:type explored: Interface_EntityIterator
	:rtype: bool
") Explore;
		Standard_Boolean Explore(const Standard_Integer level, const opencascade::handle<Standard_Transient> & ent, const Interface_Graph & G, Interface_EntityIterator & explored);

		/****************** ExploreLabel ******************/
		%feature("compactdefaultargs") ExploreLabel;
		%feature("autodoc", "Returns a text defining the criterium. 'connected entities through produced shapes'.

	:rtype: TCollection_AsciiString
") ExploreLabel;
		TCollection_AsciiString ExploreLabel();

		/****************** SetReader ******************/
		%feature("compactdefaultargs") SetReader;
		%feature("autodoc", "Sets a transferreader to sort entities : it brings the transferprocess which may change, while the transferreader does not.

	:param TR:
	:type TR: XSControl_TransferReader
	:rtype: None
") SetReader;
		void SetReader(const opencascade::handle<XSControl_TransferReader> & TR);

		/****************** XSControl_ConnectedShapes ******************/
		%feature("compactdefaultargs") XSControl_ConnectedShapes;
		%feature("autodoc", "Creates a selection connectedshapes. it remains to be set a transferreader.

	:rtype: None
") XSControl_ConnectedShapes;
		 XSControl_ConnectedShapes();

		/****************** XSControl_ConnectedShapes ******************/
		%feature("compactdefaultargs") XSControl_ConnectedShapes;
		%feature("autodoc", "Creates a selection connectedshapes, which will work with the current transferprocess brought by the transferreader.

	:param TR:
	:type TR: XSControl_TransferReader
	:rtype: None
") XSControl_ConnectedShapes;
		 XSControl_ConnectedShapes(const opencascade::handle<XSControl_TransferReader> & TR);

};


%make_alias(XSControl_ConnectedShapes)

%extend XSControl_ConnectedShapes {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class XSControl_Controller *
*****************************/
%nodefaultctor XSControl_Controller;
class XSControl_Controller : public Standard_Transient {
	public:
		/****************** ActorRead ******************/
		%feature("compactdefaultargs") ActorRead;
		%feature("autodoc", "Returns the actor for read attached to the pair (norm,appli) it can be adapted for data of the input model, as required can be read from field then adapted with model as required.

	:param model:
	:type model: Interface_InterfaceModel
	:rtype: opencascade::handle<Transfer_ActorOfTransientProcess>
") ActorRead;
		virtual opencascade::handle<Transfer_ActorOfTransientProcess> ActorRead(const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** ActorWrite ******************/
		%feature("compactdefaultargs") ActorWrite;
		%feature("autodoc", "Returns the actor for write attached to the pair (norm,appli) read from field. can be redefined.

	:rtype: opencascade::handle<Transfer_ActorOfFinderProcess>
") ActorWrite;
		virtual opencascade::handle<Transfer_ActorOfFinderProcess> ActorWrite();

		/****************** AdaptorSession ******************/
		%feature("compactdefaultargs") AdaptorSession;
		%feature("autodoc", "	:rtype: NCollection_DataMap<TCollection_AsciiString, opencascade::handle<Standard_Transient>>
") AdaptorSession;
		const NCollection_DataMap<TCollection_AsciiString, opencascade::handle<Standard_Transient>> & AdaptorSession();

		/****************** AddSessionItem ******************/
		%feature("compactdefaultargs") AddSessionItem;
		%feature("autodoc", "Records a session item, to be added for customisation of the work session. it must have a specific name. <setapplied> is used if <item> is a generalmodifier, to decide if set to true, <item> will be applied to the hook list 'send'. else, it is not applied to any hook list. remark : this method is to be called at create time, the recorded items will be used by customise warning : if <name> conflicts, the last recorded item is kept.

	:param theItem:
	:type theItem: Standard_Transient
	:param theName:
	:type theName: char *
	:param toApply: default value is Standard_False
	:type toApply: bool
	:rtype: None
") AddSessionItem;
		void AddSessionItem(const opencascade::handle<Standard_Transient> & theItem, const char * theName, const Standard_Boolean toApply = Standard_False);

		/****************** AutoRecord ******************/
		%feature("compactdefaultargs") AutoRecord;
		%feature("autodoc", "Records <self> is a general dictionary under short and long names (see method name).

	:rtype: None
") AutoRecord;
		void AutoRecord();

		/****************** Customise ******************/
		%feature("compactdefaultargs") Customise;
		%feature("autodoc", "Customises a worksession, by adding to it the recorded items (by addsessionitem).

	:param WS:
	:type WS: XSControl_WorkSession
	:rtype: None
") Customise;
		virtual void Customise(opencascade::handle<XSControl_WorkSession> & WS);

		/****************** IsModeWrite ******************/
		%feature("compactdefaultargs") IsModeWrite;
		%feature("autodoc", "Tells if a value of <modetrans> is a good value(within bounds) actually only for shapes.

	:param modetrans:
	:type modetrans: int
	:param shape: default value is Standard_True
	:type shape: bool
	:rtype: bool
") IsModeWrite;
		Standard_Boolean IsModeWrite(const Standard_Integer modetrans, const Standard_Boolean shape = Standard_True);

		/****************** ModeWriteBounds ******************/
		%feature("compactdefaultargs") ModeWriteBounds;
		%feature("autodoc", "Returns recorded min and max values for modetrans (write) actually only for shapes returns true if bounds are set, false else (then, free value).

	:param modemin:
	:type modemin: int
	:param modemax:
	:type modemax: int
	:param shape: default value is Standard_True
	:type shape: bool
	:rtype: bool
") ModeWriteBounds;
		Standard_Boolean ModeWriteBounds(Standard_Integer &OutValue, Standard_Integer &OutValue, const Standard_Boolean shape = Standard_True);

		/****************** ModeWriteHelp ******************/
		%feature("compactdefaultargs") ModeWriteHelp;
		%feature("autodoc", "Returns the help line recorded for a value of modetrans empty if help not defined or not within bounds or if values are free.

	:param modetrans:
	:type modetrans: int
	:param shape: default value is Standard_True
	:type shape: bool
	:rtype: char *
") ModeWriteHelp;
		const char * ModeWriteHelp(const Standard_Integer modetrans, const Standard_Boolean shape = Standard_True);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns a name, as given when initializing : rsc = false (d) : true name attached to the norm (long name) rsc = true : name of the ressource set (i.e. short name).

	:param rsc: default value is Standard_False
	:type rsc: bool
	:rtype: char *
") Name;
		const char * Name(const Standard_Boolean rsc = Standard_False);

		/****************** NewModel ******************/
		%feature("compactdefaultargs") NewModel;
		%feature("autodoc", "Creates a new empty model ready to receive data of the norm used to write data from imagine to an interface file.

	:rtype: opencascade::handle<Interface_InterfaceModel>
") NewModel;
		virtual opencascade::handle<Interface_InterfaceModel> NewModel();

		/****************** Protocol ******************/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Returns the protocol attached to the norm (from field).

	:rtype: opencascade::handle<Interface_Protocol>
") Protocol;
		const opencascade::handle<Interface_Protocol> & Protocol();

		/****************** RecognizeWriteShape ******************/
		%feature("compactdefaultargs") RecognizeWriteShape;
		%feature("autodoc", "Tells if a shape is valid for a transfer to a model asks the actorwrite (through a shapemapper).

	:param shape:
	:type shape: TopoDS_Shape
	:param modetrans: default value is 0
	:type modetrans: int
	:rtype: bool
") RecognizeWriteShape;
		virtual Standard_Boolean RecognizeWriteShape(const TopoDS_Shape & shape, const Standard_Integer modetrans = 0);

		/****************** RecognizeWriteTransient ******************/
		%feature("compactdefaultargs") RecognizeWriteTransient;
		%feature("autodoc", "Tells if <obj> (an application object) is a valid candidate for a transfer to a model. by default, asks the actorwrite if known (through a transientmapper). can be redefined.

	:param obj:
	:type obj: Standard_Transient
	:param modetrans: default value is 0
	:type modetrans: int
	:rtype: bool
") RecognizeWriteTransient;
		virtual Standard_Boolean RecognizeWriteTransient(const opencascade::handle<Standard_Transient> & obj, const Standard_Integer modetrans = 0);

		/****************** Record ******************/
		%feature("compactdefaultargs") Record;
		%feature("autodoc", "Records <self> in a general dictionary under a name error if <name> already used for another one.

	:param name:
	:type name: char *
	:rtype: None
") Record;
		void Record(const char * name);

		/****************** Recorded ******************/
		%feature("compactdefaultargs") Recorded;
		%feature("autodoc", "Returns the controller attached to a given name returns a null handle if <name> is unknown.

	:param name:
	:type name: char *
	:rtype: opencascade::handle<XSControl_Controller>
") Recorded;
		static opencascade::handle<XSControl_Controller> Recorded(const char * name);

		/****************** SessionItem ******************/
		%feature("compactdefaultargs") SessionItem;
		%feature("autodoc", "Returns an item given its name to record in a session if <name> is unknown, returns a null handle.

	:param theName:
	:type theName: char *
	:rtype: opencascade::handle<Standard_Transient>
") SessionItem;
		opencascade::handle<Standard_Transient> SessionItem(const char * theName);

		/****************** SetModeWrite ******************/
		%feature("compactdefaultargs") SetModeWrite;
		%feature("autodoc", "Sets mininum and maximum values for modetrans (write) erases formerly recorded bounds and values actually only for shape then, for each value a little help can be attached.

	:param modemin:
	:type modemin: int
	:param modemax:
	:type modemax: int
	:param shape: default value is Standard_True
	:type shape: bool
	:rtype: None
") SetModeWrite;
		void SetModeWrite(const Standard_Integer modemin, const Standard_Integer modemax, const Standard_Boolean shape = Standard_True);

		/****************** SetModeWriteHelp ******************/
		%feature("compactdefaultargs") SetModeWriteHelp;
		%feature("autodoc", "Attaches a short line of help to a value of modetrans (write).

	:param modetrans:
	:type modetrans: int
	:param help:
	:type help: char *
	:param shape: default value is Standard_True
	:type shape: bool
	:rtype: None
") SetModeWriteHelp;
		void SetModeWriteHelp(const Standard_Integer modetrans, const char * help, const Standard_Boolean shape = Standard_True);

		/****************** SetNames ******************/
		%feature("compactdefaultargs") SetNames;
		%feature("autodoc", "Changes names if a name is empty, the formerly set one remains remark : does not call record or autorecord.

	:param theLongName:
	:type theLongName: char *
	:param theShortName:
	:type theShortName: char *
	:rtype: None
") SetNames;
		void SetNames(const char * theLongName, const char * theShortName);

		/****************** TransferWriteShape ******************/
		%feature("compactdefaultargs") TransferWriteShape;
		%feature("autodoc", "Takes one shape and transfers it to an interfacemodel (already created, e.g. by newmodel) default uses actorwrite; can be redefined as necessary returned value is a status, as follows : done ok , void : no result , fail : fail (e.g. exception) error : bad conditions , bad model or null model.

	:param shape:
	:type shape: TopoDS_Shape
	:param FP:
	:type FP: Transfer_FinderProcess
	:param model:
	:type model: Interface_InterfaceModel
	:param modetrans: default value is 0
	:type modetrans: int
	:rtype: IFSelect_ReturnStatus
") TransferWriteShape;
		virtual IFSelect_ReturnStatus TransferWriteShape(const TopoDS_Shape & shape, const opencascade::handle<Transfer_FinderProcess> & FP, const opencascade::handle<Interface_InterfaceModel> & model, const Standard_Integer modetrans = 0);

		/****************** TransferWriteTransient ******************/
		%feature("compactdefaultargs") TransferWriteTransient;
		%feature("autodoc", "Takes one transient object and transfers it to an interfacemodel (already created, e.g. by newmodel) (result is recorded in the model by addwithrefs) fp records produced results and checks //! default uses actorwrite; can be redefined as necessary returned value is a status, as follows : 0 ok , 1 no result , 2 fail (e.g. exception raised) -1 bad conditions , -2 bad model or null model for type of object not recognized : should return 1.

	:param obj:
	:type obj: Standard_Transient
	:param FP:
	:type FP: Transfer_FinderProcess
	:param model:
	:type model: Interface_InterfaceModel
	:param modetrans: default value is 0
	:type modetrans: int
	:rtype: IFSelect_ReturnStatus
") TransferWriteTransient;
		virtual IFSelect_ReturnStatus TransferWriteTransient(const opencascade::handle<Standard_Transient> & obj, const opencascade::handle<Transfer_FinderProcess> & FP, const opencascade::handle<Interface_InterfaceModel> & model, const Standard_Integer modetrans = 0);

		/****************** WorkLibrary ******************/
		%feature("compactdefaultargs") WorkLibrary;
		%feature("autodoc", "Returns the worklibrary attached to the norm. remark that it has to be in phase with the protocol (read from field).

	:rtype: opencascade::handle<IFSelect_WorkLibrary>
") WorkLibrary;
		const opencascade::handle<IFSelect_WorkLibrary> & WorkLibrary();

};


%make_alias(XSControl_Controller)

%extend XSControl_Controller {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class XSControl_FuncShape *
****************************/
class XSControl_FuncShape {
	public:
		/****************** FileAndVar ******************/
		%feature("compactdefaultargs") FileAndVar;
		%feature("autodoc", "Analyses given file name and variable name, with a default name for variables. returns resulting file name and variable name plus status 'file to read'(true) or 'already read'(false) in the latter case, empty resfile means no file available //! if <file> is null or empty or equates '.', considers session and returned status is false else, returns resfile = file and status is true if <var> is neither null nor empty, resvar = var else, the root part of <resfile> is considered, if defined else, <def> is taken.

	:param session:
	:type session: XSControl_WorkSession
	:param file:
	:type file: char *
	:param var:
	:type var: char *
	:param def:
	:type def: char *
	:param resfile:
	:type resfile: TCollection_AsciiString
	:param resvar:
	:type resvar: TCollection_AsciiString
	:rtype: bool
") FileAndVar;
		static Standard_Boolean FileAndVar(const opencascade::handle<XSControl_WorkSession> & session, const char * file, const char * var, const char * def, TCollection_AsciiString & resfile, TCollection_AsciiString & resvar);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Defines and loads all functions which work on shapes for xscontrol (as actfunc).

	:rtype: None
") Init;
		static void Init();

		/****************** MoreShapes ******************/
		%feature("compactdefaultargs") MoreShapes;
		%feature("autodoc", "Analyses a name as designating shapes from a vars or from xstep transfer (last transfer on reading). <name> can be : '*' : all the root shapes produced by last transfer (read) i.e. considers roots of the transientprocess a name : a name of a variable draw //! returns the count of designated shapes. their list is put in <list>. if <list> is null, it is firstly created. then it is completed (append without clear) by the shapes found returns 0 if no shape could be found.

	:param session:
	:type session: XSControl_WorkSession
	:param list:
	:type list: TopTools_HSequenceOfShape
	:param name:
	:type name: char *
	:rtype: int
") MoreShapes;
		static Standard_Integer MoreShapes(const opencascade::handle<XSControl_WorkSession> & session, opencascade::handle<TopTools_HSequenceOfShape> & list, const char * name);

};


%extend XSControl_FuncShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class XSControl_Functions *
****************************/
class XSControl_Functions {
	public:
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Defines and loads all functions for xscontrol (as actfunc).

	:rtype: None
") Init;
		static void Init();

};


%extend XSControl_Functions {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class XSControl_Reader *
*************************/
class XSControl_Reader {
	public:
		/****************** ClearShapes ******************/
		%feature("compactdefaultargs") ClearShapes;
		%feature("autodoc", "Clears the list of shapes that may have accumulated in calls to transferone or transferroot.c.

	:rtype: None
") ClearShapes;
		void ClearShapes();

		/****************** GetStatsTransfer ******************/
		%feature("compactdefaultargs") GetStatsTransfer;
		%feature("autodoc", "Gives statistics about transfer.

	:param list:
	:type list: TColStd_HSequenceOfTransient
	:param nbMapped:
	:type nbMapped: int
	:param nbWithResult:
	:type nbWithResult: int
	:param nbWithFail:
	:type nbWithFail: int
	:rtype: None
") GetStatsTransfer;
		void GetStatsTransfer(const opencascade::handle<TColStd_HSequenceOfTransient> & list, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** GiveList ******************/
		%feature("compactdefaultargs") GiveList;
		%feature("autodoc", "Returns a list of entities from the iges or step file according to the following rules: - if first and second are empty strings, the whole file is selected. - if first is an entity number or label, the entity referred to is selected. - if first is a list of entity numbers/labels separated by commas, the entities referred to are selected, - if first is the name of a selection in the worksession and second is not defined, the list contains the standard output for that selection. - if first is the name of a selection and second is defined, the criterion defined by second is applied to the result of the first selection. a selection is an operator which computes a list of entities from a list given in input according to its type. if no list is specified, the selection computes its list of entities from the whole model. a selection can be: - a predefined selection (xst-transferrable-mode) - a filter based on a signature a signature is an operator which returns a string from an entity according to its type. for example: - 'xst-type' (cdl) - 'iges-level' - 'step-type'. for example, if you wanted to select only the advanced_faces in a step file you would use the following code: example reader.givelist('xst-transferrable-roots','step-type(advanced_face)'); warning if the value given to second is incorrect, it will simply be ignored.

	:param first: default value is ""
	:type first: char *
	:param second: default value is ""
	:type second: char *
	:rtype: opencascade::handle<TColStd_HSequenceOfTransient>
") GiveList;
		opencascade::handle<TColStd_HSequenceOfTransient> GiveList(const char * first = "", const char * second = "");

		/****************** GiveList ******************/
		%feature("compactdefaultargs") GiveList;
		%feature("autodoc", "Computes a list of entities from the model as follows <first> beeing a selection, <ent> beeing an entity or a list of entities (as a hsequenceoftransient) : the standard result of this selection applied to this list if <first> is erroneous, a null handle is returned.

	:param first:
	:type first: char *
	:param ent:
	:type ent: Standard_Transient
	:rtype: opencascade::handle<TColStd_HSequenceOfTransient>
") GiveList;
		opencascade::handle<TColStd_HSequenceOfTransient> GiveList(const char * first, const opencascade::handle<Standard_Transient> & ent);

		/****************** Model ******************/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "Returns the model. it can then be consulted (header, product).

	:rtype: opencascade::handle<Interface_InterfaceModel>
") Model;
		opencascade::handle<Interface_InterfaceModel> Model();

		/****************** NbRootsForTransfer ******************/
		%feature("compactdefaultargs") NbRootsForTransfer;
		%feature("autodoc", "Determines the list of root entities which are candidate for a transfer to a shape, and returns the number of entities in the list.

	:rtype: int
") NbRootsForTransfer;
		virtual Standard_Integer NbRootsForTransfer();

		/****************** NbShapes ******************/
		%feature("compactdefaultargs") NbShapes;
		%feature("autodoc", "Returns the number of shapes produced by translation.

	:rtype: int
") NbShapes;
		Standard_Integer NbShapes();

		/****************** OneShape ******************/
		%feature("compactdefaultargs") OneShape;
		%feature("autodoc", "Returns all of the results in a single shape which is: - a null shape if there are no results, - a shape if there is one result, - a compound containing the resulting shapes if there are more than one.

	:rtype: TopoDS_Shape
") OneShape;
		TopoDS_Shape OneShape();

		/****************** PrintCheckLoad ******************/
		%feature("compactdefaultargs") PrintCheckLoad;
		%feature("autodoc", "Prints the check list attached to loaded data, on the standard trace file (starts at std::cout) all messages or fails only, according to <failsonly> mode = 0 : per entity, prints messages mode = 1 : per message, just gives count of entities per check mode = 2 : also gives entity numbers.

	:param failsonly:
	:type failsonly: bool
	:param mode:
	:type mode: IFSelect_PrintCount
	:rtype: None
") PrintCheckLoad;
		void PrintCheckLoad(const Standard_Boolean failsonly, const IFSelect_PrintCount mode);

		/****************** PrintCheckTransfer ******************/
		%feature("compactdefaultargs") PrintCheckTransfer;
		%feature("autodoc", "Displays check results for the last translation of iges or step entities to open cascade entities. only fail messages are displayed if failsonly is true. all messages are displayed if failsonly is false. mode determines the contents and the order of the messages according to the terms of the ifselect_printcount enumeration.

	:param failsonly:
	:type failsonly: bool
	:param mode:
	:type mode: IFSelect_PrintCount
	:rtype: None
") PrintCheckTransfer;
		void PrintCheckTransfer(const Standard_Boolean failsonly, const IFSelect_PrintCount mode);

		/****************** PrintStatsTransfer ******************/
		%feature("compactdefaultargs") PrintStatsTransfer;
		%feature("autodoc", "Displays the statistics for the last translation. what defines the kind of statistics that are displayed as follows: - 0 gives general statistics (number of translated roots, number of warnings, number of fail messages), - 1 gives root results, - 2 gives statistics for all checked entities, - 3 gives the list of translated entities, - 4 gives warning and fail messages, - 5 gives fail messages only. the use of mode depends on the value of what. if what is 0, mode is ignored. if what is 1, 2 or 3, mode defines the following: - 0 lists the numbers of iges or step entities in the respective model - 1 gives the number, identifier, type and result type for each iges or step entity and/or its status (fail, warning, etc.) - 2 gives maximum information for each iges or step entity (i.e. checks) - 3 gives the number of entities per type of iges or step entity - 4 gives the number of iges or step entities per result type and/or status - 5 gives the number of pairs (iges or step or result type and status) - 6 gives the number of pairs (iges or step or result type and status) and the list of entity numbers in the iges or step model. if what is 4 or 5, mode defines the warning and fail messages as follows: - if mode is 0 all warnings and checks per entity are returned - if mode is 2 the list of entities per warning is returned. if mode is not set, only the list of all entities per warning is given.

	:param what:
	:type what: int
	:param mode: default value is 0
	:type mode: int
	:rtype: None
") PrintStatsTransfer;
		void PrintStatsTransfer(const Standard_Integer what, const Standard_Integer mode = 0);

		/****************** ReadFile ******************/
		%feature("compactdefaultargs") ReadFile;
		%feature("autodoc", "Loads a file and returns the read status zero for a model which compies with the controller.

	:param filename:
	:type filename: char *
	:rtype: IFSelect_ReturnStatus
") ReadFile;
		IFSelect_ReturnStatus ReadFile(const char * filename);

		/****************** RootForTransfer ******************/
		%feature("compactdefaultargs") RootForTransfer;
		%feature("autodoc", "Returns an iges or step root entity for translation. the entity is identified by its rank in a list.

	:param num: default value is 1
	:type num: int
	:rtype: opencascade::handle<Standard_Transient>
") RootForTransfer;
		opencascade::handle<Standard_Transient> RootForTransfer(const Standard_Integer num = 1);

		/****************** SetNorm ******************/
		%feature("compactdefaultargs") SetNorm;
		%feature("autodoc", "Sets a specific norm to <self> returns true if done, false if <norm> is not available.

	:param norm:
	:type norm: char *
	:rtype: bool
") SetNorm;
		Standard_Boolean SetNorm(const char * norm);

		/****************** SetWS ******************/
		%feature("compactdefaultargs") SetWS;
		%feature("autodoc", "Sets a specific session to <self>.

	:param WS:
	:type WS: XSControl_WorkSession
	:param scratch: default value is Standard_True
	:type scratch: bool
	:rtype: None
") SetWS;
		void SetWS(const opencascade::handle<XSControl_WorkSession> & WS, const Standard_Boolean scratch = Standard_True);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Returns the shape resulting from a translation and identified by the rank num. num equals 1 by default. in other words, the first shape resulting from the translation is returned.

	:param num: default value is 1
	:type num: int
	:rtype: TopoDS_Shape
") Shape;
		TopoDS_Shape Shape(const Standard_Integer num = 1);

		/****************** TransferEntity ******************/
		%feature("compactdefaultargs") TransferEntity;
		%feature("autodoc", "Translates an iges or step entity in the model. true is returned if a shape is produced; otherwise, false is returned.

	:param start:
	:type start: Standard_Transient
	:rtype: bool
") TransferEntity;
		Standard_Boolean TransferEntity(const opencascade::handle<Standard_Transient> & start);

		/****************** TransferList ******************/
		%feature("compactdefaultargs") TransferList;
		%feature("autodoc", "Translates a list of entities. returns the number of iges or step entities that were successfully translated. the list can be produced with givelist. warning - this function does not clear the existing output shapes.

	:param list:
	:type list: TColStd_HSequenceOfTransient
	:rtype: int
") TransferList;
		Standard_Integer TransferList(const opencascade::handle<TColStd_HSequenceOfTransient> & list);

		/****************** TransferOne ******************/
		%feature("compactdefaultargs") TransferOne;
		%feature("autodoc", "Translates an iges or step entity identified by the rank num in the model. false is returned if no shape is produced.

	:param num:
	:type num: int
	:rtype: bool
") TransferOne;
		Standard_Boolean TransferOne(const Standard_Integer num);

		/****************** TransferOneRoot ******************/
		%feature("compactdefaultargs") TransferOneRoot;
		%feature("autodoc", "Translates a root identified by the rank num in the model. false is returned if no shape is produced.

	:param num: default value is 1
	:type num: int
	:rtype: bool
") TransferOneRoot;
		Standard_Boolean TransferOneRoot(const Standard_Integer num = 1);

		/****************** TransferRoots ******************/
		%feature("compactdefaultargs") TransferRoots;
		%feature("autodoc", "Translates all translatable roots and returns the number of successful translations. warning - this function clears existing output shapes first.

	:rtype: int
") TransferRoots;
		Standard_Integer TransferRoots();

		/****************** WS ******************/
		%feature("compactdefaultargs") WS;
		%feature("autodoc", "Returns the session used in <self>.

	:rtype: opencascade::handle<XSControl_WorkSession>
") WS;
		opencascade::handle<XSControl_WorkSession> WS();

		/****************** XSControl_Reader ******************/
		%feature("compactdefaultargs") XSControl_Reader;
		%feature("autodoc", "Creates a reader from scratch (creates an empty worksession) a worksession or a controller must be provided before running.

	:rtype: None
") XSControl_Reader;
		 XSControl_Reader();

		/****************** XSControl_Reader ******************/
		%feature("compactdefaultargs") XSControl_Reader;
		%feature("autodoc", "Creates a reader from scratch, with a norm name which identifies a controller.

	:param norm:
	:type norm: char *
	:rtype: None
") XSControl_Reader;
		 XSControl_Reader(const char * norm);

		/****************** XSControl_Reader ******************/
		%feature("compactdefaultargs") XSControl_Reader;
		%feature("autodoc", "Creates a reader from an already existing session, with a controller already set virtual destructor.

	:param WS:
	:type WS: XSControl_WorkSession
	:param scratch: default value is Standard_True
	:type scratch: bool
	:rtype: None
") XSControl_Reader;
		 XSControl_Reader(const opencascade::handle<XSControl_WorkSession> & WS, const Standard_Boolean scratch = Standard_True);

};


%extend XSControl_Reader {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class XSControl_SelectForTransfer *
************************************/
class XSControl_SelectForTransfer : public IFSelect_SelectExtract {
	public:
		/****************** Actor ******************/
		%feature("compactdefaultargs") Actor;
		%feature("autodoc", "Returns the actor used as precised one. returns a null handle for a creation from a transferreader without any further setting.

	:rtype: opencascade::handle<Transfer_ActorOfTransientProcess>
") Actor;
		opencascade::handle<Transfer_ActorOfTransientProcess> Actor();

		/****************** ExtractLabel ******************/
		%feature("compactdefaultargs") ExtractLabel;
		%feature("autodoc", "Returns a text defining the criterium : 'recognized for transfer [(current actor)]'.

	:rtype: TCollection_AsciiString
") ExtractLabel;
		TCollection_AsciiString ExtractLabel();

		/****************** Reader ******************/
		%feature("compactdefaultargs") Reader;
		%feature("autodoc", "Returns the reader (if created with a reader) returns a null handle if not created with a reader.

	:rtype: opencascade::handle<XSControl_TransferReader>
") Reader;
		opencascade::handle<XSControl_TransferReader> Reader();

		/****************** SetActor ******************/
		%feature("compactdefaultargs") SetActor;
		%feature("autodoc", "Sets a precise actor to sort entities this definition oversedes the creation with a transferreader.

	:param act:
	:type act: Transfer_ActorOfTransientProcess
	:rtype: None
") SetActor;
		void SetActor(const opencascade::handle<Transfer_ActorOfTransientProcess> & act);

		/****************** SetReader ******************/
		%feature("compactdefaultargs") SetReader;
		%feature("autodoc", "Sets a transferreader to sort entities : it brings the actor, which may change, while the transferreader does not.

	:param TR:
	:type TR: XSControl_TransferReader
	:rtype: None
") SetReader;
		void SetReader(const opencascade::handle<XSControl_TransferReader> & TR);

		/****************** Sort ******************/
		%feature("compactdefaultargs") Sort;
		%feature("autodoc", "Returns true for an entity which is recognized by the actor, either the precised one, or the one defined by transferreader.

	:param rank:
	:type rank: int
	:param ent:
	:type ent: Standard_Transient
	:param model:
	:type model: Interface_InterfaceModel
	:rtype: bool
") Sort;
		Standard_Boolean Sort(const Standard_Integer rank, const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** XSControl_SelectForTransfer ******************/
		%feature("compactdefaultargs") XSControl_SelectForTransfer;
		%feature("autodoc", "Creates a selectfortransfer, non initialised it sorts nothing, unless an actor has been defined.

	:rtype: None
") XSControl_SelectForTransfer;
		 XSControl_SelectForTransfer();

		/****************** XSControl_SelectForTransfer ******************/
		%feature("compactdefaultargs") XSControl_SelectForTransfer;
		%feature("autodoc", "Creates a selectfortransfer, which will work with the currently defined actor brought by the transferreader.

	:param TR:
	:type TR: XSControl_TransferReader
	:rtype: None
") XSControl_SelectForTransfer;
		 XSControl_SelectForTransfer(const opencascade::handle<XSControl_TransferReader> & TR);

};


%make_alias(XSControl_SelectForTransfer)

%extend XSControl_SelectForTransfer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class XSControl_SignTransferStatus *
*************************************/
class XSControl_SignTransferStatus : public IFSelect_Signature {
	public:
		/****************** Map ******************/
		%feature("compactdefaultargs") Map;
		%feature("autodoc", "Returns the transientprocess used as precised one returns a null handle for a creation from a transferreader without any further setting.

	:rtype: opencascade::handle<Transfer_TransientProcess>
") Map;
		opencascade::handle<Transfer_TransientProcess> Map();

		/****************** Reader ******************/
		%feature("compactdefaultargs") Reader;
		%feature("autodoc", "Returns the reader (if created with a reader) returns a null handle if not created with a reader.

	:rtype: opencascade::handle<XSControl_TransferReader>
") Reader;
		opencascade::handle<XSControl_TransferReader> Reader();

		/****************** SetMap ******************/
		%feature("compactdefaultargs") SetMap;
		%feature("autodoc", "Sets a precise map to sign entities this definition oversedes the creation with a transferreader.

	:param TP:
	:type TP: Transfer_TransientProcess
	:rtype: None
") SetMap;
		void SetMap(const opencascade::handle<Transfer_TransientProcess> & TP);

		/****************** SetReader ******************/
		%feature("compactdefaultargs") SetReader;
		%feature("autodoc", "Sets a transferreader to work.

	:param TR:
	:type TR: XSControl_TransferReader
	:rtype: None
") SetReader;
		void SetReader(const opencascade::handle<XSControl_TransferReader> & TR);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the signature for a transient object, as its transfer status.

	:param ent:
	:type ent: Standard_Transient
	:param model:
	:type model: Interface_InterfaceModel
	:rtype: char *
") Value;
		const char * Value(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** XSControl_SignTransferStatus ******************/
		%feature("compactdefaultargs") XSControl_SignTransferStatus;
		%feature("autodoc", "Creates a signtransferstatus, not initialised it gives nothing (empty string).

	:rtype: None
") XSControl_SignTransferStatus;
		 XSControl_SignTransferStatus();

		/****************** XSControl_SignTransferStatus ******************/
		%feature("compactdefaultargs") XSControl_SignTransferStatus;
		%feature("autodoc", "Creates a signtransferstatus, which will work on the current transientprocess brought by the transferreader (its mapreader).

	:param TR:
	:type TR: XSControl_TransferReader
	:rtype: None
") XSControl_SignTransferStatus;
		 XSControl_SignTransferStatus(const opencascade::handle<XSControl_TransferReader> & TR);

};


%make_alias(XSControl_SignTransferStatus)

%extend XSControl_SignTransferStatus {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class XSControl_TransferReader *
*********************************/
class XSControl_TransferReader : public Standard_Transient {
	public:
		/****************** Actor ******************/
		%feature("compactdefaultargs") Actor;
		%feature("autodoc", "Returns the actor, determined by the controller, or if this one is unknown, directly set. once it has been defined, it can then be edited.

	:rtype: opencascade::handle<Transfer_ActorOfTransientProcess>
") Actor;
		opencascade::handle<Transfer_ActorOfTransientProcess> Actor();

		/****************** BeginTransfer ******************/
		%feature("compactdefaultargs") BeginTransfer;
		%feature("autodoc", "Defines a new transferprocess for reading transfer returns true if done, false if data are not properly defined (the model, the actor for read).

	:rtype: bool
") BeginTransfer;
		Standard_Boolean BeginTransfer();

		/****************** CheckList ******************/
		%feature("compactdefaultargs") CheckList;
		%feature("autodoc", "Returns the checklist resulting from transferring <ent>, i.e. stored in its recorded form resultfrommodel (empty if transfer successful or not recorded ...) //! if <ent> is the model, returns the complete cumulated check-list, <level> is ignored //! if <ent> is an entity of the model, <level> applies as follows <level> : -1 for <ent> only, last transfer (transientprocess) <level> : 0 for <ent> only (d) 1 for <ent> and its immediate subtransfers, if any 2 for <ent> and subtransferts at all levels.

	:param theEnt:
	:type theEnt: Standard_Transient
	:param theLevel: default value is 0
	:type theLevel: int
	:rtype: Interface_CheckIterator
") CheckList;
		Interface_CheckIterator CheckList(const opencascade::handle<Standard_Transient> & theEnt, const Standard_Integer theLevel = 0);

		/****************** CheckedList ******************/
		%feature("compactdefaultargs") CheckedList;
		%feature("autodoc", "Returns the list of starting entities to which a given check status is attached, in final results <ent> can be an entity, or the model to query all entities below, 'entities' are, either <ent> plus its sub-transferred, or all the entities of the model //! <check> = -2 , all entities whatever the check (see result) <check> = -1 , entities with no fail (warning allowed) <check> = 0 , entities with no check at all <check> = 1 , entities with warning but no fail <check> = 2 , entities with fail <result> : if true, only entities with an attached result remark : result true and check=0 will give an empty list.

	:param theEnt:
	:type theEnt: Standard_Transient
	:param WithCheck: default value is Interface_CheckAny
	:type WithCheck: Interface_CheckStatus
	:param theResult: default value is Standard_True
	:type theResult: bool
	:rtype: opencascade::handle<TColStd_HSequenceOfTransient>
") CheckedList;
		opencascade::handle<TColStd_HSequenceOfTransient> CheckedList(const opencascade::handle<Standard_Transient> & theEnt, const Interface_CheckStatus WithCheck = Interface_CheckAny, const Standard_Boolean theResult = Standard_True);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears data, according mode : -1 all 0 nothing done +1 final results +2 working data (model, context, transfer process).

	:param theMode:
	:type theMode: int
	:rtype: None
") Clear;
		void Clear(const Standard_Integer theMode);

		/****************** ClearResult ******************/
		%feature("compactdefaultargs") ClearResult;
		%feature("autodoc", "Clears recorded result for an entity, according mode <mode> = -1 : true, complete, clearing (erasing result) <mode> >= 0 : simple 'stripping', see resultfrommodel, in particular, 0 for simple internal strip, 10 for all but final result, 11 for all : just label, status and filename are kept returns true when done, false if nothing was to clear.

	:param theEnt:
	:type theEnt: Standard_Transient
	:param theMode:
	:type theMode: int
	:rtype: bool
") ClearResult;
		Standard_Boolean ClearResult(const opencascade::handle<Standard_Transient> & theEnt, const Standard_Integer theMode);

		/****************** Context ******************/
		%feature("compactdefaultargs") Context;
		%feature("autodoc", "Returns (modifiable) the whole definition of context rather for internal use (ex.: preparing and setting in once).

	:rtype: NCollection_DataMap<TCollection_AsciiString, opencascade::handle<Standard_Transient>>
") Context;
		NCollection_DataMap<TCollection_AsciiString, opencascade::handle<Standard_Transient>> & Context();

		/****************** EntitiesFromShapeList ******************/
		%feature("compactdefaultargs") EntitiesFromShapeList;
		%feature("autodoc", "Returns the list of entities from which some shapes were produced : it corresponds to a loop on entityfromshaperesult, but is optimised.

	:param theRes:
	:type theRes: TopTools_HSequenceOfShape
	:param theMode: default value is 0
	:type theMode: int
	:rtype: opencascade::handle<TColStd_HSequenceOfTransient>
") EntitiesFromShapeList;
		opencascade::handle<TColStd_HSequenceOfTransient> EntitiesFromShapeList(const opencascade::handle<TopTools_HSequenceOfShape> & theRes, const Standard_Integer theMode = 0);

		/****************** EntityFromResult ******************/
		%feature("compactdefaultargs") EntityFromResult;
		%feature("autodoc", "Returns an entity from which a given result was produced. if <mode> = 0 (d), searches in last root transfers if <mode> = 1, searches in last (root & sub) transfers if <mode> = 2, searches in root recorded results if <mode> = 3, searches in all (root & sub) recordeds <res> can be, either a transient object (result itself) or a binder. for a binder of shape, calls entityfromshaperesult returns a null handle if <res> not recorded.

	:param theRes:
	:type theRes: Standard_Transient
	:param theMode: default value is 0
	:type theMode: int
	:rtype: opencascade::handle<Standard_Transient>
") EntityFromResult;
		opencascade::handle<Standard_Transient> EntityFromResult(const opencascade::handle<Standard_Transient> & theRes, const Standard_Integer theMode = 0);

		/****************** EntityFromShapeResult ******************/
		%feature("compactdefaultargs") EntityFromShapeResult;
		%feature("autodoc", "Returns an entity from which a given shape result was produced returns a null handle if <res> not recorded or not a shape.

	:param theRes:
	:type theRes: TopoDS_Shape
	:param theMode: default value is 0
	:type theMode: int
	:rtype: opencascade::handle<Standard_Transient>
") EntityFromShapeResult;
		opencascade::handle<Standard_Transient> EntityFromShapeResult(const TopoDS_Shape & theRes, const Standard_Integer theMode = 0);

		/****************** FileName ******************/
		%feature("compactdefaultargs") FileName;
		%feature("autodoc", "Returns actual value of file name.

	:rtype: char *
") FileName;
		const char * FileName();

		/****************** FinalEntityLabel ******************/
		%feature("compactdefaultargs") FinalEntityLabel;
		%feature("autodoc", "Returns the label attached to an entity recorded for final, or an empty string if not recorded.

	:param theEnt:
	:type theEnt: Standard_Transient
	:rtype: char *
") FinalEntityLabel;
		const char * FinalEntityLabel(const opencascade::handle<Standard_Transient> & theEnt);

		/****************** FinalEntityNumber ******************/
		%feature("compactdefaultargs") FinalEntityNumber;
		%feature("autodoc", "Returns the number attached to the entity recorded for final, or zero if not recorded (looks in the resultfrommodel).

	:param theEnt:
	:type theEnt: Standard_Transient
	:rtype: int
") FinalEntityNumber;
		Standard_Integer FinalEntityNumber(const opencascade::handle<Standard_Transient> & theEnt);

		/****************** FinalResult ******************/
		%feature("compactdefaultargs") FinalResult;
		%feature("autodoc", "Returns the final result recorded for an entity, as such.

	:param theEnt:
	:type theEnt: Standard_Transient
	:rtype: opencascade::handle<Transfer_ResultFromModel>
") FinalResult;
		opencascade::handle<Transfer_ResultFromModel> FinalResult(const opencascade::handle<Standard_Transient> & theEnt);

		/****************** GetContext ******************/
		%feature("compactdefaultargs") GetContext;
		%feature("autodoc", "Returns the context attached to a name, if set and if it is kind of the type, else a null handle returns true if ok, false if no context.

	:param theName:
	:type theName: char *
	:param theType:
	:type theType: Standard_Type
	:param theCtx:
	:type theCtx: Standard_Transient
	:rtype: bool
") GetContext;
		Standard_Boolean GetContext(const char * theName, const opencascade::handle<Standard_Type> & theType, opencascade::handle<Standard_Transient> & theCtx);

		/****************** HasChecks ******************/
		%feature("compactdefaultargs") HasChecks;
		%feature("autodoc", "Returns true if an entity (with a final result) has checks : - failsonly = false : any kind of check message - failsonly = true : fails only returns false if <ent> is not recorded.

	:param theEnt:
	:type theEnt: Standard_Transient
	:param FailsOnly:
	:type FailsOnly: bool
	:rtype: bool
") HasChecks;
		Standard_Boolean HasChecks(const opencascade::handle<Standard_Transient> & theEnt, const Standard_Boolean FailsOnly);

		/****************** HasResult ******************/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "Returns true if a final result is recorded and brings an effective result (else, it brings only fail messages).

	:param theEnt:
	:type theEnt: Standard_Transient
	:rtype: bool
") HasResult;
		Standard_Boolean HasResult(const opencascade::handle<Standard_Transient> & theEnt);

		/****************** IsMarked ******************/
		%feature("compactdefaultargs") IsMarked;
		%feature("autodoc", "Returns true if an entity has been asked for transfert, hence it is marked, as : recorded (a computation has ran, with or without an effective result), or skipped (case ignored).

	:param theEnt:
	:type theEnt: Standard_Transient
	:rtype: bool
") IsMarked;
		Standard_Boolean IsMarked(const opencascade::handle<Standard_Transient> & theEnt);

		/****************** IsRecorded ******************/
		%feature("compactdefaultargs") IsRecorded;
		%feature("autodoc", "Returns true if a final result is recorded for an entity remark that it can bring no effective result if transfer has completely failed (finalresult brings only fail messages ...).

	:param theEnt:
	:type theEnt: Standard_Transient
	:rtype: bool
") IsRecorded;
		Standard_Boolean IsRecorded(const opencascade::handle<Standard_Transient> & theEnt);

		/****************** IsSkipped ******************/
		%feature("compactdefaultargs") IsSkipped;
		%feature("autodoc", "Returns true if an entity is noted as skipped.

	:param theEnt:
	:type theEnt: Standard_Transient
	:rtype: bool
") IsSkipped;
		Standard_Boolean IsSkipped(const opencascade::handle<Standard_Transient> & theEnt);

		/****************** LastCheckList ******************/
		%feature("compactdefaultargs") LastCheckList;
		%feature("autodoc", "Returns the checklist resulting from last transferread i.e. from transientprocess itself, recorded from last clear.

	:rtype: Interface_CheckIterator
") LastCheckList;
		Interface_CheckIterator LastCheckList();

		/****************** LastTransferList ******************/
		%feature("compactdefaultargs") LastTransferList;
		%feature("autodoc", "Returns the list of entities recorded as lastly transferred i.e. from transientprocess itself, recorded from last clear if <roots> is true , considers only roots of transfer if <roots> is false, considers all entities bound with result.

	:param theRoots:
	:type theRoots: bool
	:rtype: opencascade::handle<TColStd_HSequenceOfTransient>
") LastTransferList;
		opencascade::handle<TColStd_HSequenceOfTransient> LastTransferList(const Standard_Boolean theRoots);

		/****************** Model ******************/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "Returns the currently set interfacemodel.

	:rtype: opencascade::handle<Interface_InterfaceModel>
") Model;
		const opencascade::handle<Interface_InterfaceModel> & Model();

		/****************** PrintStats ******************/
		%feature("compactdefaultargs") PrintStats;
		%feature("autodoc", "Prints statistics on current trace file, according <what> and <mode>. see printstatsprocess for details.

	:param theWhat:
	:type theWhat: int
	:param theMode: default value is 0
	:type theMode: int
	:rtype: None
") PrintStats;
		void PrintStats(const Standard_Integer theWhat, const Standard_Integer theMode = 0);

		/****************** PrintStatsOnList ******************/
		%feature("compactdefaultargs") PrintStatsOnList;
		%feature("autodoc", "Works as printstatsprocess, but displays data only on the entities which are in <list> (filter).

	:param theTP:
	:type theTP: Transfer_TransientProcess
	:param theList:
	:type theList: TColStd_HSequenceOfTransient
	:param theWhat:
	:type theWhat: int
	:param theMode: default value is 0
	:type theMode: int
	:rtype: None
") PrintStatsOnList;
		static void PrintStatsOnList(const opencascade::handle<Transfer_TransientProcess> & theTP, const opencascade::handle<TColStd_HSequenceOfTransient> & theList, const Standard_Integer theWhat, const Standard_Integer theMode = 0);

		/****************** PrintStatsProcess ******************/
		%feature("compactdefaultargs") PrintStatsProcess;
		%feature("autodoc", "This routines prints statistics about a transientprocess it can be called, by a transferreader, or isolately prints are done on the default trace file <what> defines what kind of statistics are to be printed : 0 : basic figures 1 : root results 2 : all recorded (roots, intermediate, checked entities) 3 : abnormal records 4 : check messages (warnings and fails) 5 : fail messages //! <mode> is used according <what> : <what> = 0 : <mode> is ignored <what> = 1,2,3 : <mode> as follows : 0 (d) : just lists numbers of concerned entities in the model 1 : for each entity, gives number,label, type and result type and/or status (fail/warning...) 2 : for each entity, gives maximal information (i.e. checks) 3 : counts per type of starting entity (class type) 4 : counts per result type and/or status 5 : counts per couple (starting type / result type/status) 6 : idem plus gives for each item, the list of numbers of entities in the starting model //! <what> = 4,5 : modes relays on an enum printcount : 0 (d) : itemsbyentity (sequential list by entity) 1 : countbyitem 2 : shortbyitem (count + 5 first numbers) 3 : listbyitem (count + entity numbers) 4 : entitiesbyitem (count + entity numbers and labels).

	:param theTP:
	:type theTP: Transfer_TransientProcess
	:param theWhat:
	:type theWhat: int
	:param theMode: default value is 0
	:type theMode: int
	:rtype: None
") PrintStatsProcess;
		static void PrintStatsProcess(const opencascade::handle<Transfer_TransientProcess> & theTP, const Standard_Integer theWhat, const Standard_Integer theMode = 0);

		/****************** Recognize ******************/
		%feature("compactdefaultargs") Recognize;
		%feature("autodoc", "Tells if an entity is recognized as a valid candidate for transfer. calls method recognize from the actor (if known).

	:param theEnt:
	:type theEnt: Standard_Transient
	:rtype: bool
") Recognize;
		Standard_Boolean Recognize(const opencascade::handle<Standard_Transient> & theEnt);

		/****************** RecordResult ******************/
		%feature("compactdefaultargs") RecordResult;
		%feature("autodoc", "Records a final result of transferring an entity this result is recorded as a resultfrommodel, taken from the transientprocess returns true if a result is available, false else.

	:param theEnt:
	:type theEnt: Standard_Transient
	:rtype: bool
") RecordResult;
		Standard_Boolean RecordResult(const opencascade::handle<Standard_Transient> & theEnt);

		/****************** RecordedList ******************/
		%feature("compactdefaultargs") RecordedList;
		%feature("autodoc", "Returns the list of entities to which a final result is attached (i.e. processed by recordresult).

	:rtype: opencascade::handle<TColStd_HSequenceOfTransient>
") RecordedList;
		opencascade::handle<TColStd_HSequenceOfTransient> RecordedList();

		/****************** ResultFromNumber ******************/
		%feature("compactdefaultargs") ResultFromNumber;
		%feature("autodoc", "Returns the final result recorded for a number of entity (internal use). null if out of range.

	:param theNum:
	:type theNum: int
	:rtype: opencascade::handle<Transfer_ResultFromModel>
") ResultFromNumber;
		opencascade::handle<Transfer_ResultFromModel> ResultFromNumber(const Standard_Integer theNum);

		/****************** SetActor ******************/
		%feature("compactdefaultargs") SetActor;
		%feature("autodoc", "Sets the actor directly : this value will be used if the controller is not set.

	:param theActor:
	:type theActor: Transfer_ActorOfTransientProcess
	:rtype: None
") SetActor;
		void SetActor(const opencascade::handle<Transfer_ActorOfTransientProcess> & theActor);

		/****************** SetContext ******************/
		%feature("compactdefaultargs") SetContext;
		%feature("autodoc", "Sets a context : according to receiving appli, to be interpreted by the actor.

	:param theName:
	:type theName: char *
	:param theCtx:
	:type theCtx: Standard_Transient
	:rtype: None
") SetContext;
		void SetContext(const char * theName, const opencascade::handle<Standard_Transient> & theCtx);

		/****************** SetController ******************/
		%feature("compactdefaultargs") SetController;
		%feature("autodoc", "Sets a controller. it is required to generate the actor. elsewhere, the actor must be provided directly.

	:param theControl:
	:type theControl: XSControl_Controller
	:rtype: None
") SetController;
		void SetController(const opencascade::handle<XSControl_Controller> & theControl);

		/****************** SetFileName ******************/
		%feature("compactdefaultargs") SetFileName;
		%feature("autodoc", "Sets a new value for (loaded) file name.

	:param theName:
	:type theName: char *
	:rtype: None
") SetFileName;
		void SetFileName(const char * theName);

		/****************** SetGraph ******************/
		%feature("compactdefaultargs") SetGraph;
		%feature("autodoc", "Sets a graph and its interfacemodel (calls setmodel).

	:param theGraph:
	:type theGraph: Interface_HGraph
	:rtype: None
") SetGraph;
		void SetGraph(const opencascade::handle<Interface_HGraph> & theGraph);

		/****************** SetModel ******************/
		%feature("compactdefaultargs") SetModel;
		%feature("autodoc", "Sets an interfacemodel. this causes former results, computed from another one, to be lost (see also clear).

	:param theModel:
	:type theModel: Interface_InterfaceModel
	:rtype: None
") SetModel;
		void SetModel(const opencascade::handle<Interface_InterfaceModel> & theModel);

		/****************** SetTransientProcess ******************/
		%feature("compactdefaultargs") SetTransientProcess;
		%feature("autodoc", "Forces the transientprocess remark : it also changes the model and the actor, from those recorded in the new transientprocess.

	:param theTP:
	:type theTP: Transfer_TransientProcess
	:rtype: None
") SetTransientProcess;
		void SetTransientProcess(const opencascade::handle<Transfer_TransientProcess> & theTP);

		/****************** ShapeResult ******************/
		%feature("compactdefaultargs") ShapeResult;
		%feature("autodoc", "Returns the resulting object as a shape null shape if no result or result not a shape.

	:param theEnt:
	:type theEnt: Standard_Transient
	:rtype: TopoDS_Shape
") ShapeResult;
		TopoDS_Shape ShapeResult(const opencascade::handle<Standard_Transient> & theEnt);

		/****************** ShapeResultList ******************/
		%feature("compactdefaultargs") ShapeResultList;
		%feature("autodoc", "Returns a list of result shapes if <rec> is true , sees recordedlist if <rec> is false, sees lasttransferlist (last root transfers) for each one, if it is a shape, it is cumulated to the list if no shape is found, returns an empty sequence.

	:param theRec:
	:type theRec: bool
	:rtype: opencascade::handle<TopTools_HSequenceOfShape>
") ShapeResultList;
		const opencascade::handle<TopTools_HSequenceOfShape> & ShapeResultList(const Standard_Boolean theRec);

		/****************** Skip ******************/
		%feature("compactdefaultargs") Skip;
		%feature("autodoc", "Note that an entity has been required for transfer but no result at all is available (typically : case not implemented) it is not an error, but it gives a specific status : skipped returns true if done, false if <ent> is not in starting model.

	:param theEnt:
	:type theEnt: Standard_Transient
	:rtype: bool
") Skip;
		Standard_Boolean Skip(const opencascade::handle<Standard_Transient> & theEnt);

		/****************** TransferClear ******************/
		%feature("compactdefaultargs") TransferClear;
		%feature("autodoc", "Clears the results attached to an entity if <ents> equates the starting model, clears all results.

	:param theEnt:
	:type theEnt: Standard_Transient
	:param theLevel: default value is 0
	:type theLevel: int
	:rtype: None
") TransferClear;
		void TransferClear(const opencascade::handle<Standard_Transient> & theEnt, const Standard_Integer theLevel = 0);

		/****************** TransferList ******************/
		%feature("compactdefaultargs") TransferList;
		%feature("autodoc", "Commands the transfer on reading for a list of entities to data for imagine, using the selected actor for read returns count of transferred entities, ok or with fails (0/1) if <rec> is true (d), the results are recorded by recordresult.

	:param theList:
	:type theList: TColStd_HSequenceOfTransient
	:param theRec: default value is Standard_True
	:type theRec: bool
	:rtype: int
") TransferList;
		Standard_Integer TransferList(const opencascade::handle<TColStd_HSequenceOfTransient> & theList, const Standard_Boolean theRec = Standard_True);

		/****************** TransferOne ******************/
		%feature("compactdefaultargs") TransferOne;
		%feature("autodoc", "Commands the transfer on reading for an entity to data for imagine, using the selected actor for read returns count of transferred entities, ok or with fails (0/1) if <rec> is true (d), the result is recorded by recordresult.

	:param theEnt:
	:type theEnt: Standard_Transient
	:param theRec: default value is Standard_True
	:type theRec: bool
	:rtype: int
") TransferOne;
		Standard_Integer TransferOne(const opencascade::handle<Standard_Transient> & theEnt, const Standard_Boolean theRec = Standard_True);

		/****************** TransferRoots ******************/
		%feature("compactdefaultargs") TransferRoots;
		%feature("autodoc", "Transfers the content of the current interface model to data handled by imagine, starting from its roots (determined by the graph <g>), using the selected actor for read returns the count of performed root transfers (i.e. 0 if none) or -1 if no actor is defined.

	:param theGraph:
	:type theGraph: Interface_Graph
	:rtype: int
") TransferRoots;
		Standard_Integer TransferRoots(const Interface_Graph & theGraph);

		/****************** TransientProcess ******************/
		%feature("compactdefaultargs") TransientProcess;
		%feature("autodoc", "Returns the currently used transientprocess it is computed from the model by transferreadroots, or by begintransferread.

	:rtype: opencascade::handle<Transfer_TransientProcess>
") TransientProcess;
		const opencascade::handle<Transfer_TransientProcess> & TransientProcess();

		/****************** TransientResult ******************/
		%feature("compactdefaultargs") TransientResult;
		%feature("autodoc", "Returns the resulting object as a transient null handle if no result or result not transient.

	:param theEnt:
	:type theEnt: Standard_Transient
	:rtype: opencascade::handle<Standard_Transient>
") TransientResult;
		opencascade::handle<Standard_Transient> TransientResult(const opencascade::handle<Standard_Transient> & theEnt);

		/****************** XSControl_TransferReader ******************/
		%feature("compactdefaultargs") XSControl_TransferReader;
		%feature("autodoc", "Creates a transferreader, empty.

	:rtype: None
") XSControl_TransferReader;
		 XSControl_TransferReader();

};


%make_alias(XSControl_TransferReader)

%extend XSControl_TransferReader {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class XSControl_TransferWriter *
*********************************/
class XSControl_TransferWriter : public Standard_Transient {
	public:
		/****************** CheckList ******************/
		%feature("compactdefaultargs") CheckList;
		%feature("autodoc", "Returns the check-list of last transfer (write), i.e. the check-list currently recorded in the finderprocess.

	:rtype: Interface_CheckIterator
") CheckList;
		Interface_CheckIterator CheckList();

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears recorded data according a mode 0 clears finderprocess (results, checks) -1 create a new finderprocess.

	:param theMode:
	:type theMode: int
	:rtype: None
") Clear;
		void Clear(const Standard_Integer theMode);

		/****************** Controller ******************/
		%feature("compactdefaultargs") Controller;
		%feature("autodoc", "Returns the currently used controller.

	:rtype: opencascade::handle<XSControl_Controller>
") Controller;
		const opencascade::handle<XSControl_Controller> & Controller();

		/****************** FinderProcess ******************/
		%feature("compactdefaultargs") FinderProcess;
		%feature("autodoc", "Returns the finderprocess itself.

	:rtype: opencascade::handle<Transfer_FinderProcess>
") FinderProcess;
		const opencascade::handle<Transfer_FinderProcess> & FinderProcess();

		/****************** PrintStats ******************/
		%feature("compactdefaultargs") PrintStats;
		%feature("autodoc", "Prints statistics on current trace file, according what,mode see printstatsprocess for details.

	:param theWhat:
	:type theWhat: int
	:param theMode: default value is 0
	:type theMode: int
	:rtype: None
") PrintStats;
		void PrintStats(const Standard_Integer theWhat, const Standard_Integer theMode = 0);

		/****************** RecognizeShape ******************/
		%feature("compactdefaultargs") RecognizeShape;
		%feature("autodoc", "Tells if a shape is valid for a transfer to a model asks the controller (recognizewriteshape).

	:param theShape:
	:type theShape: TopoDS_Shape
	:rtype: bool
") RecognizeShape;
		Standard_Boolean RecognizeShape(const TopoDS_Shape & theShape);

		/****************** RecognizeTransient ******************/
		%feature("compactdefaultargs") RecognizeTransient;
		%feature("autodoc", "Tells if a transient object (from an application) is a valid candidate for a transfer to a model asks the controller (recognizewritetransient) if <obj> is a hshape, calls recognizeshape.

	:param theObj:
	:type theObj: Standard_Transient
	:rtype: bool
") RecognizeTransient;
		Standard_Boolean RecognizeTransient(const opencascade::handle<Standard_Transient> & theObj);

		/****************** ResultCheckList ******************/
		%feature("compactdefaultargs") ResultCheckList;
		%feature("autodoc", "Returns the check-list of last transfer (write), but tries to bind to each check, the resulting entity in the model instead of keeping the original mapper, whenever known.

	:param theModel:
	:type theModel: Interface_InterfaceModel
	:rtype: Interface_CheckIterator
") ResultCheckList;
		Interface_CheckIterator ResultCheckList(const opencascade::handle<Interface_InterfaceModel> & theModel);

		/****************** SetController ******************/
		%feature("compactdefaultargs") SetController;
		%feature("autodoc", "Sets a new controller, also sets a new finderprocess.

	:param theCtl:
	:type theCtl: XSControl_Controller
	:rtype: None
") SetController;
		void SetController(const opencascade::handle<XSControl_Controller> & theCtl);

		/****************** SetFinderProcess ******************/
		%feature("compactdefaultargs") SetFinderProcess;
		%feature("autodoc", "Sets a new finderprocess and forgets the former one.

	:param theFP:
	:type theFP: Transfer_FinderProcess
	:rtype: None
") SetFinderProcess;
		void SetFinderProcess(const opencascade::handle<Transfer_FinderProcess> & theFP);

		/****************** SetTransferMode ******************/
		%feature("compactdefaultargs") SetTransferMode;
		%feature("autodoc", "Changes the transfer mode.

	:param theMode:
	:type theMode: int
	:rtype: None
") SetTransferMode;
		void SetTransferMode(const Standard_Integer theMode);

		/****************** TransferMode ******************/
		%feature("compactdefaultargs") TransferMode;
		%feature("autodoc", "Returns the current transfer mode (an integer) it will be interpreted by the controller to run transfers this call form could be later replaced by more specific ones (parameters suited for each norm / transfer case).

	:rtype: int
") TransferMode;
		Standard_Integer TransferMode();

		/****************** TransferWriteShape ******************/
		%feature("compactdefaultargs") TransferWriteShape;
		%feature("autodoc", "Transfers a shape from cascade to a model of current norm, according to the last call to settransfermode works by calling the controller returns status : =0 if ok, >0 if error during transfer, <0 if transfer badly initialised.

	:param theModel:
	:type theModel: Interface_InterfaceModel
	:param theShape:
	:type theShape: TopoDS_Shape
	:rtype: IFSelect_ReturnStatus
") TransferWriteShape;
		IFSelect_ReturnStatus TransferWriteShape(const opencascade::handle<Interface_InterfaceModel> & theModel, const TopoDS_Shape & theShape);

		/****************** TransferWriteTransient ******************/
		%feature("compactdefaultargs") TransferWriteTransient;
		%feature("autodoc", "Transfers a transient object (from an application) to a model of current norm, according to the last call to settransfermode works by calling the controller returns status : =0 if ok, >0 if error during transfer, <0 if transfer badly initialised.

	:param theModel:
	:type theModel: Interface_InterfaceModel
	:param theObj:
	:type theObj: Standard_Transient
	:rtype: IFSelect_ReturnStatus
") TransferWriteTransient;
		IFSelect_ReturnStatus TransferWriteTransient(const opencascade::handle<Interface_InterfaceModel> & theModel, const opencascade::handle<Standard_Transient> & theObj);

		/****************** XSControl_TransferWriter ******************/
		%feature("compactdefaultargs") XSControl_TransferWriter;
		%feature("autodoc", "Creates a transferwriter, empty, ready to run with an empty finderprocess (but no controller, etc).

	:rtype: None
") XSControl_TransferWriter;
		 XSControl_TransferWriter();

};


%make_alias(XSControl_TransferWriter)

%extend XSControl_TransferWriter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class XSControl_Utils *
************************/
class XSControl_Utils {
	public:
		/****************** AppendCStr ******************/
		%feature("compactdefaultargs") AppendCStr;
		%feature("autodoc", "	:param seqval:
	:type seqval: TColStd_HSequenceOfHAsciiString
	:param strval:
	:type strval: char *
	:rtype: None
") AppendCStr;
		void AppendCStr(const opencascade::handle<TColStd_HSequenceOfHAsciiString> & seqval, const char * strval);

		/****************** AppendEStr ******************/
		%feature("compactdefaultargs") AppendEStr;
		%feature("autodoc", "	:param seqval:
	:type seqval: TColStd_HSequenceOfHExtendedString
	:param strval:
	:type strval: Standard_ExtString
	:rtype: None
") AppendEStr;
		void AppendEStr(const opencascade::handle<TColStd_HSequenceOfHExtendedString> & seqval, const Standard_ExtString strval);

		/****************** AppendShape ******************/
		%feature("compactdefaultargs") AppendShape;
		%feature("autodoc", "	:param seqv:
	:type seqv: TopTools_HSequenceOfShape
	:param shape:
	:type shape: TopoDS_Shape
	:rtype: None
") AppendShape;
		void AppendShape(const opencascade::handle<TopTools_HSequenceOfShape> & seqv, const TopoDS_Shape & shape);

		/****************** AppendTra ******************/
		%feature("compactdefaultargs") AppendTra;
		%feature("autodoc", "	:param seqval:
	:type seqval: TColStd_HSequenceOfTransient
	:param traval:
	:type traval: Standard_Transient
	:rtype: None
") AppendTra;
		void AppendTra(const opencascade::handle<TColStd_HSequenceOfTransient> & seqval, const opencascade::handle<Standard_Transient> & traval);

		/****************** ArrToSeq ******************/
		%feature("compactdefaultargs") ArrToSeq;
		%feature("autodoc", "	:param arr:
	:type arr: Standard_Transient
	:rtype: opencascade::handle<Standard_Transient>
") ArrToSeq;
		opencascade::handle<Standard_Transient> ArrToSeq(const opencascade::handle<Standard_Transient> & arr);

		/****************** AsciiToExtended ******************/
		%feature("compactdefaultargs") AsciiToExtended;
		%feature("autodoc", "	:param str:
	:type str: char *
	:rtype: Standard_ExtString
") AsciiToExtended;
		Standard_ExtString AsciiToExtended(const char * str);

		/****************** BinderShape ******************/
		%feature("compactdefaultargs") BinderShape;
		%feature("autodoc", "From a transient, returns a shape. in fact, recognizes shapebinder shapemapper and hshape.

	:param tr:
	:type tr: Standard_Transient
	:rtype: TopoDS_Shape
") BinderShape;
		TopoDS_Shape BinderShape(const opencascade::handle<Standard_Transient> & tr);

		/****************** CStrValue ******************/
		%feature("compactdefaultargs") CStrValue;
		%feature("autodoc", "	:param list:
	:type list: Standard_Transient
	:param num:
	:type num: int
	:rtype: char *
") CStrValue;
		const char * CStrValue(const opencascade::handle<Standard_Transient> & list, const Standard_Integer num);

		/****************** CompoundFromSeq ******************/
		%feature("compactdefaultargs") CompoundFromSeq;
		%feature("autodoc", "Converts a list of shapes to a compound (a kind of shape).

	:param seqval:
	:type seqval: TopTools_HSequenceOfShape
	:rtype: TopoDS_Shape
") CompoundFromSeq;
		TopoDS_Shape CompoundFromSeq(const opencascade::handle<TopTools_HSequenceOfShape> & seqval);

		/****************** DateString ******************/
		%feature("compactdefaultargs") DateString;
		%feature("autodoc", "	:param yy:
	:type yy: int
	:param mm:
	:type mm: int
	:param dd:
	:type dd: int
	:param hh:
	:type hh: int
	:param mn:
	:type mn: int
	:param ss:
	:type ss: int
	:rtype: char *
") DateString;
		const char * DateString(const Standard_Integer yy, const Standard_Integer mm, const Standard_Integer dd, const Standard_Integer hh, const Standard_Integer mn, const Standard_Integer ss);

		/****************** DateValues ******************/
		%feature("compactdefaultargs") DateValues;
		%feature("autodoc", "	:param text:
	:type text: char *
	:param yy:
	:type yy: int
	:param mm:
	:type mm: int
	:param dd:
	:type dd: int
	:param hh:
	:type hh: int
	:param mn:
	:type mn: int
	:param ss:
	:type ss: int
	:rtype: None
") DateValues;
		void DateValues(const char * text, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** EStrValue ******************/
		%feature("compactdefaultargs") EStrValue;
		%feature("autodoc", "	:param list:
	:type list: Standard_Transient
	:param num:
	:type num: int
	:rtype: Standard_ExtString
") EStrValue;
		Standard_ExtString EStrValue(const opencascade::handle<Standard_Transient> & list, const Standard_Integer num);

		/****************** ExtendedToAscii ******************/
		%feature("compactdefaultargs") ExtendedToAscii;
		%feature("autodoc", "	:param str:
	:type str: Standard_ExtString
	:rtype: char *
") ExtendedToAscii;
		const char * ExtendedToAscii(const Standard_ExtString str);

		/****************** IsAscii ******************/
		%feature("compactdefaultargs") IsAscii;
		%feature("autodoc", "	:param str:
	:type str: Standard_ExtString
	:rtype: bool
") IsAscii;
		Standard_Boolean IsAscii(const Standard_ExtString str);

		/****************** IsKind ******************/
		%feature("compactdefaultargs") IsKind;
		%feature("autodoc", "	:param item:
	:type item: Standard_Transient
	:param what:
	:type what: Standard_Type
	:rtype: bool
") IsKind;
		Standard_Boolean IsKind(const opencascade::handle<Standard_Transient> & item, const opencascade::handle<Standard_Type> & what);

		/****************** NewSeqCStr ******************/
		%feature("compactdefaultargs") NewSeqCStr;
		%feature("autodoc", "	:rtype: opencascade::handle<TColStd_HSequenceOfHAsciiString>
") NewSeqCStr;
		opencascade::handle<TColStd_HSequenceOfHAsciiString> NewSeqCStr();

		/****************** NewSeqEStr ******************/
		%feature("compactdefaultargs") NewSeqEStr;
		%feature("autodoc", "	:rtype: opencascade::handle<TColStd_HSequenceOfHExtendedString>
") NewSeqEStr;
		opencascade::handle<TColStd_HSequenceOfHExtendedString> NewSeqEStr();

		/****************** NewSeqShape ******************/
		%feature("compactdefaultargs") NewSeqShape;
		%feature("autodoc", "	:rtype: opencascade::handle<TopTools_HSequenceOfShape>
") NewSeqShape;
		opencascade::handle<TopTools_HSequenceOfShape> NewSeqShape();

		/****************** NewSeqTra ******************/
		%feature("compactdefaultargs") NewSeqTra;
		%feature("autodoc", "	:rtype: opencascade::handle<TColStd_HSequenceOfTransient>
") NewSeqTra;
		opencascade::handle<TColStd_HSequenceOfTransient> NewSeqTra();

		/****************** SeqIntValue ******************/
		%feature("compactdefaultargs") SeqIntValue;
		%feature("autodoc", "	:param list:
	:type list: TColStd_HSequenceOfInteger
	:param num:
	:type num: int
	:rtype: int
") SeqIntValue;
		Standard_Integer SeqIntValue(const opencascade::handle<TColStd_HSequenceOfInteger> & list, const Standard_Integer num);

		/****************** SeqLength ******************/
		%feature("compactdefaultargs") SeqLength;
		%feature("autodoc", "	:param list:
	:type list: Standard_Transient
	:rtype: int
") SeqLength;
		Standard_Integer SeqLength(const opencascade::handle<Standard_Transient> & list);

		/****************** SeqToArr ******************/
		%feature("compactdefaultargs") SeqToArr;
		%feature("autodoc", "	:param seq:
	:type seq: Standard_Transient
	:param first: default value is 1
	:type first: int
	:rtype: opencascade::handle<Standard_Transient>
") SeqToArr;
		opencascade::handle<Standard_Transient> SeqToArr(const opencascade::handle<Standard_Transient> & seq, const Standard_Integer first = 1);

		/****************** ShapeBinder ******************/
		%feature("compactdefaultargs") ShapeBinder;
		%feature("autodoc", "Creates a transient object from a shape : it is either a binder (used by functions which require a transient but can process a shape, such as viewing functions) or a hshape (according to hs) default is a hshape.

	:param shape:
	:type shape: TopoDS_Shape
	:param hs: default value is Standard_True
	:type hs: bool
	:rtype: opencascade::handle<Standard_Transient>
") ShapeBinder;
		opencascade::handle<Standard_Transient> ShapeBinder(const TopoDS_Shape & shape, const Standard_Boolean hs = Standard_True);

		/****************** ShapeType ******************/
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "Returns the type of a shape : true type if <compound> is false if <compound> is true and <shape> is a compound, iterates on its items. if all are of the same type, returns this type. else, returns compound. if it is empty, returns shape for a null shape, returns shape.

	:param shape:
	:type shape: TopoDS_Shape
	:param compound:
	:type compound: bool
	:rtype: TopAbs_ShapeEnum
") ShapeType;
		TopAbs_ShapeEnum ShapeType(const TopoDS_Shape & shape, const Standard_Boolean compound);

		/****************** ShapeValue ******************/
		%feature("compactdefaultargs") ShapeValue;
		%feature("autodoc", "	:param seqv:
	:type seqv: TopTools_HSequenceOfShape
	:param num:
	:type num: int
	:rtype: TopoDS_Shape
") ShapeValue;
		TopoDS_Shape ShapeValue(const opencascade::handle<TopTools_HSequenceOfShape> & seqv, const Standard_Integer num);

		/****************** SortedCompound ******************/
		%feature("compactdefaultargs") SortedCompound;
		%feature("autodoc", "From a shape, builds a compound as follows : explores it level by level if <explore> is false, only compound items. else, all items adds to the result, shapes which comply to <type> + if <type> is wire, considers free edges (and makes wires) + if <type> is shell, considers free faces (and makes shells) if <compound> is true, gathers items in compounds which correspond to starting compound,solid or shell containers, or items directly contained in a compound.

	:param shape:
	:type shape: TopoDS_Shape
	:param type:
	:type type: TopAbs_ShapeEnum
	:param explore:
	:type explore: bool
	:param compound:
	:type compound: bool
	:rtype: TopoDS_Shape
") SortedCompound;
		TopoDS_Shape SortedCompound(const TopoDS_Shape & shape, const TopAbs_ShapeEnum type, const Standard_Boolean explore, const Standard_Boolean compound);

		/****************** ToAString ******************/
		%feature("compactdefaultargs") ToAString;
		%feature("autodoc", "	:param strcon:
	:type strcon: char *
	:rtype: TCollection_AsciiString
") ToAString;
		TCollection_AsciiString ToAString(const char * strcon);

		/****************** ToCString ******************/
		%feature("compactdefaultargs") ToCString;
		%feature("autodoc", "	:param strval:
	:type strval: TCollection_HAsciiString
	:rtype: char *
") ToCString;
		const char * ToCString(const opencascade::handle<TCollection_HAsciiString> & strval);

		/****************** ToCString ******************/
		%feature("compactdefaultargs") ToCString;
		%feature("autodoc", "	:param strval:
	:type strval: TCollection_AsciiString
	:rtype: char *
") ToCString;
		const char * ToCString(const TCollection_AsciiString & strval);

		/****************** ToEString ******************/
		%feature("compactdefaultargs") ToEString;
		%feature("autodoc", "	:param strval:
	:type strval: TCollection_HExtendedString
	:rtype: Standard_ExtString
") ToEString;
		Standard_ExtString ToEString(const opencascade::handle<TCollection_HExtendedString> & strval);

		/****************** ToEString ******************/
		%feature("compactdefaultargs") ToEString;
		%feature("autodoc", "	:param strval:
	:type strval: TCollection_ExtendedString
	:rtype: Standard_ExtString
") ToEString;
		Standard_ExtString ToEString(const TCollection_ExtendedString & strval);

		/****************** ToHString ******************/
		%feature("compactdefaultargs") ToHString;
		%feature("autodoc", "	:param strcon:
	:type strcon: char *
	:rtype: opencascade::handle<TCollection_HAsciiString>
") ToHString;
		opencascade::handle<TCollection_HAsciiString> ToHString(const char * strcon);

		/****************** ToHString ******************/
		%feature("compactdefaultargs") ToHString;
		%feature("autodoc", "	:param strcon:
	:type strcon: Standard_ExtString
	:rtype: opencascade::handle<TCollection_HExtendedString>
") ToHString;
		opencascade::handle<TCollection_HExtendedString> ToHString(const Standard_ExtString strcon);

		/****************** ToXString ******************/
		%feature("compactdefaultargs") ToXString;
		%feature("autodoc", "	:param strcon:
	:type strcon: Standard_ExtString
	:rtype: TCollection_ExtendedString
") ToXString;
		TCollection_ExtendedString ToXString(const Standard_ExtString strcon);

		/****************** TraValue ******************/
		%feature("compactdefaultargs") TraValue;
		%feature("autodoc", "	:param list:
	:type list: Standard_Transient
	:param num:
	:type num: int
	:rtype: opencascade::handle<Standard_Transient>
") TraValue;
		opencascade::handle<Standard_Transient> TraValue(const opencascade::handle<Standard_Transient> & list, const Standard_Integer num);

		/****************** TraceLine ******************/
		%feature("compactdefaultargs") TraceLine;
		%feature("autodoc", "Just prints a line into the current trace file. this allows to better characterise the various trace outputs, as desired.

	:param line:
	:type line: char *
	:rtype: None
") TraceLine;
		void TraceLine(const char * line);

		/****************** TraceLines ******************/
		%feature("compactdefaultargs") TraceLines;
		%feature("autodoc", "Just prints a line or a set of lines into the current trace file. <lines> can be a hascii/extendedstring (produces a print without ending line) or a hsequence or harray1 of .. (one new line per item).

	:param lines:
	:type lines: Standard_Transient
	:rtype: None
") TraceLines;
		void TraceLines(const opencascade::handle<Standard_Transient> & lines);

		/****************** TypeName ******************/
		%feature("compactdefaultargs") TypeName;
		%feature("autodoc", "Returns the name of the dynamic type of an object, i.e. : if it is a type, its name if it is a object not a type, the name of its dynamictype if it is null, an empty string if <nopk> is false (d), gives complete name if <nopk> is true, returns class name without package.

	:param item:
	:type item: Standard_Transient
	:param nopk: default value is Standard_False
	:type nopk: bool
	:rtype: char *
") TypeName;
		const char * TypeName(const opencascade::handle<Standard_Transient> & item, const Standard_Boolean nopk = Standard_False);

		/****************** XSControl_Utils ******************/
		%feature("compactdefaultargs") XSControl_Utils;
		%feature("autodoc", "The only use of this, is to allow a frontal to get one distinct 'utils' set per separate engine.

	:rtype: None
") XSControl_Utils;
		 XSControl_Utils();

};


%extend XSControl_Utils {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class XSControl_Vars *
***********************/
class XSControl_Vars : public Standard_Transient {
	public:
		/****************** Get ******************/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "	:param name:
	:type name: char *
	:rtype: opencascade::handle<Standard_Transient>
") Get;
		virtual opencascade::handle<Standard_Transient> Get(const char * & name);

		/****************** GetCurve ******************/
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "	:param name:
	:type name: char *
	:rtype: opencascade::handle<Geom_Curve>
") GetCurve;
		virtual opencascade::handle<Geom_Curve> GetCurve(const char * & name);

		/****************** GetCurve2d ******************/
		%feature("compactdefaultargs") GetCurve2d;
		%feature("autodoc", "	:param name:
	:type name: char *
	:rtype: opencascade::handle<Geom2d_Curve>
") GetCurve2d;
		virtual opencascade::handle<Geom2d_Curve> GetCurve2d(const char * & name);

		/****************** GetGeom ******************/
		%feature("compactdefaultargs") GetGeom;
		%feature("autodoc", "	:param name:
	:type name: char *
	:rtype: opencascade::handle<Geom_Geometry>
") GetGeom;
		virtual opencascade::handle<Geom_Geometry> GetGeom(const char * & name);

		/****************** GetPoint ******************/
		%feature("compactdefaultargs") GetPoint;
		%feature("autodoc", "	:param name:
	:type name: char *
	:param pnt:
	:type pnt: gp_Pnt
	:rtype: bool
") GetPoint;
		virtual Standard_Boolean GetPoint(const char * & name, gp_Pnt & pnt);

		/****************** GetPoint2d ******************/
		%feature("compactdefaultargs") GetPoint2d;
		%feature("autodoc", "	:param name:
	:type name: char *
	:param pnt:
	:type pnt: gp_Pnt2d
	:rtype: bool
") GetPoint2d;
		virtual Standard_Boolean GetPoint2d(const char * & name, gp_Pnt2d & pnt);

		/****************** GetShape ******************/
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "	:param name:
	:type name: char *
	:rtype: TopoDS_Shape
") GetShape;
		virtual TopoDS_Shape GetShape(const char * & name);

		/****************** GetSurface ******************/
		%feature("compactdefaultargs") GetSurface;
		%feature("autodoc", "	:param name:
	:type name: char *
	:rtype: opencascade::handle<Geom_Surface>
") GetSurface;
		virtual opencascade::handle<Geom_Surface> GetSurface(const char * & name);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param name:
	:type name: char *
	:param val:
	:type val: Standard_Transient
	:rtype: None
") Set;
		virtual void Set(const char * name, const opencascade::handle<Standard_Transient> & val);

		/****************** SetPoint ******************/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "	:param name:
	:type name: char *
	:param val:
	:type val: gp_Pnt
	:rtype: None
") SetPoint;
		virtual void SetPoint(const char * name, const gp_Pnt & val);

		/****************** SetPoint2d ******************/
		%feature("compactdefaultargs") SetPoint2d;
		%feature("autodoc", "	:param name:
	:type name: char *
	:param val:
	:type val: gp_Pnt2d
	:rtype: None
") SetPoint2d;
		virtual void SetPoint2d(const char * name, const gp_Pnt2d & val);

		/****************** SetShape ******************/
		%feature("compactdefaultargs") SetShape;
		%feature("autodoc", "	:param name:
	:type name: char *
	:param val:
	:type val: TopoDS_Shape
	:rtype: None
") SetShape;
		virtual void SetShape(const char * name, const TopoDS_Shape & val);

		/****************** XSControl_Vars ******************/
		%feature("compactdefaultargs") XSControl_Vars;
		%feature("autodoc", "	:rtype: None
") XSControl_Vars;
		 XSControl_Vars();

};


%make_alias(XSControl_Vars)

%extend XSControl_Vars {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class XSControl_WorkSession *
******************************/
class XSControl_WorkSession : public IFSelect_WorkSession {
	public:
		/****************** ClearContext ******************/
		%feature("compactdefaultargs") ClearContext;
		%feature("autodoc", "Clears the whole current context (nullifies it).

	:rtype: None
") ClearContext;
		void ClearContext();

		/****************** ClearData ******************/
		%feature("compactdefaultargs") ClearData;
		%feature("autodoc", "In addition to basic cleardata, clears transfer and management for interactive use, for mode = 0,1,2 and over 4 plus : mode = 5 to clear transfers (both ways) only mode = 6 to clear enforced results mode = 7 to clear transfers, results.

	:param theMode:
	:type theMode: int
	:rtype: None
") ClearData;
		virtual void ClearData(const Standard_Integer theMode);

		/****************** Context ******************/
		%feature("compactdefaultargs") Context;
		%feature("autodoc", "Returns the current context list, null if not defined the context is given to the transientprocess for transferread.

	:rtype: NCollection_DataMap<TCollection_AsciiString, opencascade::handle<Standard_Transient>>
") Context;
		const NCollection_DataMap<TCollection_AsciiString, opencascade::handle<Standard_Transient>> & Context();

		/****************** InitTransferReader ******************/
		%feature("compactdefaultargs") InitTransferReader;
		%feature("autodoc", "Sets a transfer reader, by internal ways, according mode : 0 recreates it clear, 1 clears it (does not recreate) 2 aligns roots of transientprocess from final results 3 aligns final results from roots of transientprocess 4 begins a new transfer (by begintransfer) 5 recreates transferreader then begins a new transfer.

	:param theMode:
	:type theMode: int
	:rtype: None
") InitTransferReader;
		void InitTransferReader(const Standard_Integer theMode);

		/****************** MapReader ******************/
		%feature("compactdefaultargs") MapReader;
		%feature("autodoc", "Returns the transientprocess(internal data for transferreader).

	:rtype: opencascade::handle<Transfer_TransientProcess>
") MapReader;
		opencascade::handle<Transfer_TransientProcess> MapReader();

		/****************** NewModel ******************/
		%feature("compactdefaultargs") NewModel;
		%feature("autodoc", "Produces and returns a new model well conditionned it is produced by the norm controller it can be null (if this function is not implemented).

	:rtype: opencascade::handle<Interface_InterfaceModel>
") NewModel;
		opencascade::handle<Interface_InterfaceModel> NewModel();

		/****************** NormAdaptor ******************/
		%feature("compactdefaultargs") NormAdaptor;
		%feature("autodoc", "Returns the norm controller itself.

	:rtype: opencascade::handle<XSControl_Controller>
") NormAdaptor;
		const opencascade::handle<XSControl_Controller> & NormAdaptor();

		/****************** PrintTransferStatus ******************/
		%feature("compactdefaultargs") PrintTransferStatus;
		%feature("autodoc", "Prints the transfer status of a transferred item, as beeing the mapped n0 <num>, from mapwriter if <wri> is true, or from mapreader if <wri> is false returns true when done, false else (i.e. num out of range).

	:param theNum:
	:type theNum: int
	:param theWri:
	:type theWri: bool
	:param theS:
	:type theS: Message_Messenger
	:rtype: bool
") PrintTransferStatus;
		Standard_Boolean PrintTransferStatus(const Standard_Integer theNum, const Standard_Boolean theWri, const opencascade::handle<Message_Messenger> & theS);

		/****************** Result ******************/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "Returns the result attached to a starting entity if <mode> = 0, returns final result if <mode> = 1, considers last result if <mode> = 2, considers final, else if absent, last returns it as transient, if result is not transient returns the binder <mode> = 10,11,12 idem but returns the binder itself (if it is not, e.g. shape, returns the binder) <mode> = 20, returns the resultfrommodel.

	:param theEnt:
	:type theEnt: Standard_Transient
	:param theMode:
	:type theMode: int
	:rtype: opencascade::handle<Standard_Transient>
") Result;
		opencascade::handle<Standard_Transient> Result(const opencascade::handle<Standard_Transient> & theEnt, const Standard_Integer theMode);

		/****************** SelectNorm ******************/
		%feature("compactdefaultargs") SelectNorm;
		%feature("autodoc", "Selects a norm defined by its name. a norm is described and handled by a controller returns true if done, false if <normname> is unknown //! the current profile for this norm is taken.

	:param theNormName:
	:type theNormName: char *
	:rtype: bool
") SelectNorm;
		Standard_Boolean SelectNorm(const char * theNormName);

		/****************** SelectedNorm ******************/
		%feature("compactdefaultargs") SelectedNorm;
		%feature("autodoc", "Returns the name of the last selected norm. if none is defined, returns an empty string by default, returns the complete name of the norm if <rsc> is true, returns the short name used for resource.

	:param theRsc: default value is Standard_False
	:type theRsc: bool
	:rtype: char *
") SelectedNorm;
		const char * SelectedNorm(const Standard_Boolean theRsc = Standard_False);

		/****************** SetAllContext ******************/
		%feature("compactdefaultargs") SetAllContext;
		%feature("autodoc", "Sets the current context list, as a whole sets it to the transferreader.

	:param theContext:
	:type theContext: Standard_Transient
	:rtype: None
") SetAllContext;
		void SetAllContext(const NCollection_DataMap<TCollection_AsciiString, opencascade::handle<Standard_Transient> > & theContext);

		/****************** SetController ******************/
		%feature("compactdefaultargs") SetController;
		%feature("autodoc", "Selects a norm defined by its controller itself.

	:param theCtl:
	:type theCtl: XSControl_Controller
	:rtype: None
") SetController;
		void SetController(const opencascade::handle<XSControl_Controller> & theCtl);

		/****************** SetMapReader ******************/
		%feature("compactdefaultargs") SetMapReader;
		%feature("autodoc", "Changes the map reader, i.e. considers that the new one defines the relevant read results (forgets the former ones) returns true when done, false in case of bad definition, i.e. if model from tp differs from that of session.

	:param theTP:
	:type theTP: Transfer_TransientProcess
	:rtype: bool
") SetMapReader;
		Standard_Boolean SetMapReader(const opencascade::handle<Transfer_TransientProcess> & theTP);

		/****************** SetMapWriter ******************/
		%feature("compactdefaultargs") SetMapWriter;
		%feature("autodoc", "Changes the map reader, i.e. considers that the new one defines the relevant read results (forgets the former ones) returns true when done, false if <fp> is null.

	:param theFP:
	:type theFP: Transfer_FinderProcess
	:rtype: bool
") SetMapWriter;
		Standard_Boolean SetMapWriter(const opencascade::handle<Transfer_FinderProcess> & theFP);

		/****************** SetTransferReader ******************/
		%feature("compactdefaultargs") SetTransferReader;
		%feature("autodoc", "Sets a transfer reader, which manages transfers on reading.

	:param theTR:
	:type theTR: XSControl_TransferReader
	:rtype: None
") SetTransferReader;
		void SetTransferReader(const opencascade::handle<XSControl_TransferReader> & theTR);

		/****************** SetVars ******************/
		%feature("compactdefaultargs") SetVars;
		%feature("autodoc", "	:param theVars:
	:type theVars: XSControl_Vars
	:rtype: None
") SetVars;
		void SetVars(const opencascade::handle<XSControl_Vars> & theVars);

		/****************** TransferReadOne ******************/
		%feature("compactdefaultargs") TransferReadOne;
		%feature("autodoc", "Commands the transfer of, either one entity, or a list i.e. calls the transferreader after having analysed <ents> it is cumulated from the last begintransfer <ents> is processed by givelist, hence : - <ents> a selection : its selectionresult - <ents> a hsequenceoftransient : this list - <ents> the model : in this specific case, all the roots, with no cumulation of former transfers (transferreadroots).

	:param theEnts:
	:type theEnts: Standard_Transient
	:rtype: int
") TransferReadOne;
		Standard_Integer TransferReadOne(const opencascade::handle<Standard_Transient> & theEnts);

		/****************** TransferReadRoots ******************/
		%feature("compactdefaultargs") TransferReadRoots;
		%feature("autodoc", "Commands the transfer of all the root entities of the model i.e. calls transferroot from the transferreader with the graph no cumulation with former calls to transferreadone.

	:rtype: int
") TransferReadRoots;
		Standard_Integer TransferReadRoots();

		/****************** TransferReader ******************/
		%feature("compactdefaultargs") TransferReader;
		%feature("autodoc", "Returns the transfer reader, null if not set.

	:rtype: opencascade::handle<XSControl_TransferReader>
") TransferReader;
		const opencascade::handle<XSControl_TransferReader> & TransferReader();

		/****************** TransferWriteCheckList ******************/
		%feature("compactdefaultargs") TransferWriteCheckList;
		%feature("autodoc", "Returns the check-list of last transfer (write) it is recorded in the finderprocess, but it must be bound with resulting entities (in the resulting file model) rather than with original objects (in fact, their mappers).

	:rtype: Interface_CheckIterator
") TransferWriteCheckList;
		Interface_CheckIterator TransferWriteCheckList();

		/****************** TransferWriteShape ******************/
		%feature("compactdefaultargs") TransferWriteShape;
		%feature("autodoc", "Transfers a shape from cascade to a model of current norm, according to the last call to setmodewriteshape returns status :done if ok, fail if error during transfer, error if transfer badly initialised.

	:param theShape:
	:type theShape: TopoDS_Shape
	:param theCompGraph: default value is Standard_True
	:type theCompGraph: bool
	:rtype: IFSelect_ReturnStatus
") TransferWriteShape;
		IFSelect_ReturnStatus TransferWriteShape(const TopoDS_Shape & theShape, const Standard_Boolean theCompGraph = Standard_True);

		/****************** TransferWriter ******************/
		%feature("compactdefaultargs") TransferWriter;
		%feature("autodoc", "Returns the transfer reader, null if not set.

	:rtype: opencascade::handle<XSControl_TransferWriter>
") TransferWriter;
		const opencascade::handle<XSControl_TransferWriter> & TransferWriter();

		/****************** Vars ******************/
		%feature("compactdefaultargs") Vars;
		%feature("autodoc", "	:rtype: opencascade::handle<XSControl_Vars>
") Vars;
		const opencascade::handle<XSControl_Vars> & Vars();

		/****************** XSControl_WorkSession ******************/
		%feature("compactdefaultargs") XSControl_WorkSession;
		%feature("autodoc", "	:rtype: None
") XSControl_WorkSession;
		 XSControl_WorkSession();

};


%make_alias(XSControl_WorkSession)

%extend XSControl_WorkSession {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class XSControl_Writer *
*************************/
class XSControl_Writer {
	public:
		/****************** Model ******************/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "Returns the produced model. produces a new one if not yet done or if <newone> is true this method allows for instance to edit product or header data before writing.

	:param newone: default value is Standard_False
	:type newone: bool
	:rtype: opencascade::handle<Interface_InterfaceModel>
") Model;
		opencascade::handle<Interface_InterfaceModel> Model(const Standard_Boolean newone = Standard_False);

		/****************** PrintStatsTransfer ******************/
		%feature("compactdefaultargs") PrintStatsTransfer;
		%feature("autodoc", "Prints statistics about transfer.

	:param what:
	:type what: int
	:param mode: default value is 0
	:type mode: int
	:rtype: None
") PrintStatsTransfer;
		void PrintStatsTransfer(const Standard_Integer what, const Standard_Integer mode = 0);

		/****************** SetNorm ******************/
		%feature("compactdefaultargs") SetNorm;
		%feature("autodoc", "Sets a specific norm to <self> returns true if done, false if <norm> is not available.

	:param norm:
	:type norm: char *
	:rtype: bool
") SetNorm;
		Standard_Boolean SetNorm(const char * norm);

		/****************** SetWS ******************/
		%feature("compactdefaultargs") SetWS;
		%feature("autodoc", "Sets a specific session to <self>.

	:param WS:
	:type WS: XSControl_WorkSession
	:param scratch: default value is Standard_True
	:type scratch: bool
	:rtype: None
") SetWS;
		void SetWS(const opencascade::handle<XSControl_WorkSession> & WS, const Standard_Boolean scratch = Standard_True);

		/****************** TransferShape ******************/
		%feature("compactdefaultargs") TransferShape;
		%feature("autodoc", "Transfers a shape according to the mode.

	:param sh:
	:type sh: TopoDS_Shape
	:param mode: default value is 0
	:type mode: int
	:rtype: IFSelect_ReturnStatus
") TransferShape;
		IFSelect_ReturnStatus TransferShape(const TopoDS_Shape & sh, const Standard_Integer mode = 0);

		/****************** WS ******************/
		%feature("compactdefaultargs") WS;
		%feature("autodoc", "Returns the session used in <self>.

	:rtype: opencascade::handle<XSControl_WorkSession>
") WS;
		opencascade::handle<XSControl_WorkSession> WS();

		/****************** WriteFile ******************/
		%feature("compactdefaultargs") WriteFile;
		%feature("autodoc", "Writes the produced model.

	:param filename:
	:type filename: char *
	:rtype: IFSelect_ReturnStatus
") WriteFile;
		IFSelect_ReturnStatus WriteFile(const char * filename);

		/****************** XSControl_Writer ******************/
		%feature("compactdefaultargs") XSControl_Writer;
		%feature("autodoc", "Creates a writer from scratch.

	:rtype: None
") XSControl_Writer;
		 XSControl_Writer();

		/****************** XSControl_Writer ******************/
		%feature("compactdefaultargs") XSControl_Writer;
		%feature("autodoc", "Creates a writer from scratch, with a norm name which identifie a controller.

	:param norm:
	:type norm: char *
	:rtype: None
") XSControl_Writer;
		 XSControl_Writer(const char * norm);

		/****************** XSControl_Writer ******************/
		%feature("compactdefaultargs") XSControl_Writer;
		%feature("autodoc", "Creates a writer from an already existing session if <scratch> is true (d), clears already recorded data.

	:param WS:
	:type WS: XSControl_WorkSession
	:param scratch: default value is Standard_True
	:type scratch: bool
	:rtype: None
") XSControl_Writer;
		 XSControl_Writer(const opencascade::handle<XSControl_WorkSession> & WS, const Standard_Boolean scratch = Standard_True);

};


%extend XSControl_Writer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */

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
%define XMLTOBJDRIVERSDOCSTRING
"XmlTObjDrivers module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_xmltobjdrivers.html"
%enddef
%module (package="OCC.Core", docstring=XMLTOBJDRIVERSDOCSTRING) XmlTObjDrivers


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
#include<XmlTObjDrivers_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<XmlMDF_module.hxx>
#include<Message_module.hxx>
#include<TDocStd_module.hxx>
#include<XmlLDrivers_module.hxx>
#include<TCollection_module.hxx>
#include<TDF_module.hxx>
#include<XmlObjMgt_module.hxx>
#include<Resource_module.hxx>
#include<PCDM_module.hxx>
#include<CDF_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import XmlMDF.i
%import Message.i
%import TDocStd.i
%import XmlLDrivers.i
%import TCollection.i
%import TDF.i
%import XmlObjMgt.i

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
%wrap_handle(XmlTObjDrivers_DocumentRetrievalDriver)
%wrap_handle(XmlTObjDrivers_DocumentStorageDriver)
%wrap_handle(XmlTObjDrivers_IntSparseArrayDriver)
%wrap_handle(XmlTObjDrivers_ModelDriver)
%wrap_handle(XmlTObjDrivers_ObjectDriver)
%wrap_handle(XmlTObjDrivers_ReferenceDriver)
%wrap_handle(XmlTObjDrivers_XYZDriver)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/***********************
* class XmlTObjDrivers *
***********************/
%rename(xmltobjdrivers) XmlTObjDrivers;
class XmlTObjDrivers {
	public:
		/****************** AddDrivers ******************/
		%feature("compactdefaultargs") AddDrivers;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDriverTable: XmlMDF_ADriverTable
anMsgDrv: Message_Messenger

Returns
-------
None
") AddDrivers;
		static void AddDrivers(const opencascade::handle<XmlMDF_ADriverTable> & aDriverTable, const opencascade::handle<Message_Messenger> & anMsgDrv);

		/****************** DefineFormat ******************/
		%feature("compactdefaultargs") DefineFormat;
		%feature("autodoc", "Defines format 'tobjxml' and registers its read and write drivers in the specified application.

Parameters
----------
theApp: TDocStd_Application

Returns
-------
None
") DefineFormat;
		static void DefineFormat(const opencascade::handle<TDocStd_Application> & theApp);

		/****************** Factory ******************/
		%feature("compactdefaultargs") Factory;
		%feature("autodoc", "Returns a driver corresponding to <aguid>. used for plugin.

Parameters
----------
aGUID: Standard_GUID

Returns
-------
opencascade::handle<Standard_Transient>
") Factory;
		static const opencascade::handle<Standard_Transient> & Factory(const Standard_GUID & aGUID);

};


%extend XmlTObjDrivers {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class XmlTObjDrivers_DocumentRetrievalDriver *
***********************************************/
class XmlTObjDrivers_DocumentRetrievalDriver : public XmlLDrivers_DocumentRetrievalDriver {
	public:
		/****************** AttributeDrivers ******************/
		%feature("compactdefaultargs") AttributeDrivers;
		%feature("autodoc", "No available documentation.

Parameters
----------
theMsgDriver: Message_Messenger

Returns
-------
opencascade::handle<XmlMDF_ADriverTable>
") AttributeDrivers;
		virtual opencascade::handle<XmlMDF_ADriverTable> AttributeDrivers(const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** XmlTObjDrivers_DocumentRetrievalDriver ******************/
		%feature("compactdefaultargs") XmlTObjDrivers_DocumentRetrievalDriver;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") XmlTObjDrivers_DocumentRetrievalDriver;
		 XmlTObjDrivers_DocumentRetrievalDriver();

};


%make_alias(XmlTObjDrivers_DocumentRetrievalDriver)

%extend XmlTObjDrivers_DocumentRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class XmlTObjDrivers_DocumentStorageDriver *
*********************************************/
class XmlTObjDrivers_DocumentStorageDriver : public XmlLDrivers_DocumentStorageDriver {
	public:
		/****************** AttributeDrivers ******************/
		%feature("compactdefaultargs") AttributeDrivers;
		%feature("autodoc", "No available documentation.

Parameters
----------
theMsgDriver: Message_Messenger

Returns
-------
opencascade::handle<XmlMDF_ADriverTable>
") AttributeDrivers;
		virtual opencascade::handle<XmlMDF_ADriverTable> AttributeDrivers(const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** XmlTObjDrivers_DocumentStorageDriver ******************/
		%feature("compactdefaultargs") XmlTObjDrivers_DocumentStorageDriver;
		%feature("autodoc", "No available documentation.

Parameters
----------
theCopyright: TCollection_ExtendedString

Returns
-------
None
") XmlTObjDrivers_DocumentStorageDriver;
		 XmlTObjDrivers_DocumentStorageDriver(const TCollection_ExtendedString & theCopyright);

};


%make_alias(XmlTObjDrivers_DocumentStorageDriver)

%extend XmlTObjDrivers_DocumentStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class XmlTObjDrivers_IntSparseArrayDriver *
********************************************/
class XmlTObjDrivers_IntSparseArrayDriver : public XmlMDF_ADriver {
	public:
		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSource: XmlObjMgt_Persistent
theTarget: TDF_Attribute
theRelocTable: XmlObjMgt_RRelocationTable

Returns
-------
bool
") Paste;
		Standard_Boolean Paste(const XmlObjMgt_Persistent & theSource, const opencascade::handle<TDF_Attribute> & theTarget, XmlObjMgt_RRelocationTable & theRelocTable);

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSource: TDF_Attribute
theTarget: XmlObjMgt_Persistent
theRelocTable: XmlObjMgt_SRelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & theSource, XmlObjMgt_Persistent & theTarget, XmlObjMgt_SRelocationTable & theRelocTable);

		/****************** XmlTObjDrivers_IntSparseArrayDriver ******************/
		%feature("compactdefaultargs") XmlTObjDrivers_IntSparseArrayDriver;
		%feature("autodoc", "No available documentation.

Parameters
----------
theMessageDriver: Message_Messenger

Returns
-------
None
") XmlTObjDrivers_IntSparseArrayDriver;
		 XmlTObjDrivers_IntSparseArrayDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

};


%make_alias(XmlTObjDrivers_IntSparseArrayDriver)

%extend XmlTObjDrivers_IntSparseArrayDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class XmlTObjDrivers_ModelDriver *
***********************************/
class XmlTObjDrivers_ModelDriver : public XmlMDF_ADriver {
	public:
		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
Source: XmlObjMgt_Persistent
Target: TDF_Attribute
RelocTable: XmlObjMgt_RRelocationTable

Returns
-------
bool
") Paste;
		Standard_Boolean Paste(const XmlObjMgt_Persistent & Source, const opencascade::handle<TDF_Attribute> & Target, XmlObjMgt_RRelocationTable & RelocTable);

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
Source: TDF_Attribute
Target: XmlObjMgt_Persistent
RelocTable: XmlObjMgt_SRelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Source, XmlObjMgt_Persistent & Target, XmlObjMgt_SRelocationTable & RelocTable);

		/****************** XmlTObjDrivers_ModelDriver ******************/
		%feature("compactdefaultargs") XmlTObjDrivers_ModelDriver;
		%feature("autodoc", "No available documentation.

Parameters
----------
theMessageDriver: Message_Messenger

Returns
-------
None
") XmlTObjDrivers_ModelDriver;
		 XmlTObjDrivers_ModelDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

};


%make_alias(XmlTObjDrivers_ModelDriver)

%extend XmlTObjDrivers_ModelDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class XmlTObjDrivers_ObjectDriver *
************************************/
class XmlTObjDrivers_ObjectDriver : public XmlMDF_ADriver {
	public:
		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
Source: XmlObjMgt_Persistent
Target: TDF_Attribute
RelocTable: XmlObjMgt_RRelocationTable

Returns
-------
bool
") Paste;
		Standard_Boolean Paste(const XmlObjMgt_Persistent & Source, const opencascade::handle<TDF_Attribute> & Target, XmlObjMgt_RRelocationTable & RelocTable);

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
Source: TDF_Attribute
Target: XmlObjMgt_Persistent
RelocTable: XmlObjMgt_SRelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Source, XmlObjMgt_Persistent & Target, XmlObjMgt_SRelocationTable & RelocTable);

		/****************** XmlTObjDrivers_ObjectDriver ******************/
		%feature("compactdefaultargs") XmlTObjDrivers_ObjectDriver;
		%feature("autodoc", "No available documentation.

Parameters
----------
theMessageDriver: Message_Messenger

Returns
-------
None
") XmlTObjDrivers_ObjectDriver;
		 XmlTObjDrivers_ObjectDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

};


%make_alias(XmlTObjDrivers_ObjectDriver)

%extend XmlTObjDrivers_ObjectDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class XmlTObjDrivers_ReferenceDriver *
***************************************/
class XmlTObjDrivers_ReferenceDriver : public XmlMDF_ADriver {
	public:
		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
Source: XmlObjMgt_Persistent
Target: TDF_Attribute
RelocTable: XmlObjMgt_RRelocationTable

Returns
-------
bool
") Paste;
		Standard_Boolean Paste(const XmlObjMgt_Persistent & Source, const opencascade::handle<TDF_Attribute> & Target, XmlObjMgt_RRelocationTable & RelocTable);

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
Source: TDF_Attribute
Target: XmlObjMgt_Persistent
RelocTable: XmlObjMgt_SRelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Source, XmlObjMgt_Persistent & Target, XmlObjMgt_SRelocationTable & RelocTable);

		/****************** XmlTObjDrivers_ReferenceDriver ******************/
		%feature("compactdefaultargs") XmlTObjDrivers_ReferenceDriver;
		%feature("autodoc", "No available documentation.

Parameters
----------
theMessageDriver: Message_Messenger

Returns
-------
None
") XmlTObjDrivers_ReferenceDriver;
		 XmlTObjDrivers_ReferenceDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

};


%make_alias(XmlTObjDrivers_ReferenceDriver)

%extend XmlTObjDrivers_ReferenceDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class XmlTObjDrivers_XYZDriver *
*********************************/
class XmlTObjDrivers_XYZDriver : public XmlMDF_ADriver {
	public:
		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
Source: XmlObjMgt_Persistent
Target: TDF_Attribute
RelocTable: XmlObjMgt_RRelocationTable

Returns
-------
bool
") Paste;
		Standard_Boolean Paste(const XmlObjMgt_Persistent & Source, const opencascade::handle<TDF_Attribute> & Target, XmlObjMgt_RRelocationTable & RelocTable);

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
Source: TDF_Attribute
Target: XmlObjMgt_Persistent
RelocTable: XmlObjMgt_SRelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Source, XmlObjMgt_Persistent & Target, XmlObjMgt_SRelocationTable & RelocTable);

		/****************** XmlTObjDrivers_XYZDriver ******************/
		%feature("compactdefaultargs") XmlTObjDrivers_XYZDriver;
		%feature("autodoc", "No available documentation.

Parameters
----------
theMessageDriver: Message_Messenger

Returns
-------
None
") XmlTObjDrivers_XYZDriver;
		 XmlTObjDrivers_XYZDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

};


%make_alias(XmlTObjDrivers_XYZDriver)

%extend XmlTObjDrivers_XYZDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */

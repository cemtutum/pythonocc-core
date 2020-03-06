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
%define STEPAP242DOCSTRING
"StepAP242 module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_stepap242.html"
%enddef
%module (package="OCC.Core", docstring=STEPAP242DOCSTRING) StepAP242


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
#include<StepAP242_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TCollection_module.hxx>
#include<StepData_module.hxx>
#include<StepBasic_module.hxx>
#include<StepShape_module.hxx>
#include<StepDimTol_module.hxx>
#include<StepRepr_module.hxx>
#include<StepAP214_module.hxx>
#include<Message_module.hxx>
#include<StepBasic_module.hxx>
#include<Interface_module.hxx>
#include<StepShape_module.hxx>
#include<StepGeom_module.hxx>
#include<StepVisual_module.hxx>
#include<MoniTool_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TCollection.i
%import StepData.i
%import StepBasic.i
%import StepShape.i
%import StepDimTol.i
%import StepRepr.i
%import StepAP214.i
/* public enums */
/* end public enums declaration */

/* handles */
%wrap_handle(StepAP242_IdAttribute)
%wrap_handle(StepAP242_ItemIdentifiedRepresentationUsage)
%wrap_handle(StepAP242_DraughtingModelItemAssociation)
%wrap_handle(StepAP242_GeometricItemSpecificUsage)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/******************************
* class StepAP242_IdAttribute *
******************************/
class StepAP242_IdAttribute : public Standard_Transient {
	public:
		/****************** AttributeValue ******************/
		%feature("compactdefaultargs") AttributeValue;
		%feature("autodoc", "Returns field attributevalue.

	:rtype: opencascade::handle<TCollection_HAsciiString>
") AttributeValue;
		opencascade::handle<TCollection_HAsciiString> AttributeValue();

		/****************** IdentifiedItem ******************/
		%feature("compactdefaultargs") IdentifiedItem;
		%feature("autodoc", "Returns identifieditem.

	:rtype: StepAP242_IdAttributeSelect
") IdentifiedItem;
		StepAP242_IdAttributeSelect IdentifiedItem();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Init all field own and inherited.

	:param theAttributeValue:
	:type theAttributeValue: TCollection_HAsciiString
	:param theIdentifiedItem:
	:type theIdentifiedItem: StepAP242_IdAttributeSelect
	:rtype: None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theAttributeValue, const StepAP242_IdAttributeSelect & theIdentifiedItem);

		/****************** SetAttributeValue ******************/
		%feature("compactdefaultargs") SetAttributeValue;
		%feature("autodoc", "	:param theAttributeValue:
	:type theAttributeValue: TCollection_HAsciiString
	:rtype: None
") SetAttributeValue;
		void SetAttributeValue(const opencascade::handle<TCollection_HAsciiString> & theAttributeValue);

		/****************** SetIdentifiedItem ******************/
		%feature("compactdefaultargs") SetIdentifiedItem;
		%feature("autodoc", "Set field identifieditem.

	:param theIdentifiedItem:
	:type theIdentifiedItem: StepAP242_IdAttributeSelect
	:rtype: None
") SetIdentifiedItem;
		void SetIdentifiedItem(const StepAP242_IdAttributeSelect & theIdentifiedItem);

		/****************** StepAP242_IdAttribute ******************/
		%feature("compactdefaultargs") StepAP242_IdAttribute;
		%feature("autodoc", "Returns a idattribute.

	:rtype: None
") StepAP242_IdAttribute;
		 StepAP242_IdAttribute();

};


%make_alias(StepAP242_IdAttribute)

%extend StepAP242_IdAttribute {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class StepAP242_IdAttributeSelect *
************************************/
class StepAP242_IdAttributeSelect : public StepData_SelectType {
	public:
		/****************** Action ******************/
		%feature("compactdefaultargs") Action;
		%feature("autodoc", "Returns value as a action (null if another type).

	:rtype: opencascade::handle<StepBasic_Action>
") Action;
		opencascade::handle<StepBasic_Action> Action();

		/****************** Address ******************/
		%feature("compactdefaultargs") Address;
		%feature("autodoc", "Returns value as a address (null if another type).

	:rtype: opencascade::handle<StepBasic_Address>
") Address;
		opencascade::handle<StepBasic_Address> Address();

		/****************** ApplicationContext ******************/
		%feature("compactdefaultargs") ApplicationContext;
		%feature("autodoc", "Returns value as a applicationcontext (null if another type).

	:rtype: opencascade::handle<StepBasic_ApplicationContext>
") ApplicationContext;
		opencascade::handle<StepBasic_ApplicationContext> ApplicationContext();

		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a idattributeselect kind entity that is : 1 -> action 2 -> address 3 -> applicationcontext 4 -> dimensionalsize 5 -> geometrictolerance 6 -> group 7 -> reserved for organizatonalproject (not implemented in occt) 8 -> productcategory 9 -> propertydefinition 10 -> representation 11 -> shapeaspect 12 -> shapeaspectrelationship 0 else.

	:param ent:
	:type ent: Standard_Transient
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** DimensionalSize ******************/
		%feature("compactdefaultargs") DimensionalSize;
		%feature("autodoc", "Returns value as a dimensionalsize (null if another type).

	:rtype: opencascade::handle<StepShape_DimensionalSize>
") DimensionalSize;
		opencascade::handle<StepShape_DimensionalSize> DimensionalSize();

		/****************** GeometricTolerance ******************/
		%feature("compactdefaultargs") GeometricTolerance;
		%feature("autodoc", "Returns value as a geometrictolerance (null if another type).

	:rtype: opencascade::handle<StepDimTol_GeometricTolerance>
") GeometricTolerance;
		opencascade::handle<StepDimTol_GeometricTolerance> GeometricTolerance();

		/****************** Group ******************/
		%feature("compactdefaultargs") Group;
		%feature("autodoc", "Returns value as a group (null if another type).

	:rtype: opencascade::handle<StepBasic_Group>
") Group;
		opencascade::handle<StepBasic_Group> Group();

		/****************** ProductCategory ******************/
		%feature("compactdefaultargs") ProductCategory;
		%feature("autodoc", "Returns value as a productcategory (null if another type).

	:rtype: opencascade::handle<StepBasic_ProductCategory>
") ProductCategory;
		opencascade::handle<StepBasic_ProductCategory> ProductCategory();

		/****************** PropertyDefinition ******************/
		%feature("compactdefaultargs") PropertyDefinition;
		%feature("autodoc", "Returns value as a propertydefinition (null if another type).

	:rtype: opencascade::handle<StepRepr_PropertyDefinition>
") PropertyDefinition;
		opencascade::handle<StepRepr_PropertyDefinition> PropertyDefinition();

		/****************** Representation ******************/
		%feature("compactdefaultargs") Representation;
		%feature("autodoc", "Returns value as a representation (null if another type).

	:rtype: opencascade::handle<StepRepr_Representation>
") Representation;
		opencascade::handle<StepRepr_Representation> Representation();

		/****************** ShapeAspect ******************/
		%feature("compactdefaultargs") ShapeAspect;
		%feature("autodoc", "Returns value as a shapeaspect (null if another type).

	:rtype: opencascade::handle<StepRepr_ShapeAspect>
") ShapeAspect;
		opencascade::handle<StepRepr_ShapeAspect> ShapeAspect();

		/****************** ShapeAspectRelationship ******************/
		%feature("compactdefaultargs") ShapeAspectRelationship;
		%feature("autodoc", "Returns value as a shapeaspectrelationship (null if another type).

	:rtype: opencascade::handle<StepRepr_ShapeAspectRelationship>
") ShapeAspectRelationship;
		opencascade::handle<StepRepr_ShapeAspectRelationship> ShapeAspectRelationship();

		/****************** StepAP242_IdAttributeSelect ******************/
		%feature("compactdefaultargs") StepAP242_IdAttributeSelect;
		%feature("autodoc", "Returns a idattributeselect select type.

	:rtype: None
") StepAP242_IdAttributeSelect;
		 StepAP242_IdAttributeSelect();

};


%extend StepAP242_IdAttributeSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************************
* class StepAP242_ItemIdentifiedRepresentationUsage *
****************************************************/
class StepAP242_ItemIdentifiedRepresentationUsage : public Standard_Transient {
	public:
		/****************** Definition ******************/
		%feature("compactdefaultargs") Definition;
		%feature("autodoc", "Returns field definition.

	:rtype: StepAP242_ItemIdentifiedRepresentationUsageDefinition
") Definition;
		StepAP242_ItemIdentifiedRepresentationUsageDefinition Definition();

		/****************** Description ******************/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Returns field description.

	:rtype: opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** IdentifiedItem ******************/
		%feature("compactdefaultargs") IdentifiedItem;
		%feature("autodoc", "Returns field identifieditem.

	:rtype: opencascade::handle<StepRepr_HArray1OfRepresentationItem>
") IdentifiedItem;
		opencascade::handle<StepRepr_HArray1OfRepresentationItem> IdentifiedItem();

		/****************** IdentifiedItemValue ******************/
		%feature("compactdefaultargs") IdentifiedItemValue;
		%feature("autodoc", "Returns identified item with given number.

	:param num:
	:type num: int
	:rtype: opencascade::handle<StepRepr_RepresentationItem>
") IdentifiedItemValue;
		opencascade::handle<StepRepr_RepresentationItem> IdentifiedItemValue(const Standard_Integer num);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Init all fields own and inherited.

	:param theName:
	:type theName: TCollection_HAsciiString
	:param theDescription:
	:type theDescription: TCollection_HAsciiString
	:param theDefinition:
	:type theDefinition: StepAP242_ItemIdentifiedRepresentationUsageDefinition
	:param theUsedRepresentation:
	:type theUsedRepresentation: StepRepr_Representation
	:param theIdentifiedItem:
	:type theIdentifiedItem: StepRepr_HArray1OfRepresentationItem
	:rtype: None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<TCollection_HAsciiString> & theDescription, const StepAP242_ItemIdentifiedRepresentationUsageDefinition & theDefinition, const opencascade::handle<StepRepr_Representation> & theUsedRepresentation, const opencascade::handle<StepRepr_HArray1OfRepresentationItem> & theIdentifiedItem);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns field name.

	:rtype: opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** NbIdentifiedItem ******************/
		%feature("compactdefaultargs") NbIdentifiedItem;
		%feature("autodoc", "Returns number of identified items.

	:rtype: int
") NbIdentifiedItem;
		Standard_Integer NbIdentifiedItem();

		/****************** SetDefinition ******************/
		%feature("compactdefaultargs") SetDefinition;
		%feature("autodoc", "Set field definition.

	:param theDefinition:
	:type theDefinition: StepAP242_ItemIdentifiedRepresentationUsageDefinition
	:rtype: None
") SetDefinition;
		void SetDefinition(const StepAP242_ItemIdentifiedRepresentationUsageDefinition & theDefinition);

		/****************** SetDescription ******************/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "Set field description.

	:param theDescription:
	:type theDescription: TCollection_HAsciiString
	:rtype: None
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & theDescription);

		/****************** SetIdentifiedItem ******************/
		%feature("compactdefaultargs") SetIdentifiedItem;
		%feature("autodoc", "Set fiels identifieditem.

	:param theIdentifiedItem:
	:type theIdentifiedItem: StepRepr_HArray1OfRepresentationItem
	:rtype: None
") SetIdentifiedItem;
		void SetIdentifiedItem(const opencascade::handle<StepRepr_HArray1OfRepresentationItem> & theIdentifiedItem);

		/****************** SetIdentifiedItemValue ******************/
		%feature("compactdefaultargs") SetIdentifiedItemValue;
		%feature("autodoc", "Set identified item with given number.

	:param num:
	:type num: int
	:param theItem:
	:type theItem: StepRepr_RepresentationItem
	:rtype: None
") SetIdentifiedItemValue;
		void SetIdentifiedItemValue(const Standard_Integer num, const opencascade::handle<StepRepr_RepresentationItem> & theItem);

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "Set field name.

	:param theName:
	:type theName: TCollection_HAsciiString
	:rtype: None
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & theName);

		/****************** SetUsedRepresentation ******************/
		%feature("compactdefaultargs") SetUsedRepresentation;
		%feature("autodoc", "Set field usedrepresentation.

	:param theUsedRepresentation:
	:type theUsedRepresentation: StepRepr_Representation
	:rtype: None
") SetUsedRepresentation;
		void SetUsedRepresentation(const opencascade::handle<StepRepr_Representation> & theUsedRepresentation);

		/****************** StepAP242_ItemIdentifiedRepresentationUsage ******************/
		%feature("compactdefaultargs") StepAP242_ItemIdentifiedRepresentationUsage;
		%feature("autodoc", "Returns a itemidentifiedrepresentationusage.

	:rtype: None
") StepAP242_ItemIdentifiedRepresentationUsage;
		 StepAP242_ItemIdentifiedRepresentationUsage();

		/****************** UsedRepresentation ******************/
		%feature("compactdefaultargs") UsedRepresentation;
		%feature("autodoc", "Retuns field usedrepresentation.

	:rtype: opencascade::handle<StepRepr_Representation>
") UsedRepresentation;
		opencascade::handle<StepRepr_Representation> UsedRepresentation();

};


%make_alias(StepAP242_ItemIdentifiedRepresentationUsage)

%extend StepAP242_ItemIdentifiedRepresentationUsage {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************************
* class StepAP242_ItemIdentifiedRepresentationUsageDefinition *
**************************************************************/
class StepAP242_ItemIdentifiedRepresentationUsageDefinition : public StepData_SelectType {
	public:
		/****************** AppliedApprovalAssignment ******************/
		%feature("compactdefaultargs") AppliedApprovalAssignment;
		%feature("autodoc", "Returns value as a appliedapprovalassignment (null if another type).

	:rtype: opencascade::handle<StepAP214_AppliedApprovalAssignment>
") AppliedApprovalAssignment;
		opencascade::handle<StepAP214_AppliedApprovalAssignment> AppliedApprovalAssignment();

		/****************** AppliedDateAndTimeAssignment ******************/
		%feature("compactdefaultargs") AppliedDateAndTimeAssignment;
		%feature("autodoc", "Returns value as a applieddateandtimeassignment (null if another type).

	:rtype: opencascade::handle<StepAP214_AppliedDateAndTimeAssignment>
") AppliedDateAndTimeAssignment;
		opencascade::handle<StepAP214_AppliedDateAndTimeAssignment> AppliedDateAndTimeAssignment();

		/****************** AppliedDateAssignment ******************/
		%feature("compactdefaultargs") AppliedDateAssignment;
		%feature("autodoc", "Returns value as a applieddateassignment (null if another type).

	:rtype: opencascade::handle<StepAP214_AppliedDateAssignment>
") AppliedDateAssignment;
		opencascade::handle<StepAP214_AppliedDateAssignment> AppliedDateAssignment();

		/****************** AppliedDocumentReference ******************/
		%feature("compactdefaultargs") AppliedDocumentReference;
		%feature("autodoc", "Returns value as a applieddocumentreference (null if another type).

	:rtype: opencascade::handle<StepAP214_AppliedDocumentReference>
") AppliedDocumentReference;
		opencascade::handle<StepAP214_AppliedDocumentReference> AppliedDocumentReference();

		/****************** AppliedExternalIdentificationAssignment ******************/
		%feature("compactdefaultargs") AppliedExternalIdentificationAssignment;
		%feature("autodoc", "Returns value as a appliedexternalidentificationassignment (null if another type).

	:rtype: opencascade::handle<StepAP214_AppliedExternalIdentificationAssignment>
") AppliedExternalIdentificationAssignment;
		opencascade::handle<StepAP214_AppliedExternalIdentificationAssignment> AppliedExternalIdentificationAssignment();

		/****************** AppliedGroupAssignment ******************/
		%feature("compactdefaultargs") AppliedGroupAssignment;
		%feature("autodoc", "Returns value as a appliedgroupassignment (null if another type).

	:rtype: opencascade::handle<StepAP214_AppliedGroupAssignment>
") AppliedGroupAssignment;
		opencascade::handle<StepAP214_AppliedGroupAssignment> AppliedGroupAssignment();

		/****************** AppliedOrganizationAssignment ******************/
		%feature("compactdefaultargs") AppliedOrganizationAssignment;
		%feature("autodoc", "Returns value as a appliedorganizationassignment (null if another type).

	:rtype: opencascade::handle<StepAP214_AppliedOrganizationAssignment>
") AppliedOrganizationAssignment;
		opencascade::handle<StepAP214_AppliedOrganizationAssignment> AppliedOrganizationAssignment();

		/****************** AppliedPersonAndOrganizationAssignment ******************/
		%feature("compactdefaultargs") AppliedPersonAndOrganizationAssignment;
		%feature("autodoc", "Returns value as a appliedpersonandorganizationassignment (null if another type).

	:rtype: opencascade::handle<StepAP214_AppliedPersonAndOrganizationAssignment>
") AppliedPersonAndOrganizationAssignment;
		opencascade::handle<StepAP214_AppliedPersonAndOrganizationAssignment> AppliedPersonAndOrganizationAssignment();

		/****************** AppliedSecurityClassificationAssignment ******************/
		%feature("compactdefaultargs") AppliedSecurityClassificationAssignment;
		%feature("autodoc", "Returns value as a appliedsecurityclassificationassignment (null if another type).

	:rtype: opencascade::handle<StepAP214_AppliedSecurityClassificationAssignment>
") AppliedSecurityClassificationAssignment;
		opencascade::handle<StepAP214_AppliedSecurityClassificationAssignment> AppliedSecurityClassificationAssignment();

		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a itemidentifiedrepresentationusagedefinition kind entity that is : 1 -> appliedapprovalassignment 2 -> applieddateandtimeassignment 3 -> applieddateassignment 4 -> applieddocumentreference 5 -> appliedexternalidentificationassignment 6 -> appliedgroupassignment 7 -> appliedorganizationassignment 8 -> appliedpersonandorganizationassignment 9 -> appliedsecurityclassificationassignment 10 -> dimensionalsize 11 -> generalproperty 12 -> geometrictolerance 13 -> productdefinitionrelationship 14 -> propertydefinition 15 -> propertydefinitionrelationship 16 -> shapeaspect 17 -> shapeaspectrelationship 0 else.

	:param ent:
	:type ent: Standard_Transient
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** DimensionalSize ******************/
		%feature("compactdefaultargs") DimensionalSize;
		%feature("autodoc", "Returns value as a dimensionalsize (null if another type).

	:rtype: opencascade::handle<StepShape_DimensionalSize>
") DimensionalSize;
		opencascade::handle<StepShape_DimensionalSize> DimensionalSize();

		/****************** GeneralProperty ******************/
		%feature("compactdefaultargs") GeneralProperty;
		%feature("autodoc", "Returns value as a generalproperty (null if another type).

	:rtype: opencascade::handle<StepBasic_GeneralProperty>
") GeneralProperty;
		opencascade::handle<StepBasic_GeneralProperty> GeneralProperty();

		/****************** GeometricTolerance ******************/
		%feature("compactdefaultargs") GeometricTolerance;
		%feature("autodoc", "Returns value as a geometrictolerance (null if another type).

	:rtype: opencascade::handle<StepDimTol_GeometricTolerance>
") GeometricTolerance;
		opencascade::handle<StepDimTol_GeometricTolerance> GeometricTolerance();

		/****************** ProductDefinitionRelationship ******************/
		%feature("compactdefaultargs") ProductDefinitionRelationship;
		%feature("autodoc", "Returns value as a productdefinitionrelationship (null if another type).

	:rtype: opencascade::handle<StepBasic_ProductDefinitionRelationship>
") ProductDefinitionRelationship;
		opencascade::handle<StepBasic_ProductDefinitionRelationship> ProductDefinitionRelationship();

		/****************** PropertyDefinition ******************/
		%feature("compactdefaultargs") PropertyDefinition;
		%feature("autodoc", "Returns value as a propertydefinition (null if another type).

	:rtype: opencascade::handle<StepRepr_PropertyDefinition>
") PropertyDefinition;
		opencascade::handle<StepRepr_PropertyDefinition> PropertyDefinition();

		/****************** PropertyDefinitionRelationship ******************/
		%feature("compactdefaultargs") PropertyDefinitionRelationship;
		%feature("autodoc", "Returns value as a propertydefinitionrelationship (null if another type).

	:rtype: opencascade::handle<StepRepr_PropertyDefinitionRelationship>
") PropertyDefinitionRelationship;
		opencascade::handle<StepRepr_PropertyDefinitionRelationship> PropertyDefinitionRelationship();

		/****************** ShapeAspect ******************/
		%feature("compactdefaultargs") ShapeAspect;
		%feature("autodoc", "Returns value as a shapeaspect (null if another type).

	:rtype: opencascade::handle<StepRepr_ShapeAspect>
") ShapeAspect;
		opencascade::handle<StepRepr_ShapeAspect> ShapeAspect();

		/****************** ShapeAspectRelationship ******************/
		%feature("compactdefaultargs") ShapeAspectRelationship;
		%feature("autodoc", "Returns value as a shapeaspectrelationship (null if another type).

	:rtype: opencascade::handle<StepRepr_ShapeAspectRelationship>
") ShapeAspectRelationship;
		opencascade::handle<StepRepr_ShapeAspectRelationship> ShapeAspectRelationship();

		/****************** StepAP242_ItemIdentifiedRepresentationUsageDefinition ******************/
		%feature("compactdefaultargs") StepAP242_ItemIdentifiedRepresentationUsageDefinition;
		%feature("autodoc", "Returns a itemidentifiedrepresentationusagedefinition select type.

	:rtype: None
") StepAP242_ItemIdentifiedRepresentationUsageDefinition;
		 StepAP242_ItemIdentifiedRepresentationUsageDefinition();

};


%extend StepAP242_ItemIdentifiedRepresentationUsageDefinition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************
* class StepAP242_DraughtingModelItemAssociation *
*************************************************/
class StepAP242_DraughtingModelItemAssociation : public StepAP242_ItemIdentifiedRepresentationUsage {
	public:
		/****************** StepAP242_DraughtingModelItemAssociation ******************/
		%feature("compactdefaultargs") StepAP242_DraughtingModelItemAssociation;
		%feature("autodoc", "	:rtype: None
") StepAP242_DraughtingModelItemAssociation;
		 StepAP242_DraughtingModelItemAssociation();

};


%make_alias(StepAP242_DraughtingModelItemAssociation)

%extend StepAP242_DraughtingModelItemAssociation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class StepAP242_GeometricItemSpecificUsage *
*********************************************/
class StepAP242_GeometricItemSpecificUsage : public StepAP242_ItemIdentifiedRepresentationUsage {
	public:
		/****************** StepAP242_GeometricItemSpecificUsage ******************/
		%feature("compactdefaultargs") StepAP242_GeometricItemSpecificUsage;
		%feature("autodoc", "	:rtype: None
") StepAP242_GeometricItemSpecificUsage;
		 StepAP242_GeometricItemSpecificUsage();

};


%make_alias(StepAP242_GeometricItemSpecificUsage)

%extend StepAP242_GeometricItemSpecificUsage {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */

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
%define STEPCONSTRUCTDOCSTRING
"STEPConstruct module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_stepconstruct.html"
%enddef
%module (package="OCC.Core", docstring=STEPCONSTRUCTDOCSTRING) STEPConstruct


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
#include<STEPConstruct_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Transfer_module.hxx>
#include<StepShape_module.hxx>
#include<TopoDS_module.hxx>
#include<StepRepr_module.hxx>
#include<TopLoc_module.hxx>
#include<StepBasic_module.hxx>
#include<StepAP203_module.hxx>
#include<Interface_module.hxx>
#include<StepGeom_module.hxx>
#include<TCollection_module.hxx>
#include<TColStd_module.hxx>
#include<StepData_module.hxx>
#include<gp_module.hxx>
#include<XSControl_module.hxx>
#include<StepVisual_module.hxx>
#include<Quantity_module.hxx>
#include<TopTools_module.hxx>
#include<IFSelect_module.hxx>
#include<Message_module.hxx>
#include<StepBasic_module.hxx>
#include<Geom2d_module.hxx>
#include<Geom_module.hxx>
#include<StepData_module.hxx>
#include<StepShape_module.hxx>
#include<MoniTool_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Transfer.i
%import StepShape.i
%import TopoDS.i
%import StepRepr.i
%import TopLoc.i
%import StepBasic.i
%import StepAP203.i
%import Interface.i
%import StepGeom.i
%import TCollection.i
%import TColStd.i
%import StepData.i
%import gp.i
%import XSControl.i
%import StepVisual.i
%import Quantity.i
/* public enums */
/* end public enums declaration */

/* handles */
/* end handles declaration */

/* templates */
%template(STEPConstruct_DataMapOfAsciiStringTransient) NCollection_DataMap<TCollection_AsciiString,opencascade::handle<Standard_Transient>,TCollection_AsciiString>;
%template(STEPConstruct_DataMapOfPointTransient) NCollection_DataMap<gp_Pnt,opencascade::handle<Standard_Transient>,STEPConstruct_PointHasher>;
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap<TCollection_AsciiString, opencascade::handle<Standard_Transient>, TCollection_AsciiString> STEPConstruct_DataMapOfAsciiStringTransient;
typedef NCollection_DataMap<TCollection_AsciiString, opencascade::handle<Standard_Transient>, TCollection_AsciiString>::Iterator STEPConstruct_DataMapIteratorOfDataMapOfAsciiStringTransient;
typedef NCollection_DataMap<gp_Pnt, opencascade::handle<Standard_Transient>, STEPConstruct_PointHasher> STEPConstruct_DataMapOfPointTransient;
typedef NCollection_DataMap<gp_Pnt, opencascade::handle<Standard_Transient>, STEPConstruct_PointHasher>::Iterator STEPConstruct_DataMapIteratorOfDataMapOfPointTransient;
/* end typedefs declaration */

/**********************
* class STEPConstruct *
**********************/
%rename(stepconstruct) STEPConstruct;
class STEPConstruct {
	public:
		/****************** FindCDSR ******************/
		%feature("compactdefaultargs") FindCDSR;
		%feature("autodoc", "Find cdsr correcponding to the component in the specified assembly.

	:param ComponentBinder:
	:type ComponentBinder: Transfer_Binder
	:param AssemblySDR:
	:type AssemblySDR: StepShape_ShapeDefinitionRepresentation
	:param ComponentCDSR:
	:type ComponentCDSR: StepShape_ContextDependentShapeRepresentation
	:rtype: bool
") FindCDSR;
		static Standard_Boolean FindCDSR(const opencascade::handle<Transfer_Binder> & ComponentBinder, const opencascade::handle<StepShape_ShapeDefinitionRepresentation> & AssemblySDR, opencascade::handle<StepShape_ContextDependentShapeRepresentation> & ComponentCDSR);

		/****************** FindEntity ******************/
		%feature("compactdefaultargs") FindEntity;
		%feature("autodoc", "Returns step entity of the (sub)type of representationitem which is a result of the tranalation of the shape, or null if no result is recorded.

	:param FinderProcess:
	:type FinderProcess: Transfer_FinderProcess
	:param Shape:
	:type Shape: TopoDS_Shape
	:rtype: opencascade::handle<StepRepr_RepresentationItem>
") FindEntity;
		static opencascade::handle<StepRepr_RepresentationItem> FindEntity(const opencascade::handle<Transfer_FinderProcess> & FinderProcess, const TopoDS_Shape & Shape);

		/****************** FindEntity ******************/
		%feature("compactdefaultargs") FindEntity;
		%feature("autodoc", "The same as above, but in the case if item not found, repeats search on the same shape without location. the loc corresponds to the location with which result is found (either location of the shape, or null).

	:param FinderProcess:
	:type FinderProcess: Transfer_FinderProcess
	:param Shape:
	:type Shape: TopoDS_Shape
	:param Loc:
	:type Loc: TopLoc_Location
	:rtype: opencascade::handle<StepRepr_RepresentationItem>
") FindEntity;
		static opencascade::handle<StepRepr_RepresentationItem> FindEntity(const opencascade::handle<Transfer_FinderProcess> & FinderProcess, const TopoDS_Shape & Shape, TopLoc_Location & Loc);

		/****************** FindShape ******************/
		%feature("compactdefaultargs") FindShape;
		%feature("autodoc", "Returns shape resulting from given step entity (null if not mapped).

	:param TransientProcess:
	:type TransientProcess: Transfer_TransientProcess
	:param item:
	:type item: StepRepr_RepresentationItem
	:rtype: TopoDS_Shape
") FindShape;
		static TopoDS_Shape FindShape(const opencascade::handle<Transfer_TransientProcess> & TransientProcess, const opencascade::handle<StepRepr_RepresentationItem> & item);

};


%extend STEPConstruct {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class STEPConstruct_AP203Context *
***********************************/
class STEPConstruct_AP203Context {
	public:
		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears all fields describing entities specific to each part.

	:rtype: None
") Clear;
		void Clear();

		/****************** DefaultApproval ******************/
		%feature("compactdefaultargs") DefaultApproval;
		%feature("autodoc", "Returns default approval entity which is used when no other data are available.

	:rtype: opencascade::handle<StepBasic_Approval>
") DefaultApproval;
		opencascade::handle<StepBasic_Approval> DefaultApproval();

		/****************** DefaultDateAndTime ******************/
		%feature("compactdefaultargs") DefaultDateAndTime;
		%feature("autodoc", "Returns default date_and_time entity which is used when no other data are available.

	:rtype: opencascade::handle<StepBasic_DateAndTime>
") DefaultDateAndTime;
		opencascade::handle<StepBasic_DateAndTime> DefaultDateAndTime();

		/****************** DefaultPersonAndOrganization ******************/
		%feature("compactdefaultargs") DefaultPersonAndOrganization;
		%feature("autodoc", "Returns default person_and_organization entity which is used when no other data are available.

	:rtype: opencascade::handle<StepBasic_PersonAndOrganization>
") DefaultPersonAndOrganization;
		opencascade::handle<StepBasic_PersonAndOrganization> DefaultPersonAndOrganization();

		/****************** DefaultSecurityClassificationLevel ******************/
		%feature("compactdefaultargs") DefaultSecurityClassificationLevel;
		%feature("autodoc", "Returns default security_classification_level entity which is used when no other data are available.

	:rtype: opencascade::handle<StepBasic_SecurityClassificationLevel>
") DefaultSecurityClassificationLevel;
		opencascade::handle<StepBasic_SecurityClassificationLevel> DefaultSecurityClassificationLevel();

		/****************** GetApproval ******************/
		%feature("compactdefaultargs") GetApproval;
		%feature("autodoc", "	:rtype: opencascade::handle<StepAP203_CcDesignApproval>
") GetApproval;
		opencascade::handle<StepAP203_CcDesignApproval> GetApproval();

		/****************** GetApprovalDateTime ******************/
		%feature("compactdefaultargs") GetApprovalDateTime;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_ApprovalDateTime>
") GetApprovalDateTime;
		opencascade::handle<StepBasic_ApprovalDateTime> GetApprovalDateTime();

		/****************** GetApprover ******************/
		%feature("compactdefaultargs") GetApprover;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_ApprovalPersonOrganization>
") GetApprover;
		opencascade::handle<StepBasic_ApprovalPersonOrganization> GetApprover();

		/****************** GetClassificationDate ******************/
		%feature("compactdefaultargs") GetClassificationDate;
		%feature("autodoc", "	:rtype: opencascade::handle<StepAP203_CcDesignDateAndTimeAssignment>
") GetClassificationDate;
		opencascade::handle<StepAP203_CcDesignDateAndTimeAssignment> GetClassificationDate();

		/****************** GetClassificationOfficer ******************/
		%feature("compactdefaultargs") GetClassificationOfficer;
		%feature("autodoc", "	:rtype: opencascade::handle<StepAP203_CcDesignPersonAndOrganizationAssignment>
") GetClassificationOfficer;
		opencascade::handle<StepAP203_CcDesignPersonAndOrganizationAssignment> GetClassificationOfficer();

		/****************** GetCreationDate ******************/
		%feature("compactdefaultargs") GetCreationDate;
		%feature("autodoc", "	:rtype: opencascade::handle<StepAP203_CcDesignDateAndTimeAssignment>
") GetCreationDate;
		opencascade::handle<StepAP203_CcDesignDateAndTimeAssignment> GetCreationDate();

		/****************** GetCreator ******************/
		%feature("compactdefaultargs") GetCreator;
		%feature("autodoc", "	:rtype: opencascade::handle<StepAP203_CcDesignPersonAndOrganizationAssignment>
") GetCreator;
		opencascade::handle<StepAP203_CcDesignPersonAndOrganizationAssignment> GetCreator();

		/****************** GetDesignOwner ******************/
		%feature("compactdefaultargs") GetDesignOwner;
		%feature("autodoc", "	:rtype: opencascade::handle<StepAP203_CcDesignPersonAndOrganizationAssignment>
") GetDesignOwner;
		opencascade::handle<StepAP203_CcDesignPersonAndOrganizationAssignment> GetDesignOwner();

		/****************** GetDesignSupplier ******************/
		%feature("compactdefaultargs") GetDesignSupplier;
		%feature("autodoc", "	:rtype: opencascade::handle<StepAP203_CcDesignPersonAndOrganizationAssignment>
") GetDesignSupplier;
		opencascade::handle<StepAP203_CcDesignPersonAndOrganizationAssignment> GetDesignSupplier();

		/****************** GetProductCategoryRelationship ******************/
		%feature("compactdefaultargs") GetProductCategoryRelationship;
		%feature("autodoc", "Return entities (roots) instantiated for the part by method init.

	:rtype: opencascade::handle<StepBasic_ProductCategoryRelationship>
") GetProductCategoryRelationship;
		opencascade::handle<StepBasic_ProductCategoryRelationship> GetProductCategoryRelationship();

		/****************** GetSecurity ******************/
		%feature("compactdefaultargs") GetSecurity;
		%feature("autodoc", "	:rtype: opencascade::handle<StepAP203_CcDesignSecurityClassification>
") GetSecurity;
		opencascade::handle<StepAP203_CcDesignSecurityClassification> GetSecurity();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Takes sdr (part) which brings all standard data around part (common for ap203 and ap214) and creates all the additional entities required for ap203.

	:param sdr:
	:type sdr: StepShape_ShapeDefinitionRepresentation
	:rtype: None
") Init;
		void Init(const opencascade::handle<StepShape_ShapeDefinitionRepresentation> & sdr);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Takes tool which describes standard data around part (common for ap203 and ap214) and creates all the additional entities required for ap203 //! the created entities can be obtained by calls to methods getcreator(), getdesignowner(), getdesignsupplier(), getclassificationofficer(), getsecurity(), getcreationdate(), getclassificationdate(), getapproval(), getapprover(), getapprovaldatetime(), getproductcategoryrelationship().

	:param SDRTool:
	:type SDRTool: STEPConstruct_Part
	:rtype: None
") Init;
		void Init(const STEPConstruct_Part & SDRTool);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Takes nauo which describes assembly link to component and creates the security_classification entity associated to it as required by the ap203 //! instantiated (or existing previously) entities concerned can be obtained by calls to methods getclassificationofficer(), getsecurity(), getclassificationdate(), getapproval(), getapprover(), getapprovaldatetime() takes tool which describes standard data around part (common for ap203 and ap214) and takes from model (or creates if missing) all the additional entities required by ap203.

	:param nauo:
	:type nauo: StepRepr_NextAssemblyUsageOccurrence
	:rtype: None
") Init;
		void Init(const opencascade::handle<StepRepr_NextAssemblyUsageOccurrence> & nauo);

		/****************** InitApprovalRequisites ******************/
		%feature("compactdefaultargs") InitApprovalRequisites;
		%feature("autodoc", "Initializes approver and approvaldatetime entities according to approval entity.

	:rtype: None
") InitApprovalRequisites;
		void InitApprovalRequisites();

		/****************** InitAssembly ******************/
		%feature("compactdefaultargs") InitAssembly;
		%feature("autodoc", "Initializes all missing data which are required for assembly.

	:param nauo:
	:type nauo: StepRepr_NextAssemblyUsageOccurrence
	:rtype: None
") InitAssembly;
		void InitAssembly(const opencascade::handle<StepRepr_NextAssemblyUsageOccurrence> & nauo);

		/****************** InitRoles ******************/
		%feature("compactdefaultargs") InitRoles;
		%feature("autodoc", "Initializes constant fields (shared entities).

	:rtype: None
") InitRoles;
		void InitRoles();

		/****************** InitSecurityRequisites ******************/
		%feature("compactdefaultargs") InitSecurityRequisites;
		%feature("autodoc", "Initializes classificationofficer and classificationdate entities according to security entity.

	:rtype: None
") InitSecurityRequisites;
		void InitSecurityRequisites();

		/****************** RoleApprover ******************/
		%feature("compactdefaultargs") RoleApprover;
		%feature("autodoc", "Return predefined personandorganizationrole and datetimerole entities named 'creator', 'design owner', 'design supplier', 'classification officer', 'creation date', 'classification date', 'approver'.

	:rtype: opencascade::handle<StepBasic_ApprovalRole>
") RoleApprover;
		opencascade::handle<StepBasic_ApprovalRole> RoleApprover();

		/****************** RoleClassificationDate ******************/
		%feature("compactdefaultargs") RoleClassificationDate;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_DateTimeRole>
") RoleClassificationDate;
		opencascade::handle<StepBasic_DateTimeRole> RoleClassificationDate();

		/****************** RoleClassificationOfficer ******************/
		%feature("compactdefaultargs") RoleClassificationOfficer;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_PersonAndOrganizationRole>
") RoleClassificationOfficer;
		opencascade::handle<StepBasic_PersonAndOrganizationRole> RoleClassificationOfficer();

		/****************** RoleCreationDate ******************/
		%feature("compactdefaultargs") RoleCreationDate;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_DateTimeRole>
") RoleCreationDate;
		opencascade::handle<StepBasic_DateTimeRole> RoleCreationDate();

		/****************** RoleCreator ******************/
		%feature("compactdefaultargs") RoleCreator;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_PersonAndOrganizationRole>
") RoleCreator;
		opencascade::handle<StepBasic_PersonAndOrganizationRole> RoleCreator();

		/****************** RoleDesignOwner ******************/
		%feature("compactdefaultargs") RoleDesignOwner;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_PersonAndOrganizationRole>
") RoleDesignOwner;
		opencascade::handle<StepBasic_PersonAndOrganizationRole> RoleDesignOwner();

		/****************** RoleDesignSupplier ******************/
		%feature("compactdefaultargs") RoleDesignSupplier;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_PersonAndOrganizationRole>
") RoleDesignSupplier;
		opencascade::handle<StepBasic_PersonAndOrganizationRole> RoleDesignSupplier();

		/****************** STEPConstruct_AP203Context ******************/
		%feature("compactdefaultargs") STEPConstruct_AP203Context;
		%feature("autodoc", "Creates tool and fills constant fields.

	:rtype: None
") STEPConstruct_AP203Context;
		 STEPConstruct_AP203Context();

		/****************** SetDefaultApproval ******************/
		%feature("compactdefaultargs") SetDefaultApproval;
		%feature("autodoc", "Sets default approval.

	:param app:
	:type app: StepBasic_Approval
	:rtype: None
") SetDefaultApproval;
		void SetDefaultApproval(const opencascade::handle<StepBasic_Approval> & app);

		/****************** SetDefaultDateAndTime ******************/
		%feature("compactdefaultargs") SetDefaultDateAndTime;
		%feature("autodoc", "Sets default date_and_time entity.

	:param dt:
	:type dt: StepBasic_DateAndTime
	:rtype: None
") SetDefaultDateAndTime;
		void SetDefaultDateAndTime(const opencascade::handle<StepBasic_DateAndTime> & dt);

		/****************** SetDefaultPersonAndOrganization ******************/
		%feature("compactdefaultargs") SetDefaultPersonAndOrganization;
		%feature("autodoc", "Sets default person_and_organization entity.

	:param po:
	:type po: StepBasic_PersonAndOrganization
	:rtype: None
") SetDefaultPersonAndOrganization;
		void SetDefaultPersonAndOrganization(const opencascade::handle<StepBasic_PersonAndOrganization> & po);

		/****************** SetDefaultSecurityClassificationLevel ******************/
		%feature("compactdefaultargs") SetDefaultSecurityClassificationLevel;
		%feature("autodoc", "Sets default security_classification_level.

	:param sc:
	:type sc: StepBasic_SecurityClassificationLevel
	:rtype: None
") SetDefaultSecurityClassificationLevel;
		void SetDefaultSecurityClassificationLevel(const opencascade::handle<StepBasic_SecurityClassificationLevel> & sc);

};


%extend STEPConstruct_AP203Context {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class STEPConstruct_Assembly *
*******************************/
class STEPConstruct_Assembly {
	public:
		/****************** CheckSRRReversesNAUO ******************/
		%feature("compactdefaultargs") CheckSRRReversesNAUO;
		%feature("autodoc", "Checks whether srr's definition of assembly and component contradicts with nauo definition or not, according to model schema (ap214 or ap203).

	:param theGraph:
	:type theGraph: Interface_Graph
	:param CDSR:
	:type CDSR: StepShape_ContextDependentShapeRepresentation
	:rtype: bool
") CheckSRRReversesNAUO;
		static Standard_Boolean CheckSRRReversesNAUO(const Interface_Graph & theGraph, const opencascade::handle<StepShape_ContextDependentShapeRepresentation> & CDSR);

		/****************** GetNAUO ******************/
		%feature("compactdefaultargs") GetNAUO;
		%feature("autodoc", "Returns nauo object describing the assembly link.

	:rtype: opencascade::handle<StepRepr_NextAssemblyUsageOccurrence>
") GetNAUO;
		opencascade::handle<StepRepr_NextAssemblyUsageOccurrence> GetNAUO();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialises with starting values ax0 : origin axis (typically, standard xyz) loc : location to which place the item makes a mappeditem resulting value is returned by itemvalue.

	:param aSR:
	:type aSR: StepShape_ShapeDefinitionRepresentation
	:param SDR0:
	:type SDR0: StepShape_ShapeDefinitionRepresentation
	:param Ax0:
	:type Ax0: StepGeom_Axis2Placement3d
	:param Loc:
	:type Loc: StepGeom_Axis2Placement3d
	:rtype: None
") Init;
		void Init(const opencascade::handle<StepShape_ShapeDefinitionRepresentation> & aSR, const opencascade::handle<StepShape_ShapeDefinitionRepresentation> & SDR0, const opencascade::handle<StepGeom_Axis2Placement3d> & Ax0, const opencascade::handle<StepGeom_Axis2Placement3d> & Loc);

		/****************** ItemLocation ******************/
		%feature("compactdefaultargs") ItemLocation;
		%feature("autodoc", "Returns the location of the item, computed from starting aloc.

	:rtype: opencascade::handle<StepGeom_Axis2Placement3d>
") ItemLocation;
		opencascade::handle<StepGeom_Axis2Placement3d> ItemLocation();

		/****************** ItemValue ******************/
		%feature("compactdefaultargs") ItemValue;
		%feature("autodoc", "Returns the value if no make... has been called, returns the starting sr.

	:rtype: opencascade::handle<Standard_Transient>
") ItemValue;
		opencascade::handle<Standard_Transient> ItemValue();

		/****************** MakeRelationship ******************/
		%feature("compactdefaultargs") MakeRelationship;
		%feature("autodoc", "Make a (shaperepresentationrelationship,...withtransformation) resulting value is returned by itemvalue.

	:rtype: None
") MakeRelationship;
		void MakeRelationship();

		/****************** STEPConstruct_Assembly ******************/
		%feature("compactdefaultargs") STEPConstruct_Assembly;
		%feature("autodoc", "	:rtype: None
") STEPConstruct_Assembly;
		 STEPConstruct_Assembly();

};


%extend STEPConstruct_Assembly {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class STEPConstruct_ContextTool *
**********************************/
class STEPConstruct_ContextTool {
	public:
		/****************** AP203Context ******************/
		%feature("compactdefaultargs") AP203Context;
		%feature("autodoc", "Returns tool which maintains context specific for ap203.

	:rtype: STEPConstruct_AP203Context
") AP203Context;
		STEPConstruct_AP203Context & AP203Context();

		/****************** AddAPD ******************/
		%feature("compactdefaultargs") AddAPD;
		%feature("autodoc", "	:param enforce: default value is Standard_False
	:type enforce: bool
	:rtype: None
") AddAPD;
		void AddAPD(const Standard_Boolean enforce = Standard_False);

		/****************** GetACname ******************/
		%feature("compactdefaultargs") GetACname;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") GetACname;
		opencascade::handle<TCollection_HAsciiString> GetACname();

		/****************** GetACschemaName ******************/
		%feature("compactdefaultargs") GetACschemaName;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") GetACschemaName;
		opencascade::handle<TCollection_HAsciiString> GetACschemaName();

		/****************** GetACstatus ******************/
		%feature("compactdefaultargs") GetACstatus;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") GetACstatus;
		opencascade::handle<TCollection_HAsciiString> GetACstatus();

		/****************** GetACyear ******************/
		%feature("compactdefaultargs") GetACyear;
		%feature("autodoc", "	:rtype: int
") GetACyear;
		Standard_Integer GetACyear();

		/****************** GetAPD ******************/
		%feature("compactdefaultargs") GetAPD;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_ApplicationProtocolDefinition>
") GetAPD;
		opencascade::handle<StepBasic_ApplicationProtocolDefinition> GetAPD();

		/****************** GetDefaultAxis ******************/
		%feature("compactdefaultargs") GetDefaultAxis;
		%feature("autodoc", "Returns a default axis placement.

	:rtype: opencascade::handle<StepGeom_Axis2Placement3d>
") GetDefaultAxis;
		opencascade::handle<StepGeom_Axis2Placement3d> GetDefaultAxis();

		/****************** GetProductName ******************/
		%feature("compactdefaultargs") GetProductName;
		%feature("autodoc", "Generates a product name basing on write.step.product.name parameter and current position in the assembly structure.

	:rtype: opencascade::handle<TCollection_HAsciiString>
") GetProductName;
		opencascade::handle<TCollection_HAsciiString> GetProductName();

		/****************** GetRootsForAssemblyLink ******************/
		%feature("compactdefaultargs") GetRootsForAssemblyLink;
		%feature("autodoc", "Produces and returns a full list of root entities required for assembly link identified by assembly (including nauo and cdsr).

	:param assembly:
	:type assembly: STEPConstruct_Assembly
	:rtype: opencascade::handle<TColStd_HSequenceOfTransient>
") GetRootsForAssemblyLink;
		opencascade::handle<TColStd_HSequenceOfTransient> GetRootsForAssemblyLink(const STEPConstruct_Assembly & assembly);

		/****************** GetRootsForPart ******************/
		%feature("compactdefaultargs") GetRootsForPart;
		%feature("autodoc", "Produces and returns a full list of root entities required for part identified by sdrtool (including sdr itself).

	:param SDRTool:
	:type SDRTool: STEPConstruct_Part
	:rtype: opencascade::handle<TColStd_HSequenceOfTransient>
") GetRootsForPart;
		opencascade::handle<TColStd_HSequenceOfTransient> GetRootsForPart(const STEPConstruct_Part & SDRTool);

		/****************** Index ******************/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Returns current index of assembly component on current level.

	:rtype: int
") Index;
		Standard_Integer Index();

		/****************** IsAP203 ******************/
		%feature("compactdefaultargs") IsAP203;
		%feature("autodoc", "Returns true if apd.schema_name is config_control_design.

	:rtype: bool
") IsAP203;
		Standard_Boolean IsAP203();

		/****************** IsAP214 ******************/
		%feature("compactdefaultargs") IsAP214;
		%feature("autodoc", "Returns true if apd.schema_name is automotive_design.

	:rtype: bool
") IsAP214;
		Standard_Boolean IsAP214();

		/****************** IsAP242 ******************/
		%feature("compactdefaultargs") IsAP242;
		%feature("autodoc", "Returns true if apd.schema_name is ap242_managed_model_based_3d_engineering.

	:rtype: bool
") IsAP242;
		Standard_Boolean IsAP242();

		/****************** Level ******************/
		%feature("compactdefaultargs") Level;
		%feature("autodoc", "Returns current assembly level.

	:rtype: int
") Level;
		Standard_Integer Level();

		/****************** NextIndex ******************/
		%feature("compactdefaultargs") NextIndex;
		%feature("autodoc", "	:rtype: None
") NextIndex;
		void NextIndex();

		/****************** NextLevel ******************/
		%feature("compactdefaultargs") NextLevel;
		%feature("autodoc", "	:rtype: None
") NextLevel;
		void NextLevel();

		/****************** PrevIndex ******************/
		%feature("compactdefaultargs") PrevIndex;
		%feature("autodoc", "	:rtype: None
") PrevIndex;
		void PrevIndex();

		/****************** PrevLevel ******************/
		%feature("compactdefaultargs") PrevLevel;
		%feature("autodoc", "	:rtype: None
") PrevLevel;
		void PrevLevel();

		/****************** STEPConstruct_ContextTool ******************/
		%feature("compactdefaultargs") STEPConstruct_ContextTool;
		%feature("autodoc", "	:rtype: None
") STEPConstruct_ContextTool;
		 STEPConstruct_ContextTool();

		/****************** STEPConstruct_ContextTool ******************/
		%feature("compactdefaultargs") STEPConstruct_ContextTool;
		%feature("autodoc", "	:param aStepModel:
	:type aStepModel: StepData_StepModel
	:rtype: None
") STEPConstruct_ContextTool;
		 STEPConstruct_ContextTool(const opencascade::handle<StepData_StepModel> & aStepModel);

		/****************** SetACname ******************/
		%feature("compactdefaultargs") SetACname;
		%feature("autodoc", "	:param name:
	:type name: TCollection_HAsciiString
	:rtype: None
") SetACname;
		void SetACname(const opencascade::handle<TCollection_HAsciiString> & name);

		/****************** SetACschemaName ******************/
		%feature("compactdefaultargs") SetACschemaName;
		%feature("autodoc", "	:param schemaName:
	:type schemaName: TCollection_HAsciiString
	:rtype: None
") SetACschemaName;
		void SetACschemaName(const opencascade::handle<TCollection_HAsciiString> & schemaName);

		/****************** SetACstatus ******************/
		%feature("compactdefaultargs") SetACstatus;
		%feature("autodoc", "	:param status:
	:type status: TCollection_HAsciiString
	:rtype: None
") SetACstatus;
		void SetACstatus(const opencascade::handle<TCollection_HAsciiString> & status);

		/****************** SetACyear ******************/
		%feature("compactdefaultargs") SetACyear;
		%feature("autodoc", "	:param year:
	:type year: int
	:rtype: None
") SetACyear;
		void SetACyear(const Standard_Integer year);

		/****************** SetIndex ******************/
		%feature("compactdefaultargs") SetIndex;
		%feature("autodoc", "Changes current index of assembly component on current level.

	:param ind:
	:type ind: int
	:rtype: None
") SetIndex;
		void SetIndex(const Standard_Integer ind);

		/****************** SetLevel ******************/
		%feature("compactdefaultargs") SetLevel;
		%feature("autodoc", "Changes current assembly level.

	:param lev:
	:type lev: int
	:rtype: None
") SetLevel;
		void SetLevel(const Standard_Integer lev);

		/****************** SetModel ******************/
		%feature("compactdefaultargs") SetModel;
		%feature("autodoc", "Initialize applicationprotocoldefinition by the first entity of that type found in the model.

	:param aStepModel:
	:type aStepModel: StepData_StepModel
	:rtype: None
") SetModel;
		void SetModel(const opencascade::handle<StepData_StepModel> & aStepModel);

};


%extend STEPConstruct_ContextTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class STEPConstruct_Part *
***************************/
class STEPConstruct_Part {
	public:
		/****************** AC ******************/
		%feature("compactdefaultargs") AC;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_ApplicationContext>
") AC;
		opencascade::handle<StepBasic_ApplicationContext> AC();

		/****************** ACapplication ******************/
		%feature("compactdefaultargs") ACapplication;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") ACapplication;
		opencascade::handle<TCollection_HAsciiString> ACapplication();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** MakeSDR ******************/
		%feature("compactdefaultargs") MakeSDR;
		%feature("autodoc", "	:param aShape:
	:type aShape: StepShape_ShapeRepresentation
	:param aName:
	:type aName: TCollection_HAsciiString
	:param AC:
	:type AC: StepBasic_ApplicationContext
	:rtype: None
") MakeSDR;
		void MakeSDR(const opencascade::handle<StepShape_ShapeRepresentation> & aShape, const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepBasic_ApplicationContext> & AC);

		/****************** PC ******************/
		%feature("compactdefaultargs") PC;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_ProductContext>
") PC;
		opencascade::handle<StepBasic_ProductContext> PC();

		/****************** PCdisciplineType ******************/
		%feature("compactdefaultargs") PCdisciplineType;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") PCdisciplineType;
		opencascade::handle<TCollection_HAsciiString> PCdisciplineType();

		/****************** PCname ******************/
		%feature("compactdefaultargs") PCname;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") PCname;
		opencascade::handle<TCollection_HAsciiString> PCname();

		/****************** PD ******************/
		%feature("compactdefaultargs") PD;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_ProductDefinition>
") PD;
		opencascade::handle<StepBasic_ProductDefinition> PD();

		/****************** PDC ******************/
		%feature("compactdefaultargs") PDC;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_ProductDefinitionContext>
") PDC;
		opencascade::handle<StepBasic_ProductDefinitionContext> PDC();

		/****************** PDCname ******************/
		%feature("compactdefaultargs") PDCname;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") PDCname;
		opencascade::handle<TCollection_HAsciiString> PDCname();

		/****************** PDCstage ******************/
		%feature("compactdefaultargs") PDCstage;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") PDCstage;
		opencascade::handle<TCollection_HAsciiString> PDCstage();

		/****************** PDF ******************/
		%feature("compactdefaultargs") PDF;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_ProductDefinitionFormation>
") PDF;
		opencascade::handle<StepBasic_ProductDefinitionFormation> PDF();

		/****************** PDFdescription ******************/
		%feature("compactdefaultargs") PDFdescription;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") PDFdescription;
		opencascade::handle<TCollection_HAsciiString> PDFdescription();

		/****************** PDFid ******************/
		%feature("compactdefaultargs") PDFid;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") PDFid;
		opencascade::handle<TCollection_HAsciiString> PDFid();

		/****************** PDS ******************/
		%feature("compactdefaultargs") PDS;
		%feature("autodoc", "	:rtype: opencascade::handle<StepRepr_ProductDefinitionShape>
") PDS;
		opencascade::handle<StepRepr_ProductDefinitionShape> PDS();

		/****************** PDSdescription ******************/
		%feature("compactdefaultargs") PDSdescription;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") PDSdescription;
		opencascade::handle<TCollection_HAsciiString> PDSdescription();

		/****************** PDSname ******************/
		%feature("compactdefaultargs") PDSname;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") PDSname;
		opencascade::handle<TCollection_HAsciiString> PDSname();

		/****************** PDdescription ******************/
		%feature("compactdefaultargs") PDdescription;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") PDdescription;
		opencascade::handle<TCollection_HAsciiString> PDdescription();

		/****************** PRPC ******************/
		%feature("compactdefaultargs") PRPC;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_ProductRelatedProductCategory>
") PRPC;
		opencascade::handle<StepBasic_ProductRelatedProductCategory> PRPC();

		/****************** PRPCdescription ******************/
		%feature("compactdefaultargs") PRPCdescription;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") PRPCdescription;
		opencascade::handle<TCollection_HAsciiString> PRPCdescription();

		/****************** PRPCname ******************/
		%feature("compactdefaultargs") PRPCname;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") PRPCname;
		opencascade::handle<TCollection_HAsciiString> PRPCname();

		/****************** Pdescription ******************/
		%feature("compactdefaultargs") Pdescription;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") Pdescription;
		opencascade::handle<TCollection_HAsciiString> Pdescription();

		/****************** Pid ******************/
		%feature("compactdefaultargs") Pid;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") Pid;
		opencascade::handle<TCollection_HAsciiString> Pid();

		/****************** Pname ******************/
		%feature("compactdefaultargs") Pname;
		%feature("autodoc", "	:rtype: opencascade::handle<TCollection_HAsciiString>
") Pname;
		opencascade::handle<TCollection_HAsciiString> Pname();

		/****************** Product ******************/
		%feature("compactdefaultargs") Product;
		%feature("autodoc", "	:rtype: opencascade::handle<StepBasic_Product>
") Product;
		opencascade::handle<StepBasic_Product> Product();

		/****************** ReadSDR ******************/
		%feature("compactdefaultargs") ReadSDR;
		%feature("autodoc", "	:param aShape:
	:type aShape: StepShape_ShapeDefinitionRepresentation
	:rtype: None
") ReadSDR;
		void ReadSDR(const opencascade::handle<StepShape_ShapeDefinitionRepresentation> & aShape);

		/****************** SDRValue ******************/
		%feature("compactdefaultargs") SDRValue;
		%feature("autodoc", "Returns sdr or null if not done.

	:rtype: opencascade::handle<StepShape_ShapeDefinitionRepresentation>
") SDRValue;
		opencascade::handle<StepShape_ShapeDefinitionRepresentation> SDRValue();

		/****************** SRValue ******************/
		%feature("compactdefaultargs") SRValue;
		%feature("autodoc", "Returns sdr->usedrepresentation() or null if not done.

	:rtype: opencascade::handle<StepShape_ShapeRepresentation>
") SRValue;
		opencascade::handle<StepShape_ShapeRepresentation> SRValue();

		/****************** STEPConstruct_Part ******************/
		%feature("compactdefaultargs") STEPConstruct_Part;
		%feature("autodoc", "	:rtype: None
") STEPConstruct_Part;
		 STEPConstruct_Part();

		/****************** SetACapplication ******************/
		%feature("compactdefaultargs") SetACapplication;
		%feature("autodoc", "	:param text:
	:type text: TCollection_HAsciiString
	:rtype: None
") SetACapplication;
		void SetACapplication(const opencascade::handle<TCollection_HAsciiString> & text);

		/****************** SetPCdisciplineType ******************/
		%feature("compactdefaultargs") SetPCdisciplineType;
		%feature("autodoc", "	:param label:
	:type label: TCollection_HAsciiString
	:rtype: None
") SetPCdisciplineType;
		void SetPCdisciplineType(const opencascade::handle<TCollection_HAsciiString> & label);

		/****************** SetPCname ******************/
		%feature("compactdefaultargs") SetPCname;
		%feature("autodoc", "	:param name:
	:type name: TCollection_HAsciiString
	:rtype: None
") SetPCname;
		void SetPCname(const opencascade::handle<TCollection_HAsciiString> & name);

		/****************** SetPDCname ******************/
		%feature("compactdefaultargs") SetPDCname;
		%feature("autodoc", "	:param label:
	:type label: TCollection_HAsciiString
	:rtype: None
") SetPDCname;
		void SetPDCname(const opencascade::handle<TCollection_HAsciiString> & label);

		/****************** SetPDCstage ******************/
		%feature("compactdefaultargs") SetPDCstage;
		%feature("autodoc", "	:param label:
	:type label: TCollection_HAsciiString
	:rtype: None
") SetPDCstage;
		void SetPDCstage(const opencascade::handle<TCollection_HAsciiString> & label);

		/****************** SetPDFdescription ******************/
		%feature("compactdefaultargs") SetPDFdescription;
		%feature("autodoc", "	:param text:
	:type text: TCollection_HAsciiString
	:rtype: None
") SetPDFdescription;
		void SetPDFdescription(const opencascade::handle<TCollection_HAsciiString> & text);

		/****************** SetPDFid ******************/
		%feature("compactdefaultargs") SetPDFid;
		%feature("autodoc", "	:param id:
	:type id: TCollection_HAsciiString
	:rtype: None
") SetPDFid;
		void SetPDFid(const opencascade::handle<TCollection_HAsciiString> & id);

		/****************** SetPDSdescription ******************/
		%feature("compactdefaultargs") SetPDSdescription;
		%feature("autodoc", "	:param text:
	:type text: TCollection_HAsciiString
	:rtype: None
") SetPDSdescription;
		void SetPDSdescription(const opencascade::handle<TCollection_HAsciiString> & text);

		/****************** SetPDSname ******************/
		%feature("compactdefaultargs") SetPDSname;
		%feature("autodoc", "	:param label:
	:type label: TCollection_HAsciiString
	:rtype: None
") SetPDSname;
		void SetPDSname(const opencascade::handle<TCollection_HAsciiString> & label);

		/****************** SetPDdescription ******************/
		%feature("compactdefaultargs") SetPDdescription;
		%feature("autodoc", "	:param text:
	:type text: TCollection_HAsciiString
	:rtype: None
") SetPDdescription;
		void SetPDdescription(const opencascade::handle<TCollection_HAsciiString> & text);

		/****************** SetPRPCdescription ******************/
		%feature("compactdefaultargs") SetPRPCdescription;
		%feature("autodoc", "	:param text:
	:type text: TCollection_HAsciiString
	:rtype: None
") SetPRPCdescription;
		void SetPRPCdescription(const opencascade::handle<TCollection_HAsciiString> & text);

		/****************** SetPRPCname ******************/
		%feature("compactdefaultargs") SetPRPCname;
		%feature("autodoc", "	:param label:
	:type label: TCollection_HAsciiString
	:rtype: None
") SetPRPCname;
		void SetPRPCname(const opencascade::handle<TCollection_HAsciiString> & label);

		/****************** SetPdescription ******************/
		%feature("compactdefaultargs") SetPdescription;
		%feature("autodoc", "	:param text:
	:type text: TCollection_HAsciiString
	:rtype: None
") SetPdescription;
		void SetPdescription(const opencascade::handle<TCollection_HAsciiString> & text);

		/****************** SetPid ******************/
		%feature("compactdefaultargs") SetPid;
		%feature("autodoc", "	:param id:
	:type id: TCollection_HAsciiString
	:rtype: None
") SetPid;
		void SetPid(const opencascade::handle<TCollection_HAsciiString> & id);

		/****************** SetPname ******************/
		%feature("compactdefaultargs") SetPname;
		%feature("autodoc", "	:param label:
	:type label: TCollection_HAsciiString
	:rtype: None
") SetPname;
		void SetPname(const opencascade::handle<TCollection_HAsciiString> & label);

};


%extend STEPConstruct_Part {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class STEPConstruct_PointHasher *
**********************************/
class STEPConstruct_PointHasher {
	public:
		/****************** HashCode ******************/
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "Computes a hash code for the point, in the range [1, theupperbound] @param thepoint the point which hash code is to be computed @param theupperbound the upper bound of the range a computing hash code must be within returns a computed hash code, in the range [1, theupperbound].

	:param thePoint:
	:type thePoint: gp_Pnt
	:param theUpperBound:
	:type theUpperBound: int
	:rtype: int
") HashCode;
		static Standard_Integer HashCode(const gp_Pnt & thePoint, const Standard_Integer theUpperBound);

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "Returns true when the two keys are the same. two same keys must have the same hashcode, the contrary is not necessary.

	:param Point1:
	:type Point1: gp_Pnt
	:param Point2:
	:type Point2: gp_Pnt
	:rtype: bool
") IsEqual;
		static Standard_Boolean IsEqual(const gp_Pnt & Point1, const gp_Pnt & Point2);

};


%extend STEPConstruct_PointHasher {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class STEPConstruct_Tool *
***************************/
class STEPConstruct_Tool {
	public:
		/****************** FinderProcess ******************/
		%feature("compactdefaultargs") FinderProcess;
		%feature("autodoc", "Returns finderprocess (writing; null if not loaded).

	:rtype: opencascade::handle<Transfer_FinderProcess>
") FinderProcess;
		const opencascade::handle<Transfer_FinderProcess> & FinderProcess();

		/****************** Graph ******************/
		%feature("compactdefaultargs") Graph;
		%feature("autodoc", "Returns current graph (recomputing if necessary).

	:param recompute: default value is Standard_False
	:type recompute: bool
	:rtype: Interface_Graph
") Graph;
		const Interface_Graph & Graph(const Standard_Boolean recompute = Standard_False);

		/****************** Model ******************/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "Returns current model (null if not loaded).

	:rtype: opencascade::handle<Interface_InterfaceModel>
") Model;
		opencascade::handle<Interface_InterfaceModel> Model();

		/****************** STEPConstruct_Tool ******************/
		%feature("compactdefaultargs") STEPConstruct_Tool;
		%feature("autodoc", "Creates an empty tool.

	:rtype: None
") STEPConstruct_Tool;
		 STEPConstruct_Tool();

		/****************** STEPConstruct_Tool ******************/
		%feature("compactdefaultargs") STEPConstruct_Tool;
		%feature("autodoc", "Creates a tool and loads it with worksession.

	:param WS:
	:type WS: XSControl_WorkSession
	:rtype: None
") STEPConstruct_Tool;
		 STEPConstruct_Tool(const opencascade::handle<XSControl_WorkSession> & WS);

		/****************** TransientProcess ******************/
		%feature("compactdefaultargs") TransientProcess;
		%feature("autodoc", "Returns transientprocess (reading; null if not loaded).

	:rtype: opencascade::handle<Transfer_TransientProcess>
") TransientProcess;
		const opencascade::handle<Transfer_TransientProcess> & TransientProcess();

		/****************** WS ******************/
		%feature("compactdefaultargs") WS;
		%feature("autodoc", "Returns currently loaded worksession.

	:rtype: opencascade::handle<XSControl_WorkSession>
") WS;
		const opencascade::handle<XSControl_WorkSession> & WS();

};


%extend STEPConstruct_Tool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class STEPConstruct_UnitContext *
**********************************/
class STEPConstruct_UnitContext {
	public:
		/****************** AreaDone ******************/
		%feature("compactdefaultargs") AreaDone;
		%feature("autodoc", "Returns true if areafactor is computed.

	:rtype: bool
") AreaDone;
		Standard_Boolean AreaDone();

		/****************** AreaFactor ******************/
		%feature("compactdefaultargs") AreaFactor;
		%feature("autodoc", "Returns the areafactor.

	:rtype: float
") AreaFactor;
		Standard_Real AreaFactor();

		/****************** ComputeFactors ******************/
		%feature("compactdefaultargs") ComputeFactors;
		%feature("autodoc", "Computes the length, plane angle and solid angle conversion factor . returns a status, 0 if ok.

	:param aContext:
	:type aContext: StepRepr_GlobalUnitAssignedContext
	:rtype: int
") ComputeFactors;
		Standard_Integer ComputeFactors(const opencascade::handle<StepRepr_GlobalUnitAssignedContext> & aContext);

		/****************** ComputeFactors ******************/
		%feature("compactdefaultargs") ComputeFactors;
		%feature("autodoc", "	:param aUnit:
	:type aUnit: StepBasic_NamedUnit
	:rtype: int
") ComputeFactors;
		Standard_Integer ComputeFactors(const opencascade::handle<StepBasic_NamedUnit> & aUnit);

		/****************** ComputeTolerance ******************/
		%feature("compactdefaultargs") ComputeTolerance;
		%feature("autodoc", "Computes the uncertainty value (for length).

	:param aContext:
	:type aContext: StepRepr_GlobalUncertaintyAssignedContext
	:rtype: int
") ComputeTolerance;
		Standard_Integer ComputeTolerance(const opencascade::handle<StepRepr_GlobalUncertaintyAssignedContext> & aContext);

		/****************** ConvertSiPrefix ******************/
		%feature("compactdefaultargs") ConvertSiPrefix;
		%feature("autodoc", "Convert si prefix defined by enumertaion to corresponding real factor (e.g. 1e6 for mega).

	:param aPrefix:
	:type aPrefix: StepBasic_SiPrefix
	:rtype: float
") ConvertSiPrefix;
		static Standard_Real ConvertSiPrefix(const StepBasic_SiPrefix aPrefix);

		/****************** HasUncertainty ******************/
		%feature("compactdefaultargs") HasUncertainty;
		%feature("autodoc", "Tells if a uncertainty (for length) is recorded.

	:rtype: bool
") HasUncertainty;
		Standard_Boolean HasUncertainty();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Creates new context (units are mm and radians, uncertainty equal to tol3d).

	:param Tol3d:
	:type Tol3d: float
	:rtype: None
") Init;
		void Init(const Standard_Real Tol3d);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if init was called successfully.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** LengthDone ******************/
		%feature("compactdefaultargs") LengthDone;
		%feature("autodoc", "Returns true if computefactors has calculated a lengthfactor.

	:rtype: bool
") LengthDone;
		Standard_Boolean LengthDone();

		/****************** LengthFactor ******************/
		%feature("compactdefaultargs") LengthFactor;
		%feature("autodoc", "Returns the lengthfactor.

	:rtype: float
") LengthFactor;
		Standard_Real LengthFactor();

		/****************** PlaneAngleDone ******************/
		%feature("compactdefaultargs") PlaneAngleDone;
		%feature("autodoc", "Returns true if computefactors has calculated a planeanglefactor.

	:rtype: bool
") PlaneAngleDone;
		Standard_Boolean PlaneAngleDone();

		/****************** PlaneAngleFactor ******************/
		%feature("compactdefaultargs") PlaneAngleFactor;
		%feature("autodoc", "Returns the planeanglefactor.

	:rtype: float
") PlaneAngleFactor;
		Standard_Real PlaneAngleFactor();

		/****************** STEPConstruct_UnitContext ******************/
		%feature("compactdefaultargs") STEPConstruct_UnitContext;
		%feature("autodoc", "Creates empty tool.

	:rtype: None
") STEPConstruct_UnitContext;
		 STEPConstruct_UnitContext();

		/****************** SolidAngleDone ******************/
		%feature("compactdefaultargs") SolidAngleDone;
		%feature("autodoc", "Returns true if computefactors has calculated a solidanglefactor.

	:rtype: bool
") SolidAngleDone;
		Standard_Boolean SolidAngleDone();

		/****************** SolidAngleFactor ******************/
		%feature("compactdefaultargs") SolidAngleFactor;
		%feature("autodoc", "Returns the solidanglefactor.

	:rtype: float
") SolidAngleFactor;
		Standard_Real SolidAngleFactor();

		/****************** StatusMessage ******************/
		%feature("compactdefaultargs") StatusMessage;
		%feature("autodoc", "Returns a message for a given status (0 - empty) this message can then be added as warning for transfer.

	:param status:
	:type status: int
	:rtype: char *
") StatusMessage;
		const char * StatusMessage(const Standard_Integer status);

		/****************** Uncertainty ******************/
		%feature("compactdefaultargs") Uncertainty;
		%feature("autodoc", "Returns the uncertainty value (for length) it has been converted with lengthfactor.

	:rtype: float
") Uncertainty;
		Standard_Real Uncertainty();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns context (or null if not done).

	:rtype: opencascade::handle<StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx>
") Value;
		opencascade::handle<StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx> Value();

		/****************** VolumeDone ******************/
		%feature("compactdefaultargs") VolumeDone;
		%feature("autodoc", "Returns true if volumefactor is computed.

	:rtype: bool
") VolumeDone;
		Standard_Boolean VolumeDone();

		/****************** VolumeFactor ******************/
		%feature("compactdefaultargs") VolumeFactor;
		%feature("autodoc", "Returns the volumefactor.

	:rtype: float
") VolumeFactor;
		Standard_Real VolumeFactor();

};


%extend STEPConstruct_UnitContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class STEPConstruct_ExternRefs *
*********************************/
class STEPConstruct_ExternRefs : public STEPConstruct_Tool {
	public:
		/****************** AddExternRef ******************/
		%feature("compactdefaultargs") AddExternRef;
		%feature("autodoc", "Create a new external reference with specified attributes attached to a given sdr <format> can be null string, in that case this information is not written. else, it can be 'step ap214' or 'step ap203' returns index of a new extern ref.

	:param filename:
	:type filename: char *
	:param PD:
	:type PD: StepBasic_ProductDefinition
	:param format:
	:type format: char *
	:rtype: int
") AddExternRef;
		Standard_Integer AddExternRef(const char * filename, const opencascade::handle<StepBasic_ProductDefinition> & PD, const char * format);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears internal fields (list of defined extern refs).

	:rtype: None
") Clear;
		void Clear();

		/****************** FileName ******************/
		%feature("compactdefaultargs") FileName;
		%feature("autodoc", "Returns filename for numth extern reference returns null if filename is not defined or bad.

	:param num:
	:type num: int
	:rtype: char *
") FileName;
		const char * FileName(const Standard_Integer num);

		/****************** Format ******************/
		%feature("compactdefaultargs") Format;
		%feature("autodoc", "Returns format identification string for the extern document returns null handle if format is not defined.

	:param num:
	:type num: int
	:rtype: opencascade::handle<TCollection_HAsciiString>
") Format;
		opencascade::handle<TCollection_HAsciiString> Format(const Standard_Integer num);

		/****************** GetAP214APD ******************/
		%feature("compactdefaultargs") GetAP214APD;
		%feature("autodoc", "Returns the applicationprotocoldefinition of the pdm schema note: if not defined then create new apd with new application context.

	:rtype: opencascade::handle<StepBasic_ApplicationProtocolDefinition>
") GetAP214APD;
		opencascade::handle<StepBasic_ApplicationProtocolDefinition> GetAP214APD();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes tool; returns true if succeeded.

	:param WS:
	:type WS: XSControl_WorkSession
	:rtype: bool
") Init;
		Standard_Boolean Init(const opencascade::handle<XSControl_WorkSession> & WS);

		/****************** LoadExternRefs ******************/
		%feature("compactdefaultargs") LoadExternRefs;
		%feature("autodoc", "Searches current step model for external references and loads them to the internal data structures note: does not clear data structures before loading.

	:rtype: bool
") LoadExternRefs;
		Standard_Boolean LoadExternRefs();

		/****************** NbExternRefs ******************/
		%feature("compactdefaultargs") NbExternRefs;
		%feature("autodoc", "Returns number of defined extern references.

	:rtype: int
") NbExternRefs;
		Standard_Integer NbExternRefs();

		/****************** ProdDef ******************/
		%feature("compactdefaultargs") ProdDef;
		%feature("autodoc", "Returns productdefinition to which numth extern reference is associated. returns null if cannot be detected or if extern reference is not associated to sdr in a proper way.

	:param num:
	:type num: int
	:rtype: opencascade::handle<StepBasic_ProductDefinition>
") ProdDef;
		opencascade::handle<StepBasic_ProductDefinition> ProdDef(const Standard_Integer num);

		/****************** STEPConstruct_ExternRefs ******************/
		%feature("compactdefaultargs") STEPConstruct_ExternRefs;
		%feature("autodoc", "Creates an empty tool.

	:rtype: None
") STEPConstruct_ExternRefs;
		 STEPConstruct_ExternRefs();

		/****************** STEPConstruct_ExternRefs ******************/
		%feature("compactdefaultargs") STEPConstruct_ExternRefs;
		%feature("autodoc", "Creates a tool and initializes it.

	:param WS:
	:type WS: XSControl_WorkSession
	:rtype: None
") STEPConstruct_ExternRefs;
		 STEPConstruct_ExternRefs(const opencascade::handle<XSControl_WorkSession> & WS);

		/****************** SetAP214APD ******************/
		%feature("compactdefaultargs") SetAP214APD;
		%feature("autodoc", "Set the applicationprotocoldefinition of the pdm schema.

	:param APD:
	:type APD: StepBasic_ApplicationProtocolDefinition
	:rtype: None
") SetAP214APD;
		void SetAP214APD(const opencascade::handle<StepBasic_ApplicationProtocolDefinition> & APD);

		/****************** WriteExternRefs ******************/
		%feature("compactdefaultargs") WriteExternRefs;
		%feature("autodoc", "Adds all the currently defined external refs to the model returns number of written extern refs.

	:param num:
	:type num: int
	:rtype: int
") WriteExternRefs;
		Standard_Integer WriteExternRefs(const Standard_Integer num);

		/****************** checkAP214Shared ******************/
		%feature("compactdefaultargs") checkAP214Shared;
		%feature("autodoc", "Check (create if it is null) all shared entities for the model.

	:rtype: None
") checkAP214Shared;
		void checkAP214Shared();

};


%extend STEPConstruct_ExternRefs {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class STEPConstruct_Styles *
*****************************/
class STEPConstruct_Styles : public STEPConstruct_Tool {
	public:
		/****************** AddStyle ******************/
		%feature("compactdefaultargs") AddStyle;
		%feature("autodoc", "Adds a style to a sequence.

	:param style:
	:type style: StepVisual_StyledItem
	:rtype: None
") AddStyle;
		void AddStyle(const opencascade::handle<StepVisual_StyledItem> & style);

		/****************** AddStyle ******************/
		%feature("compactdefaultargs") AddStyle;
		%feature("autodoc", "Create a style linking giving psa to the item, and add it to the sequence of stored styles. if override is not null, then the resulting style will be of the subtype overridingstyleditem.

	:param item:
	:type item: StepRepr_RepresentationItem
	:param PSA:
	:type PSA: StepVisual_PresentationStyleAssignment
	:param Override:
	:type Override: StepVisual_StyledItem
	:rtype: opencascade::handle<StepVisual_StyledItem>
") AddStyle;
		opencascade::handle<StepVisual_StyledItem> AddStyle(const opencascade::handle<StepRepr_RepresentationItem> & item, const opencascade::handle<StepVisual_PresentationStyleAssignment> & PSA, const opencascade::handle<StepVisual_StyledItem> & Override);

		/****************** AddStyle ******************/
		%feature("compactdefaultargs") AddStyle;
		%feature("autodoc", "Create a style linking giving psa to the shape, and add it to the sequence of stored styles. if override is not null, then the resulting style will be of the subtype overridingstyleditem. the sape is used to find corresponding step entity by call to stepconstruct::findentity(), then previous method is called.

	:param Shape:
	:type Shape: TopoDS_Shape
	:param PSA:
	:type PSA: StepVisual_PresentationStyleAssignment
	:param Override:
	:type Override: StepVisual_StyledItem
	:rtype: opencascade::handle<StepVisual_StyledItem>
") AddStyle;
		opencascade::handle<StepVisual_StyledItem> AddStyle(const TopoDS_Shape & Shape, const opencascade::handle<StepVisual_PresentationStyleAssignment> & PSA, const opencascade::handle<StepVisual_StyledItem> & Override);

		/****************** ClearStyles ******************/
		%feature("compactdefaultargs") ClearStyles;
		%feature("autodoc", "Clears all defined styles and psa sequence.

	:rtype: None
") ClearStyles;
		void ClearStyles();

		/****************** CreateMDGPR ******************/
		%feature("compactdefaultargs") CreateMDGPR;
		%feature("autodoc", "Create mdgpr, fill it with all the styles previously defined, and add it to the model.

	:param Context:
	:type Context: StepRepr_RepresentationContext
	:param MDGPR:
	:type MDGPR: StepVisual_MechanicalDesignGeometricPresentationRepresentation
	:rtype: bool
") CreateMDGPR;
		Standard_Boolean CreateMDGPR(const opencascade::handle<StepRepr_RepresentationContext> & Context, opencascade::handle<StepVisual_MechanicalDesignGeometricPresentationRepresentation> & MDGPR);

		/****************** CreateNAUOSRD ******************/
		%feature("compactdefaultargs") CreateNAUOSRD;
		%feature("autodoc", "Create mdgpr, fill it with all the styles previously defined, and add it to the model important: <initpds> must be null when use for nauo colors <initpds> initialised only for shuo case.

	:param Context:
	:type Context: StepRepr_RepresentationContext
	:param CDSR:
	:type CDSR: StepShape_ContextDependentShapeRepresentation
	:param initPDS:
	:type initPDS: StepRepr_ProductDefinitionShape
	:rtype: bool
") CreateNAUOSRD;
		Standard_Boolean CreateNAUOSRD(const opencascade::handle<StepRepr_RepresentationContext> & Context, const opencascade::handle<StepShape_ContextDependentShapeRepresentation> & CDSR, const opencascade::handle<StepRepr_ProductDefinitionShape> & initPDS);

		/****************** DecodeColor ******************/
		%feature("compactdefaultargs") DecodeColor;
		%feature("autodoc", "Decodes step color and fills the quantity_color. returns true if ok or false if color is not recognized.

	:param Colour:
	:type Colour: StepVisual_Colour
	:param Col:
	:type Col: Quantity_Color
	:rtype: bool
") DecodeColor;
		static Standard_Boolean DecodeColor(const opencascade::handle<StepVisual_Colour> & Colour, Quantity_Color & Col);

		/****************** EncodeColor ******************/
		%feature("compactdefaultargs") EncodeColor;
		%feature("autodoc", "Create step color entity by given quantity_color the analysis is performed for whether the color corresponds to one of standard colors predefined in step. in that case, predefinedcolour entity is created instead of rgbcolour.

	:param Col:
	:type Col: Quantity_Color
	:rtype: opencascade::handle<StepVisual_Colour>
") EncodeColor;
		static opencascade::handle<StepVisual_Colour> EncodeColor(const Quantity_Color & Col);

		/****************** EncodeColor ******************/
		%feature("compactdefaultargs") EncodeColor;
		%feature("autodoc", "Create step color entity by given quantity_color the analysis is performed for whether the color corresponds to one of standard colors predefined in step. in that case, predefinedcolour entity is created instead of rgbcolour.

	:param Col:
	:type Col: Quantity_Color
	:param DPDCs:
	:type DPDCs: STEPConstruct_DataMapOfAsciiStringTransient
	:param ColRGBs:
	:type ColRGBs: STEPConstruct_DataMapOfPointTransient
	:rtype: opencascade::handle<StepVisual_Colour>
") EncodeColor;
		static opencascade::handle<StepVisual_Colour> EncodeColor(const Quantity_Color & Col, STEPConstruct_DataMapOfAsciiStringTransient & DPDCs, STEPConstruct_DataMapOfPointTransient & ColRGBs);

		/****************** FindContext ******************/
		%feature("compactdefaultargs") FindContext;
		%feature("autodoc", "Searches the step model for the representationcontext in which given shape is defined. this context (if found) can be used then in call to createmdgpr().

	:param Shape:
	:type Shape: TopoDS_Shape
	:rtype: opencascade::handle<StepRepr_RepresentationContext>
") FindContext;
		opencascade::handle<StepRepr_RepresentationContext> FindContext(const TopoDS_Shape & Shape);

		/****************** GetColorPSA ******************/
		%feature("compactdefaultargs") GetColorPSA;
		%feature("autodoc", "Returns a presentationstyleassignment entity which defines surface and curve colors as col. this psa is either created or taken from internal map where all psas created by this method are remembered.

	:param item:
	:type item: StepRepr_RepresentationItem
	:param Col:
	:type Col: StepVisual_Colour
	:rtype: opencascade::handle<StepVisual_PresentationStyleAssignment>
") GetColorPSA;
		opencascade::handle<StepVisual_PresentationStyleAssignment> GetColorPSA(const opencascade::handle<StepRepr_RepresentationItem> & item, const opencascade::handle<StepVisual_Colour> & Col);

		/****************** GetColors ******************/
		%feature("compactdefaultargs") GetColors;
		%feature("autodoc", "Extract color definitions from the style entity for each type of color supported, result can be either null if it is not defined by that style, or last definition (if they are 1 or more).

	:param style:
	:type style: StepVisual_StyledItem
	:param SurfCol:
	:type SurfCol: StepVisual_Colour
	:param BoundCol:
	:type BoundCol: StepVisual_Colour
	:param CurveCol:
	:type CurveCol: StepVisual_Colour
	:param IsComponent:
	:type IsComponent: bool
	:rtype: bool
") GetColors;
		Standard_Boolean GetColors(const opencascade::handle<StepVisual_StyledItem> & style, opencascade::handle<StepVisual_Colour> & SurfCol, opencascade::handle<StepVisual_Colour> & BoundCol, opencascade::handle<StepVisual_Colour> & CurveCol, Standard_Boolean &OutValue);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes tool; returns true if succeeded.

	:param WS:
	:type WS: XSControl_WorkSession
	:rtype: bool
") Init;
		Standard_Boolean Init(const opencascade::handle<XSControl_WorkSession> & WS);

		/****************** LoadInvisStyles ******************/
		%feature("compactdefaultargs") LoadInvisStyles;
		%feature("autodoc", "Searches the step model for the inisibility enteties (which bring styles) and fills out sequence of styles.

	:param InvSyles:
	:type InvSyles: TColStd_HSequenceOfTransient
	:rtype: bool
") LoadInvisStyles;
		Standard_Boolean LoadInvisStyles(opencascade::handle<TColStd_HSequenceOfTransient> & InvSyles);

		/****************** LoadStyles ******************/
		%feature("compactdefaultargs") LoadStyles;
		%feature("autodoc", "Searches the step model for the mdgpr or dm entities (which bring styles) and fills sequence of styles.

	:rtype: bool
") LoadStyles;
		Standard_Boolean LoadStyles();

		/****************** MakeColorPSA ******************/
		%feature("compactdefaultargs") MakeColorPSA;
		%feature("autodoc", "Create a presentationstyleassignment entity which defines two colors (for filling surfaces and curves) if isfornauo true then returns presentationstylebycontext.

	:param item:
	:type item: StepRepr_RepresentationItem
	:param SurfCol:
	:type SurfCol: StepVisual_Colour
	:param CurveCol:
	:type CurveCol: StepVisual_Colour
	:param isForNAUO: default value is Standard_False
	:type isForNAUO: bool
	:rtype: opencascade::handle<StepVisual_PresentationStyleAssignment>
") MakeColorPSA;
		opencascade::handle<StepVisual_PresentationStyleAssignment> MakeColorPSA(const opencascade::handle<StepRepr_RepresentationItem> & item, const opencascade::handle<StepVisual_Colour> & SurfCol, const opencascade::handle<StepVisual_Colour> & CurveCol, const Standard_Boolean isForNAUO = Standard_False);

		/****************** NbStyles ******************/
		%feature("compactdefaultargs") NbStyles;
		%feature("autodoc", "Returns number of defined styles.

	:rtype: int
") NbStyles;
		Standard_Integer NbStyles();

		/****************** STEPConstruct_Styles ******************/
		%feature("compactdefaultargs") STEPConstruct_Styles;
		%feature("autodoc", "Creates an empty tool.

	:rtype: None
") STEPConstruct_Styles;
		 STEPConstruct_Styles();

		/****************** STEPConstruct_Styles ******************/
		%feature("compactdefaultargs") STEPConstruct_Styles;
		%feature("autodoc", "Creates a tool and initializes it.

	:param WS:
	:type WS: XSControl_WorkSession
	:rtype: None
") STEPConstruct_Styles;
		 STEPConstruct_Styles(const opencascade::handle<XSControl_WorkSession> & WS);

		/****************** Style ******************/
		%feature("compactdefaultargs") Style;
		%feature("autodoc", "Returns style with given index.

	:param i:
	:type i: int
	:rtype: opencascade::handle<StepVisual_StyledItem>
") Style;
		opencascade::handle<StepVisual_StyledItem> Style(const Standard_Integer i);

};


%extend STEPConstruct_Styles {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class STEPConstruct_ValidationProps *
**************************************/
class STEPConstruct_ValidationProps : public STEPConstruct_Tool {
	public:
		/****************** AddArea ******************/
		%feature("compactdefaultargs") AddArea;
		%feature("autodoc", "Adds surface area property for given shape (already mapped). returns true if success, false in case of fail.

	:param Shape:
	:type Shape: TopoDS_Shape
	:param Area:
	:type Area: float
	:rtype: bool
") AddArea;
		Standard_Boolean AddArea(const TopoDS_Shape & Shape, const Standard_Real Area);

		/****************** AddCentroid ******************/
		%feature("compactdefaultargs") AddCentroid;
		%feature("autodoc", "Adds centroid property for given shape (already mapped). returns true if success, false in case of fail if instance is true, then centroid is assigned to an instance of component in assembly.

	:param Shape:
	:type Shape: TopoDS_Shape
	:param Pnt:
	:type Pnt: gp_Pnt
	:param instance: default value is Standard_False
	:type instance: bool
	:rtype: bool
") AddCentroid;
		Standard_Boolean AddCentroid(const TopoDS_Shape & Shape, const gp_Pnt & Pnt, const Standard_Boolean instance = Standard_False);

		/****************** AddProp ******************/
		%feature("compactdefaultargs") AddProp;
		%feature("autodoc", "General method for adding (writing) a validation property for shape which should be already mapped on writing itself. it uses findtarget() to find target step entity resulting from given shape, and associated context returns true if success, false in case of fail.

	:param Shape:
	:type Shape: TopoDS_Shape
	:param Prop:
	:type Prop: StepRepr_RepresentationItem
	:param Descr:
	:type Descr: char *
	:param instance: default value is Standard_False
	:type instance: bool
	:rtype: bool
") AddProp;
		Standard_Boolean AddProp(const TopoDS_Shape & Shape, const opencascade::handle<StepRepr_RepresentationItem> & Prop, const char * Descr, const Standard_Boolean instance = Standard_False);

		/****************** AddProp ******************/
		%feature("compactdefaultargs") AddProp;
		%feature("autodoc", "General method for adding (writing) a validation property for shape which should be already mapped on writing itself. it takes target and context entities which correspond to shape returns true if success, false in case of fail.

	:param target:
	:type target: StepRepr_CharacterizedDefinition
	:param Context:
	:type Context: StepRepr_RepresentationContext
	:param Prop:
	:type Prop: StepRepr_RepresentationItem
	:param Descr:
	:type Descr: char *
	:rtype: bool
") AddProp;
		Standard_Boolean AddProp(const StepRepr_CharacterizedDefinition & target, const opencascade::handle<StepRepr_RepresentationContext> & Context, const opencascade::handle<StepRepr_RepresentationItem> & Prop, const char * Descr);

		/****************** AddVolume ******************/
		%feature("compactdefaultargs") AddVolume;
		%feature("autodoc", "Adds volume property for given shape (already mapped). returns true if success, false in case of fail.

	:param Shape:
	:type Shape: TopoDS_Shape
	:param Vol:
	:type Vol: float
	:rtype: bool
") AddVolume;
		Standard_Boolean AddVolume(const TopoDS_Shape & Shape, const Standard_Real Vol);

		/****************** FindTarget ******************/
		%feature("compactdefaultargs") FindTarget;
		%feature("autodoc", "Finds target step entity to which validation props should be assigned, and corresponding context, starting from shape returns true if success, false in case of fail.

	:param S:
	:type S: TopoDS_Shape
	:param target:
	:type target: StepRepr_CharacterizedDefinition
	:param Context:
	:type Context: StepRepr_RepresentationContext
	:param instance: default value is Standard_False
	:type instance: bool
	:rtype: bool
") FindTarget;
		Standard_Boolean FindTarget(const TopoDS_Shape & S, StepRepr_CharacterizedDefinition & target, opencascade::handle<StepRepr_RepresentationContext> & Context, const Standard_Boolean instance = Standard_False);

		/****************** GetPropNAUO ******************/
		%feature("compactdefaultargs") GetPropNAUO;
		%feature("autodoc", "Returns cdsr associated with given ppd or null if not found (when, try getpropsdr).

	:param PD:
	:type PD: StepRepr_PropertyDefinition
	:rtype: opencascade::handle<StepRepr_NextAssemblyUsageOccurrence>
") GetPropNAUO;
		opencascade::handle<StepRepr_NextAssemblyUsageOccurrence> GetPropNAUO(const opencascade::handle<StepRepr_PropertyDefinition> & PD);

		/****************** GetPropPD ******************/
		%feature("compactdefaultargs") GetPropPD;
		%feature("autodoc", "Returns sdr associated with given ppd or null if not found (when, try getpropcdsr).

	:param PD:
	:type PD: StepRepr_PropertyDefinition
	:rtype: opencascade::handle<StepBasic_ProductDefinition>
") GetPropPD;
		opencascade::handle<StepBasic_ProductDefinition> GetPropPD(const opencascade::handle<StepRepr_PropertyDefinition> & PD);

		/****************** GetPropPnt ******************/
		%feature("compactdefaultargs") GetPropPnt;
		%feature("autodoc", "Returns value of centriod property (or false if it is not).

	:param item:
	:type item: StepRepr_RepresentationItem
	:param Context:
	:type Context: StepRepr_RepresentationContext
	:param Pnt:
	:type Pnt: gp_Pnt
	:rtype: bool
") GetPropPnt;
		Standard_Boolean GetPropPnt(const opencascade::handle<StepRepr_RepresentationItem> & item, const opencascade::handle<StepRepr_RepresentationContext> & Context, gp_Pnt & Pnt);

		/****************** GetPropReal ******************/
		%feature("compactdefaultargs") GetPropReal;
		%feature("autodoc", "Returns value of real-valued property (area or volume) if property is neither area nor volume, returns false else returns true and isarea indicates whether property is area or volume.

	:param item:
	:type item: StepRepr_RepresentationItem
	:param Val:
	:type Val: float
	:param isArea:
	:type isArea: bool
	:rtype: bool
") GetPropReal;
		Standard_Boolean GetPropReal(const opencascade::handle<StepRepr_RepresentationItem> & item, Standard_Real &OutValue, Standard_Boolean &OutValue);

		/****************** GetPropShape ******************/
		%feature("compactdefaultargs") GetPropShape;
		%feature("autodoc", "Returns shape associated with given sdr or null shape if not found.

	:param ProdDef:
	:type ProdDef: StepBasic_ProductDefinition
	:rtype: TopoDS_Shape
") GetPropShape;
		TopoDS_Shape GetPropShape(const opencascade::handle<StepBasic_ProductDefinition> & ProdDef);

		/****************** GetPropShape ******************/
		%feature("compactdefaultargs") GetPropShape;
		%feature("autodoc", "Returns shape associated with given ppd or null shape if not found.

	:param PD:
	:type PD: StepRepr_PropertyDefinition
	:rtype: TopoDS_Shape
") GetPropShape;
		TopoDS_Shape GetPropShape(const opencascade::handle<StepRepr_PropertyDefinition> & PD);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Load worksession; returns true if succeeded.

	:param WS:
	:type WS: XSControl_WorkSession
	:rtype: bool
") Init;
		Standard_Boolean Init(const opencascade::handle<XSControl_WorkSession> & WS);

		/****************** LoadProps ******************/
		%feature("compactdefaultargs") LoadProps;
		%feature("autodoc", "Searches for entities of the type propertydefinitionrepresentation in the model and fills the sequence by them.

	:param seq:
	:type seq: TColStd_SequenceOfTransient
	:rtype: bool
") LoadProps;
		Standard_Boolean LoadProps(TColStd_SequenceOfTransient & seq);

		/****************** STEPConstruct_ValidationProps ******************/
		%feature("compactdefaultargs") STEPConstruct_ValidationProps;
		%feature("autodoc", "Creates an empty tool.

	:rtype: None
") STEPConstruct_ValidationProps;
		 STEPConstruct_ValidationProps();

		/****************** STEPConstruct_ValidationProps ******************/
		%feature("compactdefaultargs") STEPConstruct_ValidationProps;
		%feature("autodoc", "Creates a tool and loads it with worksession.

	:param WS:
	:type WS: XSControl_WorkSession
	:rtype: None
") STEPConstruct_ValidationProps;
		 STEPConstruct_ValidationProps(const opencascade::handle<XSControl_WorkSession> & WS);

		/****************** SetAssemblyShape ******************/
		%feature("compactdefaultargs") SetAssemblyShape;
		%feature("autodoc", "Sets current assembly shape sdr (for findcdsr calls).

	:param shape:
	:type shape: TopoDS_Shape
	:rtype: None
") SetAssemblyShape;
		void SetAssemblyShape(const TopoDS_Shape & shape);

};


%extend STEPConstruct_ValidationProps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */

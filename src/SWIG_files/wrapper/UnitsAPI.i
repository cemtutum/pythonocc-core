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
%define UNITSAPIDOCSTRING
"UnitsAPI module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_unitsapi.html"
%enddef
%module (package="OCC.Core", docstring=UNITSAPIDOCSTRING) UnitsAPI


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
#include<UnitsAPI_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Units_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Units.i
/* public enums */
enum UnitsAPI_SystemUnits {
	UnitsAPI_DEFAULT = 0,
	UnitsAPI_SI = 1,
	UnitsAPI_MDTV = 2,
};

/* end public enums declaration */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/*****************
* class UnitsAPI *
*****************/
%rename(unitsapi) UnitsAPI;
class UnitsAPI {
	public:
		/****************** AnyFromLS ******************/
		%feature("compactdefaultargs") AnyFromLS;
		%feature("autodoc", "Converts the local system units value to the local unit value. example: anyfromls(25.4,'in.') returns 1. if the localsystem is mdtv. note: aunit is also used to identify the type of physical quantity to convert.

	:param aData:
	:type aData: float
	:param aUnit:
	:type aUnit: char *
	:rtype: float
") AnyFromLS;
		static Standard_Real AnyFromLS(const Standard_Real aData, const char * aUnit);

		/****************** AnyFromSI ******************/
		%feature("compactdefaultargs") AnyFromSI;
		%feature("autodoc", "Converts the si system units value to the local unit value. example: anyfromsi(0.0254,'in.') returns 0.001 note: aunit is also used to identify the type of physical quantity to convert.

	:param aData:
	:type aData: float
	:param aUnit:
	:type aUnit: char *
	:rtype: float
") AnyFromSI;
		static Standard_Real AnyFromSI(const Standard_Real aData, const char * aUnit);

		/****************** AnyToAny ******************/
		%feature("compactdefaultargs") AnyToAny;
		%feature("autodoc", "Converts the local unit value to another local unit value. example: anytoany(0.0254,'in.','millimeter') returns 1. ;.

	:param aData:
	:type aData: float
	:param aUnit1:
	:type aUnit1: char *
	:param aUnit2:
	:type aUnit2: char *
	:rtype: float
") AnyToAny;
		static Standard_Real AnyToAny(const Standard_Real aData, const char * aUnit1, const char * aUnit2);

		/****************** AnyToLS ******************/
		%feature("compactdefaultargs") AnyToLS;
		%feature("autodoc", "Converts the local unit value to the local system units value. example: anytols(1.,'in.') returns 25.4 if the localsystem is mdtv.

	:param aData:
	:type aData: float
	:param aUnit:
	:type aUnit: char *
	:rtype: float
") AnyToLS;
		static Standard_Real AnyToLS(const Standard_Real aData, const char * aUnit);

		/****************** AnyToLS ******************/
		%feature("compactdefaultargs") AnyToLS;
		%feature("autodoc", "Converts the local unit value to the local system units value. and gives the associated dimension of the unit.

	:param aData:
	:type aData: float
	:param aUnit:
	:type aUnit: char *
	:param aDim:
	:type aDim: Units_Dimensions
	:rtype: float
") AnyToLS;
		static Standard_Real AnyToLS(const Standard_Real aData, const char * aUnit, opencascade::handle<Units_Dimensions> & aDim);

		/****************** AnyToSI ******************/
		%feature("compactdefaultargs") AnyToSI;
		%feature("autodoc", "Converts the local unit value to the si system units value. example: anytosi(1.,'in.') returns 0.0254.

	:param aData:
	:type aData: float
	:param aUnit:
	:type aUnit: char *
	:rtype: float
") AnyToSI;
		static Standard_Real AnyToSI(const Standard_Real aData, const char * aUnit);

		/****************** AnyToSI ******************/
		%feature("compactdefaultargs") AnyToSI;
		%feature("autodoc", "Converts the local unit value to the si system units value. and gives the associated dimension of the unit.

	:param aData:
	:type aData: float
	:param aUnit:
	:type aUnit: char *
	:param aDim:
	:type aDim: Units_Dimensions
	:rtype: float
") AnyToSI;
		static Standard_Real AnyToSI(const Standard_Real aData, const char * aUnit, opencascade::handle<Units_Dimensions> & aDim);

		/****************** Check ******************/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "Checks the coherence between the quantity <aquantity> and the unit <aunits> in the current system and returns false when it's wrong.

	:param aQuantity:
	:type aQuantity: char *
	:param aUnit:
	:type aUnit: char *
	:rtype: bool
") Check;
		static Standard_Boolean Check(const char * aQuantity, const char * aUnit);

		/****************** CurrentFromAny ******************/
		%feature("compactdefaultargs") CurrentFromAny;
		%feature("autodoc", "Converts the adata value expressed in the unit aunit, into the current unit for the working environment, as defined for the physical quantity aquantity by the last call to the setcurrentunit function.

	:param aData:
	:type aData: float
	:param aQuantity:
	:type aQuantity: char *
	:param aUnit:
	:type aUnit: char *
	:rtype: float
") CurrentFromAny;
		static Standard_Real CurrentFromAny(const Standard_Real aData, const char * aQuantity, const char * aUnit);

		/****************** CurrentFromLS ******************/
		%feature("compactdefaultargs") CurrentFromLS;
		%feature("autodoc", "Converts the local system units value to the current unit value. example: currentfromls(1000.,'length') returns 1. if current length unit is meter and localsystem is mdtv.

	:param aData:
	:type aData: float
	:param aQuantity:
	:type aQuantity: char *
	:rtype: float
") CurrentFromLS;
		static Standard_Real CurrentFromLS(const Standard_Real aData, const char * aQuantity);

		/****************** CurrentFromSI ******************/
		%feature("compactdefaultargs") CurrentFromSI;
		%feature("autodoc", "Converts the si system units value to the current unit value. example: currentfromsi(0.001,'length') returns 1 if current length unit is millimeter.

	:param aData:
	:type aData: float
	:param aQuantity:
	:type aQuantity: char *
	:rtype: float
") CurrentFromSI;
		static Standard_Real CurrentFromSI(const Standard_Real aData, const char * aQuantity);

		/****************** CurrentToAny ******************/
		%feature("compactdefaultargs") CurrentToAny;
		%feature("autodoc", "Converts the adata value expressed in the current unit for the working environment, as defined for the physical quantity aquantity by the last call to the setcurrentunit function, into the unit aunit.

	:param aData:
	:type aData: float
	:param aQuantity:
	:type aQuantity: char *
	:param aUnit:
	:type aUnit: char *
	:rtype: float
") CurrentToAny;
		static Standard_Real CurrentToAny(const Standard_Real aData, const char * aQuantity, const char * aUnit);

		/****************** CurrentToLS ******************/
		%feature("compactdefaultargs") CurrentToLS;
		%feature("autodoc", "Converts the current unit value to the local system units value. example: currenttols(1.,'length') returns 1000. if the current length unit is meter and localsystem is mdtv.

	:param aData:
	:type aData: float
	:param aQuantity:
	:type aQuantity: char *
	:rtype: float
") CurrentToLS;
		static Standard_Real CurrentToLS(const Standard_Real aData, const char * aQuantity);

		/****************** CurrentToSI ******************/
		%feature("compactdefaultargs") CurrentToSI;
		%feature("autodoc", "Converts the current unit value to the si system units value. example: currenttosi(1.,'length') returns 0.001 if current length unit is millimeter.

	:param aData:
	:type aData: float
	:param aQuantity:
	:type aQuantity: char *
	:rtype: float
") CurrentToSI;
		static Standard_Real CurrentToSI(const Standard_Real aData, const char * aQuantity);

		/****************** CurrentUnit ******************/
		%feature("compactdefaultargs") CurrentUnit;
		%feature("autodoc", "Returns the current unit dimension <aunit> from the unit quantity <aquantity>.

	:param aQuantity:
	:type aQuantity: char *
	:rtype: char *
") CurrentUnit;
		static const char * CurrentUnit(const char * aQuantity);

		/****************** DimensionAmountOfSubstance ******************/
		%feature("compactdefaultargs") DimensionAmountOfSubstance;
		%feature("autodoc", "	:rtype: opencascade::handle<Units_Dimensions>
") DimensionAmountOfSubstance;
		static opencascade::handle<Units_Dimensions> DimensionAmountOfSubstance();

		/****************** DimensionElectricCurrent ******************/
		%feature("compactdefaultargs") DimensionElectricCurrent;
		%feature("autodoc", "	:rtype: opencascade::handle<Units_Dimensions>
") DimensionElectricCurrent;
		static opencascade::handle<Units_Dimensions> DimensionElectricCurrent();

		/****************** DimensionLength ******************/
		%feature("compactdefaultargs") DimensionLength;
		%feature("autodoc", "	:rtype: opencascade::handle<Units_Dimensions>
") DimensionLength;
		static opencascade::handle<Units_Dimensions> DimensionLength();

		/****************** DimensionLess ******************/
		%feature("compactdefaultargs") DimensionLess;
		%feature("autodoc", "	:rtype: opencascade::handle<Units_Dimensions>
") DimensionLess;
		static opencascade::handle<Units_Dimensions> DimensionLess();

		/****************** DimensionLuminousIntensity ******************/
		%feature("compactdefaultargs") DimensionLuminousIntensity;
		%feature("autodoc", "	:rtype: opencascade::handle<Units_Dimensions>
") DimensionLuminousIntensity;
		static opencascade::handle<Units_Dimensions> DimensionLuminousIntensity();

		/****************** DimensionMass ******************/
		%feature("compactdefaultargs") DimensionMass;
		%feature("autodoc", "	:rtype: opencascade::handle<Units_Dimensions>
") DimensionMass;
		static opencascade::handle<Units_Dimensions> DimensionMass();

		/****************** DimensionPlaneAngle ******************/
		%feature("compactdefaultargs") DimensionPlaneAngle;
		%feature("autodoc", "	:rtype: opencascade::handle<Units_Dimensions>
") DimensionPlaneAngle;
		static opencascade::handle<Units_Dimensions> DimensionPlaneAngle();

		/****************** DimensionSolidAngle ******************/
		%feature("compactdefaultargs") DimensionSolidAngle;
		%feature("autodoc", "Returns the basic dimensions.

	:rtype: opencascade::handle<Units_Dimensions>
") DimensionSolidAngle;
		static opencascade::handle<Units_Dimensions> DimensionSolidAngle();

		/****************** DimensionThermodynamicTemperature ******************/
		%feature("compactdefaultargs") DimensionThermodynamicTemperature;
		%feature("autodoc", "	:rtype: opencascade::handle<Units_Dimensions>
") DimensionThermodynamicTemperature;
		static opencascade::handle<Units_Dimensions> DimensionThermodynamicTemperature();

		/****************** DimensionTime ******************/
		%feature("compactdefaultargs") DimensionTime;
		%feature("autodoc", "	:rtype: opencascade::handle<Units_Dimensions>
") DimensionTime;
		static opencascade::handle<Units_Dimensions> DimensionTime();

		/****************** Dimensions ******************/
		%feature("compactdefaultargs") Dimensions;
		%feature("autodoc", "Return the dimension associated to the quantity.

	:param aQuantity:
	:type aQuantity: char *
	:rtype: opencascade::handle<Units_Dimensions>
") Dimensions;
		static opencascade::handle<Units_Dimensions> Dimensions(const char * aQuantity);

		/****************** LSToSI ******************/
		%feature("compactdefaultargs") LSToSI;
		%feature("autodoc", "Converts the local system units value to the si system unit value. example: lstosi(1.,'length') returns 0.001 if the local system length unit is millimeter.

	:param aData:
	:type aData: float
	:param aQuantity:
	:type aQuantity: char *
	:rtype: float
") LSToSI;
		static Standard_Real LSToSI(const Standard_Real aData, const char * aQuantity);

		/****************** LocalSystem ******************/
		%feature("compactdefaultargs") LocalSystem;
		%feature("autodoc", "Returns the current local system units.

	:rtype: UnitsAPI_SystemUnits
") LocalSystem;
		static UnitsAPI_SystemUnits LocalSystem();

		/****************** Reload ******************/
		%feature("compactdefaultargs") Reload;
		%feature("autodoc", "	:rtype: None
") Reload;
		static void Reload();

		/****************** SIToLS ******************/
		%feature("compactdefaultargs") SIToLS;
		%feature("autodoc", "Converts the si system unit value to the local system units value. example: sitols(1.,'length') returns 1000. if the local system length unit is millimeter.

	:param aData:
	:type aData: float
	:param aQuantity:
	:type aQuantity: char *
	:rtype: float
") SIToLS;
		static Standard_Real SIToLS(const Standard_Real aData, const char * aQuantity);

		/****************** Save ******************/
		%feature("compactdefaultargs") Save;
		%feature("autodoc", "Saves the units in the file .currentunits of the directory pointed by the csf_currentunitsuserdefaults environment variable.

	:rtype: None
") Save;
		static void Save();

		/****************** SetCurrentUnit ******************/
		%feature("compactdefaultargs") SetCurrentUnit;
		%feature("autodoc", "Sets the current unit dimension <aunit> to the unit quantity <aquantity>. example: setcurrentunit('length','millimeter').

	:param aQuantity:
	:type aQuantity: char *
	:param aUnit:
	:type aUnit: char *
	:rtype: None
") SetCurrentUnit;
		static void SetCurrentUnit(const char * aQuantity, const char * aUnit);

		/****************** SetLocalSystem ******************/
		%feature("compactdefaultargs") SetLocalSystem;
		%feature("autodoc", "Sets the local system units. example: setlocalsystem(unitsapi_mdtv).

	:param aSystemUnit: default value is UnitsAPI_SI
	:type aSystemUnit: UnitsAPI_SystemUnits
	:rtype: None
") SetLocalSystem;
		static void SetLocalSystem(const UnitsAPI_SystemUnits aSystemUnit = UnitsAPI_SI);

};


%extend UnitsAPI {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */

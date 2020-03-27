from typing import NewType, Optional

from OCC.Core.MoniTool import *
from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.TCollection import *
from OCC.Core.TopoDS import *
from OCC.Core.gp import *
from OCC.Core.Message import *
from OCC.Core.OSD import *
from OCC.Core.TColStd import *


class MoniTool_ValueType:
	MoniTool_ValueMisc: int = ...
	MoniTool_ValueInteger: int = ...
	MoniTool_ValueReal: int = ...
	MoniTool_ValueIdent: int = ...
	MoniTool_ValueVoid: int = ...
	MoniTool_ValueText: int = ...
	MoniTool_ValueEnum: int = ...
	MoniTool_ValueLogical: int = ...
	MoniTool_ValueSub: int = ...
	MoniTool_ValueHexa: int = ...
	MoniTool_ValueBinary: int = ...

class MoniTool_AttrList:
	def __init__(self) -> None: ...
	def __init__(self, other: MoniTool_AttrList) -> None: ...
	def AttrList(self) -> False: ...
	def Attribute(self, name: str) -> Standard_Transient: ...
	def AttributeType(self, name: str) -> MoniTool_ValueType: ...
	def GetAttribute(self, name: str, type: Standard_Type, val: Standard_Transient) -> bool: ...
	def GetAttributes(self, other: MoniTool_AttrList, fromname: Optional[str], copied: Optional[bool]) -> None: ...
	def GetIntegerAttribute(self, name: str, val: int) -> bool: ...
	def GetRealAttribute(self, name: str, val: float) -> bool: ...
	def GetStringAttribute(self, name: str, val: str) -> bool: ...
	def IntegerAttribute(self, name: str) -> int: ...
	def RealAttribute(self, name: str) -> float: ...
	def RemoveAttribute(self, name: str) -> bool: ...
	def SameAttributes(self, other: MoniTool_AttrList) -> None: ...
	def SetAttribute(self, name: str, val: Standard_Transient) -> None: ...
	def SetIntegerAttribute(self, name: str, val: int) -> None: ...
	def SetRealAttribute(self, name: str, val: float) -> None: ...
	def SetStringAttribute(self, name: str, val: str) -> None: ...
	def StringAttribute(self, name: str) -> str: ...

class MoniTool_CaseData(Standard_Transient):
	def __init__(self, caseid: Optional[str], name: Optional[str]) -> None: ...
	def AddAny(self, val: Standard_Transient, name: Optional[str]) -> None: ...
	def AddCPU(self, lastCPU: float, curCPU: Optional[float], name: Optional[str]) -> None: ...
	def AddData(self, val: Standard_Transient, kind: int, name: Optional[str]) -> None: ...
	def AddEntity(self, ent: Standard_Transient, name: Optional[str]) -> None: ...
	def AddGeom(self, geom: Standard_Transient, name: Optional[str]) -> None: ...
	def AddInteger(self, val: int, name: Optional[str]) -> None: ...
	def AddRaised(self, theException: Standard_Failure, name: Optional[str]) -> None: ...
	def AddReal(self, val: float, name: Optional[str]) -> None: ...
	def AddReals(self, v1: float, v2: float, name: Optional[str]) -> None: ...
	def AddShape(self, sh: TopoDS_Shape, name: Optional[str]) -> None: ...
	def AddText(self, text: str, name: Optional[str]) -> None: ...
	def AddXY(self, aXY: gp_XY, name: Optional[str]) -> None: ...
	def AddXYZ(self, aXYZ: gp_XYZ, name: Optional[str]) -> None: ...
	def CaseId(self) -> str: ...
	def Data(self, nd: int) -> Standard_Transient: ...
	@staticmethod
	def DefCheck(self, acode: str) -> int: ...
	@staticmethod
	def DefMsg(self, casecode: str) -> str: ...
	def GetCPU(self) -> float: ...
	def GetData(self, nd: int, type: Standard_Type, val: Standard_Transient) -> bool: ...
	def Integer(self, nd: int, val: int) -> bool: ...
	def IsCheck(self) -> bool: ...
	def IsFail(self) -> bool: ...
	def IsWarning(self) -> bool: ...
	def Kind(self, nd: int) -> int: ...
	def LargeCPU(self, maxCPU: float, lastCPU: float, curCPU: Optional[float]) -> bool: ...
	def Msg(self) -> Message_Msg: ...
	def Name(self) -> str: ...
	def Name(self, nd: int) -> TCollection_AsciiString: ...
	def NameNum(self, name: str) -> int: ...
	def NbData(self) -> int: ...
	def Real(self, nd: int, val: float) -> bool: ...
	def Reals(self, nd: int, v1: float, v2: float) -> bool: ...
	def RemoveData(self, num: int) -> None: ...
	def ResetCheck(self) -> None: ...
	def SetCaseId(self, caseid: str) -> None: ...
	def SetChange(self) -> None: ...
	@staticmethod
	def SetDefFail(self, acode: str) -> None: ...
	@staticmethod
	def SetDefMsg(self, casecode: str, mesdef: str) -> None: ...
	@staticmethod
	def SetDefWarning(self, acode: str) -> None: ...
	def SetFail(self) -> None: ...
	def SetName(self, name: str) -> None: ...
	def SetReplace(self, num: int) -> None: ...
	def SetWarning(self) -> None: ...
	def Shape(self, nd: int) -> TopoDS_Shape: ...
	def Text(self, nd: int, text: str) -> bool: ...
	def XY(self, nd: int, val: gp_XY) -> bool: ...
	def XYZ(self, nd: int, val: gp_XYZ) -> bool: ...

class MoniTool_DataInfo:
	@staticmethod
	def Type(self, ent: Standard_Transient) -> Standard_Type: ...
	@staticmethod
	def TypeName(self, ent: Standard_Transient) -> str: ...

class MoniTool_ElemHasher:
	@staticmethod
	def HashCode(self, theElement: MoniTool_Element, theUpperBound: int) -> int: ...
	@staticmethod
	def IsEqual(self, K1: MoniTool_Element, K2: MoniTool_Element) -> bool: ...

class MoniTool_Element(Standard_Transient):
	def ChangeAttr(self) -> MoniTool_AttrList: ...
	def Equates(self, other: MoniTool_Element) -> bool: ...
	def GetHashCode(self) -> int: ...
	def ListAttr(self) -> MoniTool_AttrList: ...
	def ValueType(self) -> Standard_Type: ...
	def ValueTypeName(self) -> str: ...

class MoniTool_IntVal(Standard_Transient):
	def __init__(self, val: Optional[int]) -> None: ...
	def GetCValue(self) -> int: ...
	def SetCValue(self, value: int) -> None: ...
	def Value(self) -> int: ...

class MoniTool_MTHasher:
	@staticmethod
	def HashCode(self, theString: str, theUpperBound: int) -> int: ...
	@staticmethod
	def IsEqual(self, Str1: str, Str2: str) -> bool: ...

class MoniTool_RealVal(Standard_Transient):
	def __init__(self, val: Optional[float]) -> None: ...
	def GetCValue(self) -> float: ...
	def SetCValue(self, value: float) -> None: ...
	def Value(self) -> float: ...

class MoniTool_SignText(Standard_Transient):
	def Name(self) -> str: ...
	def Text(self, ent: Standard_Transient, context: Standard_Transient) -> TCollection_AsciiString: ...
	def TextAlone(self, ent: Standard_Transient) -> TCollection_AsciiString: ...

class MoniTool_Stat:
	def __init__(self, title: Optional[str]) -> None: ...
	def __init__(self, other: MoniTool_Stat) -> None: ...
	def Add(self, nb: Optional[int]) -> None: ...
	def AddEnd(self) -> None: ...
	def AddSub(self, nb: Optional[int]) -> None: ...
	def Close(self, id: int) -> None: ...
	@staticmethod
	def Current(self) -> MoniTool_Stat: ...
	def Level(self) -> int: ...
	def Open(self, nb: Optional[int]) -> int: ...
	def OpenMore(self, id: int, nb: int) -> None: ...
	def Percent(self, fromlev: Optional[int]) -> float: ...

class MoniTool_Timer(Standard_Transient):
	def __init__(self) -> None: ...
	def Amend(self) -> float: ...
	def CPU(self) -> float: ...
	@staticmethod
	def ClearTimers(self) -> None: ...
	@staticmethod
	def ComputeAmendments(self) -> None: ...
	def Count(self) -> int: ...
	@staticmethod
	def Dictionary(self) -> MoniTool_DataMapOfTimer: ...
	@staticmethod
	def GetAmendments(self, Access: float, Internal: float, External: float, Error10: float) -> None: ...
	def IsRunning(self) -> int: ...
	def Reset(self) -> None: ...
	def Start(self) -> None: ...
	@staticmethod
	def Start(self, name: str) -> None: ...
	def Stop(self) -> None: ...
	@staticmethod
	def Stop(self, name: str) -> None: ...
	def Timer(self) -> OSD_Timer: ...
	def Timer(self) -> OSD_Timer: ...
	@staticmethod
	def Timer(self, name: str) -> MoniTool_Timer: ...

class MoniTool_TimerSentry:
	def __init__(self, cname: str) -> None: ...
	def __init__(self, timer: MoniTool_Timer) -> None: ...
	def Stop(self) -> None: ...
	def Timer(self) -> MoniTool_Timer: ...

class MoniTool_TypedValue(Standard_Transient):
	def __init__(self, name: str, type: Optional[MoniTool_ValueType], init: Optional[str]) -> None: ...
	def __init__(self, other: MoniTool_TypedValue) -> None: ...
	def AddDef(self, initext: str) -> bool: ...
	def AddEnum(self, v1: Optional[str], v2: Optional[str], v3: Optional[str], v4: Optional[str], v5: Optional[str], v6: Optional[str], v7: Optional[str], v8: Optional[str], v9: Optional[str], v10: Optional[str]) -> None: ...
	def AddEnumValue(self, val: str, num: int) -> None: ...
	@staticmethod
	def AddLib(self, tv: MoniTool_TypedValue, def_: Optional[str]) -> bool: ...
	def CStringValue(self) -> str: ...
	def ClearValue(self) -> None: ...
	def Definition(self) -> TCollection_AsciiString: ...
	def EnumCase(self, val: str) -> int: ...
	def EnumDef(self, startcase: int, endcase: int, match: bool) -> bool: ...
	def EnumVal(self, num: int) -> str: ...
	@staticmethod
	def FromLib(self, def_: str) -> MoniTool_TypedValue: ...
	def GetObjectValue(self, val: Standard_Transient) -> None: ...
	def HStringValue(self) -> TCollection_HAsciiString: ...
	def HasInterpret(self) -> bool: ...
	def IntegerLimit(self, max: bool, val: int) -> bool: ...
	def IntegerValue(self) -> int: ...
	def Interpret(self, hval: TCollection_HAsciiString, native: bool) -> TCollection_HAsciiString: ...
	def IsSetValue(self) -> bool: ...
	def Label(self) -> str: ...
	@staticmethod
	def Lib(self, def_: str) -> MoniTool_TypedValue: ...
	@staticmethod
	def LibList(self) -> TColStd_HSequenceOfAsciiString: ...
	def MaxLength(self) -> int: ...
	def Name(self) -> str: ...
	def ObjectType(self) -> Standard_Type: ...
	def ObjectTypeName(self) -> str: ...
	def ObjectValue(self) -> Standard_Transient: ...
	def Print(self, S: Message_Messenger) -> None: ...
	def PrintValue(self, S: Message_Messenger) -> None: ...
	def RealLimit(self, max: bool, val: float) -> bool: ...
	def RealValue(self) -> float: ...
	def Satisfies(self, hval: TCollection_HAsciiString) -> bool: ...
	def SatisfiesName(self) -> str: ...
	def SetCStringValue(self, val: str) -> bool: ...
	def SetDefinition(self, deftext: str) -> None: ...
	def SetHStringValue(self, hval: TCollection_HAsciiString) -> bool: ...
	def SetIntegerLimit(self, max: bool, val: int) -> None: ...
	def SetIntegerValue(self, ival: int) -> bool: ...
	def SetInterpret(self, func: MoniTool_ValueInterpret) -> None: ...
	def SetLabel(self, label: str) -> None: ...
	def SetMaxLength(self, max: int) -> None: ...
	def SetObjectType(self, typ: Standard_Type) -> None: ...
	def SetObjectValue(self, obj: Standard_Transient) -> bool: ...
	def SetRealLimit(self, max: bool, val: float) -> None: ...
	def SetRealValue(self, rval: float) -> bool: ...
	def SetSatisfies(self, func: MoniTool_ValueSatisfies, name: str) -> None: ...
	def SetUnitDef(self, def_: str) -> None: ...
	def StartEnum(self, start: Optional[int], match: Optional[bool]) -> None: ...
	@staticmethod
	def StaticValue(self, name: str) -> MoniTool_TypedValue: ...
	def UnitDef(self) -> str: ...
	def ValueType(self) -> MoniTool_ValueType: ...

class MoniTool_SignShape(MoniTool_SignText):
	def __init__(self) -> None: ...
	def Name(self) -> str: ...
	def Text(self, ent: Standard_Transient, context: Standard_Transient) -> TCollection_AsciiString: ...

class MoniTool_TransientElem(MoniTool_Element):
	def __init__(self, akey: Standard_Transient) -> None: ...
	def Equates(self, other: MoniTool_Element) -> bool: ...
	def Value(self) -> Standard_Transient: ...
	def ValueType(self) -> Standard_Type: ...
	def ValueTypeName(self) -> str: ...

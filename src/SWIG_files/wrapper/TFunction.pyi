from typing import NewType, Optional, Tuple

from OCC.Core.TFunction import *
from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.TDF import *
from OCC.Core.TColStd import *


class TFunction_ExecutionStatus:
	TFunction_ES_WrongDefinition: int = ...
	TFunction_ES_NotExecuted: int = ...
	TFunction_ES_Executing: int = ...
	TFunction_ES_Succeeded: int = ...
	TFunction_ES_Failed: int = ...

class TFunction_Driver(Standard_Transient):
	def Arguments(self, args: TDF_LabelList) -> None: ...
	def Execute(self, log: TFunction_Logbook) -> int: ...
	def Init(self, L: TDF_Label) -> None: ...
	def Label(self) -> TDF_Label: ...
	def MustExecute(self, log: TFunction_Logbook) -> bool: ...
	def Results(self, res: TDF_LabelList) -> None: ...
	def Validate(self, log: TFunction_Logbook) -> None: ...

class TFunction_DriverTable(Standard_Transient):
	def __init__(self) -> None: ...
	def AddDriver(self, guid: Standard_GUID, driver: TFunction_Driver, thread: Optional[int]) -> bool: ...
	def Clear(self) -> None: ...
	def FindDriver(self, guid: Standard_GUID, driver: TFunction_Driver, thread: Optional[int]) -> bool: ...
	@staticmethod
	def Get(self) -> TFunction_DriverTable: ...
	def HasDriver(self, guid: Standard_GUID, thread: Optional[int]) -> bool: ...
	def RemoveDriver(self, guid: Standard_GUID, thread: Optional[int]) -> bool: ...

class TFunction_Function(TDF_Attribute):
	def __init__(self) -> None: ...
	def Failed(self) -> bool: ...
	def GetDriverGUID(self) -> Standard_GUID: ...
	def GetFailure(self) -> int: ...
	@staticmethod
	def GetID(self) -> Standard_GUID: ...
	def ID(self) -> Standard_GUID: ...
	def NewEmpty(self) -> TDF_Attribute: ...
	def Paste(self, into: TDF_Attribute, RT: TDF_RelocationTable) -> None: ...
	def References(self, aDataSet: TDF_DataSet) -> None: ...
	def Restore(self, with_: TDF_Attribute) -> None: ...
	@staticmethod
	def Set(self, L: TDF_Label) -> TFunction_Function: ...
	@staticmethod
	def Set(self, L: TDF_Label, DriverID: Standard_GUID) -> TFunction_Function: ...
	def SetDriverGUID(self, guid: Standard_GUID) -> None: ...
	def SetFailure(self, mode: Optional[int]) -> None: ...

class TFunction_GraphNode(TDF_Attribute):
	def __init__(self) -> None: ...
	def AddNext(self, funcID: int) -> bool: ...
	def AddNext(self, func: TDF_Label) -> bool: ...
	def AddPrevious(self, funcID: int) -> bool: ...
	def AddPrevious(self, func: TDF_Label) -> bool: ...
	@staticmethod
	def GetID(self) -> Standard_GUID: ...
	def GetNext(self) -> TColStd_MapOfInteger: ...
	def GetPrevious(self) -> TColStd_MapOfInteger: ...
	def GetStatus(self) -> TFunction_ExecutionStatus: ...
	def ID(self) -> Standard_GUID: ...
	def NewEmpty(self) -> TDF_Attribute: ...
	def Paste(self, into: TDF_Attribute, RT: TDF_RelocationTable) -> None: ...
	def References(self, aDataSet: TDF_DataSet) -> None: ...
	def RemoveAllNext(self) -> None: ...
	def RemoveAllPrevious(self) -> None: ...
	def RemoveNext(self, funcID: int) -> bool: ...
	def RemoveNext(self, func: TDF_Label) -> bool: ...
	def RemovePrevious(self, funcID: int) -> bool: ...
	def RemovePrevious(self, func: TDF_Label) -> bool: ...
	def Restore(self, with_: TDF_Attribute) -> None: ...
	@staticmethod
	def Set(self, L: TDF_Label) -> TFunction_GraphNode: ...
	def SetStatus(self, status: TFunction_ExecutionStatus) -> None: ...

class TFunction_IFunction:
	def __init__(self) -> None: ...
	def __init__(self, L: TDF_Label) -> None: ...
	def Arguments(self, args: TDF_LabelList) -> None: ...
	@staticmethod
	def DeleteFunction(self, L: TDF_Label) -> bool: ...
	def GetAllFunctions(self) -> TFunction_DoubleMapOfIntegerLabel: ...
	def GetDriver(self, thread: Optional[int]) -> TFunction_Driver: ...
	def GetGraphNode(self) -> TFunction_GraphNode: ...
	def GetLogbook(self) -> TFunction_Logbook: ...
	def GetNext(self, prev: TDF_LabelList) -> None: ...
	def GetPrevious(self, prev: TDF_LabelList) -> None: ...
	def GetStatus(self) -> TFunction_ExecutionStatus: ...
	def Init(self, L: TDF_Label) -> None: ...
	def Label(self) -> TDF_Label: ...
	@staticmethod
	def NewFunction(self, L: TDF_Label, ID: Standard_GUID) -> bool: ...
	def Results(self, res: TDF_LabelList) -> None: ...
	def SetStatus(self, status: TFunction_ExecutionStatus) -> None: ...
	@staticmethod
	def UpdateDependencies(self, Access: TDF_Label) -> bool: ...
	def UpdateDependencies(self) -> bool: ...

class TFunction_Iterator:
	def __init__(self) -> None: ...
	def __init__(self, Access: TDF_Label) -> None: ...
	def Current(self) -> TDF_LabelList: ...
	def GetMaxNbThreads(self) -> int: ...
	def GetStatus(self, func: TDF_Label) -> TFunction_ExecutionStatus: ...
	def GetUsageOfExecutionStatus(self) -> bool: ...
	def Init(self, Access: TDF_Label) -> None: ...
	def More(self) -> bool: ...
	def Next(self) -> None: ...
	def SetStatus(self, func: TDF_Label, status: TFunction_ExecutionStatus) -> None: ...
	def SetUsageOfExecutionStatus(self, usage: bool) -> None: ...

class TFunction_Logbook(TDF_Attribute):
	def __init__(self) -> None: ...
	def Clear(self) -> None: ...
	def Done(self, status: bool) -> None: ...
	@staticmethod
	def GetID(self) -> Standard_GUID: ...
	def GetImpacted(self) -> TDF_LabelMap: ...
	def GetTouched(self) -> TDF_LabelMap: ...
	def GetValid(self) -> TDF_LabelMap: ...
	def GetValid(self, Ls: TDF_LabelMap) -> None: ...
	def ID(self) -> Standard_GUID: ...
	def IsDone(self) -> bool: ...
	def IsEmpty(self) -> bool: ...
	def IsModified(self, L: TDF_Label, WithChildren: Optional[bool]) -> bool: ...
	def NewEmpty(self) -> TDF_Attribute: ...
	def Paste(self, into: TDF_Attribute, RT: TDF_RelocationTable) -> None: ...
	def Restore(self, with_: TDF_Attribute) -> None: ...
	@staticmethod
	def Set(self, Access: TDF_Label) -> TFunction_Logbook: ...
	def SetImpacted(self, L: TDF_Label, WithChildren: Optional[bool]) -> None: ...
	def SetTouched(self, L: TDF_Label) -> None: ...
	def SetValid(self, L: TDF_Label, WithChildren: Optional[bool]) -> None: ...
	def SetValid(self, Ls: TDF_LabelMap) -> None: ...

class TFunction_Scope(TDF_Attribute):
	def __init__(self) -> None: ...
	def AddFunction(self, L: TDF_Label) -> bool: ...
	def ChangeFunctions(self) -> TFunction_DoubleMapOfIntegerLabel: ...
	def GetFreeID(self) -> int: ...
	def GetFunction(self, L: TDF_Label) -> int: ...
	def GetFunction(self, ID: int) -> TDF_Label: ...
	def GetFunctions(self) -> TFunction_DoubleMapOfIntegerLabel: ...
	@staticmethod
	def GetID(self) -> Standard_GUID: ...
	def GetLogbook(self) -> TFunction_Logbook: ...
	def HasFunction(self, ID: int) -> bool: ...
	def HasFunction(self, L: TDF_Label) -> bool: ...
	def ID(self) -> Standard_GUID: ...
	def NewEmpty(self) -> TDF_Attribute: ...
	def Paste(self, into: TDF_Attribute, RT: TDF_RelocationTable) -> None: ...
	def RemoveAllFunctions(self) -> None: ...
	def RemoveFunction(self, L: TDF_Label) -> bool: ...
	def RemoveFunction(self, ID: int) -> bool: ...
	def Restore(self, with_: TDF_Attribute) -> None: ...
	@staticmethod
	def Set(self, Access: TDF_Label) -> TFunction_Scope: ...
	def SetFreeID(self, ID: int) -> None: ...

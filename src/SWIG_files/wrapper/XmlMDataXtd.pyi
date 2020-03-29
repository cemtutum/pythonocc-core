from typing import NewType, Optional, Tuple

from OCC.Core.XmlMDataXtd import *
from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.XmlMDF import *
from OCC.Core.Message import *
from OCC.Core.TDF import *
from OCC.Core.XmlObjMgt import *


class XmlMDataXtd:
	@staticmethod
	def AddDrivers(self, aDriverTable: XmlMDF_ADriverTable, anMsgDrv: Message_Messenger) -> None: ...
	@staticmethod
	def DocumentVersion(self) -> int: ...
	@staticmethod
	def SetDocumentVersion(self, DocVersion: int) -> None: ...

class XmlMDataXtd_AxisDriver(XmlMDF_ADriver):
	def __init__(self, theMessageDriver: Message_Messenger) -> None: ...
	def NewEmpty(self) -> TDF_Attribute: ...
	def Paste(self, Source: XmlObjMgt_Persistent, Target: TDF_Attribute, RelocTable: XmlObjMgt_RRelocationTable) -> bool: ...
	def Paste(self, Source: TDF_Attribute, Target: XmlObjMgt_Persistent, RelocTable: XmlObjMgt_SRelocationTable) -> None: ...

class XmlMDataXtd_ConstraintDriver(XmlMDF_ADriver):
	def __init__(self, theMessageDriver: Message_Messenger) -> None: ...
	def NewEmpty(self) -> TDF_Attribute: ...
	def Paste(self, Source: XmlObjMgt_Persistent, Target: TDF_Attribute, RelocTable: XmlObjMgt_RRelocationTable) -> bool: ...
	def Paste(self, Source: TDF_Attribute, Target: XmlObjMgt_Persistent, RelocTable: XmlObjMgt_SRelocationTable) -> None: ...

class XmlMDataXtd_GeometryDriver(XmlMDF_ADriver):
	def __init__(self, theMessageDriver: Message_Messenger) -> None: ...
	def NewEmpty(self) -> TDF_Attribute: ...
	def Paste(self, Source: XmlObjMgt_Persistent, Target: TDF_Attribute, RelocTable: XmlObjMgt_RRelocationTable) -> bool: ...
	def Paste(self, Source: TDF_Attribute, Target: XmlObjMgt_Persistent, RelocTable: XmlObjMgt_SRelocationTable) -> None: ...

class XmlMDataXtd_PatternStdDriver(XmlMDF_ADriver):
	def __init__(self, theMessageDriver: Message_Messenger) -> None: ...
	def NewEmpty(self) -> TDF_Attribute: ...
	def Paste(self, Source: XmlObjMgt_Persistent, Target: TDF_Attribute, RelocTable: XmlObjMgt_RRelocationTable) -> bool: ...
	def Paste(self, Source: TDF_Attribute, Target: XmlObjMgt_Persistent, RelocTable: XmlObjMgt_SRelocationTable) -> None: ...

class XmlMDataXtd_PlacementDriver(XmlMDF_ADriver):
	def __init__(self, theMessageDriver: Message_Messenger) -> None: ...
	def NewEmpty(self) -> TDF_Attribute: ...
	def Paste(self, Source: XmlObjMgt_Persistent, Target: TDF_Attribute, RelocTable: XmlObjMgt_RRelocationTable) -> bool: ...
	def Paste(self, Source: TDF_Attribute, Target: XmlObjMgt_Persistent, RelocTable: XmlObjMgt_SRelocationTable) -> None: ...

class XmlMDataXtd_PlaneDriver(XmlMDF_ADriver):
	def __init__(self, theMessageDriver: Message_Messenger) -> None: ...
	def NewEmpty(self) -> TDF_Attribute: ...
	def Paste(self, Source: XmlObjMgt_Persistent, Target: TDF_Attribute, RelocTable: XmlObjMgt_RRelocationTable) -> bool: ...
	def Paste(self, Source: TDF_Attribute, Target: XmlObjMgt_Persistent, RelocTable: XmlObjMgt_SRelocationTable) -> None: ...

class XmlMDataXtd_PointDriver(XmlMDF_ADriver):
	def __init__(self, theMessageDriver: Message_Messenger) -> None: ...
	def NewEmpty(self) -> TDF_Attribute: ...
	def Paste(self, Source: XmlObjMgt_Persistent, Target: TDF_Attribute, RelocTable: XmlObjMgt_RRelocationTable) -> bool: ...
	def Paste(self, Source: TDF_Attribute, Target: XmlObjMgt_Persistent, RelocTable: XmlObjMgt_SRelocationTable) -> None: ...

class XmlMDataXtd_PositionDriver(XmlMDF_ADriver):
	def __init__(self, theMessageDriver: Message_Messenger) -> None: ...
	def NewEmpty(self) -> TDF_Attribute: ...
	def Paste(self, Source: XmlObjMgt_Persistent, Target: TDF_Attribute, RelocTable: XmlObjMgt_RRelocationTable) -> bool: ...
	def Paste(self, Source: TDF_Attribute, Target: XmlObjMgt_Persistent, RelocTable: XmlObjMgt_SRelocationTable) -> None: ...

class XmlMDataXtd_PresentationDriver(XmlMDF_ADriver):
	def __init__(self, theMessageDriver: Message_Messenger) -> None: ...
	def NewEmpty(self) -> TDF_Attribute: ...
	def Paste(self, Source: XmlObjMgt_Persistent, Target: TDF_Attribute, RelocTable: XmlObjMgt_RRelocationTable) -> bool: ...
	def Paste(self, Source: TDF_Attribute, Target: XmlObjMgt_Persistent, RelocTable: XmlObjMgt_SRelocationTable) -> None: ...

class XmlMDataXtd_ShapeDriver(XmlMDF_ADriver):
	def __init__(self, theMessageDriver: Message_Messenger) -> None: ...
	def NewEmpty(self) -> TDF_Attribute: ...
	def Paste(self, Source: XmlObjMgt_Persistent, Target: TDF_Attribute, RelocTable: XmlObjMgt_RRelocationTable) -> bool: ...
	def Paste(self, Source: TDF_Attribute, Target: XmlObjMgt_Persistent, RelocTable: XmlObjMgt_SRelocationTable) -> None: ...

class XmlMDataXtd_TriangulationDriver(XmlMDF_ADriver):
	def __init__(self, theMessageDriver: Message_Messenger) -> None: ...
	def NewEmpty(self) -> TDF_Attribute: ...
	def Paste(self, Source: XmlObjMgt_Persistent, Target: TDF_Attribute, RelocTable: XmlObjMgt_RRelocationTable) -> bool: ...
	def Paste(self, Source: TDF_Attribute, Target: XmlObjMgt_Persistent, RelocTable: XmlObjMgt_SRelocationTable) -> None: ...

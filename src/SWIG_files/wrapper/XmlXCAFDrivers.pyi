from typing import NewType, Optional

from OCC.Core.XmlXCAFDrivers import *
from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.TDocStd import *
from OCC.Core.XmlDrivers import *
from OCC.Core.Message import *
from OCC.Core.XmlMDF import *
from OCC.Core.TCollection import *


class XmlXCAFDrivers:
	@staticmethod
	def DefineFormat(self, theApp: TDocStd_Application) -> None: ...
	@staticmethod
	def Factory(self, aGUID: Standard_GUID) -> Standard_Transient: ...

class XmlXCAFDrivers_DocumentRetrievalDriver(XmlDrivers_DocumentRetrievalDriver):
	def AttributeDrivers(self, theMsgDriver: Message_Messenger) -> XmlMDF_ADriverTable: ...
	def __init__(self) -> None: ...

class XmlXCAFDrivers_DocumentStorageDriver(XmlDrivers_DocumentStorageDriver):
	def AttributeDrivers(self, theMsgDriver: Message_Messenger) -> XmlMDF_ADriverTable: ...
	def __init__(self, theCopyright: TCollection_ExtendedString) -> None: ...

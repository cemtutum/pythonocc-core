from typing import NewType, Optional, Tuple

from OCC.Core.XCAFPrs import *
from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.TDF import *
from OCC.Core.TopLoc import *
from OCC.Core.Quantity import *
from OCC.Core.AIS import *
from OCC.Core.Graphic3d import *
from OCC.Core.TDocStd import *
from OCC.Core.TCollection import *
from OCC.Core.TopoDS import *
from OCC.Core.TPrsStd import *

XCAFPrs_DocumentExplorerFlags = NewType('XCAFPrs_DocumentExplorerFlags', Standard_Integer)

class XCAFPrs:
	@staticmethod
	def CollectStyleSettings(self, L: TDF_Label, loc: TopLoc_Location, settings: XCAFPrs_IndexedDataMapOfShapeStyle, theLayerColor: Optional[Quantity_ColorRGBA]) -> None: ...
	@staticmethod
	def GetViewNameMode(self) -> bool: ...
	@staticmethod
	def SetViewNameMode(self, viewNameMode: bool) -> None: ...

class XCAFPrs_AISObject(AIS_ColoredShape):
	def __init__(self, theLabel: TDF_Label) -> None: ...
	def DispatchStyles(self, theToSyncStyles: Optional[bool]) -> None: ...
	def GetLabel(self) -> TDF_Label: ...
	def SetLabel(self, theLabel: TDF_Label) -> None: ...
	def SetMaterial(self, theMaterial: Graphic3d_MaterialAspect) -> None: ...

class XCAFPrs_DocumentExplorer:
	def __init__(self) -> None: ...
	def ChangeCurrent(self) -> XCAFPrs_DocumentNode: ...
	def Current(self) -> XCAFPrs_DocumentNode: ...
	def Current(self, theDepth: int) -> XCAFPrs_DocumentNode: ...
	def CurrentDepth(self) -> int: ...
	@staticmethod
	def DefineChildId(self, theLabel: TDF_Label, theParentId: TCollection_AsciiString) -> TCollection_AsciiString: ...
	@staticmethod
	def FindLabelFromPathId(self, theDocument: TDocStd_Document, theId: TCollection_AsciiString, theParentLocation: TopLoc_Location, theLocation: TopLoc_Location) -> TDF_Label: ...
	@staticmethod
	def FindLabelFromPathId(self, theDocument: TDocStd_Document, theId: TCollection_AsciiString, theLocation: TopLoc_Location) -> TDF_Label: ...
	@staticmethod
	def FindShapeFromPathId(self, theDocument: TDocStd_Document, theId: TCollection_AsciiString) -> TopoDS_Shape: ...
	def More(self) -> bool: ...
	def Next(self) -> None: ...

class XCAFPrs_DocumentIdIterator:
	def __init__(self, thePath: TCollection_AsciiString) -> None: ...
	def More(self) -> False: ...
	def Next(self) -> None: ...
	def Value(self) -> TCollection_AsciiString: ...

class XCAFPrs_DocumentNode:
	def __init__(self) -> None: ...

class XCAFPrs_Driver(TPrsStd_Driver):
	@staticmethod
	def GetID(self) -> Standard_GUID: ...
	def Update(self, L: TDF_Label, ais: AIS_InteractiveObject) -> bool: ...

class XCAFPrs_Style:
	def __init__(self) -> None: ...
	def GetColorCurv(self) -> Quantity_Color: ...
	def GetColorSurf(self) -> Quantity_Color: ...
	def GetColorSurfRGBA(self) -> Quantity_ColorRGBA: ...
	@staticmethod
	def HashCode(self, theStyle: XCAFPrs_Style, theUpperBound: int) -> int: ...
	def IsEqual(self, theOther: XCAFPrs_Style) -> bool: ...
	@staticmethod
	def IsEqual(self, theS1: XCAFPrs_Style, theS2: XCAFPrs_Style) -> bool: ...
	def IsSetColorCurv(self) -> bool: ...
	def IsSetColorSurf(self) -> bool: ...
	def IsVisible(self) -> bool: ...
	def SetColorCurv(self, col: Quantity_Color) -> None: ...
	def SetColorSurf(self, theColor: Quantity_Color) -> None: ...
	def SetColorSurf(self, theColor: Quantity_ColorRGBA) -> None: ...
	def SetVisibility(self, theVisibility: bool) -> None: ...
	def UnSetColorCurv(self) -> None: ...
	def UnSetColorSurf(self) -> None: ...

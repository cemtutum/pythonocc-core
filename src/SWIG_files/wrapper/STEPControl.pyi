from typing import NewType, Optional, Tuple

from OCC.Core.STEPControl import *
from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.Transfer import *
from OCC.Core.StepRepr import *
from OCC.Core.gp import *
from OCC.Core.StepGeom import *
from OCC.Core.TopoDS import *
from OCC.Core.StepShape import *
from OCC.Core.TopTools import *
from OCC.Core.XSControl import *
from OCC.Core.Interface import *
from OCC.Core.IFSelect import *
from OCC.Core.TColStd import *
from OCC.Core.StepData import *


class STEPControl_StepModelType:
	STEPControl_AsIs: int = ...
	STEPControl_ManifoldSolidBrep: int = ...
	STEPControl_BrepWithVoids: int = ...
	STEPControl_FacetedBrep: int = ...
	STEPControl_FacetedBrepAndBrepWithVoids: int = ...
	STEPControl_ShellBasedSurfaceModel: int = ...
	STEPControl_GeometricCurveSet: int = ...
	STEPControl_Hybrid: int = ...

class STEPControl_ActorRead(Transfer_ActorOfTransientProcess):
	def __init__(self) -> None: ...
	def ComputeSRRWT(self, SRR: StepRepr_RepresentationRelationship, TP: Transfer_TransientProcess, Trsf: gp_Trsf) -> bool: ...
	def ComputeTransformation(self, Origin: StepGeom_Axis2Placement3d, Target: StepGeom_Axis2Placement3d, OrigContext: StepRepr_Representation, TargContext: StepRepr_Representation, TP: Transfer_TransientProcess, Trsf: gp_Trsf) -> bool: ...
	def PrepareUnits(self, rep: StepRepr_Representation, TP: Transfer_TransientProcess) -> None: ...
	def Recognize(self, start: Standard_Transient) -> bool: ...
	def ResetUnits(self) -> None: ...
	def Transfer(self, start: Standard_Transient, TP: Transfer_TransientProcess) -> Transfer_Binder: ...
	def TransferShape(self, start: Standard_Transient, TP: Transfer_TransientProcess, isManifold: Optional[bool]) -> Transfer_Binder: ...

class STEPControl_ActorWrite(Transfer_ActorOfFinderProcess):
	def __init__(self) -> None: ...
	def GroupMode(self) -> int: ...
	def IsAssembly(self, S: TopoDS_Shape) -> bool: ...
	def Mode(self) -> STEPControl_StepModelType: ...
	def Recognize(self, start: Transfer_Finder) -> bool: ...
	def SetGroupMode(self, mode: int) -> None: ...
	def SetMode(self, M: STEPControl_StepModelType) -> None: ...
	def SetTolerance(self, Tol: float) -> None: ...
	def Transfer(self, start: Transfer_Finder, FP: Transfer_FinderProcess) -> Transfer_Binder: ...
	def TransferCompound(self, start: Transfer_Finder, SDR: StepShape_ShapeDefinitionRepresentation, FP: Transfer_FinderProcess) -> Transfer_Binder: ...
	def TransferShape(self, start: Transfer_Finder, SDR: StepShape_ShapeDefinitionRepresentation, FP: Transfer_FinderProcess, shapeGroup: Optional[TopTools_HSequenceOfShape], isManifold: Optional[bool]) -> Transfer_Binder: ...
	def TransferSubShape(self, start: Transfer_Finder, SDR: StepShape_ShapeDefinitionRepresentation, AX1: StepGeom_Axis2Placement3d, FP: Transfer_FinderProcess, shapeGroup: Optional[TopTools_HSequenceOfShape], isManifold: Optional[bool]) -> Transfer_Binder: ...

class STEPControl_Controller(XSControl_Controller):
	def __init__(self) -> None: ...
	def Customise(self, WS: XSControl_WorkSession) -> None: ...
	@staticmethod
	def Init(self) -> bool: ...
	def NewModel(self) -> Interface_InterfaceModel: ...
	def TransferWriteShape(self, shape: TopoDS_Shape, FP: Transfer_FinderProcess, model: Interface_InterfaceModel, modetrans: Optional[int]) -> IFSelect_ReturnStatus: ...

class STEPControl_Reader(XSControl_Reader):
	def __init__(self) -> None: ...
	def __init__(self, WS: XSControl_WorkSession, scratch: Optional[bool]) -> None: ...
	def FileUnits(self, theUnitLengthNames: TColStd_SequenceOfAsciiString, theUnitAngleNames: TColStd_SequenceOfAsciiString, theUnitSolidAngleNames: TColStd_SequenceOfAsciiString) -> None: ...
	def NbRootsForTransfer(self) -> int: ...
	def StepModel(self) -> StepData_StepModel: ...
	def TransferRoot(self, num: Optional[int]) -> bool: ...

class STEPControl_Writer:
	def __init__(self) -> None: ...
	def __init__(self, WS: XSControl_WorkSession, scratch: Optional[bool]) -> None: ...
	def Model(self, newone: Optional[bool]) -> StepData_StepModel: ...
	def PrintStatsTransfer(self, what: int, mode: Optional[int]) -> None: ...
	def SetTolerance(self, Tol: float) -> None: ...
	def SetWS(self, WS: XSControl_WorkSession, scratch: Optional[bool]) -> None: ...
	def Transfer(self, sh: TopoDS_Shape, mode: STEPControl_StepModelType, compgraph: Optional[bool]) -> IFSelect_ReturnStatus: ...
	def UnsetTolerance(self) -> None: ...
	def WS(self) -> XSControl_WorkSession: ...
	def Write(self, filename: str) -> IFSelect_ReturnStatus: ...

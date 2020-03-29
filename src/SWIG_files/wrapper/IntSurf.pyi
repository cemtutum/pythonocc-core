from typing import NewType, Optional, Tuple

from OCC.Core.IntSurf import *
from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.gp import *
from OCC.Core.Adaptor3d import *
from OCC.Core.GeomAbs import *


class IntSurf_Situation:
	IntSurf_Inside: int = ...
	IntSurf_Outside: int = ...
	IntSurf_Unknown: int = ...

class IntSurf_TypeTrans:
	IntSurf_In: int = ...
	IntSurf_Out: int = ...
	IntSurf_Touch: int = ...
	IntSurf_Undecided: int = ...

class IntSurf:
	@staticmethod
	def MakeTransition(self, TgFirst: gp_Vec, TgSecond: gp_Vec, Normal: gp_Dir, TFirst: IntSurf_Transition, TSecond: IntSurf_Transition) -> None: ...
	@staticmethod
	def SetPeriod(self, theFirstSurf: Adaptor3d_HSurface, theSecondSurf: Adaptor3d_HSurface, theArrOfPeriod_list: List[float]) -> None: ...

class IntSurf_Couple:
	def __init__(self) -> None: ...
	def __init__(self, Index1: int, Index2: int) -> None: ...
	def First(self) -> int: ...
	def Second(self) -> int: ...

class IntSurf_InteriorPoint:
	def __init__(self) -> None: ...
	def __init__(self, P: gp_Pnt, U: float, V: float, Direc: gp_Vec, Direc2d: gp_Vec2d) -> None: ...
	def Direction(self) -> gp_Vec: ...
	def Direction2d(self) -> gp_Vec2d: ...
	def Parameters(self) -> Tuple[float, float]: ...
	def SetValue(self, P: gp_Pnt, U: float, V: float, Direc: gp_Vec, Direc2d: gp_Vec2d) -> None: ...
	def UParameter(self) -> float: ...
	def VParameter(self) -> float: ...
	def Value(self) -> gp_Pnt: ...

class IntSurf_InteriorPointTool:
	@staticmethod
	def Direction2d(self, PStart: IntSurf_InteriorPoint) -> gp_Dir2d: ...
	@staticmethod
	def Direction3d(self, PStart: IntSurf_InteriorPoint) -> gp_Vec: ...
	@staticmethod
	def Value2d(self, PStart: IntSurf_InteriorPoint) -> Tuple[float, float]: ...
	@staticmethod
	def Value3d(self, PStart: IntSurf_InteriorPoint) -> gp_Pnt: ...

class IntSurf_LineOn2S(Standard_Transient):
	def __init__(self, theAllocator: Optional[IntSurf_Allocator]) -> None: ...
	def Add(self, P: IntSurf_PntOn2S) -> None: ...
	def Clear(self) -> None: ...
	def InsertBefore(self, I: int, P: IntSurf_PntOn2S) -> None: ...
	def IsOutBox(self, theP: gp_Pnt) -> bool: ...
	def IsOutSurf1Box(self, theP: gp_Pnt2d) -> bool: ...
	def IsOutSurf2Box(self, theP: gp_Pnt2d) -> bool: ...
	def NbPoints(self) -> int: ...
	def RemovePoint(self, I: int) -> None: ...
	def Reverse(self) -> None: ...
	def SetUV(self, Index: int, OnFirst: bool, U: float, V: float) -> None: ...
	def Split(self, Index: int) -> IntSurf_LineOn2S: ...
	def Value(self, Index: int) -> IntSurf_PntOn2S: ...
	def Value(self, Index: int, P: IntSurf_PntOn2S) -> None: ...

class IntSurf_PathPoint:
	def __init__(self) -> None: ...
	def __init__(self, P: gp_Pnt, U: float, V: float) -> None: ...
	def AddUV(self, U: float, V: float) -> None: ...
	def Direction2d(self) -> gp_Dir2d: ...
	def Direction3d(self) -> gp_Vec: ...
	def IsPassingPnt(self) -> bool: ...
	def IsTangent(self) -> bool: ...
	def Multiplicity(self) -> int: ...
	def Parameters(self, Index: int) -> Tuple[float, float]: ...
	def SetDirections(self, V: gp_Vec, D: gp_Dir2d) -> None: ...
	def SetPassing(self, Pass: bool) -> None: ...
	def SetTangency(self, Tang: bool) -> None: ...
	def SetValue(self, P: gp_Pnt, U: float, V: float) -> None: ...
	def Value(self) -> gp_Pnt: ...
	def Value2d(self) -> Tuple[float, float]: ...

class IntSurf_PathPointTool:
	@staticmethod
	def Direction2d(self, PStart: IntSurf_PathPoint) -> gp_Dir2d: ...
	@staticmethod
	def Direction3d(self, PStart: IntSurf_PathPoint) -> gp_Vec: ...
	@staticmethod
	def IsPassingPnt(self, PStart: IntSurf_PathPoint) -> bool: ...
	@staticmethod
	def IsTangent(self, PStart: IntSurf_PathPoint) -> bool: ...
	@staticmethod
	def Multiplicity(self, PStart: IntSurf_PathPoint) -> int: ...
	@staticmethod
	def Parameters(self, PStart: IntSurf_PathPoint, Mult: int) -> Tuple[float, float]: ...
	@staticmethod
	def Value2d(self, PStart: IntSurf_PathPoint) -> Tuple[float, float]: ...
	@staticmethod
	def Value3d(self, PStart: IntSurf_PathPoint) -> gp_Pnt: ...

class IntSurf_PntOn2S:
	def __init__(self) -> None: ...
	def IsSame(self, theOtherPoint: IntSurf_PntOn2S, theTol3D: Optional[float], theTol2D: Optional[float]) -> bool: ...
	def Parameters(self) -> Tuple[float, float, float, float]: ...
	def ParametersOnS1(self) -> Tuple[float, float]: ...
	def ParametersOnS2(self) -> Tuple[float, float]: ...
	def ParametersOnSurface(self, OnFirst: bool) -> Tuple[float, float]: ...
	def SetValue(self, Pt: gp_Pnt) -> None: ...
	def SetValue(self, Pt: gp_Pnt, OnFirst: bool, U: float, V: float) -> None: ...
	def SetValue(self, Pt: gp_Pnt, U1: float, V1: float, U2: float, V2: float) -> None: ...
	def SetValue(self, OnFirst: bool, U: float, V: float) -> None: ...
	def SetValue(self, U1: float, V1: float, U2: float, V2: float) -> None: ...
	def Value(self) -> gp_Pnt: ...
	def ValueOnSurface(self, OnFirst: bool) -> gp_Pnt2d: ...

class IntSurf_Quadric:
	def __init__(self) -> None: ...
	def __init__(self, P: gp_Pln) -> None: ...
	def __init__(self, C: gp_Cylinder) -> None: ...
	def __init__(self, S: gp_Sphere) -> None: ...
	def __init__(self, C: gp_Cone) -> None: ...
	def __init__(self, T: gp_Torus) -> None: ...
	def Cone(self) -> gp_Cone: ...
	def Cylinder(self) -> gp_Cylinder: ...
	def D1(self, U: float, V: float, P: gp_Pnt, D1U: gp_Vec, D1V: gp_Vec) -> None: ...
	def DN(self, U: float, V: float, Nu: int, Nv: int) -> gp_Vec: ...
	def Distance(self, P: gp_Pnt) -> float: ...
	def Gradient(self, P: gp_Pnt) -> gp_Vec: ...
	def Normale(self, U: float, V: float) -> gp_Vec: ...
	def Normale(self, P: gp_Pnt) -> gp_Vec: ...
	def Parameters(self, P: gp_Pnt) -> Tuple[float, float]: ...
	def Plane(self) -> gp_Pln: ...
	def SetValue(self, P: gp_Pln) -> None: ...
	def SetValue(self, C: gp_Cylinder) -> None: ...
	def SetValue(self, S: gp_Sphere) -> None: ...
	def SetValue(self, C: gp_Cone) -> None: ...
	def SetValue(self, T: gp_Torus) -> None: ...
	def Sphere(self) -> gp_Sphere: ...
	def Torus(self) -> gp_Torus: ...
	def TypeQuadric(self) -> GeomAbs_SurfaceType: ...
	def ValAndGrad(self, P: gp_Pnt, Grad: gp_Vec) -> float: ...
	def Value(self, U: float, V: float) -> gp_Pnt: ...

class IntSurf_QuadricTool:
	@staticmethod
	def Gradient(self, Quad: IntSurf_Quadric, X: float, Y: float, Z: float, V: gp_Vec) -> None: ...
	@staticmethod
	def Tolerance(self, Quad: IntSurf_Quadric) -> float: ...
	@staticmethod
	def Value(self, Quad: IntSurf_Quadric, X: float, Y: float, Z: float) -> float: ...
	@staticmethod
	def ValueAndGradient(self, Quad: IntSurf_Quadric, X: float, Y: float, Z: float, Grad: gp_Vec) -> float: ...

class IntSurf_Transition:
	def __init__(self) -> None: ...
	def __init__(self, Tangent: bool, Type: IntSurf_TypeTrans) -> None: ...
	def __init__(self, Tangent: bool, Situ: IntSurf_Situation, Oppos: bool) -> None: ...
	def IsOpposite(self) -> bool: ...
	def IsTangent(self) -> bool: ...
	def SetValue(self, Tangent: bool, Type: IntSurf_TypeTrans) -> None: ...
	def SetValue(self, Tangent: bool, Situ: IntSurf_Situation, Oppos: bool) -> None: ...
	def SetValue(self) -> None: ...
	def Situation(self) -> IntSurf_Situation: ...
	def TransitionType(self) -> IntSurf_TypeTrans: ...

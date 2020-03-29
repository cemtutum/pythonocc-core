from typing import NewType, Optional, Tuple

from OCC.Core.Geom2dInt import *
from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.Adaptor2d import *
from OCC.Core.IntRes2d import *
from OCC.Core.gp import *
from OCC.Core.TColStd import *
from OCC.Core.GeomAbs import *
from OCC.Core.math import *
from OCC.Core.IntCurve import *
from OCC.Core.Extrema import *
from OCC.Core.Intf import *
from OCC.Core.Bnd import *


class Geom2dInt_ExactIntersectionPointOfTheIntPCurvePCurveOfGInter:
	def __init__(self, C1: Adaptor2d_Curve2d, C2: Adaptor2d_Curve2d, Tol: float) -> None: ...
	def AnErrorOccurred(self) -> bool: ...
	def NbRoots(self) -> int: ...
	def Perform(self, Poly1: Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter, Poly2: Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter) -> Tuple[int, int, float, float]: ...
	def Perform(self, Uo: float, Vo: float, UInf: float, VInf: float, USup: float, VSup: float) -> None: ...
	def Roots(self) -> Tuple[float, float]: ...

class Geom2dInt_GInter(IntRes2d_Intersection):
	def __init__(self) -> None: ...
	def __init__(self, C: Adaptor2d_Curve2d, TolConf: float, Tol: float) -> None: ...
	def __init__(self, C: Adaptor2d_Curve2d, D: IntRes2d_Domain, TolConf: float, Tol: float) -> None: ...
	def __init__(self, C1: Adaptor2d_Curve2d, C2: Adaptor2d_Curve2d, TolConf: float, Tol: float) -> None: ...
	def __init__(self, C1: Adaptor2d_Curve2d, D1: IntRes2d_Domain, C2: Adaptor2d_Curve2d, TolConf: float, Tol: float) -> None: ...
	def __init__(self, C1: Adaptor2d_Curve2d, C2: Adaptor2d_Curve2d, D2: IntRes2d_Domain, TolConf: float, Tol: float) -> None: ...
	def __init__(self, C1: Adaptor2d_Curve2d, D1: IntRes2d_Domain, C2: Adaptor2d_Curve2d, D2: IntRes2d_Domain, TolConf: float, Tol: float) -> None: ...
	def ComputeDomain(self, C1: Adaptor2d_Curve2d, TolDomain: float) -> IntRes2d_Domain: ...
	def GetMinNbSamples(self) -> int: ...
	def Perform(self, C1: Adaptor2d_Curve2d, D1: IntRes2d_Domain, C2: Adaptor2d_Curve2d, D2: IntRes2d_Domain, TolConf: float, Tol: float) -> None: ...
	def Perform(self, C1: Adaptor2d_Curve2d, C2: Adaptor2d_Curve2d, TolConf: float, Tol: float) -> None: ...
	def Perform(self, C1: Adaptor2d_Curve2d, D1: IntRes2d_Domain, TolConf: float, Tol: float) -> None: ...
	def Perform(self, C1: Adaptor2d_Curve2d, TolConf: float, Tol: float) -> None: ...
	def Perform(self, C1: Adaptor2d_Curve2d, D1: IntRes2d_Domain, C2: Adaptor2d_Curve2d, TolConf: float, Tol: float) -> None: ...
	def Perform(self, C1: Adaptor2d_Curve2d, C2: Adaptor2d_Curve2d, D2: IntRes2d_Domain, TolConf: float, Tol: float) -> None: ...
	def SetMinNbSamples(self, theMinNbSamples: int) -> None: ...

class Geom2dInt_Geom2dCurveTool:
	@staticmethod
	def Circle(self, C: Adaptor2d_Curve2d) -> gp_Circ2d: ...
	@staticmethod
	def D0(self, C: Adaptor2d_Curve2d, U: float, P: gp_Pnt2d) -> None: ...
	@staticmethod
	def D1(self, C: Adaptor2d_Curve2d, U: float, P: gp_Pnt2d, T: gp_Vec2d) -> None: ...
	@staticmethod
	def D2(self, C: Adaptor2d_Curve2d, U: float, P: gp_Pnt2d, T: gp_Vec2d, N: gp_Vec2d) -> None: ...
	@staticmethod
	def D3(self, C: Adaptor2d_Curve2d, U: float, P: gp_Pnt2d, T: gp_Vec2d, N: gp_Vec2d, V: gp_Vec2d) -> None: ...
	@staticmethod
	def DN(self, C: Adaptor2d_Curve2d, U: float, N: int) -> gp_Vec2d: ...
	@staticmethod
	def Degree(self, C: Adaptor2d_Curve2d) -> int: ...
	@staticmethod
	def Ellipse(self, C: Adaptor2d_Curve2d) -> gp_Elips2d: ...
	@staticmethod
	def EpsX(self, C: Adaptor2d_Curve2d) -> float: ...
	@staticmethod
	def EpsX(self, C: Adaptor2d_Curve2d, Eps_XYZ: float) -> float: ...
	@staticmethod
	def FirstParameter(self, C: Adaptor2d_Curve2d) -> float: ...
	@staticmethod
	def GetInterval(self, C: Adaptor2d_Curve2d, Index: int, Tab: TColStd_Array1OfReal) -> Tuple[float, float]: ...
	@staticmethod
	def GetType(self, C: Adaptor2d_Curve2d) -> GeomAbs_CurveType: ...
	@staticmethod
	def Hyperbola(self, C: Adaptor2d_Curve2d) -> gp_Hypr2d: ...
	@staticmethod
	def Intervals(self, C: Adaptor2d_Curve2d, Tab: TColStd_Array1OfReal) -> None: ...
	@staticmethod
	def LastParameter(self, C: Adaptor2d_Curve2d) -> float: ...
	@staticmethod
	def Line(self, C: Adaptor2d_Curve2d) -> gp_Lin2d: ...
	@staticmethod
	def NbIntervals(self, C: Adaptor2d_Curve2d) -> int: ...
	@staticmethod
	def NbSamples(self, C: Adaptor2d_Curve2d) -> int: ...
	@staticmethod
	def NbSamples(self, C: Adaptor2d_Curve2d, U0: float, U1: float) -> int: ...
	@staticmethod
	def Parabola(self, C: Adaptor2d_Curve2d) -> gp_Parab2d: ...
	@staticmethod
	def Value(self, C: Adaptor2d_Curve2d, X: float) -> gp_Pnt2d: ...

class Geom2dInt_IntConicCurveOfGInter(IntRes2d_Intersection):
	def __init__(self) -> None: ...
	def __init__(self, L: gp_Lin2d, D1: IntRes2d_Domain, PCurve: Adaptor2d_Curve2d, D2: IntRes2d_Domain, TolConf: float, Tol: float) -> None: ...
	def __init__(self, C: gp_Circ2d, D1: IntRes2d_Domain, PCurve: Adaptor2d_Curve2d, D2: IntRes2d_Domain, TolConf: float, Tol: float) -> None: ...
	def __init__(self, E: gp_Elips2d, D1: IntRes2d_Domain, PCurve: Adaptor2d_Curve2d, D2: IntRes2d_Domain, TolConf: float, Tol: float) -> None: ...
	def __init__(self, Prb: gp_Parab2d, D1: IntRes2d_Domain, PCurve: Adaptor2d_Curve2d, D2: IntRes2d_Domain, TolConf: float, Tol: float) -> None: ...
	def __init__(self, H: gp_Hypr2d, D1: IntRes2d_Domain, PCurve: Adaptor2d_Curve2d, D2: IntRes2d_Domain, TolConf: float, Tol: float) -> None: ...
	def Perform(self, L: gp_Lin2d, D1: IntRes2d_Domain, PCurve: Adaptor2d_Curve2d, D2: IntRes2d_Domain, TolConf: float, Tol: float) -> None: ...
	def Perform(self, C: gp_Circ2d, D1: IntRes2d_Domain, PCurve: Adaptor2d_Curve2d, D2: IntRes2d_Domain, TolConf: float, Tol: float) -> None: ...
	def Perform(self, E: gp_Elips2d, D1: IntRes2d_Domain, PCurve: Adaptor2d_Curve2d, D2: IntRes2d_Domain, TolConf: float, Tol: float) -> None: ...
	def Perform(self, Prb: gp_Parab2d, D1: IntRes2d_Domain, PCurve: Adaptor2d_Curve2d, D2: IntRes2d_Domain, TolConf: float, Tol: float) -> None: ...
	def Perform(self, H: gp_Hypr2d, D1: IntRes2d_Domain, PCurve: Adaptor2d_Curve2d, D2: IntRes2d_Domain, TolConf: float, Tol: float) -> None: ...

class Geom2dInt_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfGInter(math_FunctionWithDerivative):
	def __init__(self, IT: IntCurve_IConicTool, PC: Adaptor2d_Curve2d) -> None: ...
	def Derivative(self, Param: float) -> Tuple[bool, float]: ...
	def Value(self, Param: float) -> Tuple[bool, float]: ...
	def Values(self, Param: float) -> Tuple[bool, float, float]: ...

class Geom2dInt_PCLocFOfTheLocateExtPCOfTheProjPCurOfGInter(math_FunctionWithDerivative):
	def __init__(self) -> None: ...
	def __init__(self, P: gp_Pnt2d, C: Adaptor2d_Curve2d) -> None: ...
	def Derivative(self, U: float) -> Tuple[bool, float]: ...
	def GetStateNumber(self) -> int: ...
	def Initialize(self, C: Adaptor2d_Curve2d) -> None: ...
	def IsMin(self, N: int) -> bool: ...
	def NbExt(self) -> int: ...
	def Point(self, N: int) -> Extrema_POnCurv2d: ...
	def SearchOfTolerance(self) -> float: ...
	def SetPoint(self, P: gp_Pnt2d) -> None: ...
	def SquareDistance(self, N: int) -> float: ...
	def SubIntervalInitialize(self, theUfirst: float, theUlast: float) -> None: ...
	def Value(self, U: float) -> Tuple[bool, float]: ...
	def Values(self, U: float) -> Tuple[bool, float, float]: ...

class Geom2dInt_TheCurveLocatorOfTheProjPCurOfGInter:
	pass

class Geom2dInt_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfGInter(math_FunctionSetWithDerivatives):
	def __init__(self, curve1: Adaptor2d_Curve2d, curve2: Adaptor2d_Curve2d) -> None: ...
	def Derivatives(self, X: math_Vector, D: math_Matrix) -> bool: ...
	def NbEquations(self) -> int: ...
	def NbVariables(self) -> int: ...
	def Value(self, X: math_Vector, F: math_Vector) -> bool: ...
	def Values(self, X: math_Vector, F: math_Vector, D: math_Matrix) -> bool: ...

class Geom2dInt_TheIntConicCurveOfGInter(IntRes2d_Intersection):
	def __init__(self) -> None: ...
	def __init__(self, L: gp_Lin2d, D1: IntRes2d_Domain, PCurve: Adaptor2d_Curve2d, D2: IntRes2d_Domain, TolConf: float, Tol: float) -> None: ...
	def __init__(self, C: gp_Circ2d, D1: IntRes2d_Domain, PCurve: Adaptor2d_Curve2d, D2: IntRes2d_Domain, TolConf: float, Tol: float) -> None: ...
	def __init__(self, E: gp_Elips2d, D1: IntRes2d_Domain, PCurve: Adaptor2d_Curve2d, D2: IntRes2d_Domain, TolConf: float, Tol: float) -> None: ...
	def __init__(self, Prb: gp_Parab2d, D1: IntRes2d_Domain, PCurve: Adaptor2d_Curve2d, D2: IntRes2d_Domain, TolConf: float, Tol: float) -> None: ...
	def __init__(self, H: gp_Hypr2d, D1: IntRes2d_Domain, PCurve: Adaptor2d_Curve2d, D2: IntRes2d_Domain, TolConf: float, Tol: float) -> None: ...
	def Perform(self, L: gp_Lin2d, D1: IntRes2d_Domain, PCurve: Adaptor2d_Curve2d, D2: IntRes2d_Domain, TolConf: float, Tol: float) -> None: ...
	def Perform(self, C: gp_Circ2d, D1: IntRes2d_Domain, PCurve: Adaptor2d_Curve2d, D2: IntRes2d_Domain, TolConf: float, Tol: float) -> None: ...
	def Perform(self, E: gp_Elips2d, D1: IntRes2d_Domain, PCurve: Adaptor2d_Curve2d, D2: IntRes2d_Domain, TolConf: float, Tol: float) -> None: ...
	def Perform(self, Prb: gp_Parab2d, D1: IntRes2d_Domain, PCurve: Adaptor2d_Curve2d, D2: IntRes2d_Domain, TolConf: float, Tol: float) -> None: ...
	def Perform(self, H: gp_Hypr2d, D1: IntRes2d_Domain, PCurve: Adaptor2d_Curve2d, D2: IntRes2d_Domain, TolConf: float, Tol: float) -> None: ...

class Geom2dInt_TheIntPCurvePCurveOfGInter(IntRes2d_Intersection):
	def __init__(self) -> None: ...
	def GetMinNbSamples(self) -> int: ...
	def Perform(self, Curve1: Adaptor2d_Curve2d, Domain1: IntRes2d_Domain, Curve2: Adaptor2d_Curve2d, Domain2: IntRes2d_Domain, TolConf: float, Tol: float) -> None: ...
	def Perform(self, Curve1: Adaptor2d_Curve2d, Domain1: IntRes2d_Domain, TolConf: float, Tol: float) -> None: ...
	def SetMinNbSamples(self, theMinNbSamples: int) -> None: ...

class Geom2dInt_TheIntersectorOfTheIntConicCurveOfGInter(IntRes2d_Intersection):
	def __init__(self) -> None: ...
	def __init__(self, ITool: IntCurve_IConicTool, Dom1: IntRes2d_Domain, PCurve: Adaptor2d_Curve2d, Dom2: IntRes2d_Domain, TolConf: float, Tol: float) -> None: ...
	def And_Domaine_Objet1_Intersections(self, TheImpTool: IntCurve_IConicTool, TheParCurve: Adaptor2d_Curve2d, TheImpCurveDomain: IntRes2d_Domain, TheParCurveDomain: IntRes2d_Domain, Inter2_And_Domain2: TColStd_Array1OfReal, Inter1: TColStd_Array1OfReal, Resultat1: TColStd_Array1OfReal, Resultat2: TColStd_Array1OfReal, EpsNul: float) -> int: ...
	def FindU(self, parameter: float, point: gp_Pnt2d, TheParCurev: Adaptor2d_Curve2d, TheImpTool: IntCurve_IConicTool) -> float: ...
	def FindV(self, parameter: float, point: gp_Pnt2d, TheImpTool: IntCurve_IConicTool, ParCurve: Adaptor2d_Curve2d, TheParCurveDomain: IntRes2d_Domain, V0: float, V1: float, Tolerance: float) -> float: ...
	def Perform(self, ITool: IntCurve_IConicTool, Dom1: IntRes2d_Domain, PCurve: Adaptor2d_Curve2d, Dom2: IntRes2d_Domain, TolConf: float, Tol: float) -> None: ...

class Geom2dInt_TheLocateExtPCOfTheProjPCurOfGInter:
	def __init__(self) -> None: ...
	def __init__(self, P: gp_Pnt2d, C: Adaptor2d_Curve2d, U0: float, TolU: float) -> None: ...
	def __init__(self, P: gp_Pnt2d, C: Adaptor2d_Curve2d, U0: float, Umin: float, Usup: float, TolU: float) -> None: ...
	def Initialize(self, C: Adaptor2d_Curve2d, Umin: float, Usup: float, TolU: float) -> None: ...
	def IsDone(self) -> bool: ...
	def IsMin(self) -> bool: ...
	def Perform(self, P: gp_Pnt2d, U0: float) -> None: ...
	def Point(self) -> Extrema_POnCurv2d: ...
	def SquareDistance(self) -> float: ...

class Geom2dInt_ThePolygon2dOfTheIntPCurvePCurveOfGInter(Intf_Polygon2d):
	def __init__(self, Curve: Adaptor2d_Curve2d, NbPnt: int, Domain: IntRes2d_Domain, Tol: float) -> None: ...
	def ApproxParamOnCurve(self, Index: int, ParamOnLine: float) -> float: ...
	def AutoIntersectionIsPossible(self) -> bool: ...
	def CalculRegion(self, x: float, y: float, x1: float, x2: float, y1: float, y2: float) -> int: ...
	def Closed(self, clos: bool) -> None: ...
	def Closed(self) -> bool: ...
	def ComputeWithBox(self, Curve: Adaptor2d_Curve2d, OtherBox: Bnd_Box2d) -> None: ...
	def DeflectionOverEstimation(self) -> float: ...
	def Dump(self) -> None: ...
	def InfParameter(self) -> float: ...
	def NbSegments(self) -> int: ...
	def Segment(self, theIndex: int, theBegin: gp_Pnt2d, theEnd: gp_Pnt2d) -> None: ...
	def SetDeflectionOverEstimation(self, x: float) -> None: ...
	def SupParameter(self) -> float: ...

class Geom2dInt_TheProjPCurOfGInter:
	@staticmethod
	def FindParameter(self, C: Adaptor2d_Curve2d, Pnt: gp_Pnt2d, Tol: float) -> float: ...
	@staticmethod
	def FindParameter(self, C: Adaptor2d_Curve2d, Pnt: gp_Pnt2d, LowParameter: float, HighParameter: float, Tol: float) -> float: ...

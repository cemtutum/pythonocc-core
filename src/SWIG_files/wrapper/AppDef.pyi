from typing import NewType, Optional

from OCC.Core.AppDef import *
from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.math import *
from OCC.Core.AppParCurves import *
from OCC.Core.TColStd import *
from OCC.Core.Approx import *
from OCC.Core.TColgp import *
from OCC.Core.gp import *
from OCC.Core.FEmTool import *
from OCC.Core.GeomAbs import *


class AppDef_BSpGradient_BFGSOfMyBSplGradientOfBSplineCompute(math_BFGS):
	def __init__(self, F: math_MultipleVarFunctionWithGradient, StartingPoint: math_Vector, Tolerance3d: float, Tolerance2d: float, Eps: float, NbIterations: Optional[int]) -> None: ...
	def IsSolutionReached(self, F: math_MultipleVarFunctionWithGradient) -> bool: ...

class AppDef_BSpParFunctionOfMyBSplGradientOfBSplineCompute(math_MultipleVarFunctionWithGradient):
	def __init__(self, SSP: AppDef_MultiLine, FirstPoint: int, LastPoint: int, TheConstraints: AppParCurves_HArray1OfConstraintCouple, Parameters: math_Vector, Knots: TColStd_Array1OfReal, Mults: TColStd_Array1OfInteger, NbPol: int) -> None: ...
	def CurveValue(self) -> AppParCurves_MultiBSpCurve: ...
	def DerivativeFunctionMatrix(self) -> math_Matrix: ...
	def Error(self, IPoint: int, CurveIndex: int) -> float: ...
	def FirstConstraint(self, TheConstraints: AppParCurves_HArray1OfConstraintCouple, FirstPoint: int) -> AppParCurves_Constraint: ...
	def FunctionMatrix(self) -> math_Matrix: ...
	def Gradient(self, X: math_Vector, G: math_Vector) -> bool: ...
	def Index(self) -> math_IntegerVector: ...
	def LastConstraint(self, TheConstraints: AppParCurves_HArray1OfConstraintCouple, LastPoint: int) -> AppParCurves_Constraint: ...
	def MaxError2d(self) -> float: ...
	def MaxError3d(self) -> float: ...
	def NbVariables(self) -> int: ...
	def NewParameters(self) -> math_Vector: ...
	def SetFirstLambda(self, l1: float) -> None: ...
	def SetLastLambda(self, l2: float) -> None: ...
	def Value(self, X: math_Vector, F: float) -> bool: ...
	def Values(self, X: math_Vector, F: float, G: math_Vector) -> bool: ...

class AppDef_BSpParLeastSquareOfMyBSplGradientOfBSplineCompute:
	def __init__(self, SSP: AppDef_MultiLine, FirstPoint: int, LastPoint: int, FirstCons: AppParCurves_Constraint, LastCons: AppParCurves_Constraint, Parameters: math_Vector, NbPol: int) -> None: ...
	def __init__(self, SSP: AppDef_MultiLine, FirstPoint: int, LastPoint: int, FirstCons: AppParCurves_Constraint, LastCons: AppParCurves_Constraint, NbPol: int) -> None: ...
	def __init__(self, SSP: AppDef_MultiLine, Knots: TColStd_Array1OfReal, Mults: TColStd_Array1OfInteger, FirstPoint: int, LastPoint: int, FirstCons: AppParCurves_Constraint, LastCons: AppParCurves_Constraint, Parameters: math_Vector, NbPol: int) -> None: ...
	def __init__(self, SSP: AppDef_MultiLine, Knots: TColStd_Array1OfReal, Mults: TColStd_Array1OfInteger, FirstPoint: int, LastPoint: int, FirstCons: AppParCurves_Constraint, LastCons: AppParCurves_Constraint, NbPol: int) -> None: ...
	def BSplineValue(self) -> AppParCurves_MultiBSpCurve: ...
	def BezierValue(self) -> AppParCurves_MultiCurve: ...
	def DerivativeFunctionMatrix(self) -> math_Matrix: ...
	def Distance(self) -> math_Matrix: ...
	def Error(self, F: float, MaxE3d: float, MaxE2d: float) -> None: ...
	def ErrorGradient(self, Grad: math_Vector, F: float, MaxE3d: float, MaxE2d: float) -> None: ...
	def FirstLambda(self) -> float: ...
	def FunctionMatrix(self) -> math_Matrix: ...
	def IsDone(self) -> bool: ...
	def KIndex(self) -> math_IntegerVector: ...
	def LastLambda(self) -> float: ...
	def Perform(self, Parameters: math_Vector) -> None: ...
	def Perform(self, Parameters: math_Vector, l1: float, l2: float) -> None: ...
	def Perform(self, Parameters: math_Vector, V1t: math_Vector, V2t: math_Vector, l1: float, l2: float) -> None: ...
	def Perform(self, Parameters: math_Vector, V1t: math_Vector, V2t: math_Vector, V1c: math_Vector, V2c: math_Vector, l1: float, l2: float) -> None: ...
	def Points(self) -> math_Matrix: ...
	def Poles(self) -> math_Matrix: ...

class AppDef_BSplineCompute:
	def __init__(self, Line: AppDef_MultiLine, degreemin: Optional[int], degreemax: Optional[int], Tolerance3d: Optional[float], Tolerance2d: Optional[float], NbIterations: Optional[int], cutting: Optional[bool], parametrization: Optional[Approx_ParametrizationType], Squares: Optional[bool]) -> None: ...
	def __init__(self, Line: AppDef_MultiLine, Parameters: math_Vector, degreemin: Optional[int], degreemax: Optional[int], Tolerance3d: Optional[float], Tolerance2d: Optional[float], NbIterations: Optional[int], cutting: Optional[bool], Squares: Optional[bool]) -> None: ...
	def __init__(self, Parameters: math_Vector, degreemin: Optional[int], degreemax: Optional[int], Tolerance3d: Optional[float], Tolerance2d: Optional[float], NbIterations: Optional[int], cutting: Optional[bool], Squares: Optional[bool]) -> None: ...
	def __init__(self, degreemin: Optional[int], degreemax: Optional[int], Tolerance3d: Optional[float], Tolerance2d: Optional[float], NbIterations: Optional[int], cutting: Optional[bool], parametrization: Optional[Approx_ParametrizationType], Squares: Optional[bool]) -> None: ...
	def ChangeValue(self) -> AppParCurves_MultiBSpCurve: ...
	def Error(self, tol3d: float, tol2d: float) -> None: ...
	def Init(self, degreemin: Optional[int], degreemax: Optional[int], Tolerance3d: Optional[float], Tolerance2d: Optional[float], NbIterations: Optional[int], cutting: Optional[bool], parametrization: Optional[Approx_ParametrizationType], Squares: Optional[bool]) -> None: ...
	def Interpol(self, Line: AppDef_MultiLine) -> None: ...
	def IsAllApproximated(self) -> bool: ...
	def IsToleranceReached(self) -> bool: ...
	def Parameters(self) -> TColStd_Array1OfReal: ...
	def Perform(self, Line: AppDef_MultiLine) -> None: ...
	def SetConstraints(self, firstC: AppParCurves_Constraint, lastC: AppParCurves_Constraint) -> None: ...
	def SetContinuity(self, C: int) -> None: ...
	def SetDegrees(self, degreemin: int, degreemax: int) -> None: ...
	def SetKnots(self, Knots: TColStd_Array1OfReal) -> None: ...
	def SetKnotsAndMultiplicities(self, Knots: TColStd_Array1OfReal, Mults: TColStd_Array1OfInteger) -> None: ...
	def SetParameters(self, ThePar: math_Vector) -> None: ...
	def SetPeriodic(self, thePeriodic: bool) -> None: ...
	def SetTolerances(self, Tolerance3d: float, Tolerance2d: float) -> None: ...
	def Value(self) -> AppParCurves_MultiBSpCurve: ...

class AppDef_Compute:
	def __init__(self, Line: AppDef_MultiLine, degreemin: Optional[int], degreemax: Optional[int], Tolerance3d: Optional[float], Tolerance2d: Optional[float], NbIterations: Optional[int], cutting: Optional[bool], parametrization: Optional[Approx_ParametrizationType], Squares: Optional[bool]) -> None: ...
	def __init__(self, Line: AppDef_MultiLine, Parameters: math_Vector, degreemin: Optional[int], degreemax: Optional[int], Tolerance3d: Optional[float], Tolerance2d: Optional[float], NbIterations: Optional[int], cutting: Optional[bool], Squares: Optional[bool]) -> None: ...
	def __init__(self, Parameters: math_Vector, degreemin: Optional[int], degreemax: Optional[int], Tolerance3d: Optional[float], Tolerance2d: Optional[float], NbIterations: Optional[int], cutting: Optional[bool], Squares: Optional[bool]) -> None: ...
	def __init__(self, degreemin: Optional[int], degreemax: Optional[int], Tolerance3d: Optional[float], Tolerance2d: Optional[float], NbIterations: Optional[int], cutting: Optional[bool], parametrization: Optional[Approx_ParametrizationType], Squares: Optional[bool]) -> None: ...
	def ChangeValue(self, Index: Optional[int]) -> AppParCurves_MultiCurve: ...
	def Error(self, Index: int, tol3d: float, tol2d: float) -> None: ...
	def Init(self, degreemin: Optional[int], degreemax: Optional[int], Tolerance3d: Optional[float], Tolerance2d: Optional[float], NbIterations: Optional[int], cutting: Optional[bool], parametrization: Optional[Approx_ParametrizationType], Squares: Optional[bool]) -> None: ...
	def IsAllApproximated(self) -> bool: ...
	def IsToleranceReached(self) -> bool: ...
	def NbMultiCurves(self) -> int: ...
	def Parameters(self, Index: Optional[int]) -> TColStd_Array1OfReal: ...
	def Parametrization(self) -> Approx_ParametrizationType: ...
	def Perform(self, Line: AppDef_MultiLine) -> None: ...
	def SetConstraints(self, firstC: AppParCurves_Constraint, lastC: AppParCurves_Constraint) -> None: ...
	def SetDegrees(self, degreemin: int, degreemax: int) -> None: ...
	def SetTolerances(self, Tolerance3d: float, Tolerance2d: float) -> None: ...
	def SplineValue(self) -> AppParCurves_MultiBSpCurve: ...
	def Value(self, Index: Optional[int]) -> AppParCurves_MultiCurve: ...

class AppDef_Gradient_BFGSOfMyGradientOfCompute(math_BFGS):
	def __init__(self, F: math_MultipleVarFunctionWithGradient, StartingPoint: math_Vector, Tolerance3d: float, Tolerance2d: float, Eps: float, NbIterations: Optional[int]) -> None: ...
	def IsSolutionReached(self, F: math_MultipleVarFunctionWithGradient) -> bool: ...

class AppDef_Gradient_BFGSOfMyGradientbisOfBSplineCompute(math_BFGS):
	def __init__(self, F: math_MultipleVarFunctionWithGradient, StartingPoint: math_Vector, Tolerance3d: float, Tolerance2d: float, Eps: float, NbIterations: Optional[int]) -> None: ...
	def IsSolutionReached(self, F: math_MultipleVarFunctionWithGradient) -> bool: ...

class AppDef_Gradient_BFGSOfTheGradient(math_BFGS):
	def __init__(self, F: math_MultipleVarFunctionWithGradient, StartingPoint: math_Vector, Tolerance3d: float, Tolerance2d: float, Eps: float, NbIterations: Optional[int]) -> None: ...
	def IsSolutionReached(self, F: math_MultipleVarFunctionWithGradient) -> bool: ...

class AppDef_MultiLine:
	def __init__(self) -> None: ...
	def __init__(self, NbMult: int) -> None: ...
	def __init__(self, tabMultiP: AppDef_Array1OfMultiPointConstraint) -> None: ...
	def __init__(self, tabP3d: TColgp_Array1OfPnt) -> None: ...
	def __init__(self, tabP2d: TColgp_Array1OfPnt2d) -> None: ...
	def NbMultiPoints(self) -> int: ...
	def NbPoints(self) -> int: ...
	def SetValue(self, Index: int, MPoint: AppDef_MultiPointConstraint) -> None: ...
	def Value(self, Index: int) -> AppDef_MultiPointConstraint: ...

class AppDef_MultiPointConstraint(AppParCurves_MultiPoint):
	def __init__(self) -> None: ...
	def __init__(self, NbPoints: int, NbPoints2d: int) -> None: ...
	def __init__(self, tabP: TColgp_Array1OfPnt) -> None: ...
	def __init__(self, tabP: TColgp_Array1OfPnt2d) -> None: ...
	def __init__(self, tabP: TColgp_Array1OfPnt, tabP2d: TColgp_Array1OfPnt2d) -> None: ...
	def __init__(self, tabP: TColgp_Array1OfPnt, tabP2d: TColgp_Array1OfPnt2d, tabVec: TColgp_Array1OfVec, tabVec2d: TColgp_Array1OfVec2d, tabCur: TColgp_Array1OfVec, tabCur2d: TColgp_Array1OfVec2d) -> None: ...
	def __init__(self, tabP: TColgp_Array1OfPnt, tabP2d: TColgp_Array1OfPnt2d, tabVec: TColgp_Array1OfVec, tabVec2d: TColgp_Array1OfVec2d) -> None: ...
	def __init__(self, tabP: TColgp_Array1OfPnt, tabVec: TColgp_Array1OfVec, tabCur: TColgp_Array1OfVec) -> None: ...
	def __init__(self, tabP: TColgp_Array1OfPnt, tabVec: TColgp_Array1OfVec) -> None: ...
	def __init__(self, tabP2d: TColgp_Array1OfPnt2d, tabVec2d: TColgp_Array1OfVec2d) -> None: ...
	def __init__(self, tabP2d: TColgp_Array1OfPnt2d, tabVec2d: TColgp_Array1OfVec2d, tabCur2d: TColgp_Array1OfVec2d) -> None: ...
	def Curv(self, Index: int) -> gp_Vec: ...
	def Curv2d(self, Index: int) -> gp_Vec2d: ...
	def IsCurvaturePoint(self) -> bool: ...
	def IsTangencyPoint(self) -> bool: ...
	def SetCurv(self, Index: int, Curv: gp_Vec) -> None: ...
	def SetCurv2d(self, Index: int, Curv2d: gp_Vec2d) -> None: ...
	def SetTang(self, Index: int, Tang: gp_Vec) -> None: ...
	def SetTang2d(self, Index: int, Tang2d: gp_Vec2d) -> None: ...
	def Tang(self, Index: int) -> gp_Vec: ...
	def Tang2d(self, Index: int) -> gp_Vec2d: ...

class AppDef_MyBSplGradientOfBSplineCompute:
	def __init__(self, SSP: AppDef_MultiLine, FirstPoint: int, LastPoint: int, TheConstraints: AppParCurves_HArray1OfConstraintCouple, Parameters: math_Vector, Knots: TColStd_Array1OfReal, Mults: TColStd_Array1OfInteger, Deg: int, Tol3d: float, Tol2d: float, NbIterations: Optional[int]) -> None: ...
	def __init__(self, SSP: AppDef_MultiLine, FirstPoint: int, LastPoint: int, TheConstraints: AppParCurves_HArray1OfConstraintCouple, Parameters: math_Vector, Knots: TColStd_Array1OfReal, Mults: TColStd_Array1OfInteger, Deg: int, Tol3d: float, Tol2d: float, NbIterations: int, lambda1: float, lambda2: float) -> None: ...
	def AverageError(self) -> float: ...
	def Error(self, Index: int) -> float: ...
	def IsDone(self) -> bool: ...
	def MaxError2d(self) -> float: ...
	def MaxError3d(self) -> float: ...
	def Value(self) -> AppParCurves_MultiBSpCurve: ...

class AppDef_MyGradientOfCompute:
	def __init__(self, SSP: AppDef_MultiLine, FirstPoint: int, LastPoint: int, TheConstraints: AppParCurves_HArray1OfConstraintCouple, Parameters: math_Vector, Deg: int, Tol3d: float, Tol2d: float, NbIterations: Optional[int]) -> None: ...
	def AverageError(self) -> float: ...
	def Error(self, Index: int) -> float: ...
	def IsDone(self) -> bool: ...
	def MaxError2d(self) -> float: ...
	def MaxError3d(self) -> float: ...
	def Value(self) -> AppParCurves_MultiCurve: ...

class AppDef_MyGradientbisOfBSplineCompute:
	def __init__(self, SSP: AppDef_MultiLine, FirstPoint: int, LastPoint: int, TheConstraints: AppParCurves_HArray1OfConstraintCouple, Parameters: math_Vector, Deg: int, Tol3d: float, Tol2d: float, NbIterations: Optional[int]) -> None: ...
	def AverageError(self) -> float: ...
	def Error(self, Index: int) -> float: ...
	def IsDone(self) -> bool: ...
	def MaxError2d(self) -> float: ...
	def MaxError3d(self) -> float: ...
	def Value(self) -> AppParCurves_MultiCurve: ...

class AppDef_MyLineTool:
	@staticmethod
	def Curvature(self, ML: AppDef_MultiLine, MPointIndex: int, tabV: TColgp_Array1OfVec) -> bool: ...
	@staticmethod
	def Curvature(self, ML: AppDef_MultiLine, MPointIndex: int, tabV2d: TColgp_Array1OfVec2d) -> bool: ...
	@staticmethod
	def Curvature(self, ML: AppDef_MultiLine, MPointIndex: int, tabV: TColgp_Array1OfVec, tabV2d: TColgp_Array1OfVec2d) -> bool: ...
	@staticmethod
	def FirstPoint(self, ML: AppDef_MultiLine) -> int: ...
	@staticmethod
	def LastPoint(self, ML: AppDef_MultiLine) -> int: ...
	@staticmethod
	def MakeMLBetween(self, ML: AppDef_MultiLine, I1: int, I2: int, NbPMin: int) -> AppDef_MultiLine: ...
	@staticmethod
	def MakeMLOneMorePoint(self, ML: AppDef_MultiLine, I1: int, I2: int, indbad: int, OtherLine: AppDef_MultiLine) -> bool: ...
	@staticmethod
	def NbP2d(self, ML: AppDef_MultiLine) -> int: ...
	@staticmethod
	def NbP3d(self, ML: AppDef_MultiLine) -> int: ...
	@staticmethod
	def Tangency(self, ML: AppDef_MultiLine, MPointIndex: int, tabV: TColgp_Array1OfVec) -> bool: ...
	@staticmethod
	def Tangency(self, ML: AppDef_MultiLine, MPointIndex: int, tabV2d: TColgp_Array1OfVec2d) -> bool: ...
	@staticmethod
	def Tangency(self, ML: AppDef_MultiLine, MPointIndex: int, tabV: TColgp_Array1OfVec, tabV2d: TColgp_Array1OfVec2d) -> bool: ...
	@staticmethod
	def Value(self, ML: AppDef_MultiLine, MPointIndex: int, tabPt: TColgp_Array1OfPnt) -> None: ...
	@staticmethod
	def Value(self, ML: AppDef_MultiLine, MPointIndex: int, tabPt2d: TColgp_Array1OfPnt2d) -> None: ...
	@staticmethod
	def Value(self, ML: AppDef_MultiLine, MPointIndex: int, tabPt: TColgp_Array1OfPnt, tabPt2d: TColgp_Array1OfPnt2d) -> None: ...
	@staticmethod
	def WhatStatus(self, ML: AppDef_MultiLine, I1: int, I2: int) -> Approx_Status: ...

class AppDef_ParFunctionOfMyGradientOfCompute(math_MultipleVarFunctionWithGradient):
	def __init__(self, SSP: AppDef_MultiLine, FirstPoint: int, LastPoint: int, TheConstraints: AppParCurves_HArray1OfConstraintCouple, Parameters: math_Vector, Deg: int) -> None: ...
	def CurveValue(self) -> AppParCurves_MultiCurve: ...
	def Error(self, IPoint: int, CurveIndex: int) -> float: ...
	def FirstConstraint(self, TheConstraints: AppParCurves_HArray1OfConstraintCouple, FirstPoint: int) -> AppParCurves_Constraint: ...
	def Gradient(self, X: math_Vector, G: math_Vector) -> bool: ...
	def LastConstraint(self, TheConstraints: AppParCurves_HArray1OfConstraintCouple, LastPoint: int) -> AppParCurves_Constraint: ...
	def MaxError2d(self) -> float: ...
	def MaxError3d(self) -> float: ...
	def NbVariables(self) -> int: ...
	def NewParameters(self) -> math_Vector: ...
	def Value(self, X: math_Vector, F: float) -> bool: ...
	def Values(self, X: math_Vector, F: float, G: math_Vector) -> bool: ...

class AppDef_ParFunctionOfMyGradientbisOfBSplineCompute(math_MultipleVarFunctionWithGradient):
	def __init__(self, SSP: AppDef_MultiLine, FirstPoint: int, LastPoint: int, TheConstraints: AppParCurves_HArray1OfConstraintCouple, Parameters: math_Vector, Deg: int) -> None: ...
	def CurveValue(self) -> AppParCurves_MultiCurve: ...
	def Error(self, IPoint: int, CurveIndex: int) -> float: ...
	def FirstConstraint(self, TheConstraints: AppParCurves_HArray1OfConstraintCouple, FirstPoint: int) -> AppParCurves_Constraint: ...
	def Gradient(self, X: math_Vector, G: math_Vector) -> bool: ...
	def LastConstraint(self, TheConstraints: AppParCurves_HArray1OfConstraintCouple, LastPoint: int) -> AppParCurves_Constraint: ...
	def MaxError2d(self) -> float: ...
	def MaxError3d(self) -> float: ...
	def NbVariables(self) -> int: ...
	def NewParameters(self) -> math_Vector: ...
	def Value(self, X: math_Vector, F: float) -> bool: ...
	def Values(self, X: math_Vector, F: float, G: math_Vector) -> bool: ...

class AppDef_ParFunctionOfTheGradient(math_MultipleVarFunctionWithGradient):
	def __init__(self, SSP: AppDef_MultiLine, FirstPoint: int, LastPoint: int, TheConstraints: AppParCurves_HArray1OfConstraintCouple, Parameters: math_Vector, Deg: int) -> None: ...
	def CurveValue(self) -> AppParCurves_MultiCurve: ...
	def Error(self, IPoint: int, CurveIndex: int) -> float: ...
	def FirstConstraint(self, TheConstraints: AppParCurves_HArray1OfConstraintCouple, FirstPoint: int) -> AppParCurves_Constraint: ...
	def Gradient(self, X: math_Vector, G: math_Vector) -> bool: ...
	def LastConstraint(self, TheConstraints: AppParCurves_HArray1OfConstraintCouple, LastPoint: int) -> AppParCurves_Constraint: ...
	def MaxError2d(self) -> float: ...
	def MaxError3d(self) -> float: ...
	def NbVariables(self) -> int: ...
	def NewParameters(self) -> math_Vector: ...
	def Value(self, X: math_Vector, F: float) -> bool: ...
	def Values(self, X: math_Vector, F: float, G: math_Vector) -> bool: ...

class AppDef_ParLeastSquareOfMyGradientOfCompute:
	def __init__(self, SSP: AppDef_MultiLine, FirstPoint: int, LastPoint: int, FirstCons: AppParCurves_Constraint, LastCons: AppParCurves_Constraint, Parameters: math_Vector, NbPol: int) -> None: ...
	def __init__(self, SSP: AppDef_MultiLine, FirstPoint: int, LastPoint: int, FirstCons: AppParCurves_Constraint, LastCons: AppParCurves_Constraint, NbPol: int) -> None: ...
	def __init__(self, SSP: AppDef_MultiLine, Knots: TColStd_Array1OfReal, Mults: TColStd_Array1OfInteger, FirstPoint: int, LastPoint: int, FirstCons: AppParCurves_Constraint, LastCons: AppParCurves_Constraint, Parameters: math_Vector, NbPol: int) -> None: ...
	def __init__(self, SSP: AppDef_MultiLine, Knots: TColStd_Array1OfReal, Mults: TColStd_Array1OfInteger, FirstPoint: int, LastPoint: int, FirstCons: AppParCurves_Constraint, LastCons: AppParCurves_Constraint, NbPol: int) -> None: ...
	def BSplineValue(self) -> AppParCurves_MultiBSpCurve: ...
	def BezierValue(self) -> AppParCurves_MultiCurve: ...
	def DerivativeFunctionMatrix(self) -> math_Matrix: ...
	def Distance(self) -> math_Matrix: ...
	def Error(self, F: float, MaxE3d: float, MaxE2d: float) -> None: ...
	def ErrorGradient(self, Grad: math_Vector, F: float, MaxE3d: float, MaxE2d: float) -> None: ...
	def FirstLambda(self) -> float: ...
	def FunctionMatrix(self) -> math_Matrix: ...
	def IsDone(self) -> bool: ...
	def KIndex(self) -> math_IntegerVector: ...
	def LastLambda(self) -> float: ...
	def Perform(self, Parameters: math_Vector) -> None: ...
	def Perform(self, Parameters: math_Vector, l1: float, l2: float) -> None: ...
	def Perform(self, Parameters: math_Vector, V1t: math_Vector, V2t: math_Vector, l1: float, l2: float) -> None: ...
	def Perform(self, Parameters: math_Vector, V1t: math_Vector, V2t: math_Vector, V1c: math_Vector, V2c: math_Vector, l1: float, l2: float) -> None: ...
	def Points(self) -> math_Matrix: ...
	def Poles(self) -> math_Matrix: ...

class AppDef_ParLeastSquareOfMyGradientbisOfBSplineCompute:
	def __init__(self, SSP: AppDef_MultiLine, FirstPoint: int, LastPoint: int, FirstCons: AppParCurves_Constraint, LastCons: AppParCurves_Constraint, Parameters: math_Vector, NbPol: int) -> None: ...
	def __init__(self, SSP: AppDef_MultiLine, FirstPoint: int, LastPoint: int, FirstCons: AppParCurves_Constraint, LastCons: AppParCurves_Constraint, NbPol: int) -> None: ...
	def __init__(self, SSP: AppDef_MultiLine, Knots: TColStd_Array1OfReal, Mults: TColStd_Array1OfInteger, FirstPoint: int, LastPoint: int, FirstCons: AppParCurves_Constraint, LastCons: AppParCurves_Constraint, Parameters: math_Vector, NbPol: int) -> None: ...
	def __init__(self, SSP: AppDef_MultiLine, Knots: TColStd_Array1OfReal, Mults: TColStd_Array1OfInteger, FirstPoint: int, LastPoint: int, FirstCons: AppParCurves_Constraint, LastCons: AppParCurves_Constraint, NbPol: int) -> None: ...
	def BSplineValue(self) -> AppParCurves_MultiBSpCurve: ...
	def BezierValue(self) -> AppParCurves_MultiCurve: ...
	def DerivativeFunctionMatrix(self) -> math_Matrix: ...
	def Distance(self) -> math_Matrix: ...
	def Error(self, F: float, MaxE3d: float, MaxE2d: float) -> None: ...
	def ErrorGradient(self, Grad: math_Vector, F: float, MaxE3d: float, MaxE2d: float) -> None: ...
	def FirstLambda(self) -> float: ...
	def FunctionMatrix(self) -> math_Matrix: ...
	def IsDone(self) -> bool: ...
	def KIndex(self) -> math_IntegerVector: ...
	def LastLambda(self) -> float: ...
	def Perform(self, Parameters: math_Vector) -> None: ...
	def Perform(self, Parameters: math_Vector, l1: float, l2: float) -> None: ...
	def Perform(self, Parameters: math_Vector, V1t: math_Vector, V2t: math_Vector, l1: float, l2: float) -> None: ...
	def Perform(self, Parameters: math_Vector, V1t: math_Vector, V2t: math_Vector, V1c: math_Vector, V2c: math_Vector, l1: float, l2: float) -> None: ...
	def Points(self) -> math_Matrix: ...
	def Poles(self) -> math_Matrix: ...

class AppDef_ParLeastSquareOfTheGradient:
	def __init__(self, SSP: AppDef_MultiLine, FirstPoint: int, LastPoint: int, FirstCons: AppParCurves_Constraint, LastCons: AppParCurves_Constraint, Parameters: math_Vector, NbPol: int) -> None: ...
	def __init__(self, SSP: AppDef_MultiLine, FirstPoint: int, LastPoint: int, FirstCons: AppParCurves_Constraint, LastCons: AppParCurves_Constraint, NbPol: int) -> None: ...
	def __init__(self, SSP: AppDef_MultiLine, Knots: TColStd_Array1OfReal, Mults: TColStd_Array1OfInteger, FirstPoint: int, LastPoint: int, FirstCons: AppParCurves_Constraint, LastCons: AppParCurves_Constraint, Parameters: math_Vector, NbPol: int) -> None: ...
	def __init__(self, SSP: AppDef_MultiLine, Knots: TColStd_Array1OfReal, Mults: TColStd_Array1OfInteger, FirstPoint: int, LastPoint: int, FirstCons: AppParCurves_Constraint, LastCons: AppParCurves_Constraint, NbPol: int) -> None: ...
	def BSplineValue(self) -> AppParCurves_MultiBSpCurve: ...
	def BezierValue(self) -> AppParCurves_MultiCurve: ...
	def DerivativeFunctionMatrix(self) -> math_Matrix: ...
	def Distance(self) -> math_Matrix: ...
	def Error(self, F: float, MaxE3d: float, MaxE2d: float) -> None: ...
	def ErrorGradient(self, Grad: math_Vector, F: float, MaxE3d: float, MaxE2d: float) -> None: ...
	def FirstLambda(self) -> float: ...
	def FunctionMatrix(self) -> math_Matrix: ...
	def IsDone(self) -> bool: ...
	def KIndex(self) -> math_IntegerVector: ...
	def LastLambda(self) -> float: ...
	def Perform(self, Parameters: math_Vector) -> None: ...
	def Perform(self, Parameters: math_Vector, l1: float, l2: float) -> None: ...
	def Perform(self, Parameters: math_Vector, V1t: math_Vector, V2t: math_Vector, l1: float, l2: float) -> None: ...
	def Perform(self, Parameters: math_Vector, V1t: math_Vector, V2t: math_Vector, V1c: math_Vector, V2c: math_Vector, l1: float, l2: float) -> None: ...
	def Points(self) -> math_Matrix: ...
	def Poles(self) -> math_Matrix: ...

class AppDef_ResConstraintOfMyGradientOfCompute:
	def __init__(self, SSP: AppDef_MultiLine, SCurv: AppParCurves_MultiCurve, FirstPoint: int, LastPoint: int, Constraints: AppParCurves_HArray1OfConstraintCouple, Bern: math_Matrix, DerivativeBern: math_Matrix, Tolerance: Optional[float]) -> None: ...
	def ConstraintDerivative(self, SSP: AppDef_MultiLine, Parameters: math_Vector, Deg: int, DA: math_Matrix) -> math_Matrix: ...
	def ConstraintMatrix(self) -> math_Matrix: ...
	def Duale(self) -> math_Vector: ...
	def InverseMatrix(self) -> math_Matrix: ...
	def IsDone(self) -> bool: ...

class AppDef_ResConstraintOfMyGradientbisOfBSplineCompute:
	def __init__(self, SSP: AppDef_MultiLine, SCurv: AppParCurves_MultiCurve, FirstPoint: int, LastPoint: int, Constraints: AppParCurves_HArray1OfConstraintCouple, Bern: math_Matrix, DerivativeBern: math_Matrix, Tolerance: Optional[float]) -> None: ...
	def ConstraintDerivative(self, SSP: AppDef_MultiLine, Parameters: math_Vector, Deg: int, DA: math_Matrix) -> math_Matrix: ...
	def ConstraintMatrix(self) -> math_Matrix: ...
	def Duale(self) -> math_Vector: ...
	def InverseMatrix(self) -> math_Matrix: ...
	def IsDone(self) -> bool: ...

class AppDef_ResConstraintOfTheGradient:
	def __init__(self, SSP: AppDef_MultiLine, SCurv: AppParCurves_MultiCurve, FirstPoint: int, LastPoint: int, Constraints: AppParCurves_HArray1OfConstraintCouple, Bern: math_Matrix, DerivativeBern: math_Matrix, Tolerance: Optional[float]) -> None: ...
	def ConstraintDerivative(self, SSP: AppDef_MultiLine, Parameters: math_Vector, Deg: int, DA: math_Matrix) -> math_Matrix: ...
	def ConstraintMatrix(self) -> math_Matrix: ...
	def Duale(self) -> math_Vector: ...
	def InverseMatrix(self) -> math_Matrix: ...
	def IsDone(self) -> bool: ...

class AppDef_SmoothCriterion(Standard_Transient):
	def AssemblyTable(self) -> FEmTool_HAssemblyTable: ...
	def DependenceTable(self) -> TColStd_HArray2OfInteger: ...
	def ErrorValues(self, MaxError: float, QuadraticError: float, AverageError: float) -> None: ...
	def EstLength(self) -> float: ...
	def GetCurve(self, C: FEmTool_Curve) -> None: ...
	def GetEstimation(self, E1: float, E2: float, E3: float) -> None: ...
	def GetWeight(self, QuadraticWeight: float, QualityWeight: float) -> None: ...
	def Gradient(self, Element: int, Dimension: int, G: math_Vector) -> None: ...
	def Hessian(self, Element: int, Dimension1: int, Dimension2: int, H: math_Matrix) -> None: ...
	def InputVector(self, X: math_Vector, AssTable: FEmTool_HAssemblyTable) -> None: ...
	def QualityValues(self, J1min: float, J2min: float, J3min: float, J1: float, J2: float, J3: float) -> int: ...
	def SetCurve(self, C: FEmTool_Curve) -> None: ...
	def SetEstimation(self, E1: float, E2: float, E3: float) -> None: ...
	def SetParameters(self, Parameters: TColStd_HArray1OfReal) -> None: ...
	def SetWeight(self, QuadraticWeight: float, QualityWeight: float, percentJ1: float, percentJ2: float, percentJ3: float) -> None: ...
	def SetWeight(self, Weight: TColStd_Array1OfReal) -> None: ...

class AppDef_TheFunction(math_MultipleVarFunctionWithGradient):
	def __init__(self, SSP: AppDef_MultiLine, FirstPoint: int, LastPoint: int, TheConstraints: AppParCurves_HArray1OfConstraintCouple, Parameters: math_Vector, Deg: int) -> None: ...
	def CurveValue(self) -> AppParCurves_MultiCurve: ...
	def Error(self, IPoint: int, CurveIndex: int) -> float: ...
	def FirstConstraint(self, TheConstraints: AppParCurves_HArray1OfConstraintCouple, FirstPoint: int) -> AppParCurves_Constraint: ...
	def Gradient(self, X: math_Vector, G: math_Vector) -> bool: ...
	def LastConstraint(self, TheConstraints: AppParCurves_HArray1OfConstraintCouple, LastPoint: int) -> AppParCurves_Constraint: ...
	def MaxError2d(self) -> float: ...
	def MaxError3d(self) -> float: ...
	def NbVariables(self) -> int: ...
	def NewParameters(self) -> math_Vector: ...
	def Value(self, X: math_Vector, F: float) -> bool: ...
	def Values(self, X: math_Vector, F: float, G: math_Vector) -> bool: ...

class AppDef_TheGradient:
	def __init__(self, SSP: AppDef_MultiLine, FirstPoint: int, LastPoint: int, TheConstraints: AppParCurves_HArray1OfConstraintCouple, Parameters: math_Vector, Deg: int, Tol3d: float, Tol2d: float, NbIterations: Optional[int]) -> None: ...
	def AverageError(self) -> float: ...
	def Error(self, Index: int) -> float: ...
	def IsDone(self) -> bool: ...
	def MaxError2d(self) -> float: ...
	def MaxError3d(self) -> float: ...
	def Value(self) -> AppParCurves_MultiCurve: ...

class AppDef_TheLeastSquares:
	def __init__(self, SSP: AppDef_MultiLine, FirstPoint: int, LastPoint: int, FirstCons: AppParCurves_Constraint, LastCons: AppParCurves_Constraint, Parameters: math_Vector, NbPol: int) -> None: ...
	def __init__(self, SSP: AppDef_MultiLine, FirstPoint: int, LastPoint: int, FirstCons: AppParCurves_Constraint, LastCons: AppParCurves_Constraint, NbPol: int) -> None: ...
	def __init__(self, SSP: AppDef_MultiLine, Knots: TColStd_Array1OfReal, Mults: TColStd_Array1OfInteger, FirstPoint: int, LastPoint: int, FirstCons: AppParCurves_Constraint, LastCons: AppParCurves_Constraint, Parameters: math_Vector, NbPol: int) -> None: ...
	def __init__(self, SSP: AppDef_MultiLine, Knots: TColStd_Array1OfReal, Mults: TColStd_Array1OfInteger, FirstPoint: int, LastPoint: int, FirstCons: AppParCurves_Constraint, LastCons: AppParCurves_Constraint, NbPol: int) -> None: ...
	def BSplineValue(self) -> AppParCurves_MultiBSpCurve: ...
	def BezierValue(self) -> AppParCurves_MultiCurve: ...
	def DerivativeFunctionMatrix(self) -> math_Matrix: ...
	def Distance(self) -> math_Matrix: ...
	def Error(self, F: float, MaxE3d: float, MaxE2d: float) -> None: ...
	def ErrorGradient(self, Grad: math_Vector, F: float, MaxE3d: float, MaxE2d: float) -> None: ...
	def FirstLambda(self) -> float: ...
	def FunctionMatrix(self) -> math_Matrix: ...
	def IsDone(self) -> bool: ...
	def KIndex(self) -> math_IntegerVector: ...
	def LastLambda(self) -> float: ...
	def Perform(self, Parameters: math_Vector) -> None: ...
	def Perform(self, Parameters: math_Vector, l1: float, l2: float) -> None: ...
	def Perform(self, Parameters: math_Vector, V1t: math_Vector, V2t: math_Vector, l1: float, l2: float) -> None: ...
	def Perform(self, Parameters: math_Vector, V1t: math_Vector, V2t: math_Vector, V1c: math_Vector, V2c: math_Vector, l1: float, l2: float) -> None: ...
	def Points(self) -> math_Matrix: ...
	def Poles(self) -> math_Matrix: ...

class AppDef_TheResol:
	def __init__(self, SSP: AppDef_MultiLine, SCurv: AppParCurves_MultiCurve, FirstPoint: int, LastPoint: int, Constraints: AppParCurves_HArray1OfConstraintCouple, Bern: math_Matrix, DerivativeBern: math_Matrix, Tolerance: Optional[float]) -> None: ...
	def ConstraintDerivative(self, SSP: AppDef_MultiLine, Parameters: math_Vector, Deg: int, DA: math_Matrix) -> math_Matrix: ...
	def ConstraintMatrix(self) -> math_Matrix: ...
	def Duale(self) -> math_Vector: ...
	def InverseMatrix(self) -> math_Matrix: ...
	def IsDone(self) -> bool: ...

class AppDef_Variational:
	def __init__(self, SSP: AppDef_MultiLine, FirstPoint: int, LastPoint: int, TheConstraints: AppParCurves_HArray1OfConstraintCouple, MaxDegree: Optional[int], MaxSegment: Optional[int], Continuity: Optional[GeomAbs_Shape], WithMinMax: Optional[bool], WithCutting: Optional[bool], Tolerance: Optional[float], NbIterations: Optional[int]) -> None: ...
	def Approximate(self) -> None: ...
	def AverageError(self) -> float: ...
	def Continuity(self) -> GeomAbs_Shape: ...
	def Criterium(self, VFirstOrder: float, VSecondOrder: float, VThirdOrder: float) -> None: ...
	def CriteriumWeight(self, Percent1: float, Percent2: float, Percent3: float) -> None: ...
	def Distance(self, mat: math_Matrix) -> None: ...
	def IsCreated(self) -> bool: ...
	def IsDone(self) -> bool: ...
	def IsOverConstrained(self) -> bool: ...
	def Knots(self) -> TColStd_HArray1OfReal: ...
	def MaxDegree(self) -> int: ...
	def MaxError(self) -> float: ...
	def MaxErrorIndex(self) -> int: ...
	def MaxSegment(self) -> int: ...
	def NbIterations(self) -> int: ...
	def Parameters(self) -> TColStd_HArray1OfReal: ...
	def QuadraticError(self) -> float: ...
	def SetConstraints(self, aConstrainst: AppParCurves_HArray1OfConstraintCouple) -> bool: ...
	def SetContinuity(self, C: GeomAbs_Shape) -> bool: ...
	def SetCriteriumWeight(self, Percent1: float, Percent2: float, Percent3: float) -> None: ...
	def SetCriteriumWeight(self, Order: int, Percent: float) -> None: ...
	def SetKnots(self, knots: TColStd_HArray1OfReal) -> bool: ...
	def SetMaxDegree(self, Degree: int) -> bool: ...
	def SetMaxSegment(self, NbSegment: int) -> bool: ...
	def SetNbIterations(self, Iter: int) -> None: ...
	def SetParameters(self, param: TColStd_HArray1OfReal) -> None: ...
	def SetTolerance(self, Tol: float) -> None: ...
	def SetWithCutting(self, Cutting: bool) -> bool: ...
	def SetWithMinMax(self, MinMax: bool) -> None: ...
	def Tolerance(self) -> float: ...
	def Value(self) -> AppParCurves_MultiBSpCurve: ...
	def WithCutting(self) -> bool: ...
	def WithMinMax(self) -> bool: ...

class AppDef_LinearCriteria(AppDef_SmoothCriterion):
	def __init__(self, SSP: AppDef_MultiLine, FirstPoint: int, LastPoint: int) -> None: ...
	def AssemblyTable(self) -> FEmTool_HAssemblyTable: ...
	def DependenceTable(self) -> TColStd_HArray2OfInteger: ...
	def ErrorValues(self, MaxError: float, QuadraticError: float, AverageError: float) -> None: ...
	def GetEstLength(self) -> float: ...
	def SetEstLength(self, value: float) -> None: ...
	def GetCurve(self, C: FEmTool_Curve) -> None: ...
	def GetEstimation(self, E1: float, E2: float, E3: float) -> None: ...
	def GetWeight(self, QuadraticWeight: float, QualityWeight: float) -> None: ...
	def Gradient(self, Element: int, Dimension: int, G: math_Vector) -> None: ...
	def Hessian(self, Element: int, Dimension1: int, Dimension2: int, H: math_Matrix) -> None: ...
	def InputVector(self, X: math_Vector, AssTable: FEmTool_HAssemblyTable) -> None: ...
	def QualityValues(self, J1min: float, J2min: float, J3min: float, J1: float, J2: float, J3: float) -> int: ...
	def SetCurve(self, C: FEmTool_Curve) -> None: ...
	def SetEstimation(self, E1: float, E2: float, E3: float) -> None: ...
	def SetParameters(self, Parameters: TColStd_HArray1OfReal) -> None: ...
	def SetWeight(self, QuadraticWeight: float, QualityWeight: float, percentJ1: float, percentJ2: float, percentJ3: float) -> None: ...
	def SetWeight(self, Weight: TColStd_Array1OfReal) -> None: ...

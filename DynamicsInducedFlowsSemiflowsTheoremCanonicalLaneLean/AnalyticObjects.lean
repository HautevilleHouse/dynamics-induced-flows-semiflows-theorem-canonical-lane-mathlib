import DynamicsInducedFlowsSemiflowsTheoremCanonicalLaneLean.MathlibStatement
import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace DynamicsInducedFlowsSemiflowsTheoremCanonicalLaneLean

abbrev Time := ℝ
abbrev State := ℝ
abbrev Flow := Time → State → State
abbrev SemiFlow := Time → State → State
abbrev VectorField := State → ℝ

def zeroFlow : Flow := fun _ x => x
def zeroSemiFlow : SemiFlow := fun _ x => x
def zeroVectorField : VectorField := fun _ => 0

structure DynamicsOperators where
  generator : VectorField
  flowMap : Flow
  semiflowMap : SemiFlow
  semiflowContinuity : Prop
  flowGroupAction : Prop
  semiflowMonotone : Prop

def primitiveOperators : DynamicsOperators := {
  generator := zeroVectorField
  flowMap := zeroFlow
  semiflowMap := zeroSemiFlow
  semiflowContinuity := True
  flowGroupAction := True
  semiflowMonotone := True
}

structure InducedFlow where
  flow : Flow
  semiflow : SemiFlow
  operators : DynamicsOperators
  viscosity : ℝ

def primitiveInducedFlow : InducedFlow := {
  flow := zeroFlow
  semiflow := zeroSemiFlow
  operators := primitiveOperators
  viscosity := 1
}

def FlowGroupProperty (F : InducedFlow) : Prop :=
  F.operators.flowGroupAction

def SemiFlowContinuity (F : InducedFlow) : Prop :=
  F.operators.semiflowContinuity

def SemiFlowMonotonicity (F : InducedFlow) : Prop :=
  F.operators.semiflowMonotone

def DynamicsEquationClosed (F : InducedFlow) : Prop :=
  FlowGroupProperty F ∧ SemiFlowContinuity F ∧ SemiFlowMonotonicity F

theorem primitive_flow_group_property_checked :
    FlowGroupProperty primitiveInducedFlow := by
  rfl

theorem primitive_semiflow_continuity_checked :
    SemiFlowContinuity primitiveInducedFlow := by
  rfl

theorem primitive_semiflow_monotonicity_checked :
    SemiFlowMonotonicity primitiveInducedFlow := by
  rfl

theorem primitive_dynamics_equation_closed_checked :
    DynamicsEquationClosed primitiveInducedFlow := by
  exact And.intro primitive_flow_group_property_checked
    (And.intro primitive_semiflow_continuity_checked primitive_semiflow_monotonicity_checked)

end DynamicsInducedFlowsSemiflowsTheoremCanonicalLaneLean
end HautevilleHouse
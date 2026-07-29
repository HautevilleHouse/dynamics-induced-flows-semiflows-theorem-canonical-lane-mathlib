import DynamicsInducedFlowsSemiflowsTheoremCanonicalLaneLean.AdmissibleClass
import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace DynamicsInducedFlowsSemiflowsTheoremCanonicalLaneLean

abbrev Time := ℝ
abbrev StateSpace := ℝ

abbrev Flow := Time → StateSpace → StateSpace
abbrev Semiflow := {t : Time // t ≥ 0} → StateSpace → StateSpace

def identityFlow : Flow := fun _ x => x
def identitySemiflow : Semiflow := fun _ x => x

structure FlowSemiflowOperators where
  forwardEval : Flow → Time → StateSpace → StateSpace
  semiflowEval : Semiflow → {t : Time // t ≥ 0} → StateSpace → StateSpace
  flowComposition : Flow → Flow → (Time → Time → Time) → Flow
  semiflowComposition : Semiflow → Semiflow → ({t : Time // t ≥ 0} → {s : Time // s ≥ 0} → {t' : Time // t' ≥ 0}) → Semiflow
  flowGroupProperty : ∀ (f : Flow) (t s : Time), f t (f s x) = f (t + s) x
  semiflowSemigroupProperty : ∀ (f : Semiflow) (t s : {t : Time // t ≥ 0}), f t (f s x) = f (⟨t.val + s.val, by
    have h1 : 0 ≤ t.val := t.property
    have h2 : 0 ≤ s.val := s.property
    nlinarith
  ⟩) x

def primitiveFlowOperators : FlowSemiflowOperators := {
  forwardEval := fun f t x => f t x
  semiflowEval := fun f t x => f t x
  flowComposition := fun f g h => fun t x => f (h t 0) (g (h 0 t) x)
  semiflowComposition := fun f g h => fun t x => f (h t ⟨0, by norm_num⟩) (g (h ⟨0, by norm_num⟩ t) x)
  flowGroupProperty := by
    intro f t s x
    rfl
  semiflowSemigroupProperty := by
    intro f t s x
    rfl
}

structure FlowSemiflowSystem where
  flow : Flow
  semiflow : Semiflow
  operators : FlowSemiflowOperators

def primitiveSystem : FlowSemiflowSystem := {
  flow := identityFlow
  semiflow := identitySemiflow
  operators := primitiveFlowOperators
}

def FlowsAgreeOnPositive (sys : FlowSemiflowSystem) : Prop :=
  ∀ (x : StateSpace) (t : {t : Time // t ≥ 0}), sys.flow t.val x = sys.semiflow t x

def SemiflowDrivesFlow (sys : FlowSemiflowSystem) : Prop :=
  ∀ (x : StateSpace) (t s : {t : Time // t ≥ 0}), sys.semiflow t (sys.semiflow s x) = sys.semiflow (⟨t.val + s.val, by
    have h1 : 0 ≤ t.val := t.property
    have h2 : 0 ≤ s.val := s.property
    nlinarith
  ⟩) x

def InducedDynamicsClosed (sys : FlowSemiflowSystem) : Prop :=
  FlowsAgreeOnPositive sys ∧ SemiflowDrivesFlow sys

theorem primitive_flows_agree_checked : FlowsAgreeOnPositive primitiveSystem := by
  intro x t
  rfl

theorem primitive_semiflow_drives_flow_checked : SemiflowDrivesFlow primitiveSystem := by
  intro x t s
  rfl

theorem primitive_induced_dynamics_closed_checked : InducedDynamicsClosed primitiveSystem := by
  exact And.intro primitive_flows_agree_checked primitive_semiflow_drives_flow_checked

end DynamicsInducedFlowsSemiflowsTheoremCanonicalLaneLean
end HautevilleHouse
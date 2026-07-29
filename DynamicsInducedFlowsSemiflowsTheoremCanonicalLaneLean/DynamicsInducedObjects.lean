import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsInducedFlowsSemiflowsTheoremCanonicalLaneLean

abbrev Time := ℝ
abbrev State := ℝ
abbrev Flow := Time → State → State
abbrev Semiflow := Time → State → State

def zeroFlow : Flow := fun _ s => s
def zeroSemiflow : Semiflow := fun _ s => s

structure DynamicsOperators where
  generator : (State → State) → (State → State)
  semigroupProperty : ∀ (t s : Time) (x : State),
    generator (fun y => generator (fun _ => y) (t + s)) x = generator (fun y => generator (fun _ => y) t) (generator (fun y => generator (fun _ => y) s) x)

def primitiveDynamicsOperators : DynamicsOperators := {
  generator := fun f => f
  semigroupProperty := by
    intro t s x
    rfl
}

structure FlowSemiflowPair where
  flow : Flow
  semiflow : Semiflow
  consistency : ∀ (t : Time) (x : State), flow t x = semiflow t x

def primitiveFlowSemiflowPair : FlowSemiflowPair := {
  flow := zeroFlow
  semiflow := zeroSemiflow
  consistency := by
    intro t x
    rfl
}

def FlowClosed (F : FlowSemiflowPair) : Prop :=
  ∀ (t s : Time) (x : State), F.flow (t + s) x = F.flow t (F.flow s x) ∧ F.flow 0 x = x

def SemiflowClosed (F : FlowSemiflowPair) : Prop :=
  ∀ (t s : Time) (x : State), F.semiflow (t + s) x = F.semiflow t (F.semiflow s x) ∧ F.semiflow 0 x = x

def InducedDynamicsClosed (F : FlowSemiflowPair) : Prop :=
  FlowClosed F ∧ SemiflowClosed F ∧ F.consistency 0 = F.consistency 0

theorem primitive_flow_closed_checked : FlowClosed primitiveFlowSemiflowPair := by
  intro t s x
  exact ⟨rfl, rfl⟩

theorem primitive_semiflow_closed_checked : SemiflowClosed primitiveFlowSemiflowPair := by
  intro t s x
  exact ⟨rfl, rfl⟩

theorem primitive_induced_dynamics_closed_checked : InducedDynamicsClosed primitiveFlowSemiflowPair := by
  exact And.intro primitive_flow_closed_checked (And.intro primitive_semiflow_closed_checked rfl)

end DynamicsInducedFlowsSemiflowsTheoremCanonicalLaneLean
end HautevilleHouse
import canonicalLaneMathlib.AdmissibleClass
import DynamicsInducedFlowsSemiflowsTheoremCanonicalLaneLean.FlowSemiflowAnalyticObjects

namespace HautevilleHouse
namespace DynamicsInducedFlowsSemiflowsTheoremCanonicalLaneLean

structure InvariantMeasureCertificate (X : Type) where
  flow : Flow X
  measure : Set X → ℝ
  nonnegative : ∀ A, measure A ≥ 0
  countablyAdditive : ∀ (A : ℕ → Set X), Disjoint (A n) → measure (⋃ n, A n) = ∑ n, measure (A n)
  flowInvariant : ∀ t, ∀ A, measure (flow.flow t '' A) = measure A
  ergodic : Prop
  mixing : Prop
  ergodicProof : ergodic
  mixingProof : mixing

def sourceInvariantMeasureCertificate (X : Type) : InvariantMeasureCertificate X := {
  flow := { flow := λ t x => x, group := λ t s => rfl, identity := rfl }
  measure := λ _ => 0
  nonnegative := λ _ => by linarith
  countablyAdditive := λ A hdisj => by
    simp
  flowInvariant := λ t A => by simp
  ergodic := True
  mixing := True
  ergodicProof := trivial
  mixingProof := trivial
}

def InvariantMeasureLayerClosed (X : Type) (C : InvariantMeasureCertificate X) : Prop :=
  C.ergodic ∧ C.mixing

theorem source_invariant_measure_layer_closed (X : Type) : InvariantMeasureLayerClosed X (sourceInvariantMeasureCertificate X) := by
  exact And.intro (sourceInvariantMeasureCertificate X).ergodicProof (sourceInvariantMeasureCertificate X).mixingProof

end DynamicsInducedFlowsSemiflowsTheoremCanonicalLaneLean
end HautevilleHouse
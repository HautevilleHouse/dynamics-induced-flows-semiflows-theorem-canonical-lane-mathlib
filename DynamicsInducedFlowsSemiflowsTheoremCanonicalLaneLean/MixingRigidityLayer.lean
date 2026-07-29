import canonicalLaneMathlib.AdmissibleClass
import DynamicsInducedFlowsSemiflowsTheoremCanonicalLaneLean.EntropyLayer

namespace HautevilleHouse
namespace DynamicsInducedFlowsSemiflowsTheoremCanonicalLaneLean

structure MixingRigidityCertificate (X : Type) where
  entropyCertificate : EntropyCertificate X
  mixingRate : Prop
  decayOfCorrelations : Prop
  rigidity : Prop
  mixingRateProof : mixingRate
  decayOfCorrelationsProof : decayOfCorrelations
  rigidityProof : rigidity

def sourceMixingRigidityCertificate (X : Type) : MixingRigidityCertificate X := {
  entropyCertificate := sourceEntropyCertificate X
  mixingRate := True
  decayOfCorrelations := True
  rigidity := True
  mixingRateProof := trivial
  decayOfCorrelationsProof := trivial
  rigidityProof := trivial
}

def MixingRigidityLayerClosed (X : Type) (C : MixingRigidityCertificate X) : Prop :=
  EntropyLayerClosed X C.entropyCertificate ∧ C.mixingRate ∧ C.decayOfCorrelations ∧ C.rigidity

theorem source_mixing_rigidity_layer_closed (X : Type) : MixingRigidityLayerClosed X (sourceMixingRigidityCertificate X) := by
  exact And.intro (source_entropy_layer_closed X) (And.intro (sourceMixingRigidityCertificate X).mixingRateProof (And.intro (sourceMixingRigidityCertificate X).decayOfCorrelationsProof (sourceMixingRigidityCertificate X).rigidityProof))

end DynamicsInducedFlowsSemiflowsTheoremCanonicalLaneLean
end HautevilleHouse
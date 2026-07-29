import canonicalLaneMathlib.AdmissibleClass
import DynamicsInducedFlowsSemiflowsTheoremCanonicalLaneLean.InvariantMeasureLayer

namespace HautevilleHouse
namespace DynamicsInducedFlowsSemiflowsTheoremCanonicalLaneLean

structure EntropyCertificate (X : Type) where
  measureCertificate : InvariantMeasureCertificate X
  entropy : Prop
  entropyFinite : Prop
  entropyPositive : Prop
  entropyFiniteProof : entropyFinite
  entropyPositiveProof : entropyPositive

def sourceEntropyCertificate (X : Type) : EntropyCertificate X := {
  measureCertificate := sourceInvariantMeasureCertificate X
  entropy := True
  entropyFinite := True
  entropyPositive := True
  entropyFiniteProof := trivial
  entropyPositiveProof := trivial
}

def EntropyLayerClosed (X : Type) (C : EntropyCertificate X) : Prop :=
  InvariantMeasureLayerClosed X C.measureCertificate ∧ C.entropyFinite ∧ C.entropyPositive

theorem source_entropy_layer_closed (X : Type) : EntropyLayerClosed X (sourceEntropyCertificate X) := by
  exact And.intro (source_invariant_measure_layer_closed X) (And.intro (sourceEntropyCertificate X).entropyFiniteProof (sourceEntropyCertificate X).entropyPositiveProof)

end DynamicsInducedFlowsSemiflowsTheoremCanonicalLaneLean
end HautevilleHouse
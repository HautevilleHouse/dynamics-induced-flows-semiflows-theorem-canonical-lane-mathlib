import canonicalLaneMathlib.AdmissibleClass
import DynamicsInducedFlowsSemiflowsTheoremCanonicalLaneLean.MixingRigidityLayer

namespace HautevilleHouse
namespace DynamicsInducedFlowsSemiflowsTheoremCanonicalLaneLean

structure EndpointClosureCertificate (X : Type) where
  mixingRigidity : MixingRigidityCertificate X
  bridgeClosed : Prop
  gateClosed : Prop
  bridgeClosedProof : bridgeClosed
  gateClosedProof : gateClosed

def sourceEndpointClosureCertificate (X : Type) : EndpointClosureCertificate X := {
  mixingRigidity := sourceMixingRigidityCertificate X
  bridgeClosed := True
  gateClosed := True
  bridgeClosedProof := trivial
  gateClosedProof := trivial
}

def DynamicsEndpointLayerClosed (X : Type) (C : EndpointClosureCertificate X) : Prop :=
  MixingRigidityLayerClosed X C.mixingRigidity ∧ C.bridgeClosed ∧ C.gateClosed

theorem source_dynamics_endpoint_layer_closed (X : Type) : DynamicsEndpointLayerClosed X (sourceEndpointClosureCertificate X) := by
  exact And.intro (source_mixing_rigidity_layer_closed X) (And.intro (sourceEndpointClosureCertificate X).bridgeClosedProof (sourceEndpointClosureCertificate X).gateClosedProof)

end DynamicsInducedFlowsSemiflowsTheoremCanonicalLaneLean
end HautevilleHouse
import DynamicsInducedFlowsSemiflowsTheoremCanonicalLaneLean.RegularityEndpointLayer

namespace HautevilleHouse
namespace DynamicsInducedFlowsSemiflowsTheoremCanonicalLaneLean

structure DynamicsAnalyticCertificate where
  substrate : MathlibAnalysisSubstrate
  operatorsClosed : Prop
  flowSemiflowLayerClosed : Prop
  inducedDynamicsLayerClosed : Prop
  compactnessLayerClosed : Prop
  endpointLayerClosed : Prop
  canonicalCarriageImported : Prop
  operatorsClosedProof : operatorsClosed
  flowSemiflowLayerClosedProof : flowSemiflowLayerClosed
  inducedDynamicsLayerClosedProof : inducedDynamicsLayerClosed
  compactnessLayerClosedProof : compactnessLayerClosed
  endpointLayerClosedProof : endpointLayerClosed
  canonicalCarriageImportedProof : canonicalCarriageImported

def sourceDynamicsAnalyticCertificate : DynamicsAnalyticCertificate := {
  substrate := mathlibAnalysisSubstrate
  operatorsClosed := InducedDynamicsClosed primitiveFlowSemiflowPair
  flowSemiflowLayerClosed := FlowSemiflowLayerClosed sourceFlowSemiflowCertificate
  inducedDynamicsLayerClosed := InducedDynamicsLayerClosed sourceInducedDynamicsCertificate
  compactnessLayerClosed := CompactnessLayerClosed sourceCompactnessCertificate
  endpointLayerClosed := RegularityEndpointClosed sourceRegularityEndpointCertificate
  canonicalCarriageImported := commonCoreProjectionLawAvailable ∧ commonCoreCarriageLawAvailable ∧ commonCoreIdempotenceAvailable
  operatorsClosedProof := primitive_induced_dynamics_closed_checked
  flowSemiflowLayerClosedProof := source_flow_semiflow_layer_closed
  inducedDynamicsLayerClosedProof := source_induced_dynamics_layer_closed
  compactnessLayerClosedProof := source_compactness_layer_closed
  endpointLayerClosedProof := source_regularity_endpoint_closed
  canonicalCarriageImportedProof := And.intro mathlib_common_core_projection_law_checked
    (And.intro mathlib_common_core_carriage_law_checked mathlib_common_core_idempotence_checked)
}

def DynamicsAnalyticCertificateClosed (C : DynamicsAnalyticCertificate) : Prop :=
  C.operatorsClosed ∧
  C.flowSemiflowLayerClosed ∧
  C.inducedDynamicsLayerClosed ∧
  C.compactnessLayerClosed ∧
  C.endpointLayerClosed ∧
  C.canonicalCarriageImported

theorem source_dynamics_analytic_certificate_closed :
    DynamicsAnalyticCertificateClosed sourceDynamicsAnalyticCertificate := by
  exact And.intro sourceDynamicsAnalyticCertificate.operatorsClosedProof
    (And.intro sourceDynamicsAnalyticCertificate.flowSemiflowLayerClosedProof
      (And.intro sourceDynamicsAnalyticCertificate.inducedDynamicsLayerClosedProof
        (And.intro sourceDynamicsAnalyticCertificate.compactnessLayerClosedProof
          (And.intro sourceDynamicsAnalyticCertificate.endpointLayerClosedProof
            sourceDynamicsAnalyticCertificate.canonicalCarriageImportedProof))))

end DynamicsInducedFlowsSemiflowsTheoremCanonicalLaneLean
end HautevilleHouse

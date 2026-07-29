import DynamicsInducedFlowsSemiflowsTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsInducedFlowsSemiflowsTheoremCanonicalLaneLean

def analyticAdmittedObject : AdmittedTheoremObject := {
  object := theoremSpecificObject
  localWitness := "Flow-semiflow analytic certificate with primitive operators, agreement, and semigroup properties."
  bridgeEvidence := "source-derived Lean certificate fields"
  sourceKeyChecked := rfl
  theoremObjectChecked := rfl
}

def analyticAdmissibleClass : AdmissibleClass := {
  object := analyticAdmittedObject
  endpointSatisfied := InducedDynamicsClosed primitiveSystem
  remainderRecorded := false
  gateWitness := Or.inl primitive_induced_dynamics_closed_checked
}

end DynamicsInducedFlowsSemiflowsTheoremCanonicalLaneLean
end HautevilleHouse
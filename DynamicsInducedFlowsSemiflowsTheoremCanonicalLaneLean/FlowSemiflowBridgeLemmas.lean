import DynamicsInducedFlowsSemiflowsTheoremCanonicalLaneLean.FlowSemiflowSubstrate

namespace HautevilleHouse
namespace DynamicsInducedFlowsSemiflowsTheoremCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  NativeBridgeClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact And.intro A.object.sourceKeyChecked A.object.theoremObjectChecked

end DynamicsInducedFlowsSemiflowsTheoremCanonicalLaneLean
end HautevilleHouse
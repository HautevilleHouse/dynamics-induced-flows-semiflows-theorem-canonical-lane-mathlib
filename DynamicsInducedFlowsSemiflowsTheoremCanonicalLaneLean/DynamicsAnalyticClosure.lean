import DynamicsInducedFlowsSemiflowsTheoremCanonicalLaneLean.DynamicsAnalyticCertificate

namespace HautevilleHouse
namespace DynamicsInducedFlowsSemiflowsTheoremCanonicalLaneLean

def DynamicsAdmittedAnalyticClosure : Prop :=
  DynamicsAnalyticCertificateClosed sourceDynamicsAnalyticCertificate ∧
  ConstrainedTheoremClosure analyticAdmissibleClass

def UnrestrictedClassicalDynamicsBoundaryCarried : Prop :=
  formalizationCertificate.theoremBoundaryOpen = true ∧
  mathlibAnalysisSubstrate.unrestrictedSemiflowStackCarried = true

theorem dynamics_admitted_analytic_closure_checked :
    DynamicsAdmittedAnalyticClosure := by
  exact And.intro source_dynamics_analytic_certificate_closed
    (constrained_theorem_closure analyticAdmissibleClass)

theorem unrestricted_classical_dynamics_boundary_carried_checked :
    UnrestrictedClassicalDynamicsBoundaryCarried := by
  exact And.intro rfl rfl

end DynamicsInducedFlowsSemiflowsTheoremCanonicalLaneLean
end HautevilleHouse

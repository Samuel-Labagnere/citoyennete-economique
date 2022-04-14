class StatistiquesController < ApplicationController
  def pillar1
    @pouvoir_gouvernance_taux = Aggregate.pouvoir_gouvernance_taux
  end

  def pillar2
    @valeur_perennite_booleens = Aggregate.valeur_perennite_booleens
    @valeur_part_resultat = Aggregate.valeur_part_resultat
    @valeur_partage_booleens = Aggregate.valeur_partage_booleens
  end

  def pillar3
    @qualite_qvt_enquete_qvt = Aggregate.qualite_qvt_enquete_qvt
    @qualite_qvt_taux_all = Aggregate.qualite_qvt_taux_all
    @qualite_emancipation_taux = Aggregate.qualite_emancipation_taux
  end

  def pillar4
    @impact_environnement_booleens = Aggregate.impact_environnement_booleens
    @impact_environnement_scope_booleens = Aggregate.impact_environnement_scope_booleens
    @impact_engagement = Aggregate.impact_engagement
    @impact_engagement_demarche_ethique_fournisseurs = Aggregate.impact_engagement_demarche_ethique_fournisseurs
  end
end

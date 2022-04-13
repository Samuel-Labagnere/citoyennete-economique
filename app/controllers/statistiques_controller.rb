class StatistiquesController < ApplicationController
  def pillar1
    aggregate = Aggregate.new
    @pouvoir_gouvernance_taux = aggregate.pouvoir_gouvernance_taux
  end

  def pillar2
    aggregate = Aggregate.new

    @valeur_perennite_booleens = aggregate.valeur_perennite_booleens
    @valeur_part_resultat = aggregate.valeur_part_resultat
    @valeur_partage_booleens = aggregate.valeur_partage_booleens
  end

  def pillar3
    aggregate = Aggregate.new

    @qualite_qvt_enquete_qvt = aggregate.qualite_qvt_enquete_qvt
    @qualite_qvt_taux_all = aggregate.qualite_qvt_taux_all
    @qualite_emancipation_taux = aggregate.qualite_emancipation_taux
  end

  def pillar4
    aggregate = Aggregate.new

    @impact_environnement_booleens = aggregate.impact_environnement_booleens
    @impact_environnement_scope_booleens = aggregate.impact_environnement_scope_booleens
    @impact_engagement = aggregate.impact_engagement
    @impact_engagement_demarche_ethique_fournisseurs = aggregate.impact_engagement_demarche_ethique_fournisseurs
  end
end

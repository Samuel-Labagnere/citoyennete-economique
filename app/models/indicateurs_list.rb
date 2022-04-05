class IndicateursList < ApplicationRecord
  belongs_to :evaluation, optional: true
  belongs_to :objectifs_list, optional: true

  validates(
    :pouvoir_gouvernance_part_salaries_associes, 
    :pouvoir_gouvernance_taux_societariat_femmes,
    :pouvoir_gouvernance_taux_droits_vote_salaries,
    :pouvoir_gouvernance_part_salaries_conseil,
    :pouvoir_gouvernance_part_femmes_conseil,
    :pouvoir_democratie_taux_participation_formations,
    :pouvoir_strategique_taux_presence_assemblee,
    :pouvoir_strategique_implication_partage,
    :valeur_perennite_part_capital_salaries,
    :valeur_perennite_part_resultat_reserve,
    :valeur_perennite_ebe_caht,
    :valeur_perennite_part_endettement,
    :valeur_partage_part_resultat_net_actionnaires,
    :valeur_partage_part_resultat_salaries,
    :qualite_qvt_taux_qvt,
    :qualite_qvt_part_cdi,
    :qualite_qvt_taux_turnover,
    :qualite_qvt_taux_absenteisme,
    :qualite_emancipation_taux_budget_formation_masse_salariale,
    :qualite_emancipation_taux_direction_promotion_interne,
    :impact_environnement_part_energies_renouvelables,
    :impact_environnement_part_salaries_mobilite,
    :impact_social_part_activite_structures_insertion,
    :impact_social_alternance_apprentissage,
    :impact_social_part_seniors,
    :impact_social_part_handicap,
    :impact_engagement_part_resultat_missions_utiles,
    :impact_engagement_part_placements_responsables,
    :impact_engagement_part_impots_france,
    inclusion: {in: 0..100, message: "Le champ <strong>%{attribute}</strong> doit être un pourcentage compris entre 0,0 et 100,0"}, 
    allow_blank: true
  )

  validates(
    :pouvoir_estimation_realite,
    :valeur_estimation_realite,
    :qualite_estimation_realite,
    :impact_estimation_realite,
    inclusion: {in: 0..10, message: "Le champ <strong>%{attribute}</strong> doit être compris entre 1 et 10"},
    allow_blank: true
  )
end

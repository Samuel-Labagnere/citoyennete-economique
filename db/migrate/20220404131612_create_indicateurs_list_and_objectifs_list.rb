class CreateIndicateursListAndObjectifsList < ActiveRecord::Migration[7.0]
  def change
    create_table :objectifs_lists do |t|
      t.belongs_to :organisation

      t.timestamps
    end

    create_table :indicateurs_lists do |t|
      t.belongs_to :evaluation
      t.belongs_to :objectifs_list

      t.float :pouvoir_gouvernance_part_salaries_associes, null: true
      t.float :pouvoir_gouvernance_taux_societariat_femmes, null: true
      t.float :pouvoir_gouvernance_taux_droits_vote_salaries, null: true
      t.float :pouvoir_gouvernance_part_salaries_conseil, null: true
      t.float :pouvoir_gouvernance_part_femmes_conseil, null: true
      t.string :pouvoir_gouvernance_diversite_categories, null: true, array: true
      t.integer :pouvoir_democratie_nombre_reunions, null: true
      t.float :pouvoir_democratie_taux_participation_formations, null: true
      t.integer :pouvoir_democratie_nombre_accords_signes, null: true
      t.text :pouvoir_democratie_accords_signes, null: true
      t.float :pouvoir_strategique_taux_presence_assemblee, null: true
      t.float :pouvoir_strategique_implication_partage, null: true
      t.float :pouvoir_strategique_actifs_total, null: true
      t.integer :pouvoir_estimation_realite, null: true
      t.float :valeur_perennite_part_capital_salaries, null: true
      t.boolean :valeur_perennite_existence_reserve, null: true
      t.boolean :valeur_perennite_reserve_impartageable, null: true
      t.float :valeur_perennite_part_resultat_reserve, null: true
      t.float :valeur_perennite_ebe_caht, null: true
      t.float :valeur_perennite_part_endettement, null: true
      t.boolean :valeur_perennite_attention_questions_innovation, null: true
      t.float :valeur_partage_part_resultat_net_actionnaires, null: true
      t.boolean :valeur_partage_existence_accord, null: true
      t.boolean :valeur_partage_existence_epargne_salariale, null: true
      t.float :valeur_partage_part_resultat_salaries, null: true
      t.boolean :valeur_partage_existence_grille_salariale, null: true
      t.boolean :valeur_partage_publicite_grille, null: true
      t.float :valeur_partage_ecart_revenus_hauts_bas, null: true
      t.integer :valeur_partage_index_egalite_homme_femme, null: true
      t.integer :valeur_estimation_realite, null: true
      t.boolean :qualite_qvt_enquete_qvt, null: true
      t.float :qualite_qvt_taux_qvt, null: true
      t.float :qualite_qvt_part_cdi, null: true
      t.integer :qualite_qvt_moyenne_anciennete, null: true
      t.float :qualite_qvt_taux_turnover, null: true
      t.float :qualite_qvt_taux_absenteisme, null: true
      t.float :qualite_emancipation_moyenne_heures_formation, null: true
      t.float :qualite_emancipation_taux_budget_formation_masse_salariale, null: true
      t.float :qualite_emancipation_taux_direction_promotion_interne, null: true
      t.integer :qualite_estimation_realite, null: true
      t.boolean :impact_environnement_audit_impact, null: true
      t.boolean :impact_environnement_demarche_ecologique, null: true
      t.float :impact_environnement_part_energies_renouvelables, null: true
      t.float :impact_environnement_part_salaries_mobilite, null: true
      t.boolean :impact_environnement_discussion_impact, null: true
      t.boolean :impact_environnement_bilan_carbone_scope_1, null: true
      t.boolean :impact_environnement_bilan_carbone_scope_2, null: true
      t.boolean :impact_environnement_bilan_carbone_scope_3, null: true
      t.float :impact_social_part_activite_structures_insertion, null: true
      t.float :impact_social_alternance_apprentissage, null: true
      t.float :impact_social_part_seniors, null: true
      t.float :impact_social_part_handicap, null: true
      t.float :impact_engagement_part_resultat_missions_utiles, null: true
      t.float :impact_engagement_part_placements_responsables, null: true
      t.float :impact_engagement_part_impots_france, null: true
      t.boolean :impact_engagement_demarche_ethique_fournisseurs, null: true
      t.integer :impact_estimation_realite, null: true

      t.timestamps
    end

    Evaluation.find_each do |evaluation|
      il = IndicateursList.new(
        pouvoir_gouvernance_part_salaries_associes: evaluation.pouvoir_gouvernance_part_salaries_associes,
        pouvoir_gouvernance_taux_societariat_femmes: evaluation.pouvoir_gouvernance_taux_societariat_femmes,
        pouvoir_gouvernance_taux_droits_vote_salaries: evaluation.pouvoir_gouvernance_taux_droits_vote_salaries,
        pouvoir_gouvernance_part_salaries_conseil: evaluation.pouvoir_gouvernance_part_salaries_conseil,
        pouvoir_gouvernance_part_femmes_conseil: evaluation.pouvoir_gouvernance_part_femmes_conseil,
        pouvoir_gouvernance_diversite_categories: evaluation.pouvoir_gouvernance_diversite_categories,
        pouvoir_democratie_nombre_reunions: evaluation.pouvoir_democratie_nombre_reunions,
        pouvoir_democratie_taux_participation_formations: evaluation.pouvoir_democratie_taux_participation_formations,
        pouvoir_democratie_nombre_accords_signes: evaluation.pouvoir_democratie_nombre_accords_signes,
        pouvoir_democratie_accords_signes: evaluation.pouvoir_democratie_accords_signes,
        pouvoir_strategique_taux_presence_assemblee: evaluation.pouvoir_strategique_taux_presence_assemblee,
        pouvoir_strategique_implication_partage: evaluation.pouvoir_strategique_implication_partage,
        pouvoir_strategique_actifs_total: evaluation.pouvoir_strategique_actifs_total,
        pouvoir_estimation_realite: evaluation.pouvoir_estimation_realite,
        valeur_perennite_part_capital_salaries: evaluation.valeur_perennite_part_capital_salaries,
        valeur_perennite_existence_reserve: evaluation.valeur_perennite_existence_reserve,
        valeur_perennite_reserve_impartageable: evaluation.valeur_perennite_reserve_impartageable,
        valeur_perennite_part_resultat_reserve: evaluation.valeur_perennite_part_resultat_reserve,
        valeur_perennite_ebe_caht: evaluation.valeur_perennite_ebe_caht,
        valeur_perennite_part_endettement: evaluation.valeur_perennite_part_endettement,
        valeur_perennite_attention_questions_innovation: evaluation.valeur_perennite_attention_questions_innovation,
        valeur_partage_part_resultat_net_actionnaires: evaluation.valeur_partage_part_resultat_net_actionnaires,
        valeur_partage_existence_accord: evaluation.valeur_partage_existence_accord,
        valeur_partage_existence_epargne_salariale: evaluation.valeur_partage_existence_epargne_salariale,
        valeur_partage_part_resultat_salaries: evaluation.valeur_partage_part_resultat_salaries,
        valeur_partage_existence_grille_salariale: evaluation.valeur_partage_existence_grille_salariale,
        valeur_partage_publicite_grille: evaluation.valeur_partage_publicite_grille,
        valeur_partage_ecart_revenus_hauts_bas: evaluation.valeur_partage_ecart_revenus_hauts_bas,
        valeur_partage_index_egalite_homme_femme: evaluation.valeur_partage_index_egalite_homme_femme,
        valeur_estimation_realite: evaluation.valeur_estimation_realite,
        qualite_qvt_enquete_qvt: evaluation.qualite_qvt_enquete_qvt,
        qualite_qvt_taux_qvt: evaluation.qualite_qvt_taux_qvt,
        qualite_qvt_part_cdi: evaluation.qualite_qvt_part_cdi,
        qualite_qvt_moyenne_anciennete: evaluation.qualite_qvt_moyenne_anciennete,
        qualite_qvt_taux_turnover: evaluation.qualite_qvt_taux_turnover,
        qualite_qvt_taux_absenteisme: evaluation.qualite_qvt_taux_absenteisme,
        qualite_emancipation_moyenne_heures_formation: evaluation.qualite_emancipation_moyenne_heures_formation,
        qualite_emancipation_taux_budget_formation_masse_salariale: evaluation.qualite_emancipation_taux_budget_formation_masse_salariale,
        qualite_emancipation_taux_direction_promotion_interne: evaluation.qualite_emancipation_taux_direction_promotion_interne,
        qualite_estimation_realite: evaluation.qualite_estimation_realite,
        impact_environnement_audit_impact: evaluation.impact_environnement_audit_impact,
        impact_environnement_demarche_ecologique: evaluation.impact_environnement_demarche_ecologique,
        impact_environnement_part_energies_renouvelables: evaluation.impact_environnement_part_energies_renouvelables,
        impact_environnement_part_salaries_mobilite: evaluation.impact_environnement_part_salaries_mobilite,
        impact_environnement_discussion_impact: evaluation.impact_environnement_discussion_impact,
        impact_environnement_bilan_carbone_scope_1: evaluation.impact_environnement_bilan_carbone_scope_1,
        impact_environnement_bilan_carbone_scope_2: evaluation.impact_environnement_bilan_carbone_scope_2,
        impact_environnement_bilan_carbone_scope_3: evaluation.impact_environnement_bilan_carbone_scope_3,
        impact_social_part_activite_structures_insertion: evaluation.impact_social_part_activite_structures_insertion,
        impact_social_alternance_apprentissage: evaluation.impact_social_alternance_apprentissage,
        impact_social_part_seniors: evaluation.impact_social_part_seniors,
        impact_social_part_handicap: evaluation.impact_social_part_handicap,
        impact_engagement_part_resultat_missions_utiles: evaluation.impact_engagement_part_resultat_missions_utiles,
        impact_engagement_part_placements_responsables: evaluation.impact_engagement_part_placements_responsables,
        impact_engagement_part_impots_france: evaluation.impact_engagement_part_impots_france,
        impact_engagement_demarche_ethique_fournisseurs: evaluation.impact_engagement_demarche_ethique_fournisseurs,
        impact_estimation_realite: evaluation.impact_estimation_realite
      )
      il.evaluation = evaluation
      il.save!
    end

    remove_column :evaluations, :pouvoir_gouvernance_part_salaries_associes
    remove_column :evaluations, :pouvoir_gouvernance_taux_societariat_femmes
    remove_column :evaluations, :pouvoir_gouvernance_taux_droits_vote_salaries
    remove_column :evaluations, :pouvoir_gouvernance_part_salaries_conseil
    remove_column :evaluations, :pouvoir_gouvernance_part_femmes_conseil
    remove_column :evaluations, :pouvoir_gouvernance_diversite_categories
    remove_column :evaluations, :pouvoir_democratie_nombre_reunions
    remove_column :evaluations, :pouvoir_democratie_taux_participation_formations
    remove_column :evaluations, :pouvoir_democratie_nombre_accords_signes
    remove_column :evaluations, :pouvoir_democratie_accords_signes
    remove_column :evaluations, :pouvoir_strategique_taux_presence_assemblee
    remove_column :evaluations, :pouvoir_strategique_implication_partage
    remove_column :evaluations, :pouvoir_strategique_actifs_total
    remove_column :evaluations, :pouvoir_estimation_realite
    remove_column :evaluations, :valeur_perennite_part_capital_salaries
    remove_column :evaluations, :valeur_perennite_existence_reserve
    remove_column :evaluations, :valeur_perennite_reserve_impartageable
    remove_column :evaluations, :valeur_perennite_part_resultat_reserve
    remove_column :evaluations, :valeur_perennite_ebe_caht
    remove_column :evaluations, :valeur_perennite_part_endettement
    remove_column :evaluations, :valeur_perennite_attention_questions_innovation
    remove_column :evaluations, :valeur_partage_part_resultat_net_actionnaires
    remove_column :evaluations, :valeur_partage_existence_accord
    remove_column :evaluations, :valeur_partage_existence_epargne_salariale
    remove_column :evaluations, :valeur_partage_part_resultat_salaries
    remove_column :evaluations, :valeur_partage_existence_grille_salariale
    remove_column :evaluations, :valeur_partage_publicite_grille
    remove_column :evaluations, :valeur_partage_ecart_revenus_hauts_bas
    remove_column :evaluations, :valeur_partage_index_egalite_homme_femme
    remove_column :evaluations, :valeur_estimation_realite
    remove_column :evaluations, :qualite_qvt_enquete_qvt
    remove_column :evaluations, :qualite_qvt_taux_qvt
    remove_column :evaluations, :qualite_qvt_part_cdi
    remove_column :evaluations, :qualite_qvt_moyenne_anciennete
    remove_column :evaluations, :qualite_qvt_taux_turnover
    remove_column :evaluations, :qualite_qvt_taux_absenteisme
    remove_column :evaluations, :qualite_emancipation_moyenne_heures_formation
    remove_column :evaluations, :qualite_emancipation_taux_budget_formation_masse_salariale
    remove_column :evaluations, :qualite_emancipation_taux_direction_promotion_interne
    remove_column :evaluations, :qualite_estimation_realite
    remove_column :evaluations, :impact_environnement_audit_impact
    remove_column :evaluations, :impact_environnement_demarche_ecologique
    remove_column :evaluations, :impact_environnement_part_energies_renouvelables
    remove_column :evaluations, :impact_environnement_part_salaries_mobilite
    remove_column :evaluations, :impact_environnement_discussion_impact
    remove_column :evaluations, :impact_environnement_bilan_carbone_scope_1
    remove_column :evaluations, :impact_environnement_bilan_carbone_scope_2
    remove_column :evaluations, :impact_environnement_bilan_carbone_scope_3
    remove_column :evaluations, :impact_social_part_activite_structures_insertion
    remove_column :evaluations, :impact_social_alternance_apprentissage
    remove_column :evaluations, :impact_social_part_seniors
    remove_column :evaluations, :impact_social_part_handicap
    remove_column :evaluations, :impact_engagement_part_resultat_missions_utiles
    remove_column :evaluations, :impact_engagement_part_placements_responsables
    remove_column :evaluations, :impact_engagement_part_impots_france
    remove_column :evaluations, :impact_engagement_demarche_ethique_fournisseurs
    remove_column :evaluations, :impact_estimation_realite
  end
end

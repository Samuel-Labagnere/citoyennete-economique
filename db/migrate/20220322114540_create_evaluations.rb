class CreateEvaluations < ActiveRecord::Migration[7.0]
  def change
    create_table :evaluations do |t|
      t.belongs_to :organisation

      t.integer :annee
      t.float :pouvoir_gouvernance_part_salaries_associes, null: true
      t.float :pouvoir_gouvernance_taux_societariat_femmes, null: true
      t.float :pouvoir_gouvernance_part_salaries_conseil, null: true
      t.float :pouvoir_gouvernance_part_femmes_conseil, null: true
      t.string :pouvoir_gouvernance_diversite_categories, null: true, array: true
      t.integer :pouvoir_democratie_nombre_reunions, null: true
      t.float :pouvoir_democratie_taux_participation_formations, null: true
      t.integer :pouvoir_democratie_nombre_accords_signes, null: true
      t.text :pouvoir_democratie_accords_signes, null: true
      t.float :pouvoir_strategique_taux_presence_assemblee, null: true
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
  end
end

# == Schema Information
#
# Table name: states
#
#  id                                                         :bigint           not null, primary key
#  impact_engagement_demarche_ethique_fournisseurs            :boolean
#  impact_engagement_part_impots_france                       :float
#  impact_engagement_part_placements_responsables             :float
#  impact_engagement_part_resultat_missions_utiles            :float
#  impact_environnement_audit_impact                          :boolean
#  impact_environnement_bilan_carbone_scope_1                 :boolean
#  impact_environnement_bilan_carbone_scope_2                 :boolean
#  impact_environnement_bilan_carbone_scope_3                 :boolean
#  impact_environnement_demarche_ecologique                   :boolean
#  impact_environnement_discussion_impact                     :boolean
#  impact_environnement_part_energies_renouvelables           :float
#  impact_environnement_part_salaries_mobilite                :float
#  impact_estimation_realite                                  :integer
#  impact_social_alternance_apprentissage                     :float
#  impact_social_part_activite_structures_insertion           :float
#  impact_social_part_handicap                                :float
#  impact_social_part_seniors                                 :float
#  pouvoir_democratie_accords_signes                          :text
#  pouvoir_democratie_nombre_accords_signes                   :integer
#  pouvoir_democratie_nombre_reunions                         :integer
#  pouvoir_democratie_taux_participation_formations           :float
#  pouvoir_estimation_realite                                 :integer
#  pouvoir_gouvernance_diversite_categories                   :string           is an Array
#  pouvoir_gouvernance_part_femmes_conseil                    :float
#  pouvoir_gouvernance_part_salaries_associes                 :float
#  pouvoir_gouvernance_part_salaries_conseil                  :float
#  pouvoir_gouvernance_taux_droits_vote_salaries              :float
#  pouvoir_gouvernance_taux_societariat_femmes                :float
#  pouvoir_strategique_actifs_total                           :float
#  pouvoir_strategique_implication_partage                    :float
#  pouvoir_strategique_taux_presence_assemblee                :float
#  qualite_emancipation_moyenne_heures_formation              :float
#  qualite_emancipation_taux_budget_formation_masse_salariale :float
#  qualite_emancipation_taux_direction_promotion_interne      :float
#  qualite_estimation_realite                                 :integer
#  qualite_qvt_enquete_qvt                                    :boolean
#  qualite_qvt_moyenne_anciennete                             :integer
#  qualite_qvt_part_cdi                                       :float
#  qualite_qvt_taux_absenteisme                               :float
#  qualite_qvt_taux_qvt                                       :float
#  qualite_qvt_taux_turnover                                  :float
#  valeur_estimation_realite                                  :integer
#  valeur_partage_ecart_revenus_hauts_bas                     :float
#  valeur_partage_existence_accord                            :boolean
#  valeur_partage_existence_epargne_salariale                 :boolean
#  valeur_partage_existence_grille_salariale                  :boolean
#  valeur_partage_index_egalite_homme_femme                   :integer
#  valeur_partage_part_resultat_net_actionnaires              :float
#  valeur_partage_part_resultat_salaries                      :float
#  valeur_partage_publicite_grille                            :boolean
#  valeur_perennite_attention_questions_innovation            :boolean
#  valeur_perennite_ebe_caht                                  :float
#  valeur_perennite_existence_reserve                         :boolean
#  valeur_perennite_part_capital_salaries                     :float
#  valeur_perennite_part_endettement                          :float
#  valeur_perennite_part_resultat_reserve                     :float
#  valeur_perennite_reserve_impartageable                     :boolean
#  created_at                                                 :datetime         not null
#  updated_at                                                 :datetime         not null
#  evaluation_id                                              :bigint
#  objectifs_list_id                                          :bigint
#
# Indexes
#
#  index_states_on_evaluation_id      (evaluation_id)
#  index_states_on_objectifs_list_id  (objectifs_list_id)
#
require "test_helper"

class IndicateursListTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

require "application_system_test_case"

class EvaluationsTest < ApplicationSystemTestCase
  setup do
    @evaluation = evaluations(:one)
  end

  test "visiting the index" do
    visit evaluations_url
    assert_selector "h1", text: "Evaluations"
  end

  test "should create evaluation" do
    visit evaluations_url
    click_on "New evaluation"

    fill_in "Annee", with: @evaluation.annee
    check "Impact engagement demarche ethique fournisseurs" if @evaluation.impact_engagement_demarche_ethique_fournisseurs
    fill_in "Impact engagement part impots france", with: @evaluation.impact_engagement_part_impots_france
    fill_in "Impact engagement part placements responsables", with: @evaluation.impact_engagement_part_placements_responsables
    fill_in "Impact engagement part resultat missions utiles", with: @evaluation.impact_engagement_part_resultat_missions_utiles
    check "Impact environnement audit impact" if @evaluation.impact_environnement_audit_impact
    check "Impact environnement bilan carbone scope 1" if @evaluation.impact_environnement_bilan_carbone_scope_1
    check "Impact environnement bilan carbone scope 2" if @evaluation.impact_environnement_bilan_carbone_scope_2
    check "Impact environnement bilan carbone scope 3" if @evaluation.impact_environnement_bilan_carbone_scope_3
    check "Impact environnement demarche ecologique" if @evaluation.impact_environnement_demarche_ecologique
    check "Impact environnement discussion impact" if @evaluation.impact_environnement_discussion_impact
    fill_in "Impact environnement part energies renouvelables", with: @evaluation.impact_environnement_part_energies_renouvelables
    fill_in "Impact environnement part salaries mobilite", with: @evaluation.impact_environnement_part_salaries_mobilite
    fill_in "Impact estimation realite", with: @evaluation.impact_estimation_realite
    fill_in "Impact social alternance apprentissage", with: @evaluation.impact_social_alternance_apprentissage
    fill_in "Impact social part activite structures insertion", with: @evaluation.impact_social_part_activite_structures_insertion
    fill_in "Impact social part handicap", with: @evaluation.impact_social_part_handicap
    fill_in "Impact social part seniors", with: @evaluation.impact_social_part_seniors
    fill_in "Pouvoir democratie accords signes", with: @evaluation.pouvoir_democratie_accords_signes
    fill_in "Pouvoir democratie nombre accords signes", with: @evaluation.pouvoir_democratie_nombre_accords_signes
    fill_in "Pouvoir democratie nombre reunions", with: @evaluation.pouvoir_democratie_nombre_reunions
    fill_in "Pouvoir democratie taux participation formations", with: @evaluation.pouvoir_democratie_taux_participation_formations
    fill_in "Pouvoir estimation realite", with: @evaluation.pouvoir_estimation_realite
    fill_in "Pouvoir gouvernance diversite categories", with: @evaluation.pouvoir_gouvernance_diversite_categories
    fill_in "Pouvoir gouvernance part femmes conseil", with: @evaluation.pouvoir_gouvernance_part_femmes_conseil
    fill_in "Pouvoir gouvernance part salaries associes", with: @evaluation.pouvoir_gouvernance_part_salaries_associes
    fill_in "Pouvoir gouvernance part salaries conseil", with: @evaluation.pouvoir_gouvernance_part_salaries_conseil
    fill_in "Pouvoir gouvernance taux societariat femmes", with: @evaluation.pouvoir_gouvernance_taux_societariat_femmes
    fill_in "Pouvoir strategique actifs total", with: @evaluation.pouvoir_strategique_actifs_total
    fill_in "Pouvoir strategique taux presence assemblee", with: @evaluation.pouvoir_strategique_taux_presence_assemblee
    fill_in "Qualite emancipation moyenne heures formation", with: @evaluation.qualite_emancipation_moyenne_heures_formation
    fill_in "Qualite emancipation taux budget formation masse salariale", with: @evaluation.qualite_emancipation_taux_budget_formation_masse_salariale
    fill_in "Qualite emancipation taux direction promotion interne", with: @evaluation.qualite_emancipation_taux_direction_promotion_interne
    fill_in "Qualite estimation realite", with: @evaluation.qualite_estimation_realite
    check "Qualite qvt enquete qvt" if @evaluation.qualite_qvt_enquete_qvt
    fill_in "Qualite qvt moyenne anciennete", with: @evaluation.qualite_qvt_moyenne_anciennete
    fill_in "Qualite qvt part cdi", with: @evaluation.qualite_qvt_part_cdi
    fill_in "Qualite qvt taux absenteisme", with: @evaluation.qualite_qvt_taux_absenteisme
    fill_in "Qualite qvt taux qvt", with: @evaluation.qualite_qvt_taux_qvt
    fill_in "Qualite qvt taux turnover", with: @evaluation.qualite_qvt_taux_turnover
    fill_in "Valeur estimation realite", with: @evaluation.valeur_estimation_realite
    fill_in "Valeur partage ecart revenus hauts bas", with: @evaluation.valeur_partage_ecart_revenus_hauts_bas
    check "Valeur partage existence accord" if @evaluation.valeur_partage_existence_accord
    check "Valeur partage existence epargne salariale" if @evaluation.valeur_partage_existence_epargne_salariale
    check "Valeur partage existence grille salariale" if @evaluation.valeur_partage_existence_grille_salariale
    fill_in "Valeur partage index egalite homme femme", with: @evaluation.valeur_partage_index_egalite_homme_femme
    fill_in "Valeur partage part resultat net actionnaires", with: @evaluation.valeur_partage_part_resultat_net_actionnaires
    fill_in "Valeur partage part resultat salaries", with: @evaluation.valeur_partage_part_resultat_salaries
    check "Valeur partage publicite grille" if @evaluation.valeur_partage_publicite_grille
    check "Valeur perennite attention questions innovation" if @evaluation.valeur_perennite_attention_questions_innovation
    fill_in "Valeur perennite ebe caht", with: @evaluation.valeur_perennite_ebe_caht
    check "Valeur perennite existence reserve" if @evaluation.valeur_perennite_existence_reserve
    fill_in "Valeur perennite part capital salaries", with: @evaluation.valeur_perennite_part_capital_salaries
    fill_in "Valeur perennite part endettement", with: @evaluation.valeur_perennite_part_endettement
    fill_in "Valeur perennite part resultat reserve", with: @evaluation.valeur_perennite_part_resultat_reserve
    check "Valeur perennite reserve impartageable" if @evaluation.valeur_perennite_reserve_impartageable
    click_on "Create Evaluation"

    assert_text "Evaluation was successfully created"
    click_on "Back"
  end

  test "should update Evaluation" do
    visit evaluation_url(@evaluation)
    click_on "Edit this evaluation", match: :first

    fill_in "Annee", with: @evaluation.annee
    check "Impact engagement demarche ethique fournisseurs" if @evaluation.impact_engagement_demarche_ethique_fournisseurs
    fill_in "Impact engagement part impots france", with: @evaluation.impact_engagement_part_impots_france
    fill_in "Impact engagement part placements responsables", with: @evaluation.impact_engagement_part_placements_responsables
    fill_in "Impact engagement part resultat missions utiles", with: @evaluation.impact_engagement_part_resultat_missions_utiles
    check "Impact environnement audit impact" if @evaluation.impact_environnement_audit_impact
    check "Impact environnement bilan carbone scope 1" if @evaluation.impact_environnement_bilan_carbone_scope_1
    check "Impact environnement bilan carbone scope 2" if @evaluation.impact_environnement_bilan_carbone_scope_2
    check "Impact environnement bilan carbone scope 3" if @evaluation.impact_environnement_bilan_carbone_scope_3
    check "Impact environnement demarche ecologique" if @evaluation.impact_environnement_demarche_ecologique
    check "Impact environnement discussion impact" if @evaluation.impact_environnement_discussion_impact
    fill_in "Impact environnement part energies renouvelables", with: @evaluation.impact_environnement_part_energies_renouvelables
    fill_in "Impact environnement part salaries mobilite", with: @evaluation.impact_environnement_part_salaries_mobilite
    fill_in "Impact estimation realite", with: @evaluation.impact_estimation_realite
    fill_in "Impact social alternance apprentissage", with: @evaluation.impact_social_alternance_apprentissage
    fill_in "Impact social part activite structures insertion", with: @evaluation.impact_social_part_activite_structures_insertion
    fill_in "Impact social part handicap", with: @evaluation.impact_social_part_handicap
    fill_in "Impact social part seniors", with: @evaluation.impact_social_part_seniors
    fill_in "Pouvoir democratie accords signes", with: @evaluation.pouvoir_democratie_accords_signes
    fill_in "Pouvoir democratie nombre accords signes", with: @evaluation.pouvoir_democratie_nombre_accords_signes
    fill_in "Pouvoir democratie nombre reunions", with: @evaluation.pouvoir_democratie_nombre_reunions
    fill_in "Pouvoir democratie taux participation formations", with: @evaluation.pouvoir_democratie_taux_participation_formations
    fill_in "Pouvoir estimation realite", with: @evaluation.pouvoir_estimation_realite
    fill_in "Pouvoir gouvernance diversite categories", with: @evaluation.pouvoir_gouvernance_diversite_categories
    fill_in "Pouvoir gouvernance part femmes conseil", with: @evaluation.pouvoir_gouvernance_part_femmes_conseil
    fill_in "Pouvoir gouvernance part salaries associes", with: @evaluation.pouvoir_gouvernance_part_salaries_associes
    fill_in "Pouvoir gouvernance part salaries conseil", with: @evaluation.pouvoir_gouvernance_part_salaries_conseil
    fill_in "Pouvoir gouvernance taux societariat femmes", with: @evaluation.pouvoir_gouvernance_taux_societariat_femmes
    fill_in "Pouvoir strategique actifs total", with: @evaluation.pouvoir_strategique_actifs_total
    fill_in "Pouvoir strategique taux presence assemblee", with: @evaluation.pouvoir_strategique_taux_presence_assemblee
    fill_in "Qualite emancipation moyenne heures formation", with: @evaluation.qualite_emancipation_moyenne_heures_formation
    fill_in "Qualite emancipation taux budget formation masse salariale", with: @evaluation.qualite_emancipation_taux_budget_formation_masse_salariale
    fill_in "Qualite emancipation taux direction promotion interne", with: @evaluation.qualite_emancipation_taux_direction_promotion_interne
    fill_in "Qualite estimation realite", with: @evaluation.qualite_estimation_realite
    check "Qualite qvt enquete qvt" if @evaluation.qualite_qvt_enquete_qvt
    fill_in "Qualite qvt moyenne anciennete", with: @evaluation.qualite_qvt_moyenne_anciennete
    fill_in "Qualite qvt part cdi", with: @evaluation.qualite_qvt_part_cdi
    fill_in "Qualite qvt taux absenteisme", with: @evaluation.qualite_qvt_taux_absenteisme
    fill_in "Qualite qvt taux qvt", with: @evaluation.qualite_qvt_taux_qvt
    fill_in "Qualite qvt taux turnover", with: @evaluation.qualite_qvt_taux_turnover
    fill_in "Valeur estimation realite", with: @evaluation.valeur_estimation_realite
    fill_in "Valeur partage ecart revenus hauts bas", with: @evaluation.valeur_partage_ecart_revenus_hauts_bas
    check "Valeur partage existence accord" if @evaluation.valeur_partage_existence_accord
    check "Valeur partage existence epargne salariale" if @evaluation.valeur_partage_existence_epargne_salariale
    check "Valeur partage existence grille salariale" if @evaluation.valeur_partage_existence_grille_salariale
    fill_in "Valeur partage index egalite homme femme", with: @evaluation.valeur_partage_index_egalite_homme_femme
    fill_in "Valeur partage part resultat net actionnaires", with: @evaluation.valeur_partage_part_resultat_net_actionnaires
    fill_in "Valeur partage part resultat salaries", with: @evaluation.valeur_partage_part_resultat_salaries
    check "Valeur partage publicite grille" if @evaluation.valeur_partage_publicite_grille
    check "Valeur perennite attention questions innovation" if @evaluation.valeur_perennite_attention_questions_innovation
    fill_in "Valeur perennite ebe caht", with: @evaluation.valeur_perennite_ebe_caht
    check "Valeur perennite existence reserve" if @evaluation.valeur_perennite_existence_reserve
    fill_in "Valeur perennite part capital salaries", with: @evaluation.valeur_perennite_part_capital_salaries
    fill_in "Valeur perennite part endettement", with: @evaluation.valeur_perennite_part_endettement
    fill_in "Valeur perennite part resultat reserve", with: @evaluation.valeur_perennite_part_resultat_reserve
    check "Valeur perennite reserve impartageable" if @evaluation.valeur_perennite_reserve_impartageable
    click_on "Update Evaluation"

    assert_text "Evaluation was successfully updated"
    click_on "Back"
  end

  test "should destroy Evaluation" do
    visit evaluation_url(@evaluation)
    click_on "Supprimer cette évaluation", match: :first

    assert_text "Evaluation was successfully destroyed"
  end
end

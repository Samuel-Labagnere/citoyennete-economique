# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_04_13_131847) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "evaluations", force: :cascade do |t|
    t.bigint "organisation_id"
    t.integer "annee"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "chiffre_affaires"
    t.float "resultat_net"
    t.integer "nombre_salaries"
    t.integer "nombre_salaries_etp"
    t.string "status", default: "blank"
    t.index ["organisation_id"], name: "index_evaluations_on_organisation_id"
  end

  create_table "invitation_codes", force: :cascade do |t|
    t.string "code"
    t.bigint "organisation_id", null: false
    t.datetime "expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organisation_id"], name: "index_invitation_codes_on_organisation_id"
  end

  create_table "objectifs_lists", force: :cascade do |t|
    t.bigint "organisation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organisation_id"], name: "index_objectifs_lists_on_organisation_id"
  end

  create_table "organisations", force: :cascade do |t|
    t.string "nom", null: false
    t.integer "statut_juridique", null: false
    t.integer "date_creation", null: false
    t.string "secteur_activite", null: false
    t.string "ape", null: false
    t.string "siren", null: false
    t.string "agrement_specifique"
    t.boolean "objectifs_extra_financiers"
    t.text "distinctions"
    t.string "valeurs_entreprise"
    t.boolean "validation_admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["siren"], name: "index_organisations_on_siren", unique: true
  end

  create_table "states", force: :cascade do |t|
    t.bigint "evaluation_id"
    t.bigint "objectifs_list_id"
    t.float "pouvoir_gouvernance_part_salaries_associes"
    t.float "pouvoir_gouvernance_taux_societariat_femmes"
    t.float "pouvoir_gouvernance_taux_droits_vote_salaries"
    t.float "pouvoir_gouvernance_part_salaries_conseil"
    t.float "pouvoir_gouvernance_part_femmes_conseil"
    t.string "pouvoir_gouvernance_diversite_categories", array: true
    t.integer "pouvoir_democratie_nombre_reunions"
    t.float "pouvoir_democratie_taux_participation_formations"
    t.integer "pouvoir_democratie_nombre_accords_signes"
    t.text "pouvoir_democratie_accords_signes"
    t.float "pouvoir_strategique_taux_presence_assemblee"
    t.float "pouvoir_strategique_implication_partage"
    t.float "pouvoir_strategique_actifs_total"
    t.integer "pouvoir_estimation_realite"
    t.float "valeur_perennite_part_capital_salaries"
    t.boolean "valeur_perennite_existence_reserve"
    t.boolean "valeur_perennite_reserve_impartageable"
    t.float "valeur_perennite_part_resultat_reserve"
    t.float "valeur_perennite_ebe_caht"
    t.float "valeur_perennite_part_endettement"
    t.boolean "valeur_perennite_attention_questions_innovation"
    t.float "valeur_partage_part_resultat_net_actionnaires"
    t.boolean "valeur_partage_existence_accord"
    t.boolean "valeur_partage_existence_epargne_salariale"
    t.float "valeur_partage_part_resultat_salaries"
    t.boolean "valeur_partage_existence_grille_salariale"
    t.boolean "valeur_partage_publicite_grille"
    t.float "valeur_partage_ecart_revenus_hauts_bas"
    t.integer "valeur_partage_index_egalite_homme_femme"
    t.integer "valeur_estimation_realite"
    t.boolean "qualite_qvt_enquete_qvt"
    t.float "qualite_qvt_taux_qvt"
    t.float "qualite_qvt_part_cdi"
    t.integer "qualite_qvt_moyenne_anciennete"
    t.float "qualite_qvt_taux_turnover"
    t.float "qualite_qvt_taux_absenteisme"
    t.float "qualite_emancipation_moyenne_heures_formation"
    t.float "qualite_emancipation_taux_budget_formation_masse_salariale"
    t.float "qualite_emancipation_taux_direction_promotion_interne"
    t.integer "qualite_estimation_realite"
    t.boolean "impact_environnement_audit_impact"
    t.boolean "impact_environnement_demarche_ecologique"
    t.float "impact_environnement_part_energies_renouvelables"
    t.float "impact_environnement_part_salaries_mobilite"
    t.boolean "impact_environnement_discussion_impact"
    t.boolean "impact_environnement_bilan_carbone_scope_1"
    t.boolean "impact_environnement_bilan_carbone_scope_2"
    t.boolean "impact_environnement_bilan_carbone_scope_3"
    t.float "impact_social_part_activite_structures_insertion"
    t.float "impact_social_alternance_apprentissage"
    t.float "impact_social_part_seniors"
    t.float "impact_social_part_handicap"
    t.float "impact_engagement_part_resultat_missions_utiles"
    t.float "impact_engagement_part_placements_responsables"
    t.float "impact_engagement_part_impots_france"
    t.boolean "impact_engagement_demarche_ethique_fournisseurs"
    t.integer "impact_estimation_realite"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "up_to_date", default: false
    t.index ["evaluation_id"], name: "index_states_on_evaluation_id"
    t.index ["objectifs_list_id"], name: "index_states_on_objectifs_list_id"
  end

  create_table "users", force: :cascade do |t|
    t.bigint "organisation_id"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_super_admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["organisation_id"], name: "index_users_on_organisation_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "invitation_codes", "organisations"
end

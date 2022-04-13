class ObjectifsListsController < ApplicationController
  before_action :check_super_admin, only: %i[ index ]
  before_action :authenticate_user!
  before_action :set_objectifs_list, only: %i[ show edit update destroy ]
  before_action :check_owner, only: %i[ show edit update destroy ]

  def index
    @objectifs_lists = ObjectifsList.all
  end

  def show
  end

  def new
    if current_user.organisation.objectifs_list.present?
      redirect_to user_root_path
    else
      @objectifs_list = ObjectifsList.new
      @objectifs_list.state = State.new
    end
  end

  def edit
  end

  def create
    @objectifs_list = ObjectifsList.new(objectifs_list_params)
    @objectifs_list = current_user.organisation.objectifs_list = @objectifs_list

    respond_to do |format|
      if @objectifs_list.save
        format.html { redirect_to objectifs_list_url(@objectifs_list), notice: I18n.t('notice.objectifs_list.create') }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @objectifs_list.update(objectifs_list_params)
        format.html { redirect_to objectifs_list_url(@objectifs_list), notice: I18n.t('notice.objectifs_list.update') }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @objectifs_list.destroy

    respond_to do |format|
      format.html { redirect_to user_root_path, notice: I18n.t('notice.objectifs_list.destroy') }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_objectifs_list
    @objectifs_list = ObjectifsList.includes(:state).find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def objectifs_list_params
    params.require(:objectifs_list).permit(indicateurs_list_attributes: [ :pouvoir_gouvernance_taux_droits_vote_salaries, {:pouvoir_gouvernance_diversite_categories => []}, :pouvoir_strategique_implication_partage, :pouvoir_gouvernance_part_salaries_associes, :pouvoir_gouvernance_taux_societariat_femmes, :pouvoir_gouvernance_part_salaries_conseil, :pouvoir_gouvernance_part_femmes_conseil, :pouvoir_gouvernance_diversite_categories, :pouvoir_democratie_nombre_reunions, :pouvoir_democratie_taux_participation_formations, :pouvoir_democratie_nombre_accords_signes, :pouvoir_democratie_accords_signes, :pouvoir_strategique_taux_presence_assemblee, :pouvoir_strategique_actifs_total, :pouvoir_estimation_realite, :valeur_perennite_part_capital_salaries, :valeur_perennite_existence_reserve, :valeur_perennite_reserve_impartageable, :valeur_perennite_part_resultat_reserve, :valeur_perennite_ebe_caht, :valeur_perennite_part_endettement, :valeur_perennite_attention_questions_innovation, :valeur_partage_part_resultat_net_actionnaires, :valeur_partage_existence_accord, :valeur_partage_existence_epargne_salariale, :valeur_partage_part_resultat_salaries, :valeur_partage_existence_grille_salariale, :valeur_partage_publicite_grille, :valeur_partage_ecart_revenus_hauts_bas, :valeur_partage_index_egalite_homme_femme, :valeur_estimation_realite, :qualite_qvt_enquete_qvt, :qualite_qvt_taux_qvt, :qualite_qvt_part_cdi, :qualite_qvt_moyenne_anciennete, :qualite_qvt_taux_turnover, :qualite_qvt_taux_absenteisme, :qualite_emancipation_moyenne_heures_formation, :qualite_emancipation_taux_budget_formation_masse_salariale, :qualite_emancipation_taux_direction_promotion_interne, :qualite_estimation_realite, :impact_environnement_audit_impact, :impact_environnement_demarche_ecologique, :impact_environnement_part_energies_renouvelables, :impact_environnement_part_salaries_mobilite, :impact_environnement_discussion_impact, :impact_environnement_bilan_carbone_scope_1, :impact_environnement_bilan_carbone_scope_2, :impact_environnement_bilan_carbone_scope_3, :impact_social_part_activite_structures_insertion, :impact_social_alternance_apprentissage, :impact_social_part_seniors, :impact_social_part_handicap, :impact_engagement_part_resultat_missions_utiles, :impact_engagement_part_placements_responsables, :impact_engagement_part_impots_france, :impact_engagement_demarche_ethique_fournisseurs, :impact_estimation_realite ])
  end

  def check_owner
    if current_user.organisation != @objectifs_list.organisation
      render(file: File.join(Rails.root, 'public/403.html'), status: 403, layout: false)
    end
  end
end

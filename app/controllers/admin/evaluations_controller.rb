class Admin::EvaluationsController < Admin::ApplicationController
  before_action :check_super_admin, only: %i[ index ]
  before_action :set_evaluation, only: %i[ show edit update destroy ]
  before_action :check_owner, only: %i[ show edit update destroy ]

  # GET /evaluations or /evaluations.json
  def index
    @evaluations = Evaluation.all
  end

  # GET /evaluations/1 or /evaluations/1.json
  def show
    add_breadcrumb @evaluation
  end


  # GET /evaluations/new
  def new
    add_breadcrumb 'Nouvelle évaluation'

    @evaluation = Evaluation.new
    @evaluation.state = State.new
  end

  # GET /evaluations/1/edit
  def edit
  end

  # POST /evaluations or /evaluations.json
  def create
    @evaluation = current_user.organisation.evaluations.new(evaluation_params)

    respond_to do |format|
      if @evaluation.save
        format.html { redirect_to evaluation_url(@evaluation), notice: I18n.t('notice.evaluation.create') }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /evaluations/1 or /evaluations/1.json
  def update
    respond_to do |format|
      if @evaluation.update(evaluation_params)
        format.html { redirect_to evaluation_url(@evaluation), notice: I18n.t('notice.evaluation.update') }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /evaluations/1 or /evaluations/1.json
  def destroy
    @evaluation.destroy

    respond_to do |format|
      format.html { redirect_to admin_path, notice: I18n.t('notice.evaluation.destroy') }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evaluation
      @evaluation = Evaluation.includes(:state).find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def evaluation_params
      params.require(:evaluation).permit(:annee, :chiffre_affaires, :resultat_net, :nombre_salaries, :nombre_salaries_etp, state_attributes: [ :pouvoir_gouvernance_taux_droits_vote_salaries, {:pouvoir_gouvernance_diversite_categories => []}, :pouvoir_strategique_implication_partage, :pouvoir_gouvernance_part_salaries_associes, :pouvoir_gouvernance_taux_societariat_femmes, :pouvoir_gouvernance_part_salaries_conseil, :pouvoir_gouvernance_part_femmes_conseil, :pouvoir_gouvernance_diversite_categories, :pouvoir_democratie_nombre_reunions, :pouvoir_democratie_taux_participation_formations, :pouvoir_democratie_nombre_accords_signes, :pouvoir_democratie_accords_signes, :pouvoir_strategique_taux_presence_assemblee, :pouvoir_strategique_actifs_total, :pouvoir_estimation_realite, :valeur_perennite_part_capital_salaries, :valeur_perennite_existence_reserve, :valeur_perennite_reserve_impartageable, :valeur_perennite_part_resultat_reserve, :valeur_perennite_ebe_caht, :valeur_perennite_part_endettement, :valeur_perennite_attention_questions_innovation, :valeur_partage_part_resultat_net_actionnaires, :valeur_partage_existence_accord, :valeur_partage_existence_epargne_salariale, :valeur_partage_part_resultat_salaries, :valeur_partage_existence_grille_salariale, :valeur_partage_publicite_grille, :valeur_partage_ecart_revenus_hauts_bas, :valeur_partage_index_egalite_homme_femme, :valeur_estimation_realite, :qualite_qvt_enquete_qvt, :qualite_qvt_taux_qvt, :qualite_qvt_part_cdi, :qualite_qvt_moyenne_anciennete, :qualite_qvt_taux_turnover, :qualite_qvt_taux_absenteisme, :qualite_emancipation_moyenne_heures_formation, :qualite_emancipation_taux_budget_formation_masse_salariale, :qualite_emancipation_taux_direction_promotion_interne, :qualite_estimation_realite, :impact_environnement_audit_impact, :impact_environnement_demarche_ecologique, :impact_environnement_part_energies_renouvelables, :impact_environnement_part_salaries_mobilite, :impact_environnement_discussion_impact, :impact_environnement_bilan_carbone_scope_1, :impact_environnement_bilan_carbone_scope_2, :impact_environnement_bilan_carbone_scope_3, :impact_social_part_activite_structures_insertion, :impact_social_alternance_apprentissage, :impact_social_part_seniors, :impact_social_part_handicap, :impact_engagement_part_resultat_missions_utiles, :impact_engagement_part_placements_responsables, :impact_engagement_part_impots_france, :impact_engagement_demarche_ethique_fournisseurs, :impact_estimation_realite ])
    end

    def check_owner
      if current_user.organisation != @evaluation.organisation
        render(file: File.join(Rails.root, 'public/403.html'), status: 403, layout: false)
      end
    end
end

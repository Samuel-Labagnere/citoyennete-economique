class OrganisationsController < ApplicationController
  before_action :check_super_admin, only: %i[ index show destroy ]
  before_action :authenticate_user!, except: %i[ public_list ]
  before_action :set_organisation, only: %i[ show edit update destroy ]
  before_action :check_owner, only: %i[ edit update ]

  # GET /organisations or /organisations.json
  def index
    @organisations = Organisation.all
  end

  def public_list
    @organisations = Organisation.all
  end

  # GET /organisations/1 or /organisations/1.json
  def show
  end

  # GET /organisations/new
  def new
    @organisation = Organisation.new
    if !current_user.organisation.nil? && !current_user.is_super_admin
      redirect_to root_path
    end
  end

  # GET /organisations/1/edit
  def edit
  end

  # POST /organisations or /organisations.json
  def create
    @organisation = Organisation.new(organisation_params)
    @organisation.validation_admin = true;

    respond_to do |format|
      if @organisation.save
        if !current_user.is_super_admin
          current_user.organisation = @organisation
          current_user.save
        end

        format.html { redirect_to user_root_path, notice: I18n.t('notice.organisation.create') }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organisations/1 or /organisations/1.json
  def update
    respond_to do |format|
      if @organisation.update(organisation_params)
        format.html { redirect_to edit_organisation_url(@organisation), notice: I18n.t('notice.organisation.update') }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organisations/1 or /organisations/1.json
  def destroy
    @organisation.destroy

    respond_to do |format|
      format.html { redirect_to organisations_url, notice: I18n.t('notice.organisation.destroy') }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organisation
      @organisation = Organisation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def organisation_params
      params.require(:organisation).permit(:nom, :statut_juridique, :date_creation, :secteur_activite, :ape, :siren, :nombre_salaries, :nombre_salaries_etp, :chiffre_affaires, :agrement_specifique, :objectifs_extra_fianciers, :distinctions, :valeurs_entreprise, :validation_admin)
    end

    def check_super_admin
      if !current_user || !current_user.is_super_admin
        render(file: File.join(Rails.root, 'public/403.html'), status: 403, layout: false)
      end
    end

    def check_owner
      if current_user.organisation != @organisation
        render(file: File.join(Rails.root, 'public/403.html'), status: 403, layout: false)
      end
    end
end

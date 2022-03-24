class OrganisationsController < ApplicationController
  before_action :check_super_admin, only: %i[ index show destroy ]
  before_action :authenticate_user!
  before_action :set_organisation, only: %i[ show edit update destroy ]

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

        format.html { redirect_to user_root_path, notice: "L'organisation a bien été créée." }
        format.json { render :show, status: :created, location: @organisation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @organisation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organisations/1 or /organisations/1.json
  def update
    respond_to do |format|
      if @organisation.update(organisation_params)
        format.html { redirect_to organisation_url(@organisation), notice: "Organisation was successfully updated." }
        format.json { render :show, status: :ok, location: @organisation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @organisation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organisations/1 or /organisations/1.json
  def destroy
    @organisation.destroy

    respond_to do |format|
      format.html { redirect_to organisations_url, notice: "Organisation was successfully destroyed." }
      format.json { head :no_content }
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
end

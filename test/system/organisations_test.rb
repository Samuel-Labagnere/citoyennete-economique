require "application_system_test_case"

class OrganisationsTest < ApplicationSystemTestCase
  setup do
    @organisation = organisations(:one)
  end

  test "visiting the index" do
    visit organisations_url
    assert_selector "h1", text: "Organisations"
  end

  test "should create organisation" do
    visit organisations_url
    click_on "New organisation"

    fill_in "Agrement specifique", with: @organisation.agrement_specifique
    fill_in "Ape", with: @organisation.ape
    fill_in "Chiffre affaires", with: @organisation.chiffre_affaires
    fill_in "Date creation", with: @organisation.date_creation
    fill_in "Distinctions", with: @organisation.distinctions
    fill_in "Nom", with: @organisation.nom
    fill_in "Nombre salaries", with: @organisation.nombre_salaries
    fill_in "Nombre salaries etp", with: @organisation.nombre_salaries_etp
    check "Objectifs extra financiers" if @organisation.objectifs_extra_fianciers
    fill_in "Secteur activite", with: @organisation.secteur_activite
    fill_in "Siren", with: @organisation.siren
    fill_in "Statut juridique", with: @organisation.statut_juridique
    fill_in "Valeurs entreprise", with: @organisation.valeurs_entreprise
    check "Validation admin" if @organisation.validation_admin
    click_on "Create Organisation"

    assert_text "Organisation was successfully created"
    click_on "Back"
  end

  test "should update Organisation" do
    visit organisation_url(@organisation)
    click_on "Edit this organisation", match: :first

    fill_in "Agrement specifique", with: @organisation.agrement_specifique
    fill_in "Ape", with: @organisation.ape
    fill_in "Chiffre affaires", with: @organisation.chiffre_affaires
    fill_in "Date crea", with: @organisation.date_creation
    fill_in "Distinctions", with: @organisation.distinctions
    fill_in "Nom", with: @organisation.nom
    fill_in "Nombre salaries", with: @organisation.nombre_salaries
    fill_in "Nombre salaries etp", with: @organisation.nombre_salaries_etp
    check "Objectifs extra fianciers" if @organisation.objectifs_extra_fianciers
    fill_in "Secteur activite", with: @organisation.secteur_activite
    fill_in "Siren", with: @organisation.siren
    fill_in "Statut juridique", with: @organisation.statut_juridique
    fill_in "Valeurs entreprise", with: @organisation.valeurs_entreprise
    check "Validation admin" if @organisation.validation_admin
    click_on "Update Organisation"

    assert_text "Organisation was successfully updated"
    click_on "Back"
  end

  test "should destroy Organisation" do
    visit organisation_url(@organisation)
    click_on "Destroy this organisation", match: :first

    assert_text "Organisation was successfully destroyed"
  end
end

class StatistiquesController < ApplicationController
  def simple_form_label(symbol)
    I18n.t("simple_form.labels.indicateurs_list." + symbol.to_s)
  end

  def index
    latest_years = []
    Organisation.all.each do |organisation|
      latest_years.push organisation.evaluations.pluck(:annee).max
    end
    latest_evaluations = Evaluation.where(annee: latest_years)
    latest_indicateurs_lists = IndicateursList.where(evaluation_id: latest_evaluations)

    @pouvoir_gouvernance_taux = {
      simple_form_label(:pouvoir_gouvernance_part_salaries_associes) => latest_indicateurs_lists.median(:pouvoir_gouvernance_part_salaries_associes),
      simple_form_label(:pouvoir_gouvernance_taux_societariat_femmes) => latest_indicateurs_lists.median(:pouvoir_gouvernance_taux_societariat_femmes),
      simple_form_label(:pouvoir_gouvernance_taux_droits_vote_salaries) => latest_indicateurs_lists.median(:pouvoir_gouvernance_taux_droits_vote_salaries),
      simple_form_label(:pouvoir_gouvernance_part_salaries_conseil) => latest_indicateurs_lists.median(:pouvoir_gouvernance_part_salaries_conseil),
      simple_form_label(:pouvoir_gouvernance_part_femmes_conseil) => latest_indicateurs_lists.median(:pouvoir_gouvernance_part_femmes_conseil)
    }

    @pouvoir_gouvernance_diversite_categories = {
      "Salariés" => latest_indicateurs_lists.where("'Salariés' = ANY (pouvoir_gouvernance_diversite_categories)").count,
      "Investisseurs" => latest_indicateurs_lists.where("'Investisseurs' = ANY (pouvoir_gouvernance_diversite_categories)").count,
      "Fournisseurs" => latest_indicateurs_lists.where("'Fournisseurs' = ANY (pouvoir_gouvernance_diversite_categories)").count,
      "Sous-traitants" => latest_indicateurs_lists.where("'Sous-traitans' = ANY (pouvoir_gouvernance_diversite_categories)").count,
      "Clients" => latest_indicateurs_lists.where("'Clients' = ANY (pouvoir_gouvernance_diversite_categories)").count,
      "Experts" => latest_indicateurs_lists.where("'Experts' = ANY (pouvoir_gouvernance_diversite_categories)").count,
      "Syndicats" => latest_indicateurs_lists.where("'Syndicats' = ANY (pouvoir_gouvernance_diversite_categories)").count,
      "Pouvoirs publics" => latest_indicateurs_lists.where("'Pouvoirs publics' = ANY (pouvoir_gouvernance_diversite_categories)").count,
      "Associations" => latest_indicateurs_lists.where("'Associations' = ANY (pouvoir_gouvernance_diversite_categories)").count,
      "Grand public" => latest_indicateurs_lists.where("'Grand public' = ANY (pouvoir_gouvernance_diversite_categories)").count,
      "Autres" => latest_indicateurs_lists.where("'Autres' = ANY (pouvoir_gouvernance_diversite_categories)").count
    }

    @pouvoir_democratie_nombres = {
      simple_form_label(:pouvoir_democratie_nombre_reunions) => latest_indicateurs_lists.median(:pouvoir_democratie_nombre_reunions),
      simple_form_label(:pouvoir_democratie_nombre_accords_signes) => latest_indicateurs_lists.median(:pouvoir_democratie_nombre_accords_signes)
    }

    @pouvoir_democratie_taux_participation_formations = latest_indicateurs_lists.median(:pouvoir_democratie_taux_participation_formations)

    @pouvoir_strategique_taux = {
      simple_form_label(:pouvoir_strategique_taux_presence_assemblee) => latest_indicateurs_lists.median(:pouvoir_strategique_taux_presence_assemblee),
      simple_form_label(:pouvoir_strategique_implication_partage) => latest_indicateurs_lists.median(:pouvoir_strategique_implication_partage),
      simple_form_label(:pouvoir_strategique_actifs_total) => latest_indicateurs_lists.median(:pouvoir_strategique_actifs_total)
    }
  end
end

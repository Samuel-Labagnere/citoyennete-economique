class StatistiquesController < ApplicationController
  def index
    latest_years = []
    Organisation.all.each do |organisation|
      latest_years.push organisation.evaluations.pluck(:annee).max
    end
    latest_evaluations = Evaluation.where(annee: latest_years)

    @pouvoir_gouvernance_taux = {
      "Part de salariés associés" => latest_evaluations.median(:pouvoir_gouvernance_part_salaries_associes),
      "Taux de sociétariat parmi les femmes salariées" => latest_evaluations.median(:pouvoir_gouvernance_taux_societariat_femmes),
      "Taux des droits de vote détnus par les salariés" => latest_evaluations.median(:pouvoir_gouvernance_taux_droits_vote_salaries),
      "Part de salariés participant au conseil d'administration ou de surveillance" => Evaluation.median(:pouvoir_gouvernance_part_salaries_conseil),
      "Part de femmes au conseil d'administration" => latest_evaluations.median(:pouvoir_gouvernance_part_femmes_conseil)
    }

    @pouvoir_gouvernance_diversite_categories = {
      "Salariés" => latest_evaluations.where("'Salariés' = ANY (pouvoir_gouvernance_diversite_categories)").count,
      "Investisseurs" => latest_evaluations.where("'Investisseurs' = ANY (pouvoir_gouvernance_diversite_categories)").count,
      "Fournisseurs" => latest_evaluations.where("'Fournisseurs' = ANY (pouvoir_gouvernance_diversite_categories)").count,
      "Sous-traitants" => latest_evaluations.where("'Sous-traitans' = ANY (pouvoir_gouvernance_diversite_categories)").count,
      "Clients" => latest_evaluations.where("'Clients' = ANY (pouvoir_gouvernance_diversite_categories)").count,
      "Experts" => latest_evaluations.where("'Experts' = ANY (pouvoir_gouvernance_diversite_categories)").count,
      "Syndicats" => latest_evaluations.where("'Syndicats' = ANY (pouvoir_gouvernance_diversite_categories)").count,
      "Pouvoirs publics" => latest_evaluations.where("'Pouvoirs publics' = ANY (pouvoir_gouvernance_diversite_categories)").count,
      "Associations" => latest_evaluations.where("'Associations' = ANY (pouvoir_gouvernance_diversite_categories)").count,
      "Grand public" => latest_evaluations.where("'Grand public' = ANY (pouvoir_gouvernance_diversite_categories)").count,
      "Autres" => latest_evaluations.where("'Autres' = ANY (pouvoir_gouvernance_diversite_categories)").count
    }

    @pouvoir_democratie_nombres = {
      "Nombre annuel de réunion des salariés et des associés par la gourvernance" => latest_evaluations.median(:pouvoir_democratie_nombre_reunions),
      "Nombre d'accords signés entre les représentants du personnel et la direction" => latest_evaluations.median(:pouvoir_democratie_nombre_accords_signes)
    }

    @pouvoir_democratie_taux_participation_formations = latest_evaluations.median(:pouvoir_democratie_taux_participation_formations)

    @pouvoir_strategique_taux = {
      "Taux de présence des salariés associés en assemblée générale" => latest_evaluations.median(:pouvoir_strategique_taux_presence_assemblee),
      "Part de salariés impliqués dans une intance contribuant au partage du pouvoir et des décisions" => latest_evaluations.median(:pouvoir_strategique_implication_partage),
      "Taux de salariés actifs" => latest_evaluations.median(:pouvoir_strategique_actifs_total)
    }
  end
end

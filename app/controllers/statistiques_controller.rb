class StatistiquesController < ApplicationController
  def index
    latest_years = []
    Organisation.all.each do |organisation|
      latest_years.push organisation.evaluations.pluck(:annee).max
    end
    latest_evaluations = Evaluation.where(annee: latest_years)

    @pouvoir_gouvernance = {
      "Part de salariés associés" => latest_evaluations.median(:pouvoir_gouvernance_part_salaries_associes),
      "Taux de sociétariat parmi les femmes salariées" => latest_evaluations.median(:pouvoir_gouvernance_taux_societariat_femmes),
      "Taux des droits de vote détnus par les salariés" => latest_evaluations.median(:pouvoir_gouvernance_taux_droits_vote_salaries),
      "Part de salariés participant au conseil d'administration ou de surveillance" => Evaluation.median(:pouvoir_gouvernance_part_salaries_conseil),
      "Part de femmes au conseil d'administration" => latest_evaluations.median(:pouvoir_gouvernance_part_femmes_conseil)
    }
  end
end

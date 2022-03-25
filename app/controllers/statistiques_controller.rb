class StatistiquesController < ApplicationController
  def index
    @pouvoir_gouvernance = {
      "Part de salariés associés" => Evaluation.median(:pouvoir_gouvernance_part_salaries_associes),
      "Taux de sociétariat parmi les femmes salariées" => Evaluation.median(:pouvoir_gouvernance_taux_societariat_femmes),
      "Taux des droits de vote détnus par les salariés" => Evaluation.median(:pouvoir_gouvernance_taux_droits_vote_salaries),
      "Part de salariés participant au conseil d'administration ou de surveillance" => Evaluation.median(:pouvoir_gouvernance_part_salaries_conseil),
      "Part de femmes au conseil d'administration" => Evaluation.median(:pouvoir_gouvernance_part_femmes_conseil)
    }
  end
end

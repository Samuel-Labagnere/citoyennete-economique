class StatistiquesController < ApplicationController
  before_action :set_vars

  def set_vars
    $latest_years = []
    Organisation.all.each do |organisation|
      $latest_years.push organisation.evaluations.pluck(:annee).max
    end
    $latest_evaluations = Evaluation.where(annee: $latest_years)
    $latest_indicateurs_lists = IndicateursList.where(evaluation_id: $latest_evaluations)
  end

  def index
  end

  def pil1
    @pouvoir_gouvernance_taux = {
      helpers.indicateur_clean(:pouvoir_gouvernance_part_salaries_associes) => $latest_indicateurs_lists.median(:pouvoir_gouvernance_part_salaries_associes),
      helpers.indicateur_clean(:pouvoir_gouvernance_taux_societariat_femmes) => $latest_indicateurs_lists.median(:pouvoir_gouvernance_taux_societariat_femmes),
      helpers.indicateur_clean(:pouvoir_gouvernance_taux_droits_vote_salaries) => $latest_indicateurs_lists.median(:pouvoir_gouvernance_taux_droits_vote_salaries),
      helpers.indicateur_clean(:pouvoir_gouvernance_part_femmes_conseil) => $latest_indicateurs_lists.median(:pouvoir_gouvernance_part_femmes_conseil)
    }

    @pouvoir_gouvernance_part_salaries_conseil = {
      :pouvoir_gouvernance_part_salaries_conseil => $latest_indicateurs_lists.median(:pouvoir_gouvernance_part_salaries_conseil)
    }

    @pouvoir_gouvernance_diversite_categories = {
      "Salariés" => $latest_indicateurs_lists.where("'Salariés' = ANY (pouvoir_gouvernance_diversite_categories)").count,
      "Investisseurs" => $latest_indicateurs_lists.where("'Investisseurs' = ANY (pouvoir_gouvernance_diversite_categories)").count,
      "Fournisseurs" => $latest_indicateurs_lists.where("'Fournisseurs' = ANY (pouvoir_gouvernance_diversite_categories)").count,
      "Sous-traitants" => $latest_indicateurs_lists.where("'Sous-traitans' = ANY (pouvoir_gouvernance_diversite_categories)").count,
      "Clients" => $latest_indicateurs_lists.where("'Clients' = ANY (pouvoir_gouvernance_diversite_categories)").count,
      "Experts" => $latest_indicateurs_lists.where("'Experts' = ANY (pouvoir_gouvernance_diversite_categories)").count,
      "Syndicats" => $latest_indicateurs_lists.where("'Syndicats' = ANY (pouvoir_gouvernance_diversite_categories)").count,
      "Pouvoirs publics" => $latest_indicateurs_lists.where("'Pouvoirs publics' = ANY (pouvoir_gouvernance_diversite_categories)").count,
      "Associations" => $latest_indicateurs_lists.where("'Associations' = ANY (pouvoir_gouvernance_diversite_categories)").count,
      "Grand public" => $latest_indicateurs_lists.where("'Grand public' = ANY (pouvoir_gouvernance_diversite_categories)").count,
      "Autres" => $latest_indicateurs_lists.where("'Autres' = ANY (pouvoir_gouvernance_diversite_categories)").count
    }

    @pouvoir_democratie_nombres = {
      helpers.indicateur_clean(:pouvoir_democratie_nombre_reunions) => $latest_indicateurs_lists.median(:pouvoir_democratie_nombre_reunions),
      helpers.indicateur_clean(:pouvoir_democratie_nombre_accords_signes) => $latest_indicateurs_lists.median(:pouvoir_democratie_nombre_accords_signes)
    }

    @pouvoir_democratie_taux_participation_formations = $latest_indicateurs_lists.median(:pouvoir_democratie_taux_participation_formations)

    @pouvoir_strategique_taux = {
      :pouvoir_strategique_taux_presence_assemblee => $latest_indicateurs_lists.median(:pouvoir_strategique_taux_presence_assemblee),
      :pouvoir_strategique_implication_partage => $latest_indicateurs_lists.median(:pouvoir_strategique_implication_partage),
      :pouvoir_strategique_actifs_total => $latest_indicateurs_lists.median(:pouvoir_strategique_actifs_total)
    }

    @pouvoir_democratie_nombres = {
      :pouvoir_democratie_nombre_reunions => $latest_indicateurs_lists.median(:pouvoir_democratie_nombre_reunions),
      :pouvoir_democratie_nombre_accords_signes => $latest_indicateurs_lists.median(:pouvoir_democratie_nombre_accords_signes)
    }
  end

  def pil2
    @valeur_perennite_booleens = {}

    valeur_perennite_existence_reserve_true = $latest_indicateurs_lists.where(valeur_perennite_existence_reserve: true).count
    valeur_perennite_existence_reserve_false = $latest_indicateurs_lists.where(valeur_perennite_existence_reserve: false).count
    valeur_perennite_reserve_impartageable_false = $latest_indicateurs_lists.where(valeur_perennite_reserve_impartageable: false).count
    valeur_perennite_reserve_impartageable_true = $latest_indicateurs_lists.where(valeur_perennite_reserve_impartageable: true).count
    valeur_perennite_attention_questions_innovation_false = $latest_indicateurs_lists.where(valeur_perennite_attention_questions_innovation: false).count
    valeur_perennite_attention_questions_innovation_true = $latest_indicateurs_lists.where(valeur_perennite_attention_questions_innovation: true).count

    valeur_perennite_existence_reserve_somme = valeur_perennite_existence_reserve_true + valeur_perennite_existence_reserve_false
    valeur_perennite_reserve_impartageable_somme = valeur_perennite_reserve_impartageable_true + valeur_perennite_reserve_impartageable_false
    valeur_perennite_attention_questions_innovation_somme = valeur_perennite_attention_questions_innovation_true + valeur_perennite_attention_questions_innovation_false

    if valeur_perennite_existence_reserve_somme > 0
      @valeur_perennite_booleens[:valeur_perennite_existence_reserve] = {
        helpers.indicateur_clean(:valeur_perennite_existence_reserve) => (valeur_perennite_existence_reserve_true / valeur_perennite_existence_reserve_somme * 100),
        helpers.negative_indicateur(:valeur_perennite_existence_reserve) => (valeur_perennite_existence_reserve_false / valeur_perennite_existence_reserve_somme * 100)
      }
    end

    if valeur_perennite_reserve_impartageable_somme > 0
      @valeur_perennite_booleens[:valeur_perennite_reserve_impartageable] = {
        helpers.indicateur_clean(:valeur_perennite_reserve_impartageable) => (valeur_perennite_reserve_impartageable_true / valeur_perennite_reserve_impartageable_somme * 100),
        helpers.negative_indicateur(:valeur_perennite_reserve_impartageable) => (valeur_perennite_reserve_impartageable_false / valeur_perennite_reserve_impartageable_somme * 100)
      }
    end

    if valeur_perennite_attention_questions_innovation_somme > 0
      @valeur_perennite_booleens[:valeur_perennite_attention_questions_innovation] = {
        helpers.indicateur_clean(:valeur_perennite_attention_questions_innovation) => (valeur_perennite_attention_questions_innovation_true / valeur_perennite_attention_questions_innovation_somme * 100),
        helpers.negative_indicateur(:valeur_perennite_attention_questions_innovation) => (valeur_perennite_attention_questions_innovation_false / valeur_perennite_attention_questions_innovation_somme * 100)
      }

      @valeur_part_resultat = {
        helpers.indicateur_clean(:valeur_partage_part_resultat_net_actionnaires) => $latest_indicateurs_lists.median(:valeur_partage_part_resultat_net_actionnaires),
        helpers.indicateur_clean(:valeur_partage_part_resultat_salaries) => $latest_indicateurs_lists.median(:valeur_partage_part_resultat_salaries)
      }

      @valeur_partage_ecart_revenus_hauts_bas = $latest_indicateurs_lists.median(:valeur_partage_ecart_revenus_hauts_bas)
      @valeur_partage_index_egalite_homme_femme = $latest_indicateurs_lists.median(:valeur_partage_index_egalite_homme_femme)

      @valeur_partage_booleens = {}

      valeur_partage_existence_accord_false = $latest_indicateurs_lists.where(valeur_partage_existence_accord: false).count
      valeur_partage_existence_accord_true = $latest_indicateurs_lists.where(valeur_partage_existence_accord: true).count
      valeur_partage_existence_accord_somme = valeur_partage_existence_accord_true + valeur_partage_existence_accord_false
      valeur_partage_existence_epargne_salariale_false = $latest_indicateurs_lists.where(valeur_partage_existence_epargne_salariale: false).count
      valeur_partage_existence_epargne_salariale_true = $latest_indicateurs_lists.where(valeur_partage_existence_epargne_salariale: true).count
      valeur_partage_existence_epargne_salariale_somme = valeur_partage_existence_epargne_salariale_true + valeur_partage_existence_epargne_salariale_false
      valeur_partage_existence_grille_salariale_false = $latest_indicateurs_lists.where(valeur_partage_existence_grille_salariale: false).count
      valeur_partage_existence_grille_salariale_true = $latest_indicateurs_lists.where(valeur_partage_existence_grille_salariale: true).count
      valeur_partage_existence_grille_salariale_somme = valeur_partage_existence_grille_salariale_true + valeur_partage_existence_grille_salariale_false
      valeur_partage_publicite_grille_false = $latest_indicateurs_lists.where(valeur_partage_publicite_grille: false).count
      valeur_partage_publicite_grille_true = $latest_indicateurs_lists.where(valeur_partage_publicite_grille: true).count
      valeur_partage_publicite_grille_somme = valeur_partage_publicite_grille_true + valeur_partage_publicite_grille_false

      if valeur_partage_existence_accord_somme > 0
        @valeur_partage_booleens = {
          helpers.indicateur_clean(:valeur_partage_existence_accord) => (valeur_partage_existence_accord_true / valeur_partage_existence_accord_somme * 100),
          helpers.negative_indicateur(:valeur_partage_existence_accord) => (valeur_partage_existence_accord_false / valeur_partage_existence_accord_somme * 100)
        }
      end

      if valeur_partage_existence_epargne_salariale_somme > 0
        @valeur_partage_booleens = {
          helpers.indicateur_clean(:valeur_partage_existence_epargne_salariale) => (valeur_partage_existence_epargne_salariale_true / valeur_partage_existence_epargne_salariale_somme * 100),
          helpers.negative_indicateur(:valeur_partage_existence_epargne_salariale) => (valeur_partage_existence_epargne_salariale_false / valeur_partage_existence_epargne_salariale_somme * 100)
        }
      end

      if valeur_partage_existence_grille_salariale_somme > 0
        @valeur_partage_booleens = {
          helpers.indicateur_clean(:valeur_partage_existence_grille_salariale) => (valeur_partage_existence_grille_salariale_true / valeur_partage_existence_grille_salariale_somme * 100),
          helpers.negative_indicateur(:valeur_partage_existence_grille_salariale) => (valeur_partage_existence_grille_salariale_false / valeur_partage_existence_grille_salariale_somme * 100)
        }
      end

      if valeur_partage_publicite_grille_somme > 0
        @valeur_partage_booleens = {
          helpers.indicateur_clean(:valeur_partage_publicite_grille) => (valeur_partage_publicite_grille_true / valeur_partage_publicite_grille_somme * 100),
          helpers.negative_indicateur(:valeur_partage_publicite_grille) => (valeur_partage_publicite_grille_false / valeur_partage_publicite_grille_somme * 100)
        }
      end
    end

    # @valeur_perennite_booleens = {
    #   :valeur_perennite_existence_reserve => [
    #     ($latest_indicateurs_lists.where(valeur_perennite_existence_reserve: false).count / $latest_indicateurs_lists.where.not(valeur_perennite_existence_reserve: nil).count * 100),
    #     ($latest_indicateurs_lists.where(valeur_perennite_existence_reserve: true).count / $latest_indicateurs_lists.where.not(valeur_perennite_existence_reserve: nil).count * 100) 
    #   ],
    #   :valeur_perennite_reserve_impartageable => [
    #     ($latest_indicateurs_lists.where(valeur_perennite_reserve_impartageable: false).count / $latest_indicateurs_lists.where.not(valeur_perennite_reserve_impartageable: nil).count * 100),
    #     ($latest_indicateurs_lists.where(valeur_perennite_reserve_impartageable: true).count / $latest_indicateurs_lists.where.not(valeur_perennite_reserve_impartageable: nil).count * 100)
    #   ],
    #   :valeur_perennite_attention_questions_innovation => [
    #     ($latest_indicateurs_lists.where(valeur_perennite_attention_questions_innovation: false).count / $latest_indicateurs_lists.where.not(valeur_perennite_attention_questions_innovation: nil) * 100),
    #     ($latest_indicateurs_lists.where(valeur_perennite_attention_questions_innovation: true).count / $latest_indicateurs_lists.where.not(valeur_perennite_attention_questions_innovation: nil) * 100)
    #   ]
    # }
  end

  def pil3
  end

  def pil4
  end
end

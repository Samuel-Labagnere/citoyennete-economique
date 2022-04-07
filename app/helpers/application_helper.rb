module ApplicationHelper
  def indicateur_clean(symbol)
    I18n.t("activerecord.attributes.indicateurs_list." + symbol.to_s)
  end

  def negative_indicateur(symbol)
    I18n.t("negative_indicateurs." + symbol.to_s)
  end

  def has_any_indicateur(evaluation, *indicateurs)
    result = false
    indicateurs.each do |indicateur|
      if not evaluation.indicateurs_list[indicateur].nil?
        result = true
      end
    end
    return result
  end
end

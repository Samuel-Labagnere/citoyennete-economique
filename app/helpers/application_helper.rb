module ApplicationHelper
  def indicateur_clean(symbol)
    I18n.t("activerecord.attributes.indicateurs_list." + symbol.to_s)
  end
end

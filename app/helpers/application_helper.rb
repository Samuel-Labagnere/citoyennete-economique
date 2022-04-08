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
  
  def single_value_pie_chart(value, suffix: nil, max: nil)
    suffix ||= "%"
    max ||= 100

    data = {
      "value" => value,
      "remainder" => (max - value)
    }

    pie_chart data,
    donut: true, legend: false, colors: ["#2E3092", "#ECD1D8"], 
    library: { 
      events: [],
      plugins: {
        donut_text: {
          text: "#{value}#{suffix}"
        }
      }
    }
  end

  # def single_value_pie_chart(value, suffix: nil, max: nil)
  #   suffix ||= "%"
  #   max ||= 100

  #   data = {
  #     "value" => value,
  #     "remainder" => (max - value)
  #   }

  #   chart = pie_chart data,
  #     donut: true, suffix: "%", colors: ["#2E3092", "#ECD1D8"], 
  #     library: { 
  #       plugins: {
  #         tooltip: {
  #           filter: "__fn__tooltipFilter"
  #         },
  #         legend: {
  #           labels: {
  #             filter: "__fn__legendFilter"
  #           }
  #         }
  #       }
  #     }
    
  #   chart["\"__fn__tooltipFilter\""]= raw "function(a) {
  #     return a.dataIndex === 0;
  #   }"

  #   chart["\"__fn__legendFilter\""]= raw "function(legendItem) {
  #     return legendItem.index === 0;
  #   }"

  #   return chart
  # end
end

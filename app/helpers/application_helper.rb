module ApplicationHelper
  def indicateur_clean(symbol)
    I18n.t("activerecord.attributes.state." + symbol.to_s)
  end

  def negative_indicateur(symbol)
    I18n.t("negative_indicateurs." + symbol.to_s)
  end

  def single_value_pie_chart(value, suffix: nil, max: nil)
    suffix ||= "%"
    max ||= 100

    if value.present?
      value = value.round

      data = {
        "value" => value,
        "remainder" => (max - value)
      }
    else
      data = {}
    end

    pie_chart data,
              donut: true,
              legend: false,
              colors: ["#2E3092", "#B4A9A6"],
              library: {
                events: [],
                plugins: {
                  donut_text: {
                    text: "#{value}#{suffix}"
                  }
                }
              }
  end

  def boolean_state_field(state, field)
    state[field] ? indicateur_clean(field) : negative_indicateur(field) unless field.nil?
  end


  def evo_value_pie_chart(value, old_value, suffix: nil, max: nil)
    suffix ||= "%"
    max ||= 100

    difference = value - old_value
    if difference >= 0
      difference_color = "#198754"
      slice1 = value - difference
      slice2 = difference
      remainder = max - value
    else
      difference_color = "#dc3545"
      slice1 = value
      slice2 = difference.abs
      remainder = max - old_value
    end

    data = {
      "slice1" => slice1,
      "slice2" => slice2,
      "remainder" => remainder
    }

    pie_chart data,
    donut: true, legend: false, colors: ["#2E3092", difference_color, "#ECD1D8"],
    library: {
      events: [],
      plugins: {
        donut_text: {
          texts: [
            {
              text: value.to_s + "%",
              font: {
                size: "30"
              },
              color: "black"
            },
            {
              text: sprintf("%+.1f", difference) + "%",
              font: {
                size: "20"
              },
              color: difference_color
            },
          ]
        }
      }
    }
  end
end

module ResultatsHelper
  def single_value_pie_chart(value, suffix: nil, max: nil)
    suffix ||= "%"
    max ||= 100

    data = {
      "value" => value,
      "remainder" => (max - value)
    }

    pie_chart data,
    donut: true, legend: false, colors: ["#007A78", "#C7C2C3"], 
    library: { 
      plugins: {
        tooltip: {
          enabled: false
        },
        donut_text: {
          text: "#{value}#{suffix}"
        }
      }
    }
  end
end

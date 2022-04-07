module ResultatsHelper
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
end

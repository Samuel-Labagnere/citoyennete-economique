// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"

// chart.js plugin for putting text in donut center
import Chart from 'chart.js/auto';
Chart.register({
  id: 'donut_text',
  beforeDraw: function(chart, args, options) {
    if(options.text) {
      var width = chart.width,
      height = chart.height,
      ctx = chart.ctx;

      ctx.restore();
      var fontSize = (height / 114).toFixed(2);
      ctx.font = fontSize + "em sans-serif";
      ctx.textBaseline = "middle";

      var text = options.text,
        textX = Math.round((width - ctx.measureText(text).width) / 2),
        textY = height / 2;

      ctx.fillText(text, textX, textY);
      ctx.save();
    }
  }
});

import "chartkick/chart.js"
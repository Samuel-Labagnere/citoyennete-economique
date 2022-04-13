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
      if(width <= 310) {
        var fontSize = (width / 114).toFixed(2);
      } else {
        var fontSize = (height / 114).toFixed(2);
      }
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

// import { resolve, valueOrDefault, toLineHeight, isNullOrUndef } from 'chart.js/helpers';

// var utils = {

// 	parseFont: function(value) {
// 		var size = valueOrDefault(value.size, Chart.defaults.font.size);
// 		var font = {
// 			family: valueOrDefault(value.family, Chart.defaults.font.family),
// 			lineHeight: toLineHeight(value.lineHeight, size),
// 			size: size,
// 			style: valueOrDefault(value.style, Chart.defaults.font.style),
// 			weight: valueOrDefault(value.weight, null),
// 			string: ''
// 		};

// 		font.string = utils.toFontString(font);
// 		return font;
// 	},

// 	toFontString: function(font) {
// 		if (!font || isNullOrUndef(font.size) || isNullOrUndef(font.family)) {
// 			return null;
// 		}

// 		return (font.style ? font.style + ' ' : '')
// 			+ (font.weight ? font.weight + ' ' : '')
// 			+ font.size + 'px '
// 			+ font.family;
// 	},

// 	textSize: function(ctx, labels) {
// 		var items = [].concat(labels);
// 		var ilen = items.length;
// 		var prev = ctx.font;
// 		var width = 0;
// 		var height = 0;
// 		var i;

// 		for (i = 0; i < ilen; ++i) {
// 			ctx.font = items[i].font.string;
// 			width = Math.max(ctx.measureText(items[i].text).width, width);
// 			height += items[i].font.lineHeight;
// 		}

// 		ctx.font = prev;

// 		var result = {
// 			height: height,
// 			width: width
// 		};
// 		return result;
// 	}

// };

// Chart.register({
//   id: 'donut_text',
//   beforeDraw: function(chart, args, options) {
//     if(options.texts) {
//       var ctx = chart.ctx;

//       var innerLabels = [];
//       options.texts.forEach(function(label) {
//         var text = typeof(label.text) === 'function' ? label.text(chart) : label.text;
//         var innerLabel = {
//           text: text,
//           font: utils.parseFont(resolve([label.font, options.font, {}], ctx, 0)),
//           color: resolve([label.color, options.color, Chart.defaults.color], ctx, 0)
//         };
//         innerLabels.push(innerLabel);
//       });

//       var textAreaSize = utils.textSize(ctx, innerLabels);

//       // Calculate the adjustment ratio to fit the text area into the doughnut inner circle
//       var hypotenuse = Math.sqrt(Math.pow(textAreaSize.width, 2) + Math.pow(textAreaSize.height, 2));
//       var innerDiameter = chart.innerRadius * 2;
//       var fitRatio = innerDiameter / hypotenuse;

//       // Adjust the font if necessary and recalculate the text area after applying the fit ratio
//       if (fitRatio < 1) {
//         innerLabels.forEach(function(innerLabel) {
//           innerLabel.font.size = Math.floor(innerLabel.font.size * fitRatio);
//           innerLabel.font.lineHeight = undefined;
//           innerLabel.font = utils.parseFont(resolve([innerLabel.font, {}], ctx, 0));
//         });

//         textAreaSize = utils.textSize(ctx, innerLabels);
//       }

//       ctx.textAlign = 'center';
//       ctx.textBaseline = 'middle';

//       // The center of the inner circle
//       var centerX = ((chart.chartArea.left + chart.chartArea.right) / 2);
//       var centerY = ((chart.chartArea.top + chart.chartArea.bottom) / 2);

//       // The top Y coordinate of the text area
//       var topY = centerY - textAreaSize.height / 2;

//       var i;
//       var ilen = innerLabels.length;
//       var currentHeight = 0;
//       for (i = 0; i < ilen; ++i) {
//         ctx.fillStyle = innerLabels[i].color;
//         ctx.font = innerLabels[i].font.string;

//         // The Y center of each line
//         var lineCenterY = topY + innerLabels[i].font.lineHeight / 2 + currentHeight;
//         currentHeight += innerLabels[i].font.lineHeight;

//         // Draw each line of text
//         ctx.fillText(innerLabels[i].text, centerX, lineCenterY);
//       }
//     }
//   }
// });

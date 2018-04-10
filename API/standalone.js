//npm install https://products.wolframalpha.com/api/libraries/javascript/wolfram-alpha-api-1.0.0-rc.1.tgz

const WolframAlphaAPI = require('wolfram-alpha-api');
const waApi = WolframAlphaAPI('AH4R6V-3QUP7RQ6UU');


waApi.getFull('sin(x)').then((queryresult) => {
  const pods = queryresult.pods;
  const output = pods.map((pod) => {
    const subpodContent = pod.subpods.map(subpod =>
      `  <img src="${subpod.img.src}" alt="${subpod.img.alt}">`
    ).join('\n');
    return `<h2>${pod.title}</h2>\n${subpodContent}`;
  }).join('\n');
  console.log(output);
}).catch(console.error);

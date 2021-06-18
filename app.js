const express = require("express");
const cors = require("cors");
const fs = require("fs");
const app = express();

// const products = fs.readFileSync("./products.json", {
//   encoding: "utf8",
//   flag: "r",
// });
const NaturalLanguageUnderstandingV1 = require("ibm-watson/natural-language-understanding/v1");
const { IamAuthenticator } = require("ibm-watson/auth");

const naturalLanguageUnderstanding = new NaturalLanguageUnderstandingV1({
  version: "2021-03-25",
  authenticator: new IamAuthenticator({
    apikey: "90YVka0c9UkvwDPN7IGjCzpc1shobMJrIxVMutQ-JVaO",
  }),
  serviceUrl:
    "https://api.eu-gb.natural-language-understanding.watson.cloud.ibm.com/instances/aa22b18c-90d9-4b0d-af80-5b1940886ad5",
});

const products = require("./products.json");

products.forEach(async (product) => {
  const text =
    product.shortDesc +
    " " +
    product.longDesc.details[0].productDetails +
    " " +
    product.longDesc.details[0]["Size & Fit"] +
    " " +
    product.longDesc.details[0]["Material & Care"] +
    " " +
    product.longDesc.details[0]["Style note"];
  const analyzeParams = {
    text: text,
    features: {
      keywords: {
        sentiment: true,
        emotion: true,
        limit: 3,
      },
    },
  };

  try {
    const analysisResults = await naturalLanguageUnderstanding.analyze(
      analyzeParams
    );

    let score = 0.0;
    analysisResults.result?.keywords?.forEach((keyword) => {
      var temp;
      if (keyword.sentiment?.label == "positive") temp = 10;
      if (keyword.sentiment?.label == "neutral") temp = 5;
      if (keyword.sentiment?.label == "negative") temp = -10;
      score += keyword.sentiment?.label == true ? 10 : temp;
    });
    score = score / analysisResults.result?.keywords?.length;
    console.log(`Score for ${product.name} = ${score}`);
    if (score == 10) product.longDesc.ecoRating = false;
    else product.longDesc.ecoRating = true;
  } catch (err) {
    console.log("error:", err);
  }
});

app.use(cors());

app.use(express.json());

app.get("/", (req, res) => {
  res.status(200);
});

app.get("/products", (req, res) => {
  // console.log("Products req");
  res.status(200).json({
    data: products,
  });
});

module.exports = app;

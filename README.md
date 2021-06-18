# Eco-Bay
The way we shop is easy and convenient. Do you need or want something? Just head to the store or hop online, and it’s yours. 
But here’s the problem: Too much of the stuff we buy today is made without any thought about tomorrow.  
Our landfills are growing while our resources are disappearing–it’s just not sustainable.   The future of our planet depends on the actions we take today, but the truth is, it’s just not that easy to make every shopping decision a mindful one.

## Short description
This app lets e-commerce users be more mindful of their choices while buying a product online


### What's the problem?
 **It’s estimated that there will be  [2.14 billion](https://www.oberlo.com/statistics/how-many-people-shop-online)  global digital buyers in 2021.**
That’s a lot of potential customers.
In fact, with an expected global population of [7.87 billion people](http://www.worldometers.info/world-population/world-population-projections/), that’s about 27.2 percent of the world’s population shopping online.
What’s more, this number has been rising rapidly over the years and is expected to continue doing so.
The general population need to be aware of the choices they make and the effect these choices have on the environment.

### The Idea
To create awareness among the people, there needs to be more details about the carbon-footprint of the products they buy online. By aggregating and analyzing product data we can deduct the eco-friendliness of these products 
When given an option, people naturally tend to choose the eco-friendly product. so our idea is to enable them to do it.
### Video

## The architecture

1. As we enable users choose eco-friendly products, we chose flutter for our development to reduce the computing power needed, as it is a cross platform UI framework.
2. User uses the app to find products online. 
3. The app fires NodeJs APIs to get product details.  
4. NodeJs in turn triggers IBM Watson Natural Language Understanding classification model.  
5. The model returns materials detected in the product description.  
6. These materials will be fed into a multi-level classification to get a eco-score.  
7. Based on this score, the model checks if the product is eco-friendly or not.

# Getting started
## Pre-requisites

 - NodeJS
 - Flutter
 

## Steps

Install npm packages

    npm install

Start Node server
	
    node server.js

In the demo folder create Flutter build

    cd demo
    flutter create .

Start flutter app

    flutter run


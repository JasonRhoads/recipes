require 'spec_helper'

RSpec.describe Recipes do
  let(:recipe) {
    recipe = Recipes.list
    recipe["Vegan Instant Pot Colcannon"] = {
      url: "https://www.brandnewvegan.com/recipes/vegan-instant-pot-colcannon",
      meta: { 
        "Author" => "Brand New Vegan", 
      },
      description: "Here is my Vegan Instant Pot Colcannon recipe than many of you have requested. It’s got a ton of greens, it’s completely oil-free, and you make it all in just one pot – nothing could be easier.",
      ingredients: {
        code: "<ul>\n<li>\n<span data-amount=\"0.25\" data-unit=\"cup\">1/4 cup</span> low sodium vegetable broth</li>\n<li>\n<span data-amount=\"2\" data-unit=\"cup\">2 cups</span> chopped green cabbage</li>\n<li>\n<span data-amount=\"3\" data-unit=\"ounce\">3 ounces</span> chopped kale leaves</li>\n<li>\n<span data-amount=\"4\">4</span> chopped green onions</li>\n<li>\n<span data-amount=\"3\">3</span>–<span data-amount=\"4\">4</span> cloves minced garlic</li>\n<li>\n<span data-amount=\"0.5\" data-unit=\"cup\">1/2 cup</span> water</li>\n<li>\n<span data-amount=\"3\">3</span> lbs yukon gold potatoes</li>\n<li>\n<span data-amount=\"1\">1</span> Tbs white miso</li>\n<li>\n<span data-amount=\"0.25\" data-unit=\"cup\">1/4 cup</span> unsweetened almond milk (if needed)</li>\n<li>salt and pepper to taste</li>\n</ul>" 
      },
      instructions: {
        code: "<ol>\n<li>Add cabbage and kale to instant pot</li>\n<li>Add broth and SAUTE until the kale is slightly wilted</li>\n<li>Add onions and garlic, SAUTE 1 minute and press CANCEL</li>\n<li>Add water and potatoes</li>\n<li>Attach lid, make sure vent is sealed, press MANUAL 7 minutes</li>\n<li>After it finishes, let it sit for 10 minutes</li>\n<li>CAREFULLY vent any remaining pressure and remove lid</li>\n<li>Add miso and mash, adding almond milk as needed</li>\n<li>Add salt and pepper if needed and serve</li>\n</ol>" 
      },
      notes: "Care To Leave a Tip? Donate Here",
      keywords: "vegan instant pot colcannon"
    }
  
    recipe
  }
  
  it "Retrieves an empty list when no recipes have been added previously" do
    expect(recipe.class).to eq Hash
    expect(recipe).to be {}
  end
  it "Recipe name" do
    expect(recipe.keys[0]).to eq "Vegan Instant Pot Colcannon"
  end
  it "Recipe Author name" do
    expect(recipe["Vegan Instant Pot Colcannon"][:meta]["Author"]).to eq "Brand New Vegan"
  end
  it "Recipe description" do
    expect(recipe["Vegan Instant Pot Colcannon"][:description][0..9]).to eq "Here is my"
  end
  it "makes a new Recipe object" do
    expect(recipe["Vegan Instant Pot Colcannon"][:url]).to eq "https://www.brandnewvegan.com/recipes/vegan-instant-pot-colcannon"
  end
  
end
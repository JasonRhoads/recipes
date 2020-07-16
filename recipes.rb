require 'nokogiri'
require 'open-uri'
require 'pry'


class Recipes  
  @@recipes = {}
  def self.list
    @@recipes
  end
  
  def self.metadata_to_hash(data)
    metadata = {}
    data.split("  ").each do |r|
      key, value = r.split(": ")
      metadata[key] = value  
    end
    metadata
  end
  
end

doc = Nokogiri::HTML(open("https://www.brandnewvegan.com/"))
recipes = Recipes.list 
  
doc.search("#featured-post-3 article a").each do |r| 
  url= Nokogiri::HTML(open(r['href']))
  recipes[r['title']] = {url: r['href'],
    meta: Recipes.metadata_to_hash(url.search(".tasty-recipes-details").text.strip.to_s), 
    description: url.search(".tasty-recipes-description").text[11..],
    ingredients: {code: url.search(".tasty-recipes-ingredients ul").to_s},
    instructions: {code: url.search(".tasty-recipes-instructions ol").to_s},
    notes: url.search(".tasty-recipes-notes").text[5..].strip,
    keywords: url.search(".tasty-recipes-keywords").text[10..],
  } unless r['title'].nil?
end




recipes
# binding.pry
# recipe_url = "https://www.brandnewvegan.com/recipes/cheezy-hashbrown-casserole"
# testdoc = Nokogiri::HTML(open(recipe_url))
# # ".tasty-recipes-details" 
# testdoc.search(".tasty-recipes-details").text
# testdoc.search(".tasty-recipes-description").text
# testdoc.search(".tasty-recipes-ingredients").text
# testdoc.search(".tasty-recipes-instructions").text
# # testdoc.search(".tasty-recipes-notes").text
# # testdoc.search(".tasty-recipes-keywords").text
# # arry = recipes["Crispy Instant Pot Potatoes"][:meta].strip.split("  ")
# arry.each do |r|
#     recipes["Cheezy Hashbrown Casserole"][:meta][r.split(": ")[0]] = r.split(":")[1]  
# end 

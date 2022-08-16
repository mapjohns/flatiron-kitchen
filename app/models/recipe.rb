class Recipe < ApplicationRecord
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients
    validates :name, presence: true

    def ingredients_attributes=(ingredients_attributes)
        if !ingredients_attributes["0"]["name"] == ""
            ingredients_attributes.values.each do |ingredient_attribute|
                igd = Ingredient.find_or_create_by(ingredient_attribute) 
                self.ingredients << igd
            end
        end
    end
end

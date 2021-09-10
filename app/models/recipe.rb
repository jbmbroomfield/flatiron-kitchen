class Recipe < ApplicationRecord

    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients

    validates :name, presence: true

    def ingredient_ids=(ingredient_ids)
        ingredient_ids.filter! { |ingredient_id| ingredient_id.length > 0 }
        self.ingredients = ingredient_ids.map { |ingredient_id| Ingredient.find(ingredient_id) }
        self.save
    end

end

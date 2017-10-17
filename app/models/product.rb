class Product < ApplicationRecord

  self.per_page = 10

  def self.search(term, current_page)
    if term
      page(current_page).all
    end
  end
end

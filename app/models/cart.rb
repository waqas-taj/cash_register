class Cart < ApplicationRecord
  has_many :cart_items
  belongs_to :user

  def apply_discounts(discount_rules)
    discount_rules.each { |rule| rule.apply(self) }
  end
end

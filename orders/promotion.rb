require 'ostruct'
require_relative './promotion_rule'

module Orders
  class Promotion
    PROMOTION_AVAILABLE = [:total_cost]
    def retrieve_rule(items)
      rule = PromotionRule.new
      res = rule.rule_finder(PROMOTION_AVAILABLE, items)
      OpenStruct.new(discount: res[:discount], name: res[:rule])
    end

    def applicable?(items)
      rule = PromotionRule.new
      !rule.rule_finder(PROMOTION_AVAILABLE, items).nil?
    end
  end
end

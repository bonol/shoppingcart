module Orders
  class PromotionRule
    
    def rule_finder rule_types, items
      rules =[]
      rule_types.each do |type|
        r = self.send(type, items)
        rules << r if r
      end
      rules.max_by{ |r| r[:discount] }
    end
    
    def total_cost items
      cost = items.inject(0.0){ |sum, i| sum + i.price.to_f }
      TOTAL_COST_RULE.find{ |r| cost > r[:cost_upper] }
    end
    
    TOTAL_COST_RULE = [
      {cost_upper: 100, discount: 20, rule: 'total greater than $100'},
      {cost_upper: 50,  discount: 15, rule: 'total greater than $50'},
      {cost_upper: 20,  discount: 10, rule: 'total greater than $20'}
    ]
  end
end

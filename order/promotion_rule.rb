module Orders
  class PromotionRule
    
    def rule_finder rule_types, items
      rules =[]
      rule_types.each do |type|
        r = self.send(type, items)
        rules << r if r
      end
      rules.max_by{ |r| r[1] }
    end
    
    def total_cost items
      cost = items.inject(0.0){ |sum, i| sum + i.price.to_f }
      COST_RULE.find{ |r| cost > r.first }
    end
    
    COST_RULE = [
      [100, 20, 'total greater than $100'],
      [50, 15, 'total greater than $50'],
      [20, 10, 'total greater than $20'],
    ]
  end
end

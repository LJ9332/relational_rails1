class F1TeamDriver < ApplicationRecord
  def order
    @f1_team_driver = F1TeamDriver.order(created_at: :desc)
  end
end
class Host < ActiveRecord::Base

  after_create :get_ip_reputation

  def get_ip_reputation
    GetIpReputationTask.create(self)
  end
end

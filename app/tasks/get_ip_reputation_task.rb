class GetIpReputationTask 
  include SharedWorkforce::Task

  title "Get IP reputation"
  instruction "Enter the IP reputation"

  answer_type :edit
  on_success :process_responses

  def setup(host)
    html = File.open(File.join(Rails.root, 'app', 'tasks', 'get_ip_reputation_template.html')).read
    html.gsub!("{ip_address}", host.ip_address)
    self.html = html
  end

  def process_responses(host, responses)
    answers = responses.map{|r| r[:answer] }.flatten
    answer = answers.first.gsub(/^#/, '')

    if answer.present?
      host.reputation = answer
      host.save!
    end
  end
end
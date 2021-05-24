class App < ApplicationRecord
  belongs_to :user
  belongs_to :job

  def app_add
    user = user_id
    job = job_id
    res = App.where(user_id: user, job_id: job)
    if res.empty?
      App.create(user_id: user, job_id: job)
      true
    else
      false
    end
  end
end

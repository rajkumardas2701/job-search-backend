class App < ApplicationRecord
  belongs_to :user
  belongs_to :job

  def app_add(_data)
    user = user_id
    job = job_id
    res = App.where(user_id: user, job_id: job)
    if res
      false
    else
      App.create(user_id: user, job_id: job)
      true
    end
  end
end

class App < ApplicationRecord
  belongs_to :user
  belongs_to :job

  def app_add
    res = App.where(user_id: user_id, job_id: job_id)
    if res.empty?
      App.create(user_id: user_id, job_id: job_id, status: 'Applied')
      true
    else
      false
    end
  end

  def fetch_apps(user, job_id)
    job = Job.find(job_id)
    a = job.users.pluck(:id)
    a.delete(user.id)
    User.where(id: a)
  end
end

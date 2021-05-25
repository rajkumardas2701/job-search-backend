class Job < ApplicationRecord
  has_many :apps
  has_many :users, through: :apps

  def add_recruiter_job_to_apps(user, job)
    App.create!(status: 'recruiter_added',
                user_id: user.id,
                job_id: job.id)
  end

  def get_jobs(user)
    if user.user_type == 'Recruiter'
      user.jobs
    elsif user.user_type == 'Candidate'
      Job.where.not(id: user.jobs.pluck(:id))
    else
      Job.all
    end
  end

  def remove_apps(id)
    apps = App.where(job_id: id)
    if apps.length() > 0
      apps.each do |app|
        app.delete
      end
      true
    else
      false
    end
  end
end

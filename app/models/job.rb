class Job < ApplicationRecord
  has_many :apps
  has_many :users, through: :apps

  def add_recruiter_job_to_apps(user, job)
    Apps.create!(status: 'recruiter_added',
                user_id: user.id,
                job: job.id)
  end
end

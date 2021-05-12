class AddUserAndJobReferenceToApp < ActiveRecord::Migration[6.1]
  def change
    add_reference :apps, :user, foreign_key: true
    add_reference :apps, :job, foreign_key: true
  end
end

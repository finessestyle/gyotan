# app/jobs/delete_user_job.rb
class DeleteUserJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    user = User.find_by(id: user_id)
    user.destroy if user.present?
  end
end
class AddEmailToSchedule < ActiveRecord::Migration
  def change
    add_column :schedules, :email, :string
    add_column :schedules, :birthdate, :date
    add_column :schedules, :recycle_day, :string
    add_column :schedules, :recycle_birth_week, :string
  end
end

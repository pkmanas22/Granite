# frozen_string_literal: true

class AddDefaultPreferenceToExistingUsers < ActiveRecord::Migration[7.1]
  def up
    User.where.missing(:preference).find_each do |user|
      user.send(:build_default_preference)
      user.save(validate: false)
    end
  end

  def down
    User.find_each do |user|
      user.preference.delete
    end
  end
end

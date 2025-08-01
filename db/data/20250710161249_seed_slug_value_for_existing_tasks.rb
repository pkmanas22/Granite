# frozen_string_literal: true

class SeedSlugValueForExistingTasks < ActiveRecord::Migration[7.1]
  def up
    Task.find_each do |task|
      task.send(:set_slug)
      task.save!(validate: false)
    end
  end

  def down
    # raise ActiveRecord::IrreversibleMigration
    Task.find_each do |task|
      task.slug = nil
      task.save!(validate: false)
    end
  end
end

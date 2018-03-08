class BackgroundJob < ActiveRecord::Base
  def self.start(id)
    find(id).start
  end

  def start
    @progress = 0

    while @progress<100
      sleep 1
      @progress += 10
      update_attribute(:progress, @progress)
    end

    update_attribute(:finished_at, Time.zone.now)

  end
end
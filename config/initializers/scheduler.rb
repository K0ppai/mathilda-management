require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new

scheduler.cron '0 0 * * *' do
  Student.new.update_external_students
end

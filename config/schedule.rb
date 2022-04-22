schedule.cron '0 17 * * *' do
  Order.update_cancelled_status
end
task :default => 'frontpage'

namespace :check do
desc 'frontpage'
  task :frontpage do
    exec('rspec spec/frontpage_spec.rb --format h > reports/frontpage.html')
  end
desc 'orders_page'
  task :orders_page do
    exec('rspec spec/orders_page.spec --format h > reports/orders_page_report.html')
  end
end



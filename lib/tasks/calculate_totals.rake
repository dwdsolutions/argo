namespace :argo do
  namespace :utilities do
    desc 'Calculate Totals by Travel'
    task :calculate_total_by_travel => :environment do
      travels = Travel.all
      travels.each do |travel|
        total = 0
        travel.travelers.each do |traveler|
          total += traveler.cost_by_person
        end
        travel.update_attributes({total_cost: total})
      end
    end
  end
end
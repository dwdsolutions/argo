class PriceComparation < ActiveRecord::Base
    
    def self.comparations
	comparations = PriceComparation.limit(1).where(:category => 'Educacion').order("RANDOM()")
	comparations =  comparations + PriceComparation.limit(2).where(:category => 'Combustible').order("RANDOM()")
	comparations =  comparations + PriceComparation.limit(2).where(:category => 'Trivial').order("RANDOM()")
	comparations
    end	
end

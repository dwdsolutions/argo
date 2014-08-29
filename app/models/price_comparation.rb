class PriceComparation < ActiveRecord::Base

  def self.comparations
	  comparations = self.limit(2).where(:category => 'Educacion').order("RANDOM()")
	  comparations = comparations + self.limit(1).where(:category => 'Combustible').order("RANDOM()")
	  comparations = comparations + self.limit(2).where(:category => 'Trivial').order("RANDOM()")
	  comparations = comparations + self.limit(1).where(:category => 'Salario').order("RANDOM()")
	  comparations
  end
end

class Content < ActiveRecord::Base
  belongs_to :User
  attr_accessible :user_id, :author, :edition, :journal_num, :pages, :pub_date, :pub_house, :pub_place, :ref_date, :title1, :title2, :volume, :website, :ref_type, :ref_year, :ref_month, :ref_day, :pub_year, :pub_month, :pub_day
        
  validates :author,   
        :presence => true,
        :format => { :with => /^\s*[a-zA-Z,.\s]+\s*$/, :message => "Lastname, First name letter" }
        
        
  #validates :ref_day, :ref_month, :ref_year,
  #		  :numericality => { :only_integer => true }
  		  
  validates :title1, 
  		  :presence => true 		  
  		  
  validates :title2, 
  		  :presence => true,
  		  :if => :type_of_reference?
  		   		   
  def type_of_reference?
      (ref_type == 2 || ref_type == 3 || ref_type == 4 || ref_type == 5 || ref_type == 6)
  end
  
  def self.asignar_mes(op)
  		case op
  			when 1 then "january"
  			when 2 then "february"
  			when 3 then "march"
  			when 4 then "april"
  			when 5 then "may"
  			when 6 then "june"
  			when 7 then "july"
  			when 8 then "august"
  			when 9 then "september"
  			when 10 then "november"
  			when 12 then "december"  			
  		end
  end
  
   
end
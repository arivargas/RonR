class Content < ActiveRecord::Base
  belongs_to :User
  attr_accessible :author, :edition, :journal_num, :pages, :pub_date, :pub_house, :pub_place, :ref_date, :title1, :title2, :volume, :website, :User_id, :ref_type, :ref_year, :ref_month, :ref_day, :pub_year, :pub_month, :pub_day
        
  validates :author,   
        :presence => true,
        :format => { :with => /^\s*[a-zA-Z,\s]+\s*$/, :message => "Lastname, First name letter" }
        
        
  validates :ref_day, :ref_month, :ref_year, :pub_year,
  		  :numericality => { :only_integer => true },
  		  :presence => true
  		  		  
  
  validates :pub_month, :pub_day,
  		  :numericality => { :only_integer => true }
  		  
  validates :title1, 
  		  :presence => true 		  
  		  
  validates :title2, 
  		  :presence => true,
  		  :if => :type_of_reference?
  		   		  
  
  #validates :surname, :presence => true, :if => "name.nil?"
 
 
  def type_of_reference?
      (ref_type == 2 || ref_type == 3 || ref_type == 4 || ref_type == 5 || ref_type == 6)
  end
  
end

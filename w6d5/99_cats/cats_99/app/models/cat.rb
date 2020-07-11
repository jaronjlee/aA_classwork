require 'action_view'

class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper
    
    COLORS = ['red', 'blue', 'yellow']
    validates :birth_date, presence: true
    validates :name, presence: true
    validates :color, inclusion: { in: COLORS }, presence: true
    validates :sex, inclusion: { in: %w(M F) }, presence: true
    
    def age
        time_ago_in_words(self.birth_date)  
    end

    


    
    
end



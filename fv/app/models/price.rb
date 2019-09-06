class Price < ActiveRecord::Base
  belongs_to :market, optional: true
end

require 'rubygems'
require 'httparty'
require 'json'
require 'csv'
require 'httparty'


class Market < ApplicationRecord
  validates :symbol, :presence => true, :uniqueness => true
  has_many :prices
end

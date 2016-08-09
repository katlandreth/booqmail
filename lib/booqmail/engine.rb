module Booqmail
  class Engine < ::Rails::Engine
    require "figaro"
    require 'jquery-rails'
    require 'bootstrap-sass'
    require 'responders'
    require 'gmail'
  end
end

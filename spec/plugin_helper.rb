# frozen_string_literal: true

if ENV['SIMPLECOV']
  require 'simplecov'

  SimpleCov.start do
    root "plugins/pavilion-category-manager"
    track_files "plugins/pavilion-category-manager/**/*.rb"
    add_filter { |src| src.filename =~ /(\/spec\/|plugin\.rb)/ }
  end
end

require 'rails_helper'
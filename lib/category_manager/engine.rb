# frozen_string_literal: true

module ::CategoryManager
  PLUGIN_NAME ||= "category_manager"
  
  class Engine < ::Rails::Engine
    engine_name PLUGIN_NAME
    isolate_namespace CategoryManager
  end
end
# frozen_string_literal: true

# name: pavilion-category-manager
# about: Manage categories in discourse
# version: 0.1.0
# authors: angusmcleod
# url: https://github.com/paviliondev/pavilion-category-manager

enabled_site_setting :category_manager_enabled

after_initialize do
  %w(
    ../lib/category_manager/engine.rb
    ../lib/category_manager/user.rb
  ).each do |file|
    load File.expand_path(file, __FILE__)
  end
end

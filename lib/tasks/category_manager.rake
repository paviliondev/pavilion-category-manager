
desc "copies category user notification levels between two categories"
task "categories:copy_user_notification_levels", [:category_id, :target_category_id] => [:environment] do |_, args|
  CategoryManager::User.copy_notification_levels(
    args[:category_id],
    args[:target_category_id]
  )
end
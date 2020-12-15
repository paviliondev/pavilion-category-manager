class CategoryManager::User
  def self.copy_levels(category_id, target_category_id)
    category = Category.find_by_id(category_id)
    target_category = Category.find_by_id(target_category_id)
    
    return false unless category.present? && target_category.present?
    
    CategoryUser.transaction do
      CategoryUser.where(category_id: category.id).each do |record|
        if user = User.find_by_id(record.user_id)
          CategoryUser.set_notification_level_for_category(
            user,
            record.notification_level,
            target_category.id
          )
        end
      end
    end
  end
end
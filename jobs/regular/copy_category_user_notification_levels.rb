module Jobs
  class CopyCategoryUserNotificationLevels < ::Jobs::Base    
    def execute(args)
      %i{
        category_id
        target_category_id
      }.each do |key|
        raise Discourse::InvalidParameters.new(key) if args[key].blank?
      end
      
      CategoryManager::User.copy_notification_levels(
        args[:category_id],
        args[:target_category_id]
      )
    end
  end
end
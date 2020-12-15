
require_relative '../../plugin_helper'

describe CategoryManager::User do
  fab!(:user1) { Fabricate(:user) }
  fab!(:user2) { Fabricate(:user) }
  fab!(:user3) { Fabricate(:user) }
  fab!(:category) { Fabricate(:category) }
  fab!(:target_category) { Fabricate(:category) }
  
  it 'copies category user notification levels between two categories' do

    CategoryUser.set_notification_level_for_category(
      user1,
      NotificationLevels.all[:watching_first_post],
      category.id
    )
    CategoryUser.set_notification_level_for_category(
      user2,
      NotificationLevels.all[:muted],
      category.id
    )
    CategoryUser.set_notification_level_for_category(
      user3,
      NotificationLevels.all[:tracking],
      category.id
    )
    
    CategoryManager::User.copy_levels(category.id, target_category.id)

    expect(CategoryUser.where(
      user_id: user1.id,
      category_id: target_category.id,
      notification_level: NotificationLevels.all[:watching_first_post]
    ).exists?).to eq(true)
    
    expect(CategoryUser.where(
      user_id: user2.id,
      category_id: target_category.id,
      notification_level: NotificationLevels.all[:muted]
    ).exists?).to eq(true)
    
    expect(CategoryUser.where(
      user_id: user3.id,
      category_id: target_category.id,
      notification_level: NotificationLevels.all[:tracking]
    ).exists?).to eq(true)
  end
end
Avo.configure do |config|
  config.root_path = "/avo"
  config.app_name = "Monet Admin"
  config.timezone = "UTC"
  config.currency = "USD"
  config.locale = :en
  
  # Authentication
  config.current_user_method = :current_user
  config.authenticate_with do
    # Add your authentication logic here
    # For now, we'll allow all access in development
    unless Rails.env.production?
      true
    else
      # In production, you might want to check for admin users
      false
    end
  end
  
  # Authorization
  config.authorization_methods = {
    index: "avo_index?",
    show: "avo_show?",
    edit: "avo_edit?",
    new: "avo_new?",
    update: "avo_update?",
    create: "avo_create?",
    destroy: "avo_destroy?",
    search: "avo_search?",
  }
  
  # Set the number of records displayed in the index view
  config.per_page = 24
  config.per_page_steps = [12, 24, 48, 72]
  
  # Customize the home path
  config.home_path = nil
end
module AvoAuthorizable
  extend ActiveSupport::Concern

  def avo_index?
    Rails.env.development? || current_user&.admin?
  end

  def avo_show?
    Rails.env.development? || current_user&.admin?
  end

  def avo_edit?
    Rails.env.development? || current_user&.admin?
  end

  def avo_new?
    Rails.env.development? || current_user&.admin?
  end

  def avo_update?
    Rails.env.development? || current_user&.admin?
  end

  def avo_create?
    Rails.env.development? || current_user&.admin?
  end

  def avo_destroy?
    Rails.env.development? || current_user&.admin?
  end

  def avo_search?
    Rails.env.development? || current_user&.admin?
  end

  private

  def current_user
    # Override this method in your ApplicationController or User model
    nil
  end
end
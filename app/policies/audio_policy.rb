class AudioPolicy < ApplicationPolicy
   attr_reader :user, :audio
  def index?
    true
  end

  def create?
    user.present?
  end

  def update?
    return true if user.present? && user.admin?

    user.present? && user == audio.user
  end

  def destroy?
    user.present? && user.admin?
  end

  private

    def audio
      record
    end
end

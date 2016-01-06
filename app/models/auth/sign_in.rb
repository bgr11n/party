module Auth
  class SignIn < ActiveType::Object
    attr_accessor :email, :password

    validate :validate_identity_exists
    validate :validate_identity_from_plain
    validate :validate_password_correct

    def idenity
      @idenity ||= ::Persistence::UserIdentity.find_by(email: email, source: 'plain') if email.present?
    end

  private

    def idenity_from_plain
      idenity && idenity.from_plain?
    end

    def validate_identity_exists
      errors.add(:email, 'not found') if idenity.blank?
    end

    def validate_identity_from_plain
      errors.add(:email, "login through #{idenity.source.capitalize}") if !idenity_from_plain
    end

    def validate_password_correct
      errors.add(:password, 'incorrect password') if idenity_from_plain && !idenity.has_password?(password)
    end
  end
end

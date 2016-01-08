module Auth
  class SignIn < ActiveType::Object
    attr_accessor :email, :password

    validate :email_presence_validator
    validate :validate_password_correct

    delegate :from_plain?, :blank?, to: :idenity

    def idenity
      @idenity ||= ::Persistence::UserIdentity.find_by(email: email) if email.present?
    end

    def email_required?
      true
    end

  private

    def email_presence_validator
      EmailPresenceValidator.new(attributes: :email).validate_each(self, :email, email)
    end

    def validate_password_correct
      errors.add(:password, 'incorrect password') if idenity && idenity.from_plain? && !idenity.has_password?(password)
    end
  end
end

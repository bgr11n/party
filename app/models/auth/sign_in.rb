module Auth
  class SignIn < ActiveType::Object
    attr_accessor :email, :password

    validate :email_validator
    validate :auth_email_validator
    validate :validate_password_correct

    delegate :from_plain?, :blank?, :source, to: :idenity

    def idenity
      @idenity ||= ::Persistence::UserIdentity.find_by(email: email) if email.present?
    end

    def email_required?
      true
    end

    def new_user?
      false
    end

  private

    def email_validator
      EmailValidator.new(attributes: :email).validate_each(self, :email, email)
    end

    def auth_email_validator
      AuthEmailValidator.new(attributes: :email).validate_each(self, :email, email)
    end

    def validate_password_correct
      if idenity && idenity.from_plain? && !idenity.has_password?(password)
        errors.add(:password, 'incorrect password')
      end
    end
  end
end

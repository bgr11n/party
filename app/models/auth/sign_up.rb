module Auth
  class SignUp < ActiveType::Object
    attr_accessor :email, :password

    validate :email_validator
    validate :auth_email_validator
    validate :password_validator

    before_save :encrypt_password
    before_save :save_identity
    before_save :save_user

    def password_required?
      true
    end

    def email_required?
      true
    end

    def new_user?
      true
    end

  private

    def user
      @user ||= ::Persistence::User.new nickname: email
    end

    def identity
      @identity ||= ::Persistence::UserIdentity.new user: user, email: email, source: 'plain'
    end

    def encrypt_password
      if password.present?
        identity.password_salt = BCrypt::Engine.generate_salt
        identity.password_hash = BCrypt::Engine.hash_secret(password, identity.password_salt)
      end
    end

    def password_validator
      PasswordValidator.new(attributes: :password).validate_each(self, :password, password)
    end

    def email_validator
      EmailValidator.new(attributes: :email).validate_each(self, :email, email)
    end

    def auth_email_validator
      AuthEmailValidator.new(attributes: :email).validate_each(self, :email, email)
    end

    def save_user
      user.save
    end

    def save_identity
      identity.save
    end
  end
end

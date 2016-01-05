module Auth
  class SignUp < ActiveType::Object
    attr_accessor :email, :password

    validates :email, :password, presence: true
    validate :password_validator
    validate :validate_email_exists

    before_save :encrypt_password
    before_save :save_identity
    before_save :save_user

    def password_required?
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

    def validate_email_exists
      if ::Persistence::UserIdentity.where(email: email, source: 'plain').count > 0
        errors.add(:email, 'has already been taken')
      end
    end

    def save_user
      user.save
    end

    def save_identity
      identity.save
    end
  end
end

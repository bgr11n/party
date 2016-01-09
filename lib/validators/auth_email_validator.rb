class AuthEmailValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    return unless record.email_required?
    identities = ::Persistence::UserIdentity.where(email: value)

    # For sign in
    if !record.new_user? && identities.where(source: 'plain').empty?
      record.errors.add(:email, 'invalid email')
    # For sign up
    elsif record.new_user? && identities.where(source: 'plain').any?
      record.errors.add(:email, 'has already been taken')
    # For both
    elsif identities.where.not(source: 'plain').any?
      record.errors.add(:email, "log in through #{identities.first.source.capitalize}")
    end
  end
end

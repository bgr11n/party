class EmailExistenceValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    return unless record.email_required?
    identities = ::Persistence::UserIdentity.where(email: value)
    if identities.where(source: 'plain').any?
      record.errors.add(:email, 'has already been taken')
    elsif identities.where.not(source: 'plain').any?
      record.errors.add(:email, "log in through #{identities.first.source.capitalize}")
    end
  end
end

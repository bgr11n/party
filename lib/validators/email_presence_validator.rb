class EmailPresenceValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    return unless record.email_required?
    if record.blank?
      record.errors.add(:email, 'not found')
    elsif !record.from_plain?
      record.errors.add(:email, "log in through #{record.source.capitalize}")
    end
  end
end

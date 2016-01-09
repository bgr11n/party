class PasswordValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    return unless record.password_required?
    if value.blank?
      record.errors.add(attribute, :blank)
    elsif value.length < 6
      record.errors.add(attribute, :too_short, count: 6)
    elsif record.email.present? && value == record.email
      record.errors.add(attribute, 'is the same as email')
    end
  end
end

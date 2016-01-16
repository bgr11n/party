class PasswordValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    return unless record.password_required?
    if value.blank?
      record.errors.add(attribute, :blank)
    elsif value.length < 8
      record.errors.add(attribute, :too_short, count: 8)
    elsif record.email.present? && value == record.email
      record.errors.add(attribute, 'is the same as email')
    end
  end
end

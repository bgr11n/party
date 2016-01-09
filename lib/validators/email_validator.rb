class EmailValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    return unless record.email_required?
    if value.blank?
      record.errors.add(attribute, :blank)
    elsif wrong_email_format?(value)
      record.errors.add(attribute, 'invalid email')
    end
  end

private

  def wrong_email_format? email
    ! (email =~ regexp)
  end

  def regexp
    /^[a-zA-Z0-9!#\$%&'*+\/=?\^_`{|}~\-]+(?:\.[a-zA-Z0-9!#\$%&'\*+\/=?\^_`{|}~\-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9\-]*[a-zA-Z0-9])?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9\-]*[a-zA-Z0-9])?$/
  end
end

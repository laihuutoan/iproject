class ValidEmailsValidator < ActiveModel::EachValidator
  SPLIT_EMAILS_REGEX = /\s{0,}\,\s+{0,}/

  def validate_each record, attribute, value
    if value.present?
      emails = value.split(SPLIT_EMAILS_REGEX)
      valid_mail_count = emails.count{|email| email =~ Settings.regex.email}

      if emails.count > valid_mail_count
        record.errors[attribute] << (options[:message] || 'Email is not valid')
      end
    end
  end
end

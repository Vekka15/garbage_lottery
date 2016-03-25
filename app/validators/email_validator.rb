class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless User.where(email: value).empty?
      record.errors[attribute] << "User with this email already exist"
    end
  end
end

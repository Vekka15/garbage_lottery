class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    # validation to make sure that there is no users with that email (there is no point in invitation)
    unless User.where(email: value).empty?
      record.errors[attribute] << "User with this email already exist"
    end
  end
end

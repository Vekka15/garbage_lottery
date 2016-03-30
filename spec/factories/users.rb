FactoryGirl.define do
  factory :user do |f|
    f.email 'test@prograils.com'
    f.password 'testtest'
    f.password_confirmation 'testtest'
    f.admin true
  end

end

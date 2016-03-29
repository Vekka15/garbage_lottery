FactoryGirl.define do
  factory :user do |f|
    f.email 'test@prograils.com'
    f.password 'testtest'
    f.admin true
  end

end

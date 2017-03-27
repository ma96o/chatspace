include ActionDispatch::TestProcess
FactoryGirl.define do
  factory :message do
    text  { Faker::Name.name }
    image { fixture_file_upload Rails.root.join('spec', 'factories', 'test-images', 'test.jpeg'), 'image/jpeg' }
  end
end

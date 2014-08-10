require 'rails_helper'

describe Session do
  let(:session) {
    Session.create({user_id: rand(1000),
                 user_name: Faker::Name.name,
                 email: Faker::Internet.email,
                 browser: "Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2049.0 Safari/537.36",
                 app: App.create({name: "Sample"})
                })
  }
  it "creates an api key after creation" do
    expect(session.api_key.length).to be > 10
  end
  it "does not change an api key on update" do
    old_api_key = session.api_key
    session.update({user_name: session.user_name + " Updated"})
    expect(session.api_key).to eq(old_api_key)
  end
end

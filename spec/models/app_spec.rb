require 'rails_helper'

describe App do
  let(:app) { App.create({name: Faker::Product.product_name}) }
  it "creates an api key after creation" do
    expect(app.api_key.length).to be > 10
  end
  it "does not change an api key on update" do
    old_api_key = app.api_key
    app.update(name: app.name + " Updated")
    expect(app.api_key).to eq(old_api_key)
  end
end

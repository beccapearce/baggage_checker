require 'spec_helper'

describe User, type: :model do
  it 'can create a valid user' do
    user = User.new(name: "Bethany Milton-Walker", group: "42", password: "gavarnie")
    expect(user).to be_valid
  end
end

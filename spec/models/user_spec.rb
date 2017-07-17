require 'spec_helper'

describe User, type: :model do
  it 'can create a valid user' do
    user = User.new(name: "Bethany Milton-Walker", group: "42", password: "gavarnie")
    expect(user).to be_valid
  end
  it 'invalid user no name' do
    user = User.new(group: "42", password: "gavarnie")
    expect(user).not_to be_valid
  end
  it 'invalid user no group' do
    user = User.new(name:"Fred Astaire", password: "Ginger")
    expect(user).not_to be_valid
  end
  it 'invalid user no password' do
    user = User.new(name:"Fred Astaire", group:"100")
    expect(user).not_to be_valid
  end
  it 'invalid user short password' do
    user = User.new(name:"Christopher", group:"100", password:"ayt")
    expect(user).not_to be_valid
  end
  it 'invalid user long group' do
    user = User.new(name:"Christopher", group:"100000", password:"100acres")
    expect(user).not_to be_valid
  end
  it 'invalid user long name' do
    user = User.new(name:("a"*51), group:"100000", password:"100acres")
    expect(user).not_to be_valid
  end
end

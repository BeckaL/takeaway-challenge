require 'menu.rb'

describe Menu do

  it 'displays menu options with prices' do
    expect(subject.display).to eq "Chilli paneer: £5.00\nDaal: £4.50\nRice: £1.50"
  end
  
end

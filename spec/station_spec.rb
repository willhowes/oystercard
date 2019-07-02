require 'station'

describe Station do

  subject {described_class.new("Victoria", 1)}

  it 'returns name of station' do
    expect(subject.name).to eq("Victoria")
  end

  it "Says what the zone is as a variable" do
    expect(subject.zone).to eq(1)
  end
end

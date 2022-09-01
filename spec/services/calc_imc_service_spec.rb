require 'rails_helper'

RSpec.describe 'CalcImcService' do
  subject { CalcImcService.new(1.74, 68) }

  context 'when data is valid' do
    it "return the calcution" do
      expect(subject.call).to eq(22.46)
    end
  end

  context 'when the data is invalid' do
    it "return the error message height" do
      subject.height = 0

      expect(subject.call).to match("Validation failed: Height must be greater than 0")
    end

    it "return the error message weight" do
      subject.weight = 0

      expect(subject.call).to match("Validation failed: Weight must be greater than 0")
    end
    
  end
end
require 'rails_helper'

# Test suite for the IMC model
RSpec.describe Imc, type: :model do
  # Validation tests
  # ensure columns height and weight are present before saving
  it { should validate_presence_of(:height) }
  it { should validate_presence_of(:weight) }

  # pending "add some examples to (or delete) #{__FILE__}"
end

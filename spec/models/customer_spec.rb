require 'rails_helper'

RSpec.describe Customer do
  context 'associations' do
    it { is_expected.to have_many(:tweets).dependent(:destroy) }
  end
end

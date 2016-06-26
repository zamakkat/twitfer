require 'rails_helper'

RSpec.describe Tweet do
  context 'associations' do
    it { is_expected.to belong_to(:customer) }
  end
end

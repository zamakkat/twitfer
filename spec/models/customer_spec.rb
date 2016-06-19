require 'spec_helper'

describe Customer do
  context 'associations' do
    it { is_expected.to have_many(:tweets).dependent(:destroy) }
  end
end

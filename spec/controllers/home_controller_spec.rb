require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe '#index' do
    def do_request
      get :index
    end

    before { do_request }

    it { is_expected.to render_template('home/index') }
    it { expect(response).to be_success }
  end
end

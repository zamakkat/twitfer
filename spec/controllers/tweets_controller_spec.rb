require 'rails_helper'

RSpec.describe TweetsController, type: :controller do
  describe 'GET #index' do
    def do_request
      get :index
    end

    before do
      create_list(:tweet, 5)
      do_request
    end

    it { expect(assigns(:tweets).first).to be_a(Tweet) }
    it { is_expected.to render_template('tweets/index') }
    it { expect(response).to be_success }
  end
end

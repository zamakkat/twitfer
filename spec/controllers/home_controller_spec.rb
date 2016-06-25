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

  describe '#customers' do
    def do_request
      get :customers
    end

    before { do_request }

    it { expect(assigns(:customers)).to eq(create_list(:customer, 3)) }
    it { expect(assigns(:tweets)).to eq(create_list(:tweet, 5)) }
    it { is_expected.to render_template('home/customers') }
    it { expect(response).to be_success }
  end
end

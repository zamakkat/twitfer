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

    before do
      create_list(:customer, 3)
      create_list(:tweet, 5)
      do_request
    end

    it { expect(assigns(:customers).first).to be_a(Customer) }
    it { expect(assigns(:tweets).first).to be_a(Tweet) }
    it { is_expected.to render_template('home/customers') }
    it { expect(response).to be_success }
  end
end

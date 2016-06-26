require 'rails_helper'

RSpec.describe CustomersController, type: :controller do
  describe 'GET #index' do
    def do_request
      get :index
    end

    before do
      create_list(:customer, 3)
      do_request
    end

    it { expect(assigns(:customers).first).to be_a(Customer) }
    it { is_expected.to render_template('customers/index') }
    it { expect(response).to be_success }
  end

  describe 'GET #show' do
    let!(:customer) { create(:customer) }

    def do_request
      get :show, id: customer.id
    end

    before { do_request }

    it { expect(assigns(:customer)).to be_a(Customer) }
    it { is_expected.to render_template('customers/show') }
    it { expect(response).to be_success }
  end
end

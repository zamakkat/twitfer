class Customer < ActiveRecord::Base
  has_many :tweets, dependent: :destroy, autosave: true

  before_create :set_code

  private

    def set_code
      self.code = generate_code unless code
    end

    def generate_code
      loop do
        random_code = SecureRandom.hex(4)
        break random_code unless Customer.where(code: random_code).exists?
      end
    end
end

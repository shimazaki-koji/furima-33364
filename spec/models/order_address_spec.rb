require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '配送先の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
      sleep(1)
    end

    it '値が正しく入力されていれば保存できること' do
      expect(@order_address).to be_valid
    end

    it '郵便番号が空だと保存できない' do
      @order_address.postal_code = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
    end
    
    it '郵便番号にハイフンが含まれていないと保存できない' do
      @order_address.postal_code = "9999999"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end

    it '都道府県が空だと保存できない' do
      @order_address.shipment_id = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Shipment can't be blank")
    end
    
    it '市区町村が空だと保存できない' do
      @order_address.city = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end
    
    it '番地が空だと保存できない' do
      @order_address.address = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Address can't be blank")
    end
    
    it '電話番号が空だと保存できない' do
      @order_address.phone_number = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end

    it '電話番号にハイフンが含まれていると保存できない' do
      @order_address.phone_number = "090-1234-5678"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid")
    end
  end
end

require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '配送先の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    describe '商品購入' do
      context '内容に問題がない場合' do
        it '値が正しく入力されていれば保存できること' do
          expect(@order_address).to be_valid
        end

        it '建物名が空でも保存できること' do
          @order_address.building = ""
          expect(@order_address).to be_valid
        end
      end

      context '内容に問題がある場合' do
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

        it '郵便番号は全角数字では保存できないこと' do
          @order_address.postal_code = '１１１−１１１１'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
        end

        it '都道府県が空だと保存できない' do
          @order_address.shipment_id = nil
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
                
        #it '建物名が空でも保存できること' do
          #@order_address.building = ""
          #expect(@ordre_address).to be_valid
        #end

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

        it '電話番号は11桁以内であること' do
          @order_address.phone_number = "090123456789"
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
        end

        it '電話番号は全角数字では保存できないこと' do
          @order_address.phone_number = '０９０１２３４５６７８'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include('Phone number is invalid')
        end

        it 'user_idが入っていること' do
          @order_address.user_id = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("User can't be blank")
        end
        
        it 'item_idが入っていること' do
          @order_address.item_id = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Item can't be blank")
        end
      end
    end
  end
end
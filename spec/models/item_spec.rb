require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品機能' do
    context '商品が出品できるとき' do
      it "必要な情報を適切に入力すると、商品が出品できること" do
        expect(@item).to be_valid
      end
    end

    context '商品が出品できないとき' do
      it "商品画像を1枚つけることが必須であること" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "商品名が必須であること" do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end

      it "商品の説明が必須であること" do
        @item.explanatory_text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanatory text can't be blank")
      end

      it "カテゴリーの情報が必須であること" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it "商品の状態についての情報が必須であること" do
        @item.product_condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Product condition can't be blank")
      end

      it "配送料の負担についての情報が必須であること" do
        @item.delivery_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
      end

      it "発送元の地域についての情報が必須であること" do
        @item.shipment_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment can't be blank")
      end

      it "発送までの日数についての情報が必須であること" do
        @item.days_to_ship_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship can't be blank")
      end

      it "価格についての情報が必須であること" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "販売価格は全角数字では保存できないこと" do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it "販売価格が¥300を下回った場合" do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it "販売価格が¥9999999を上回った場合" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it "販売価格が整数であるか" do
        @item.price = 1000.234
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be an integer")
      end
    end
  end
end

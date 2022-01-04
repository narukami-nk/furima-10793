require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入処理' do
    before do
      user = FactoryBot.create(:user)
      item = FaxtoryBot.create(:item)
      @order_address = FactoryBot.build(order_address, user_id: user.id, item_id:item.id)
    end

    context '購入処理ができる場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @donation_address.building = ''
        expect(@donation_address).to be_valid
      end

    end

    context '購入処理ができない場合' do
      it 'user_idが空だと処理ができない' do
        @donation_address.user_id = ''
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include("User must exist")
      end

      it 'tokenが空だと処理ができない' do
        @donation_address.token = ''
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'post_codeが空だと処理ができない' do
        @donation_address.post_code = ''
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形ではないと処理ができない' do
        @donation_address.postal_code = '1234567'
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'prefectureが空(1)の時、処理ができない' do
        @donation_address.prefecture = 1
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'priceが空だと保存できないこと' do
        @donation_address.price = nil
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが全角数字だと保存できないこと' do
        @donation_address.price = '２０００'
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include('Price is invalid')
      end
      it 'priceが1円未満では保存できないこと' do
        @donation_address.price = 0
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include('Price is invalid')
      end
      it 'priceが1,000,000円を超過すると保存できないこと' do
        @donation_address.price = 1000001
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include('Price is invalid')
      end
      it 'userが紐付いていないと保存できないこと' do
        @donation_address.user_id = nil
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include("User can't be blank")
      end
    end
end

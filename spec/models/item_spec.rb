require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe 'ユーザー新規登録' do
    context '出品が成功する場合' do
      it 'image, product_name, discription, priceが存在していれば登録できる' do
        expect(@item).to be_valid
      end

      it 'category_id, status_id, shipping_fee_id, prefecture_id, shipping_day_idが2以上であれば登録できる' do
        @item.category_id = 2
        @item.status_id = 2
        @item.shipping_fee_id = 2
        @item.prefecture_id = 2
        @item.shipping_day_id = 2
        expect(@item).to be_valid
      end

      it 'priceが半角数値の300円以上9,999,999円以下であれば登録できる' do
        @item.price = 500
        expect(@item).to be_valid
      end

      context '出品が失敗する場合' do
        it 'imageが空では登録できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end

        it 'product_nameが空では登録できない' do
          @item.product_name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Product name can't be blank")
        end

        it 'discriptionが空では登録できない' do
          @item.discription = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Discription can't be blank")
        end

        it 'category_idが1では登録できない' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end

        it 'status_idが1では登録できない' do
          @item.status_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Status can't be blank")
        end

        it 'shipping_fee_idが1では登録できない' do
          @item.shipping_fee_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
        end

        it 'prefecture_idが1では登録できない' do
          @item.prefecture_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture can't be blank")
        end

        it 'shipping_day_idが1では登録できない' do
          @item.shipping_day_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping day can't be blank")
        end

        it 'priceが空では登録できない' do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end

        it 'priceが半角数値でないと登録できない' do
          @item.price = '５００'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is not a number')
        end

        it 'priceが300円未満だと登録できない' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
        end

        it 'priceが9,999,999円以上だと登録できない' do
          @item.price = 10_000_000
          @item.valid?
          expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
        end
      end
    end
  end
end

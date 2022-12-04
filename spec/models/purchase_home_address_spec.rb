require 'rails_helper'

RSpec.describe PurchaseHomeAddress, type: :model do

  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_home_address = FactoryBot.build(:purchase_home_address, user_id: user.id, item_id: item.id)
  end
  describe 'ユーザー新規登録' do
    

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_home_address).to be_valid
      end

      it 'building_nameは空でも保存できること' do
        @purchase_home_address.building_name = ''
        expect(@purchase_home_address).to be_valid
      end

      
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
          @purchase_home_address.post_code = ''
          @purchase_home_address.valid?
          expect(@purchase_home_address.errors.full_messages).to include("郵便番号を入力してください", "郵便番号は不正な値です")
      end

      it 'post_codeは、「3桁ハイフン4桁」の半角文字列でないと保存できないこと' do
        @purchase_home_address.post_code = '111'
        @purchase_home_address.valid?
        expect(@purchase_home_address.errors.full_messages).to include("郵便番号は不正な値です")
      end

      it 'prefecture_idが1だと保存できないこと' do
        @purchase_home_address.prefecture_id = '1'
        @purchase_home_address.valid?
        expect(@purchase_home_address.errors.full_messages).to include("都道府県は1以外の値にしてください")
      end

      it 'municiparitiesが空だと保存できないこと' do
        @purchase_home_address.municiparities = ''
        @purchase_home_address.valid?
        expect(@purchase_home_address.errors.full_messages).to include("市区町村を入力してください")
      end

      it 'addressが空だと保存できないこと' do
        @purchase_home_address.address = ''
        @purchase_home_address.valid?
        expect(@purchase_home_address.errors.full_messages).to include("番地を入力してください")
      end

      it 'phone_numberが空だと保存できないこと' do
        @purchase_home_address.phone_number = ''
        @purchase_home_address.valid?
        expect(@purchase_home_address.errors.full_messages).to include("電話番号を入力してください")
      end

      it 'phone_numberが9桁以下では購入できない' do
        @purchase_home_address.phone_number = '12345678'
        @purchase_home_address.valid?
        expect(@purchase_home_address.errors.full_messages).to include("電話番号は不正な値です")
      end

      it 'phone_numberが12桁以上では購入できない' do
        @purchase_home_address.phone_number = '1234567890123'
        @purchase_home_address.valid?
        expect(@purchase_home_address.errors.full_messages).to include("電話番号は不正な値です")
      end

      it 'user_idが空だと保存できないこと' do
        @purchase_home_address.user_id = ''
        @purchase_home_address.valid?
        expect(@purchase_home_address.errors.full_messages).to include("Userを入力してください")
      end

      it 'item_idが空だと保存できないこと' do
        @purchase_home_address.item_id = ''
        @purchase_home_address.valid?
        expect(@purchase_home_address.errors.full_messages).to include("Itemを入力してください")
      end

      it "tokenが空では登録できないこと" do
        @purchase_home_address.token = nil
        @purchase_home_address.valid?
        expect(@purchase_home_address.errors.full_messages).to include("クレジットカード情報を入力してください")
      end


      
      
      
    end


  end
end

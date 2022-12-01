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
          expect(@purchase_home_address.errors.full_messages).to include("Post code can't be blank", "Post code is invalid")
      end

      it 'post_codeは、「3桁ハイフン4桁」の半角文字列でないと保存できないこと' do
        @purchase_home_address.post_code = '111'
        @purchase_home_address.valid?
        expect(@purchase_home_address.errors.full_messages).to include("Post code is invalid", "Post code is invalid")
      end

      it 'prefecture_idが1だと保存できないこと' do
        @purchase_home_address.prefecture_id = '1'
        @purchase_home_address.valid?
        expect(@purchase_home_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'municiparitiesが空だと保存できないこと' do
        @purchase_home_address.municiparities = ''
        @purchase_home_address.valid?
        expect(@purchase_home_address.errors.full_messages).to include("Municiparities can't be blank")
      end

      it 'addressが空だと保存できないこと' do
        @purchase_home_address.address = ''
        @purchase_home_address.valid?
        expect(@purchase_home_address.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberが空だと保存できないこと' do
        @purchase_home_address.phone_number = ''
        @purchase_home_address.valid?
        expect(@purchase_home_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが10桁以上11桁以内の半角数値のみでないと保存できないこと' do
        @purchase_home_address.phone_number = ''
        @purchase_home_address.valid?
        expect(@purchase_home_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it "tokenが空では登録できないこと" do
        @purchase_home_address.token = nil
        @purchase_home_address.valid?
        expect(@purchase_home_address.errors.full_messages).to include("Token can't be blank")
      end


      
      
      
    end


  end
end

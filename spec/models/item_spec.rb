require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品" do
    
    it "image、nameとexplain、categoryとstatus、areaとpayment、dayとpriceが存在すれば出品できること" do
      expect(@item).to be_valid
    end

    it "imageが空では出品できないこと" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it "nameが空では出品できないこと" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it "explainが空では出品できないこと" do
      @item.explain = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Explain can't be blank")
    end

    it "categoryが空では出品できないこと" do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end

    it "statusが空では出品できないこと" do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include( "Status must be other than 1")
    end

    it "areaが空では出品できないこと" do
      @item.area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include( "Area must be other than 1")
    end

    it "paymentが空では出品できないこと" do
      @item.payment_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include( "Payment must be other than 1")
    end

    it "dayが空では出品できないこと" do
      @item.day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include( "Day must be other than 1")
    end

    it "priceが空では出品できないこと" do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include( "Price can't be blank", "Price is invalid", "Price is not a number")
    end

    it "priceが¥300未満では出品できないこと" do
      @item.price = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include( "Price must be greater than or equal to 300")
    end

    it "priceが¥9,999,999より大きければ出品できないこと" do
      @item.price = "99999999"
      @item.valid?
      expect(@item.errors.full_messages).to include( "Price must be less than or equal to 9999999")
    end

    it "priceが半角数字でなければ出品できないこと" do
      @item.price = "a1000"
      @item.valid?
      expect(@item.errors.full_messages).to include( "Price is not a number")
    end

  end
end

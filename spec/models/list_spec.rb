require 'rails_helper'

RSpec.describe List, type: :model do
  context "データが正しく保存される" do
    before do
      @list = List.new
      @list.title = "タイトル"
      @list.body = "本文です。"
      @list.save
    end
    it "全て入力してあるので保存される" do
      expect(@list).to be_valid
    end
  end
  context "データが正しく保存されない" do
    before do
      @list = List.new
      @list.title = ""
      @list.body = "本文です。"
      @list.save
    end
    it "titleが入力されていないので保存されない" do
      expect(@list).to be_invalid
      expect(@list.errors[:title]).to include("can't be blank")
    end
  end
  context "データが正しく保存されない" do
    before do
      @list = List.new
      @list.title = "タイトル"
      @list.body = ""
      @list.save
    end
    it "bodyが入力されていないので保存されない" do
      expect(@list).to be_invalid
      expect(@list.errors[:body]).to include("can't be blank")
    end
  end
  context "データが正しく更新される" do
    before do
      @list = List.new(title:"タイトル", body:"本文です")
      @list.save
      @list.update(title:"title", body:"body")
    end
    it "データが全て入力されているので更新される" do
      expect(@list). to be_valid
    end
  end
  context "データが正しく更新されない"
    before do
      @list = List.new(title:"タイトル", body:"本文です")
      @list.save
      @list.update(title:"", body:"body")
    end
    it "データが全て入力されていないので更新されない" do
      expect(@list). to be_invalid
    end
  end
end

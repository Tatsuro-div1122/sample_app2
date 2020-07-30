require 'rails_helper'

RSpec.describe List, type: :model do
  context "データが正しく保存される" do
    let!(:list) {List.create(title:"タイトル", body:"本文です")}
    it "全て入力してあるので保存される" do
      expect(List.first).to eq list
    end
  end
  context "データが正しく保存されない" do
    let(:list) {List.create(title:"", body:"本文です")}
    it "titleが入力されていないので保存されない" do
      expect(list).to be_invalid
    end
    it "未入力のエラーメッセージが表示される" do
      expect(list.errors[:title]).to include("can't be blank")
    end
  end
  context "データが正しく保存されない" do
    let(:list) {List.create(title:"タイトル", body:"")}
    it "bodyが入力されていないので保存されない" do
      expect(list).to be_invalid
    end
    it "未入力のエラーメッセージが表示される" do
      expect(list.errors[:body]).to include("can't be blank")
    end
  end

  context "データが正しく更新される" do
    let(:list) {List.new(title:"タイトル", body:"本文です")}
    before do
      list.update(title:"title", body:"body")
    end
    it "データが全て入力されているので更新される" do
      expect(list).to be_valid
    end
  end
  context "データが正しく更新されない" do
    let(:list) {List.create(title:"タイトル", body:"本文です")}
    before do
      list.update(title:"", body:"body")
    end
    it "データが全て入力されていないので更新されない" do
      expect(list). to be_invalid
    end
    it "未入力のエラーメッセージが表示される" do
      expect(list.errors[:title]).to include("can't be blank")
    end
  end
  context "データが正しく更新されない" do
    let(:list) {List.create(title:"タイトル", body:"本文です")}
    before do
      list.update(title:"title", body:"")
    end
    it "データが全て入力されていないので更新されない" do
      expect(list).to be_invalid
    end
    it "未入力のエラーメッセージが表示される" do
      expect(list.errors[:body]).to include("can't be blank")
    end
  end
end

require 'rails_helper'

RSpec.describe "Todoloists", type: :request do
  describe '新規投稿ページ' do
    context '新規投稿ページが正しく表示される' do
      before do
        get todolists_new_path
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it '表示が正しいこと' do
        expect(response.body).to include("新規投稿", "タイトル", "本文", "画像", "投稿")
      end
    end
  end

  describe 'トップページ' do
    context 'トップページが正しく表示される' do
      before do
        get top_path
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
    end
  end

  describe '投稿一覧ページ' do
    context '投稿ページが正しく表示される' do
      before do
        get todolists_path
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
    end
  end

  describe '投稿詳細ページ' do
    context '投稿詳細ページが正しく表示される' do
      let(:list) {List.create(title:"タイトル", body:"本文です")}
      before do
        get todolist_path(list)
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
    end
  end

  describe '編集ページ' do
    context '投稿編集ページが正しく表示される' do
      let(:list) {List.create(title:"タイトル", body:"本文です")}
      before do
        get edit_todolist_path(list)
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
    end
  end
end

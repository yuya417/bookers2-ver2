require 'rails_helper'

RSpec.describe 'Favoriteモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { favorite2.valid? }

    let(:user) { create(:user) }
    let!(:book) { create(:book, user:) }
    let!(:favorite) { create(:favorite, book:, user:) }
    let!(:favorite2) { build(:favorite, book:, user:) }

    it 'ユーザーは一つの投稿に一つしかいいねできない' do
      is_expected.to eq false
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Bookモデルとの関係' do
      it 'N:1となっている' do
        expect(Favorite.reflect_on_association(:book).macro).to eq :belongs_to
      end
    end
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Favorite.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end
end

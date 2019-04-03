require 'rails_helper'

describe Post, type: :model do

  describe 'validations' do
    let(:post) { Post.new(title: '', content: '', time: '', skills: '') }

    it 'requires title' do
      post.valid?
      expect(post.errors[:title]).not_to be_empty
    end

    it 'requires content' do
      post.valid?
      expect(post.errors[:content]).not_to be_empty
    end

    it 'requires time' do
      post.valid?
      expect(post.errors[:time]).not_to be_empty
    end

    it 'requires skills' do
      post.valid?
      expect(post.errors[:skills]).not_to be_empty
    end
  end

  describe 'associations validations' do

    it 'belongs_to ingredient' do
      post = Post.new(title: 'Some title', content: 'some content', time: 10, skills: 1, ingredients: [])
      expect(post.valid?).to be_falsy
    end

    it 'has a belongs_to association' do
      ingredient = Ingredient.new(name: 'ingredient')
      post = FactoryBot.create(:post, ingredients: [ingredient])
      expect(post.ingredients).to eq([ingredient])
    end
  end

end

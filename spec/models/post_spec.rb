require 'rails_helper'

describe Post, type: :model do

  describe 'validations' do
    let(:post) { Post.new(title: '', content: '', time: '', skills: '') }

    it 'requires title' do
      expect(post.valid?).to be_falsy
    end

    it 'requires content' do
      expect(post.valid?).to be_falsy
    end

    it 'requires time' do
      expect(post.valid?).to be_falsy
    end

    it 'requires skills' do
      expect(post.valid?).to be_falsy
    end
  end

end

require 'rails_helper'

describe PostsController do

  describe "guest user" do

    describe "GET index" do
      it "renders :index template" do
        get :index
        expect(response).to render_template(:index)
      end
    end

    describe "GET show" do
      let(:post) { FactoryBot.create(:post)}

      it "renders :show template" do
        get :show, params: {id: post.id}
        expect(response).to render_template(:show)
      end
      it "assigns requested post to @post" do
        get :show, params: { id: post.id }
        expect(assigns(:post)).to eq(post)
      end
    end

    describe "GET new" do
      it "redirects to login page" do
        get :new
        expect(response).to redirect_to(new_user_session_url)
      end
    end

    describe "POST create" do
      it "redirects to login page" do
        post :create, params: { post: FactoryBot.attributes_for(:post) }
        expect(response).to redirect_to(new_user_session_url)
      end
    end

    describe "GET edit" do
      it "redirects to login page" do
        get :edit, params: { id: FactoryBot.create(:post).id }
        expect(response).to redirect_to(new_user_session_url)
      end
    end

    describe "PUT update" do
      it "redirects to login page" do
        put :update, params: { id: FactoryBot.create(:post).id, post: FactoryBot.create(:post) }
        expect(response).to redirect_to(new_user_session_url)
      end
    end

    describe "DELETE destroy" do
      it "redirects to login page" do
        delete :destroy, params: { id: FactoryBot.create(:post).id }
        expect(response).to redirect_to(new_user_session_url)
      end
    end

  end

  # describe "GET new" do
  #   context "when the user is admin" do
  #     it "renders :new template" do
  #       admin = FactoryBot.create(:admin)
  #       login_as(:admin, scope: :user)
  #       get :new
  #       expect(response).to render_template :new
  #     end
  #     it "assigns new Post to @post" do
  #       get :new
  #       expect(assigns(:post)).to be_a_new(Post)
  #     end
  #   end
  # end



  # describe "POST create" do
  #   it "redirects to posts#show" do
  #     post :create, params: { post: FactoryBot.attributes_for(:post) }
  #     expect(response).to redirects_to(post_path(assigns[:post]))
  #   end
  #   it "creates new post in database" do
  #
  #   end
  # end

end

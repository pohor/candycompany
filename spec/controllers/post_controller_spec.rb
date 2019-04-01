require 'rails_helper'

describe PostsController do

  shared_examples "public access to posts" do
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
  end

  describe "guest user" do

    it_behaves_like "public access to posts"

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

  describe "regular user" do
    let(:user) { FactoryBot.create(:user) }
    before do
      sign_in(user)
    end

    it_behaves_like "public access to posts"

    describe "GET new" do
      it "redirects to posts index page" do
        get :new
        expect(response).to redirect_to(posts_path)
      end
    end

    describe "POST create" do
      it "redirects to posts index page" do
        post :create, params: { post: FactoryBot.attributes_for(:post) }
        expect(response).to redirect_to(posts_path)
      end
    end

    describe "GET edit" do
      it "redirects to posts index page" do
        get :edit, params: { id: FactoryBot.create(:post).id }
        expect(response).to redirect_to(posts_path)
      end
    end

    describe "PUT update" do
      it "redirects to posts index page" do
        put :update, params: { id: FactoryBot.create(:post).id, post: FactoryBot.create(:post) }
        expect(response).to redirect_to(posts_path)
      end
    end

    describe "DELETE destroy" do
      it "redirects to posts index page" do
        delete :destroy, params: { id: FactoryBot.create(:post).id }
        expect(response).to redirect_to(posts_path)
      end
    end

  end

  describe "admin user" do
    let(:user) { FactoryBot.create(:admin) }
    before do
      sign_in(user)
    end

    it_behaves_like "public access to posts"

    describe "GET new" do
      it "renders :new template" do
        get :new
        expect(response).to render_template :new
      end
    end

    describe "POST create" do

      context "valid data" do
        it "redirects to posts#show after creating" do
          post :create, params: { post: FactoryBot.attributes_for(:post) }
          expect(response).to redirect_to(post_path(assigns[:post]))
        end

        it "creates new post in database" do
          expect { post :create, params: { post: FactoryBot.attributes_for(:post) } }.to change(Post, :count).by(1)
        end
      end

      context "invalid data" do
        it "renders :new template" do
          post :create, params: { post: FactoryBot.attributes_for(:post, title: "") }
          expect(response).to render_template(:new)
        end

        it "doesn't create a new post in the database" do
          expect {
            post :create, params: { post: FactoryBot.attributes_for(:post, title: "") } }.not_to change(Post, :count)
        end
      end
    end

    describe "GET edit" do
      let(:post) { FactoryBot.create(:post) }
      it "renders :edit template" do
        get :edit, params: { id: post.id }
        expect(response).to render_template(:edit)
      end

      it "assigns the requested post to template" do
        get :edit, params: { id: post.id }
        expect(assigns(:post)).to eq(post)
      end
    end

    describe "PUT update" do
      let(:post) { FactoryBot.create(:post) }

      context "valid data" do
        let(:valid_data) { FactoryBot.attributes_for(:post, title: "New Title") }

        it "redirects to posts#show" do
          put :update, params: { id: post.id, post: valid_data }
          expect(response).to redirect_to(post)
        end

        it "updates post in the database" do
          put :update, params: { id: post.id, post: valid_data }
          post.reload
          expect(post.title).to eq("New Title")
        end
      end

      context "invalid data" do
        let(:invalid_data) { FactoryBot.attributes_for(:post, title: "", content: "new") }
        it "renders :edit template"do
          put :update, params: { id: post.id, post: invalid_data }
          expect(response).to render_template(:edit)
        end

        it " doesn't update post in the database" do
          put :update, params: { id: post.id, post: invalid_data }
          post.reload
          expect(post.content).not_to eq("new")
        end
      end
    end

    describe "DELETE destroy" do
      let(:post) { FactoryBot.create(:post) }

      it "redirects to posts#index" do
        delete :destroy, params: { id: post.id }
        expect(response).to redirect_to(posts_path)
      end

      it "deletes post from database" do
        delete :destroy, params: { id: post.id }
        expect(Post.exists?(post.id)).to be_falsy
      end
    end
  end


end

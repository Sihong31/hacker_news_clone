require "rails_helper"

RSpec.describe PostsController, :type => :controller do

  let (:some_test_user) {User.create!(username:'bagoftricks', password: '123456', first_name: "bagof", last_name: "tricks")}
  let!(:sample_post) {Post.create!(title: "why it has to be in a bag", url: "bod.com", body: "it just has to be", user_id: 1)}

  before :each do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(some_test_user)
  end

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all of the posts into @posts" do
      get :index
      expect(assigns(:posts)).to eq([sample_post])
    end
  end
  describe "#create" do
    it "creates a new post on index page" do
      post :create, { post: {title: "why it has to be a bag", url: "bod.com", body: "it just has to be", user_id: 1}}
      expect(response).to redirect_to post_path(Post.last)
    end
  end
  describe "#show" do
    it "assigns a post" do
      get :show, id: sample_post.id
      expect(assigns(:post)).to eq(sample_post)
    end
  end
  describe "#update" do
    it "saves a valid update" do
      put :update, {id: sample_post.id, post:{title: 'Awesome god damn post'}}
      expect(response).to redirect_to post_path(sample_post)
      # expect(sample_post.reload.title).to eq('')
    end
    it "won't save a bad update" do
      old_title = sample_post.title
      put :update, {id: sample_post.id, post:{title: nil}}
      expect(response).to render_template("edit")
      expect(sample_post.reload.title).to eq(old_title)
    end
  end

  describe "#delete" do
    it "deletes the post" do
      old_count = Post.count
      delete :destroy, id: sample_post.id
      expect(response).to redirect_to(posts_path)
      expect(Post.count).to eq(old_count - 1)
      expect(Post.where(id: sample_post.id).count).to eq(0)
    end
  end
end

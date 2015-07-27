require "rails_helper"

RSpec.describe PostsController, :type => :controller do

  let (:some_test_user) {User.create!(username:'bagoftricks', password: '123456', first_name: "bagof", last_name: "tricks")}
  let!(:sample_post) {Post.create!(title: "why it has to be in a bag", url: "bod.com", body: "it just has to be", user_id: 1)}
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
      post1, post2 = Post.create!(title: "hello", body: "hello again", user_id: 1), Post.create!(title: "jello", body: "jello again", user_id: 4)
      get :index
      expect(assigns(:posts)).to match_array([post1, post2])
    end
  end
  describe "create a post" do
    it "creates a new post on index page" do
      allow(PostsController).to receive(:current_user) {current_user.id = 1}
      visit '/posts/new'
        save_and_open_page
        within("#new_post") do

          fill_in 'post[title]', :with => 'anchovies'
          fill_in 'post[url]', :with => 'delicious'
          fill_in 'post[body]', :with => 'goes great in your coffee with grape jam'
        end
        click_button 'Create!'
        expect(page).to have_content 'adlfjalkdfj'
    end
  end
end

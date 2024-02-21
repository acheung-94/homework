require 'rails_helper'

RSpec.describe "Users", type: :request do

  describe "GET /users/new (#new)" do
    it "renders the new template" do
      get new_user_url
      expect(response.body).to include("Sign Up!")
    end
  end

  describe "POST /users (#create)" do
    context "with invalid params" do
      it "validates the presence of the user's email" do
        # Your code here
        post users_url, params: { user: { email: '', password: 'abcdef' } }
        expect(flash.now[:errors]).to eq(["Email can't be blank"])
      end

      it "validates that the password is at least 6 characters long" do
        # Your code here
        post users_url, params: { user: { email: 'jack_bruce', password: 'short' } }
        expect(flash.now[:errors]).to eq(["Password is too short (minimum is 6 characters)"])
      end
    end

    context "with valid params" do
      it "redirects user to root page on success" do
        post users_url, params: { user: { email: 'jack_bruce@hotmail.com', password: 'password' } }
        expect(response).to redirect_to(root_url)
      end
    end
  end
end
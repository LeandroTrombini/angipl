require 'rails_helper'
RSpec.describe "Words", type: :request do
  describe "GET /words" do
     it "returns http success" do
         word = Word.create(value: "teste", language: "Português")
        get "/words"
        expect(response.status).to eq(200)
        expect(response.body).to include("teste")
     end
  end
end
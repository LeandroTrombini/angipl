require 'rails_helper'

RSpec.describe WordsController, type: :controller do
  describe "GET index" do
    context "successful" do
      before { get :index }
      it "returns http status 200 and success" do
        expect(response).to be_successful
        expect(response).to have_http_status(200)
      end

      it "renders the index template" do
        expect(response).to render_template(:index)
      end


      it "should array empty" do
        expect(assigns(:words)).to be_empty
      end
    end
  end

  describe "POST create" do
    subject { post :create, params: params }

    context 'valid params' do
      let(:params) { { word: { value: 'cat', language: 'english'} } }

      it "creates new word" do
        expect { subject }.to change { Word.count }.by 1
      end
    end

    context 'invalid params' do
      let(:params) { { word: { value: 'cat' } } }

      it "does not create new word" do
        expect { subject }.to_not change(Word, :count)
      end
    end
  end

  describe "GET show" do
    before { get :show, params: params }

    let(:params) do
      { id: word.id }
    end

    let(:word) { create(:word) }

    it 'assigns @word' do
      expect(assigns(:word)).to eq(word)
    end

    it 'shoul success and render to edit page' do
      expect(response).to have_http_status(200)
      expect(response).to render_template(:show)
    end
  end
end
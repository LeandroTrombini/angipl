require 'rails_helper'

RSpec.describe WordsController, type: :controller do
  describe "GET index" do
    before { get :index }
    it "renders the index template" do
      expect(response).to be_successful
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
end
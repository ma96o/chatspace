require 'rails_helper'

describe MessagesController do
  let(:user){ create(:user) }
  let(:group){ create(:group) }
  let(:message){ build(:message) }

  before do
    sign_in user
  end

  after do
    sign_out user
  end

  describe 'GET #index' do
    before do
      get :index, group_id: group.id, user_id: user.id
    end

    it 'renders the index template' do
      expect(response).to render_template :index
    end
  end

  describe 'POST #create' do
    context 'success to save' do
      it 'save success' do
        expect {
          post :create, params: {group_id: group.id, user_id: user.id, message: attributes_for(:message)}
        }.to change(Message, :count)
      end

      it 'redirects to messages#index' do
        post :create, group_id: group.id, user_id: user.id, message: attributes_for(:message)
        expect(response).to redirect_to group_messages_path(group.id)
      end
    end

    context 'fail to save' do
      it 'can not save in the database' do
        expect {
          post :create, group_id: group.id, user_id: user.id, message: attributes_for(:message, text: nil, image: nil)
        }.not_to change(Message, :count)
      end

      it 'response as ajax' do
        post :create, params: {group_id: group.id,  user_id: user.id, message: attributes_for(:message, text: nil, image: nil)}
        expect(response.status).to eq 200
      end
    end
  end
end

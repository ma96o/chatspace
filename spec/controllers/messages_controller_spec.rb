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
      context 'when format is html' do
        it 'save success' do
          expect {
            post :create, params: {group_id: group.id, user_id: user.id, message: attributes_for(:message), format: :html}
          }.to change(Message, :count).by(1)
        end

        it 'redirect to #index' do
          post :create, params: {group_id: group.id, user_id: user.id, message: attributes_for(:message), format: :html}
          expect(response).to redirect_to group_messages_path(group.id)
        end

        it 'has success message' do
          post :create, params: {group_id: group.id, user_id: user.id, message: attributes_for(:message), format: :html}
          expect(flash[:notice]).to be_present
        end
      end

      context 'when format is json' do
        it 'save success' do
          expect {
            post :create, params: {group_id: group.id, user_id: user.id, message: attributes_for(:message), format: :json}
          }.to change(Message, :count).by(1)
        end
        it 'no render template' do
          post :create, params: {group_id: group.id, user_id: user.id, message: attributes_for(:message), format: :json}
          expect(@template).to be_nil
        end
      end
    end


    context 'fail to save' do
      it 'can not save in the database' do
        expect {
          post :create, group_id: group.id, user_id: user.id, message: attributes_for(:message, text: nil, image: nil)
        }.not_to change(Message, :count)
      end

      it 'render #index after save failed' do
        post :create, params: {group_id: group.id,  user_id: user.id, message: attributes_for(:message, text: nil, image: nil)}
        expect(response).to render_template(:index)
      end

      it 'has alert message' do
        post :create, params: {group_id: group.id,  user_id: user.id, message: attributes_for(:message, text: nil, image: nil)}
        expect(flash[:alert]).to be_present
      end
    end
  end
end

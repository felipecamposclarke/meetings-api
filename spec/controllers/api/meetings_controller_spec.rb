require 'spec_helper'

RSpec.describe Api::MeetingsController, :type => :controller do

  let(:valid_attributes) { FactoryGirl.attributes_for(:meeting) }
  let(:invalid_attributes) { FactoryGirl.attributes_for(:invalid_meeting) }
  let(:meeting) { create(:meeting) }
  let(:valid_session) { {} }

  describe "GET index" do
    before { get :index, {}, valid_session }

    it "assigns all meetings as @meetings" do
      expect(assigns(:meetings)).to eq([meeting])
    end

    it { should respond_with 200 }
  end

  describe "GET show" do
    before { get :show, {:id => meeting.to_param}, valid_session }

    it "assigns the requested meeting as @meeting" do
      expect(assigns(:meeting)).to eq(meeting)
    end

    it { should respond_with 200 }
  end

  describe "POST create" do
    context "when is successfully created" do
      before { post :create, {:meeting => valid_attributes}, valid_session }

      it "creates a new Meeting" do
        expect(Meeting.count).to eq(1)
      end

      it "assigns a newly created meeting as @meeting" do
        expect(assigns(:meeting)).to be_a(Meeting)
        expect(assigns(:meeting)).to be_persisted
      end

      it { should respond_with 201 }
    end

    context "when is not created" do
      before { post :create, {:meeting => invalid_attributes}, valid_session }

      it "renders an errors json" do
        meeting_response = json_response
        expect(meeting_response).to have_key("errors")
      end

      it { should respond_with 422 }
    end
  end

  describe "PUT/PATCH update" do
    context "when is successfully updated" do

      let(:metting_date) { Faker::Date.forward(3).to_datetime }
      let(:new_attributes) { |xxx| { date: metting_date } }

      it "updates the requested meeting" do
        put :update, {:id => meeting.to_param, :meeting => new_attributes}, valid_session
        meeting.reload
        expect(meeting["date"].to_datetime).to eql metting_date
      end

      it "assigns the requested meeting as @meeting" do
        put :update, {:id => meeting.to_param, :meeting => valid_attributes}, valid_session
        expect(assigns(:meeting)).to eq(meeting)
      end

      it "should respond with 200" do
        put :update, {:id => meeting.to_param, :meeting => valid_attributes}, valid_session
        expect(response.response_code).to eq(200)
      end
    end

    context "when is not updated" do
      before { put :update, {:id => meeting.to_param, :meeting => invalid_attributes}, valid_session }

      it "assigns the meeting as @meeting" do
        expect(assigns(:meeting)).to eq(meeting)
      end

      it { should respond_with 422 }
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested meeting" do
      meeting = Meeting.create! valid_attributes
      expect {
        delete :destroy, {:id => meeting.to_param}, valid_session
      }.to change(Meeting, :count).by(-1)
    end

    it "should respond with 204" do
      delete :destroy, {:id => meeting.to_param}, valid_session
      expect(response.response_code).to eq(204)
    end
  end
end

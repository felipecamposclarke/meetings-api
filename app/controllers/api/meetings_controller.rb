module Api
  class MeetingsController < ApplicationController
    before_action :set_meeting, only: [:show, :edit, :update, :destroy]

    respond_to :json

    def index
      @meetings = Meeting.all
      respond_with(@meetings)
    end

    def show
      respond_with(@meeting)
    end

    def create
      @meeting = Meeting.new(meeting_params)
      @meeting.save
      respond_with @meeting, status: 201
    end

    def update
      @meeting.update(meeting_params)
      respond_with(@meeting)
    end

    def destroy
      @meeting.destroy
      respond_with(@meeting)
    end

    private
      def set_meeting
        @meeting = Meeting.find(params[:id])
      end

      def meeting_params
        params.require(:meeting).permit(:title, :description, :author, :date)
      end
  end
end

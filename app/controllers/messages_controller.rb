# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action :set_application_and_chat
  before_action :set_message, only: %i[show update destroy]

  # GET /messages
  def index
    @messages = @chat.messages.all

    render json: @messages
  end

  # GET /messages/1
  def show
    render json: @message
  end

  def search
    return if params[:query].blank?
    @messages = @chat.messages.search(params[:query]).records
    render json: @messages
  end

  # POST /messages
  def create
    @message = @chat.messages.new(message_params)

    if @message.save
      render json: @message, status: :created
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /messages/1
  def update
    if @message.update(message_params)
      render json: @message
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  # DELETE /messages/1
  def destroy
    @message.destroy
  end

  private

  def set_application_and_chat
    @application = Application.find_by(token: params[:application_token])
    @chat = @application.chats.find_by(chat_number: params[:chat_number])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_message
    @message = @chat.messages.find_by(message_number: params[:number])
  end

  # Only allow a trusted parameter "white list" through.
  def message_params
    params.require(:message).permit(:body)
  end
end

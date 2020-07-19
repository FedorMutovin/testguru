class TestsController < ApplicationController
  before_action :find_all_test

  def index
    render json: @test
  end

  def show
    render json: @test.find(params[:id])
  end

  private

  def find_all_test
    @test = Test.all
  end
end

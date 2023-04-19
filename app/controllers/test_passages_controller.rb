class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]
  
  def show; end
  
  def result; end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call

    flash_options = if result.html_url.present?
      create_gist!(url: result.html_url)
      { notice: t('.success', link: view_context.link_to(t('.gist_link'), result.html_url,target: "_blank")).html_safe }
    else
      { alert: t('.failure') }
    end

    redirect_to @test_passage, flash_options
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def create_gist!(url:)
    current_user.gists.create!(url: url, question_id: @test_passage.current_question.id)
  end

end

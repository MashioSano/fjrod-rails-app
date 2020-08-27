# frozen_string_literal: true

class ReportsController < ApplicationController
  before_action :set_report, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[show index]
  before_action :correct_user, only: %i[edit update destroy]

  def index
    @reports = Report.all
  end

  def show; end

  def new
    @report = Report.new
  end

  def edit; end

  def create
    @report = current_user.reports.build(report_params)
    if @report.save
      flash[:notice] = t 'flash.create'
      redirect_to @report
    else
      render :new
    end
  end

  def update
    if @report.update(report_params)
      flash[:notice] = t 'flash.update'
      redirect_to @report
    else
      render 'edit'
    end
  end

  def destroy
    @report.destroy
    flash[:notice] = t 'flash.destroy'
    redirect_to reports_path
  end

  private

  def set_report
    @report = Report.find(params[:id])
  end

  def report_params
    params.require(:report).permit(:title, :body)
  end

  def correct_user
    report = Report.find(params[:id])
    redirect_to reports_path unless current_user == report.user
  end
end

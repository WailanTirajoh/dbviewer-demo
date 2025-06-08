class CompanyProfilesController < ApplicationController
  def index
    @companies = Company.all
  end

  def show
    @company = Company.find_by(slug: params[:slug])
    redirect_to company_profiles_path, alert: "Company not found" unless @company
  end

  def posts
    @company = Company.find_by(slug: params[:company_slug])
    redirect_to company_profiles_path, alert: "Company not found" and return unless @company

    @posts = @company.posts.published.recent.includes(:author)
  end

  def post
    @company = Company.find_by(slug: params[:company_slug])
    redirect_to company_profiles_path, alert: "Company not found" and return unless @company

    @post = @company.posts.published.find_by(slug: params[:slug])
    redirect_to company_posts_path(@company.slug), alert: "Post not found" unless @post
  end

  def employees
    @company = Company.find_by(slug: params[:company_slug])
    redirect_to company_profiles_path, alert: "Company not found" and return unless @company

    @employees = @company.employees.active
  end

  def services
    @company = Company.find_by(slug: params[:company_slug])
    redirect_to company_profiles_path, alert: "Company not found" and return unless @company

    @services = @company.services.order(display_order: :asc)
  end

  def testimonials
    @company = Company.find_by(slug: params[:company_slug])
    redirect_to company_profiles_path, alert: "Company not found" and return unless @company

    @testimonials = @company.testimonials
  end
end

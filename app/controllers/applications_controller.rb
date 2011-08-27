class ApplicationsController < ApplicationController

  before_filter :all_applications
  before_filter :is_owner, :only => [ :edit, :update, :destroy, :statistics ]
  before_filter :is_logged_in, :only => [ :new, :create ]

  def index
    ## @applications provided by before_filter!

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @applications }
    end
  end

  def show
    @application = Application.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @application }
    end
  end

  def new
    @application = Application.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @application }
    end
  end

  def edit
    @application = Application.find(params[:id])
  end

  def create
    @application = Application.new(params[:application])

    respond_to do |format|
      if @application.save
        format.html { redirect_to @application, notice: 'Application was successfully created.' }
        format.json { render json: @application, status: :created, location: @application }
      else
        format.html { render action: "new" }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @application = Application.find(params[:id])

    respond_to do |format|
      if @application.update_attributes(params[:application])
        format.html { redirect_to @application, notice: 'Application was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @application = Application.find(params[:id])
    @application.destroy

    respond_to do |format|
      format.html { redirect_to applications_url }
      format.json { head :ok }
    end
  end

  def version
     @application = Application.find( params[:id] )
     render json: @application.to_json( :only => [ :version, :appexecutable_url ] )
  end

  def statistics
      @application = Application.find( params[:id] )
      respond_to do |format|
         format.html # statistics.html.erb
         format.json { render json: @application }
      end
  end

  ## everything below this is only to be used inside contoller
  private

  def all_applications
        @applications = Application.all
  end

  def is_owner
     @application = Application.find( params[:id] )
     if current_user != @application.user
         render :nothing => true
     end
  end

end

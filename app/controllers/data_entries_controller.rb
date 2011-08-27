class DataEntriesController < ApplicationController

  def index
    @data_entries = DataEntry.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @data_entries }
    end
  end

  def show
    @data_entry = DataEntry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @data_entry }
    end
  end

  def new
    @data_entry = DataEntry.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @data_entry }
    end
  end

  def edit
    @data_entry = DataEntry.find(params[:id])
  end

  def create
    @data_entry = DataEntry.new(params[:data_entry])

    respond_to do |format|
      if @data_entry.save
        format.html { redirect_to @data_entry, notice: 'Data entry was successfully created.' }
        format.json { render json: @data_entry, status: :created, location: @data_entry }
      else
        format.html { render action: "new" }
        format.json { render json: @data_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @data_entry = DataEntry.find(params[:id])

    respond_to do |format|
      if @data_entry.update_attributes(params[:data_entry])
        format.html { redirect_to @data_entry, notice: 'Data entry was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @data_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @data_entry = DataEntry.find(params[:id])
    @data_entry.destroy

    respond_to do |format|
      format.html { redirect_to data_entries_url }
      format.json { head :ok }
    end
  end
end

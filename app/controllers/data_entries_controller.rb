class DataEntriesController < ApplicationController

  def new
    @data_entry = DataEntry.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @data_entry }
    end
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

end

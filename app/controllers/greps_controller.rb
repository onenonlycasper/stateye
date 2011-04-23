class GrepsController < ApplicationController
  # GET /greps
  # GET /greps.xml
  def index
    @greps = Grep.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @greps }
    end
  end

  # GET /greps/1
  # GET /greps/1.xml
  def show
    @grep = Grep.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @grep }
    end
  end

  # GET /greps/new
  # GET /greps/new.xml
  def new
    @grep = Grep.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @grep }
    end
  end

  # GET /greps/1/edit
  def edit
    @grep = Grep.find(params[:id])
  end

  # POST /greps
  # POST /greps.xml
  def create
    @grep = Grep.new(params[:grep])

    respond_to do |format|
      if @grep.save
        format.html { redirect_to(@grep, :notice => 'Grep was successfully created.') }
        format.xml  { render :xml => @grep, :status => :created, :location => @grep }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @grep.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /greps/1
  # PUT /greps/1.xml
  def update
    @grep = Grep.find(params[:id])

    respond_to do |format|
      if @grep.update_attributes(params[:grep])
        format.html { redirect_to(@grep, :notice => 'Grep was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @grep.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /greps/1
  # DELETE /greps/1.xml
  def destroy
    @grep = Grep.find(params[:id])
    @grep.destroy

    respond_to do |format|
      format.html { redirect_to(greps_url) }
      format.xml  { head :ok }
    end
  end
end

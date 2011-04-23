class RawsController < ApplicationController
  # GET /raws
  # GET /raws.xml
  def index
    @raws = Raw.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @raws }
    end
  end

  # GET /raws/1
  # GET /raws/1.xml
  def show
    @raw = Raw.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @raw }
    end
  end

  # GET /raws/new
  # GET /raws/new.xml
  def new
    @raw = Raw.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @raw }
    end
  end

  # GET /raws/1/edit
  def edit
    @raw = Raw.find(params[:id])
  end

  # POST /raws
  # POST /raws.xml
  def create
    @raw = Raw.new(params[:raw])

    respond_to do |format|
      if @raw.save
        format.html { redirect_to(@raw, :notice => 'Raw was successfully created.') }
        format.xml  { render :xml => @raw, :status => :created, :location => @raw }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @raw.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /raws/1
  # PUT /raws/1.xml
  def update
    @raw = Raw.find(params[:id])

    respond_to do |format|
      if @raw.update_attributes(params[:raw])
        format.html { redirect_to(@raw, :notice => 'Raw was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @raw.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /raws/1
  # DELETE /raws/1.xml
  def destroy
    @raw = Raw.find(params[:id])
    @raw.destroy

    respond_to do |format|
      format.html { redirect_to(raws_url) }
      format.xml  { head :ok }
    end
  end
end

class FormsController < ApplicationController
  before_action :set__form, only: [:show, :edit, :update, :destroy]

  # GET /_forms
  # GET /_forms.json
  def index
    @_forms = Form.all
  end

  # GET /_forms/1
  # GET /_forms/1.json
  def show
  end

  # GET /_forms/new
  def new
    @_form = Form.new
  end

  # GET /_forms/1/edit
  def edit
  end

  # POST /_forms
  # POST /_forms.json
  def create
    @_form = Form.new(_form_params)

    respond_to do |format|
      if @_form.save
        format.html { redirect_to @_form, notice: 'Form was successfully created.' }
        format.json { render :show, status: :created, location: @_form }
      else
        format.html { render :new }
        format.json { render json: @_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /_forms/1
  # PATCH/PUT /_forms/1.json
  def update
    respond_to do |format|
      if @_form.update(_form_params)
        format.html { redirect_to @_form, notice: 'Form was successfully updated.' }
        format.json { render :show, status: :ok, location: @_form }
      else
        format.html { render :edit }
        format.json { render json: @_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /_forms/1
  # DELETE /_forms/1.json
  def destroy
    @_form.destroy
    respond_to do |format|
      format.html { redirect_to _forms_url, notice: 'Form was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set__form
      @_form = Form.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def _form_params
      params.require(:_form).permit(:index, :edit, :show, :new)
    end
end

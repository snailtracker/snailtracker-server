class AppsController < ApplicationController
  include Authenticated
  def index
    @apps = App.all
  end
  def new
    @app = App.new
  end
  def create
    @app = App.create(app_params)
    if @app.new_record?
      flash[:error] = @app.errors.full_messages.to_sentence
      render :new
    else
      flash[:success] = "Successfully created #{@app.name}."
      redirect_to @app
    end
  end
  def show
    @app = App.find(params[:id])
  end
  def update
    @app = App.find(params[:id])
    @app.update(app_params)
    flash[:success] = "Successfully updated #{@app.name}."
    redirect_to @app
  end
  def destroy
    @app = App.find(params[:id])
    @app.destroy
    if @app.destroyed?
      flash[:success] = "Successfully destroyed #{@app.name}"
    else
      flash[:error] = "Could not destroy #{@app.name}"
    end
    redirect_to apps_path
  end

  private

  def app_params
    params.require(:app).permit(:name)
  end
end

class EmployeesController < ApplicationController
def new
   @employee = Employee.new   
   @employee.build_address
   @employee.build_corporation
 end
 
 def create
  @employee = Employee.create(employee_params)
  if @employee.save
    redirect_to @employee
  else
    render 'new'
  end
 end 
 
 def show
   @employee = Employee.find(params[:id])
 end
 
 def index
  @employees = Employee.all
 end
 
  def edit
   @employee = Employee.find(params[:id])
  end
  
  def update
    @employee = Employee.find(params[:id])
 
    if @employee.update(employee_params)
      redirect_to @employee
    else
      render 'edit'
    end
  end
  
  def destroy
    @employee = Employee.find(params[:article_id])
    @address = @employee.address.find(params[:id])
    @address.destroy
    @corpo = @employee.corporation.find(params[:id])
    @corpo.destroy
    redirect_to employee_path(@employee)
  end
 
 private
  def employee_params
    params.require(:employee).permit(:name, address_attributes: [:street, :city], corporation_attributes: [:name])
  end
end

class ContactsController <  ApplicationController

  before_action :set_contact, only:[:show, :edit, :update, :destroy]

  def index
    @contactgroups = ContactGroups.where(:group_id => "3" )
  end

  def new
    @contact = Contact.new
    @groups = Group.all
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.user_id = current_user.id
    if @contact.save
      flash[:success] = "You have successfully login"
      redirect_to contact_path(@contact)
    else
      flash[:error] = "You have successfully login"
      render 'new'
    end
  end

  def show
    @user = User.all
    @current_user = current_user
  end

  def edit
  end

  def update
    if @contact.update(contact_params)
      redirect_to contact_path(@contact)
    else
      render 'edit'
    end
  end

  def destroy
    ContactGroups.where(:contact_id => @contact.id.to_i).destroy_all
    @contact.destroy
    redirect_to contacts_path
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :last_name, :phone_number, groups_ids: [])
  end

  def set_contact
    @contact = Contact.find(params[:id])

  end
end
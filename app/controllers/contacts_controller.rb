class ContactsController < ApplicationController
  
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.contact_mail(@contact).deliver
      flash[:notice] = "お問い合わせ内容を送信しました"
      redirect_to("/")
    else
      render("contents/new")
    end
  end


  private

    # Only allow a list of trusted parameters through.
    def contact_params
      params.require(:contact).permit(:name, :email, :content)
    end
  
end
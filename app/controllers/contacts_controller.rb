class ContactsController < ApplicationController

  def new
  	@contact = Contact.new
  end

  def create
  	@contact = Contact.new(params[:contact])
  	@contact.request = request
  	if @contact.deliver
  		flash[:notice] = 'Thank you! Your message was sent successfully. You will receive a feedback from us as soon as possible.'
  		redirect_to request.referrer || root_url
  	else
  		flash[:error] = 'Something went wrong contacting with Us. Please, try again.'
  		redirect_to request.referrer || root_url
  	end
  end

end

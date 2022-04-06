# frozen_string_literal: true

class ContactsController < ApplicationController
  # GET /contacts/new

  def new
    @contact = Contact.new

    @contact.build_company
  end

  # POST /contacts or /contacts.json

  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save

        format.html do
          redirect_to root_path,
                      notice: 'Nous avons bien pris en compte votre demande. Nous allons vous contacter très prochainement.'
        end

        format.json { render :show, status: :created, location: @contact }

      else

        format.html { render :new, status: :unprocessable_entity }

        format.json { render json: @contact.errors, status: :unprocessable_entity }

      end
    end
  end

  private

  # Only allow a list of trusted parameters through.

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :phone, :company_id, company_attributes: [:name])
  end
end

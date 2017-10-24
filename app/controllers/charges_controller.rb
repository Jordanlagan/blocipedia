class ChargesController < ApplicationController

  def initialize
    @price = Amount.new.default
  end

  def create

    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @price,
      description: "BigMoney Membership - #{current_user.email}",
      currency: 'usd'
    )

    current_user.premium!
    flash[:notice] = "Thanks for your purchase, #{current_user.email}"
    redirect_to wikis_path

    rescue Stripe::CardError => e
      flash[:alert] = e.message
      redirect_to new_charge_path

  end

  def new
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "BigMoney Membership - #{current_user.name}",
      amount: @price
    }
  end

  def downgrade
    current_user.standard!
    set_private_wikis_to_public
    flash[:notice] = "You are now a standard user :("
    redirect_to wikis_path
  end

  private

  def set_private_wikis_to_public
    wikis = Wiki.all
    wikis.each do |w|
      if w.user.id == current_user.id
        w.update_attribute(:private, false)
      end
    end
  end
end

class HomeController < ApplicationController
  def home
    @rates = Rate.all
    @countries = @rates.all.map(&:currency).uniq

    if params[:amount]
      @date = params[:date]
      @amount = params[:amount]
      @from = params[:from]
      @to = params[:to]

      @converted_amount = 0
      from_db_rate = @rates.where(:date => @date, :currency => @from)['rate']
      to_db_rate = @rates.where(:date => @date, :currency => @to)['rate']

      @converted_amount = @amount * (to_db_rate / from_db_rate)
    end
    return @converted_amount
  end

end

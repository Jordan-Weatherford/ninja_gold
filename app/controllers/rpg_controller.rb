class RpgController < ApplicationController
  def index
  	 # reset_session
  	session[:activities] = [] if !session[:activities]
  	session[:gold] = 0 if !session[:gold]
  end

  def farm
  	session[:random] = Random.rand(10..20)
  	time = Time.now
  	session[:activities] << ["Earned #{session[:random]} golds from the farm! (#{time})", "green"]
  	session[:gold] += session[:random].to_i
  	redirect_to :action => 'index'
  end

  def cave
  	session[:random] = Random.rand(5..10)
  	time = Time.now
  	session[:activities] << ["Earned #{session[:random]} golds from the cave! (#{time})", "green"]
  	session[:gold] += session[:random].to_i
  	redirect_to :action => 'index'
  end 

  def house
  	session[:random] = Random.rand(2..5)
  	time = Time.now
  	session[:activities] << ["Earned #{session[:random]} golds from the house! (#{time})", "green"]
  	session[:gold] += session[:random].to_i
  	redirect_to :action => 'index'
  end 

  def casino
  	@rand = Random.rand(0..50)
  	@luck = Random.rand(0..1)

  	time = Time.now
  	if @luck == 1
		session[:activities] << ["Earned #{@rand} golds from the casino! (#{time})", "green"]
		session[:gold] += @rand
	else
		session[:activities] << ["Entered a casino and lost #{@rand} golds...Ouch. (#{time})", "red"]
		session[:gold] -= @rand
	end
  	redirect_to :action => 'index'
  end

  def reset
  	reset_session
  	redirect_to :action => 'index'
  end 
end

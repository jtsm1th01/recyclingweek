class Schedule < ActiveRecord::Base

  def recycling_week
    @todays_number = determine_day_number(Time.now.strftime("%A").downcase)
    @recycle_day_number = determine_day_number(self.recycle_day)
    @days_since_birth = (Date.today - self.birthdate).to_i
    
    week_indicator = (@days_since_birth / 7) + 1
    if self.recycle_birth_week == "y" && week_indicator.odd?
      return false
    elsif self.recycle_birth_week == "y" && week_indicator.even? 
      return true
    elsif self.recycle_birth_week == "n" && week_indicator.odd?
      return true
    elsif self.recycle_birth_week == "n" && week_indicator.even?
      return false
    end
  end
  
  def determine_day_number(day)
    if day == "monday"
      @day_number = 1
    elsif day == "tuesday"
      @day_number = 2
    elsif day == "wednesday"
      @day_number = 3
    elsif day == "thursday"
      @day_number = 4
    elsif day == "friday"
      @day_number = 5
    elsif day == "saturday"
      @day_number = 6
    elsif day == "sunday"
      @day_number = 7
    end
  end

  def indicate_recycling_week(recycling_week)
    if recycling_week == true && (@recycle_day_number > @todays_number)
      @indicator = "Recycling Day is this #{recycle_day.capitalize}."
    elsif recycling_week == true && (@recycle_day_number < @todays_number)
      @indicator = "Recycling Day was on #{recycle_day.capitalize}."
    elsif recycling_week == true && (@recycle_day_number == @todays_number)
      @indicator = "Recycling Day is today." 
    else recycling_week == false
      @indicator = "Recycling Day is next #{recycle_day.capitalize}."
    end
  end    

end

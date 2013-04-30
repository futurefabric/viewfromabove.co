module ReferencesHelper

	def orbit_altitude_in_kilometres
		370
	end

	def kilometres_per_second
		7.71
	end

	def orbit_distance_in_kilometres
		kilometres_per_minute = kilometres_per_second * 60
		orbit_duration_minutes * kilometres_per_minute
	end

	def kilometres_per_hour
		(kilometres_per_second * 60) * 60
	end
	
	def orbit_duration_seconds
		seconds_in_day = (24 * 60) * 60
		seconds_in_day / orbits_per_day
	end

	def orbit_duration_minutes
		orbit_duration_minutes = orbit_duration_seconds / 60
	end

	def orbit_duration_hours_and_minutes
		hours = (orbit_duration_minutes / 60).floor
		minutes = (orbit_duration_minutes % 60).round
		"#{hours} hour #{minutes} minutes"
	end

	def orbits_per_day
		15.7
	end

	def orbits_per_year
		orbits_per_day * 365.25
	end

	def orbits_since_launch
		days_since_launch * orbits_per_day
	end

	def days_since_launch
		day_one = Time.parse('1998-11-20 12:00:00 UTC')
		today = Time.zone.now
		(today - day_one).to_i / 1.day
	end
end

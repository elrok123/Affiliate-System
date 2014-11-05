class SalesController < ApplicationController
	def view
		@total_income_by_month = []
		@total_income_by_month[0] = Order.where("MONTHNAME(created_at) = 'JANUARY'").sum(:order_total)
		@total_income_by_month[1] = Order.where("MONTHNAME(created_at) = 'FEBRUARY'").sum(:order_total)
		@total_income_by_month[2] = Order.where("MONTHNAME(created_at) = 'MARCH'").sum(:order_total)
		@total_income_by_month[3] = Order.where("MONTHNAME(created_at) = 'APRIL'").sum(:order_total)
		@total_income_by_month[4] = Order.where("MONTHNAME(created_at) = 'MAY'").sum(:order_total)
		@total_income_by_month[5] = Order.where("MONTHNAME(created_at) = 'JUNE'").sum(&:order_total)
		@total_income_by_month[6] = Order.where("MONTHNAME(created_at) = 'JULY'").sum(&:order_total)
		@total_income_by_month[7] = Order.where("MONTHNAME(created_at) = 'AUGUST'").sum(&:order_total)
		@total_income_by_month[8] = Order.where("MONTHNAME(created_at) = 'SEPTEMBER'").sum(&:order_total)
		@total_income_by_month[9] = Order.where("MONTHNAME(created_at) = 'OCTOBER'").sum(&:order_total)
		@total_income_by_month[10] = Order.where("MONTHNAME(created_at) = 'NOVEMBER'").sum(&:order_total)
		@total_income_by_month[11] = Order.where("MONTHNAME(created_at) = 'DECEMBER'").sum(&:order_total)

		@total_income_by_years_ago = []
		@total_income_by_years_ago[0] = Order.where("YEAR(created_at) = '"+(11.years.ago).strftime("%Y")+"'").sum(&:order_total)
		@total_income_by_years_ago[1] = Order.where("YEAR(created_at) = '"+(10.years.ago).strftime("%Y")+"'").sum(&:order_total)
		@total_income_by_years_ago[2] = Order.where("YEAR(created_at) = '"+(9.years.ago).strftime("%Y")+"'").sum(&:order_total)
		@total_income_by_years_ago[3] = Order.where("YEAR(created_at) = '"+(8.years.ago).strftime("%Y")+"'").sum(&:order_total)
		@total_income_by_years_ago[4] = Order.where("YEAR(created_at) = '"+(7.years.ago).strftime("%Y")+"'").sum(&:order_total)
		@total_income_by_years_ago[5] = Order.where("YEAR(created_at) = '"+(6.years.ago).strftime("%Y")+"'").sum(&:order_total)
		@total_income_by_years_ago[6] = Order.where("YEAR(created_at) = '"+(5.years.ago).strftime("%Y")+"'").sum(&:order_total)
		@total_income_by_years_ago[7] = Order.where("YEAR(created_at) = '"+(4.years.ago).strftime("%Y")+"'").sum(&:order_total)
		@total_income_by_years_ago[8] = Order.where("YEAR(created_at) = '"+(3.years.ago).strftime("%Y")+"'").sum(&:order_total)
		@total_income_by_years_ago[9] = Order.where("YEAR(created_at) = '"+(2.years.ago).strftime("%Y")+"'").sum(&:order_total)
		@total_income_by_years_ago[10] = Order.where("YEAR(created_at) = '"+(1.years.ago).strftime("%Y")+"'").sum(&:order_total)
		@total_income_by_years_ago[11] = Order.where("YEAR(created_at) = '"+Time.now.year.to_s+"'").sum(&:order_total)
	end
end

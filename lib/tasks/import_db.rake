namespace :import_db do
  desc "Retreive currency data and insert into the local database"
  task insert_currencies: :environment do
    require "open-uri"
    doc = Nokogiri::XML(open("http://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml"))

    doc.xpath("//xmlns:Cube[@time]").each { |curr_rate|
      date = curr_rate["time"]
      each_curr = curr_rate.children
      each_curr.each { |currency|
        currency = currency["currency"]
        rate = currency["rate"]
      Rate.create(date: "#{date}", currency: "#{currency}", rate: "#{rate}")
      }
    }
  end

end

require('./lib/websites_lib.rb')
class ScrapeController < ApplicationController
    def scrape
        prices = []
        agent = Mechanize.new
        agent.user_agent_alias = 'Mac Safari'
        websites = fetch_websites()
        websites.each do |w|
            prices.push({
                website: w[:name],
                price: agent.get(w[:website]).css(w[:anchor])[0].text.gsub("\n",'').strip.gsub(" ", '')
            })
        end
        render json: {status: 'SUCCESS', message: 'scraped', data: prices}, status: :ok
    end
end


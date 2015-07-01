require 'clearbit'

Clearbit.key = '8c6e686d9dd080d984df2d14c9589981'

module Lita
  module Handlers
    class CompanyWhois < Handler

      def self.default_config(config)
        config.command_only = false
      end

      route %r{(?:whois)\s+(\w+[.]\w+)}i, :datasheet

      def datasheet(response)
        query = response.matches[0][0]
        company = Clearbit::Streaming::Company.find(domain: query)

        if company
          response.reply company.logo
          
          response.reply " "
          
          response.reply "*" + company.name.to_s + "* _(" + company.type.to_s + " company)_"
          response.reply "_" + company.description.to_s + "_"
          
          response.reply " "

          response.reply "*Metrics*"
          if company.metrics.employees
          	response.reply "Employees: " + company.metrics.employees.to_s
          end
          if company.twitter.followers
          	response.reply "Twitter Followers: " + company.twitter.followers.to_s
          end
          if company.metrics.raised
          	response.reply "Raised: " + company.metrics.raised.to_s
          end
          if company.metrics.marketCap
          	response.reply "Market Cap: " + company.metrics.marketCap.to_s
          end
          if company.metrics.googleRank
          	response.reply "Google PageRank: " + company.metrics.googleRank.to_s
          end
          if company.metrics.alexaGlobalRank
          	response.reply "Alexa Global Rank: " + company.metrics.alexaGlobalRank.to_s
          end
          
          response.reply " "

          response.reply "*Web Presence*"
          if company.site.url
          	response.reply "Website: " + company.site.url.to_s
          end
          if company.twitter.handle
          	response.reply "Twitter: https://www.twitter.com/" + company.twitter.handle.to_s
          end
          if company.linkedin.handle
          	response.reply "LinkedIn: https://www.linkedin.com/" + company.linkedin.handle.to_s
          end
          if company.facebook.handle
          	response.reply "Facebook: https://www.facebook.com/" + company.facebook.handle.to_s
          end
          if company.phone
          	response.reply "Phone: " + company.phone.to_s
          end
        else
          response.reply 'Company not found'
        end
      end
    end

    Lita.register_handler(CompanyWhois)
  end
end

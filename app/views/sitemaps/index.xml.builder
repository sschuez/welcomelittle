# xml.instruct! :xml, version: '1.0'
# xml.tag! 'sitemapindex', 'xmlns' => "http://www.sitemaps.org/schemas/sitemap/0.9" do

#   xml.tag! 'url' do
#     xml.tag! 'loc', root_url
#   end

#   xml.tag! 'url' do
#     xml.tag! 'loc', contact_url
#   end

#   @inquiries.each do |inquiry|
#     xml.tag! 'url' do
#       xml.tag! 'loc', inquiry_url(inquiry)
#       xml.lastmod inquiry.updated_at.strftime("%F")
#     end
#   end

# end
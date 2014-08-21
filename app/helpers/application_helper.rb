module ApplicationHelper
end

# File actionpack/lib/action_view/helpers/asset_tag_helper.rb, line 166
def favicon_link_tag(source='favicon.ico', options={})
  tag('link', {
    :rel  => 'shortcut icon',
    :type => 'image/vnd.microsoft.icon',
    :href => path_to_image(source)
  }.merge!(options.symbolize_keys))
end
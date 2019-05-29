require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, "77b820f032ae413a8ac5dad827aa72d1", "8bab14c3a05d468dbfd3bd2718ccb202", scope: 'user-read-email playlist-modify-public user-library-read user-library-modify'
end

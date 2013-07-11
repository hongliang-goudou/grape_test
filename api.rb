require 'active_record'
require 'grape'
require 'dalli'
require './models/post'
#require File.expand_path("/home/hongliang/workspace/blog/app/models/post")
#require File.expand_path("/home/hongliang/workspace/blog/app/models/comment")

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: File.expand_path('../db/production.sqlite3', __FILE__), pool: 5)

module Twitter
  class API < Grape::API

    version 'v1', using: :header, vendor: 'twitter'
    format :json

    after do
        @dc.close if @dc.respond_to?(:close)
        ActiveRecord::Base.clear_active_connections!
    end

    resource :statuses do
      desc "Return a post."
      params do
        requires :id, type: Integer, desc: "Post id."
      end
      route_param :id do
        get do
            #@dc = Dalli::Client.new('127.0.0.1:11211')
            #@dc.get("abc_post_#{params[:id]}")
            p = Post.find(params[:id])
            p
        end
      end
    end
  end
end

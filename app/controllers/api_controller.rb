class ApiController < ApplicationController
    protect_from_forgery with: :null_sessions
end
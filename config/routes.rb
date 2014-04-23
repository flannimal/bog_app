BogApp::Application.routes.draw do

  root to: 'bogs#index'

  get '/bogs', to: 'bogs#index'     #/bogs is the menu page

  get '/bogs/new', to: 'bogs#new'     #new goes to /bogs/:id then to /show

  get '/bogs/list', to: 'bogs#list'		# list is an index  (has to go before show)

  get '/bogs/:id', to: 'bogs#show'		#1 item display

  get '/list/:id/edit', to: 'bogs#edit'   

  put '/bogs/:id', to: 'bogs#update'

  get '/bogs/:id/delete', to: 'bogs#delete'

  post '/bogs', to: 'bogs#create'

end


"bogs/new"
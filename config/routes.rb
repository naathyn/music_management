SamRainesMusic::Application.routes.draw do
  resources :messages

  resources :sessions,  only: [:new, :create, :destroy]
  resources :articles, :blogs, :discoveries, :albums, :photos
  resources :shows, except: :show
  resources :tags, only: :show
  resources :users, only: [:edit, :update]

  root to: 'pages#home', as: :home

  get     '/signin'     => 'sessions#new'
  post    '/login'     => 'sessions#new'
  delete  '/signout'    => 'sessions#destroy'
  get     '/writings'   => 'blogs#index',       as: :main_blog
  get     '/discover'   => 'discoveries#index', as: :main_discover
  get     '/music'      => 'pages#music'
  get     '/entry/:id'  => 'blogs#show',        as: :entry
  get     '/contact'    => 'pages#contact'
  get     '/notice'     => 'pages#notice'
  get     '/download'   => 'pages#download'
  get     '/bio'        => 'pages#bio'
end

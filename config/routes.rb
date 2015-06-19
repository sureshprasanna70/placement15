Rails.application.routes.draw do
  resources :personal_profiles
  resources :college_profiles
  root 'home#index'
  get 'resume'=>"home#resume",:as=>"resume"
  get 'faq'=>"home#faq",:as=>"faq"
  get 'data/user/pic/:id/:filename.:extension'=>"application#download"
  devise_for :users,:controllers=>{registrations:"registrations"}
end

Rails.application.routes.draw do
  resources :workstatuses

  get 'admin/index'

  get 'admin/createuser'=>"admin#rollno"
  post 'admin/createuser'

  resources :companies

  resources :projects

  resources :extra_activities

  resources :semester_marks

  resources :academic_details

  resources :personal_profiles
  resources :college_profiles
  root 'home#index'
  get 'resume'=>"home#resume",:as=>"resume"
  get 'faq'=>"home#faq",:as=>"faq"
  get 'data/user/pic/:id/:filename.:extension'=>"application#download"
  get 'excelsheet/:filename.:extension'=>"application#exceldownload"
  devise_for :users,:controllers=>{registrations:"registrations"},path_names: { sign_up: ''  }
end

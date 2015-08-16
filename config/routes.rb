Rails.application.routes.draw do
  resources :courses

  resources :notifications

  resources :workstatuses

  get 'admin'=>'admin#index'
  get 'admin/query'=>"admin#querybuild"
  post 'admin/getresults'=>"admin#getresults"
  get 'admin/createuser'=>"admin#rollno",:as=>"multi_user"
  post 'admin/createuser'
  get 'admin/excelsheet'=>"admin#excelsheet",:as=>"excel_user"
  post 'admin/userexcel'
  get 'college_profile/branch/:degree'=>"college_profiles#getdegree"
  get 'feedback'=>"home#feedback"
  get 'excelsheet'=>"college_profiles#excel_dump"
  post 'feedback/send'=>"home#send_feedback",:as=>"send_feedback"
  get 'admin/singleuser'=>"admin#singleuser",:as=>"single_user"
  post 'admin/singleuser'=>"admin#loneuser"
  get 'admin/changepassword'=>"admin#change_pass",:as=>"changepassword"
  post 'admin/changepassword'=>'admin#password',:as=>'password_path'
  get 'admin/edit_enable'=>"admin#enable_edit",:as=>"enable_edit"
  post 'admin/edit_enable'=>"admin#enable_edit_action",:as=>"enable"
  get 'myresume'=>"home#print",:as=>"myresume"
  get 'barcode/:filename.:extension'=>"application#barcode",:as=>"barcode"

  resources :companies

  resources :projects

  resources :extra_activities

  resources :semester_marks

  resources :academic_details

  resources :personal_profiles
  resources :college_profiles
  root 'home#index'
  get 'resume'=>"home#resume",:as=>"resume"
  get 'resume/submit'=>"home#submit",:as=>"submit_resume"
  get 'faq'=>"home#faq",:as=>"faq"
  get 'data/user/pic/:id/:filename.:extension'=>"application#download"
  get 'excelsheet/:filename.:extension'=>"application#exceldownload"
  get 'resume/complete'=>"home#complete",:as=>"complete"
  devise_for :users,:controllers=>{registrations:"registrations"},path_names: { sign_up: ''  }

end

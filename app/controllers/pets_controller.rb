class PetsController < ApplicationController

  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index'
  end

  get '/pets/new' do
    @owners = Owner.all
    erb :'/pets/new'
  end

  post '/pets' do
    pet = Pet.create(name:params[:pet_name])
    if params[:owner_id]
      owner = Owner.find(params[:owner_id])
      owner.pets << pet
      owner.save
      # binding.pry
    else
      new_owner = Owner.create(name:params[:owner_name])
      new_owner.pets << pet
      new_owner.save
    end
    redirect to "/pets/#{pet.id}"
  end

  get '/pets/:id' do
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

  get '/pets/:id/edit' do
    # binding.pry
    @pet = Pet.find(params[:id])
    @owners = Owner.all
    erb :'/pets/edit'
  end

  patch '/pets/:id' do
    pet = Pet.find(params[:id])
    owner = Owner.find(params[:owner][:id]) if params[:owner][:name].empty?
    # binding.pry
    pet.update(name: params[:pet_name])
    if owner
      owner.pets << pet
      owner.save
    else
      new = Owner.create(name: params[:owner][:name])
      new.pets << pet
      # binding.pry
    end
    redirect to "/pets/#{@pet.id}"
  end
end

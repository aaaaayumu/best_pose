require 'rails_helper'

def basic_pass(path) 
  username = ENV["BASIC_AUTH_USER"] 
  password = ENV["BASIC_AUTH_PASSWORD"]
  visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
end

RSpec.describe "ユーザー新規登録", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  context '新規登録できるとき' do
    it '正しい情報を入力すればユーザー新規登録ができてトップページに遷移する' do
      # トップページに移動する
        basic_pass root_path
      # トップページに新規登録ページに遷移するボタンがあることを確認する
        expect(page).to have_content 'ユーザー登録'
      # 新規登録ページに移動する
        visit new_user_registration_path
      # 正しいユーザー情報を入力する
        fill_in 'user_nickname', with: @user.nickname
        fill_in 'user_email', with: @user.email
        fill_in 'user_password', with: @user.password
        fill_in 'user_password_confirmation', with: @user.password_confirmation
        fill_in 'user_body_height', with: @user.body_height
        fill_in 'user_body_weight', with: @user.body_weight
        fill_in 'user_self_introduction', with: @user.self_introduction
      # 新規登録ボタンを押すとユーザーモデルのカウントが1上がるのを確認する
        expect{
          find('input[name="commit"]').click
        }.to change { User.count }.by(1)
      # トップページに遷移したことを確認する
        expect(current_path).to eq root_path
      # ログアウトボタンやマイページボタン、ユーザー編集ボタンが表示されることを確認する
        expect(page).to have_content 'ログアウト' 
        expect(page).to have_content 'マイページ' 
        expect(page).to have_content 'ユーザー編集' 
      # ログインボタンや新規登録ページに遷移するボタンが表示されていないことを確認する
        expect(page).to have_no_content 'ログイン'
        expect(page).to have_no_content 'ユーザー登録'
    end
  end
  context '新規登録できないとき' do
    it '誤った情報ではユーザー新規登録できずにユーザー新規登録ページに戻ってくる' do
      # トップページに移動する
        basic_pass root_path
      # トップページに新規登録ページに遷移するボタンがあることを確認する
        expect(page).to have_content 'ユーザー登録'
      # 新規登録ページに移動する
        visit new_user_registration_path
      # 誤ったユーザー情報を入力する
        fill_in 'user_nickname', with: ''
        fill_in 'user_email', with: ''
        fill_in 'user_password', with: ''
        fill_in 'user_password_confirmation', with: ''
        fill_in 'user_body_height', with: ''
        fill_in 'user_body_weight', with: ''
        fill_in 'user_self_introduction', with: ''
      # 新規登録ボタンを押したもユーザーモデルのカウントが上がらないことを確認する
        expect {
          find('input[name="commit"]').click
        }.to change { User.count }.by(0)
      # 新規登録ページに戻されることを確認する
        expect(current_path).to eq user_registration_path
    end
  end
end

RSpec.describe "ログイン", type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  context 'ログインできるとき' do
    it '保存されているユーザー情報と合致すればログインできトップページ遷移する' do
      # トップページに移動する
        basic_pass root_path
      # トップページにログインページに遷移するボタンが表示されていることを確認する
        expect(page).to have_content 'ログイン'
      # ログインページに移動する
        visit new_user_session_path
      # 正しい情報を入力する
        fill_in 'user_email', with: @user.email
        fill_in 'user_password', with: @user.password
      # ログインボタンを押す
        find('input[name="commit"]').click
      # トップページに遷移したことを確認する
        expect(current_path).to eq root_path
      # ログアウトボタンやマイページボタン、ユーザー編集ボタンが表示されることを確認する
        expect(page).to have_content 'ログアウト' 
        expect(page).to have_content 'マイページ' 
        expect(page).to have_content 'ユーザー編集' 
      # ログインボタンや新規登録ページに遷移するボタンが表示されていないことを確認する
        expect(page).to have_no_content 'ログイン'
        expect(page).to have_no_content 'ユーザー登録'
    end
  end

  context 'ログインできないとき' do
    it '保存されているユーザー情報と合致しなければログインできずにログインページに戻される' do
      # トップページに移動する
        basic_pass root_path
      # トップページにログインページに遷移するボタンが表示されていることを確認する
        expect(page).to have_content 'ログイン'
      # ログインページに移動する
        visit new_user_session_path
      # 誤った情報を入力する
        fill_in 'user_email', with: ''
        fill_in 'user_password', with: ''
      # ログインボタンを押す
        find('input[name="commit"]').click
      # ログインページに戻されることを確認する
        expect(current_path).to eq user_session_path
    end
  end
end

require 'fileutils'
require 'singleton'

class OutputWriter
  include Singleton
  #対象ファイルに、ある特定メッセージを書き込む
  def write_to_file(target_file,target_country,msg)
    target_to_dir_file = target_country +target_file
    File.open(target_file, "a") do |f|
      begin
      f.write msg
      rescue => e
        p "error has occured #{e}"
      end
    end
  end
  public
  #シミュレーション結果を格納するファイルを生成するメソッド
  #デフォルトで""を利用するように設定
  def create_file(setting_file_name: "",output_dir_prefix: "",target_country: "")
    #p "debug #{ prefix}"
    now = Time.now.strftime("%Y-%m-%d-%S")
    file_name = output_dir_prefix + setting_file_name + get_random_val() + "#{now}.txt"
    #p "DEBUG: #{set_to_dir_file}"
    begin
      FileUtils.touch(file_name)
    rescue => e
      p "#{e},ファイルを作成することに失敗しました"
      raise Error
    end
    file_name
  end

  #ファイル名が重複しないように10文字のランダム文字列をファイル名に足すためのメソッド
  private 
    def get_random_val
      (0...10).map{ ('A'..'Z').to_a[rand(26)] }.join 
    end
end

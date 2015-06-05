require 'fileutils'
require 'singleton'

#singletonクラスに設定
class OutputWriter
  include Singleton
  #対象ファイルに、ある特定メッセージを書き込む
  def write_to_file(target_file,msg)
    File.open(target_file, "a") do |f|
      begin
      f.write msg
      rescue => e
        p "error has occured #{e}"
      end
    end
  end
  #ファイル名が重複しないように10文字のランダム文字列をファイル名に足すためのメソッド
  private 
    def get_random_val
      (0...10).map{ ('A'..'Z').to_a[rand(26)] }.join 
    end
  public
  #シミュレーション結果を格納するファイルを生成するメソッド
  #デフォルトで""を利用するように設定
  def create_file(prefix: "")
    #p "debug #{ prefix}"
    now = Time.now.strftime("%Y-%m-%d-%S")
    file_name = prefix << get_random_val() << "#{now}.txt"
    set_to_dir_file = "output/" << file_name
    begin
      FileUtils.touch(set_to_dir_file)
    rescue e
      p "#{e},ファイルを作成することに失敗しました"
      raise Error
    end
    set_to_dir_file
  end
end

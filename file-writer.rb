require 'fileutils'
require 'singleton'
#only one instance
class OutputWriter
  #singletonクラスに設定
  # -インスタンス化を防ぐ->このクラス自体は使いまわせるため、ひとつで充分
  include Singleton
  #
  def write_to_file(target_file,msg)
    File.open(target_file, "a") do |f|
      begin
      f.write msg
      rescue => e
        p "error has occured #{e}"
      end
    end
  end

  private 
    def get_random_val
      (0...8).map{ ('A'..'Z').to_a[rand(26)] }.join 
    end
  public
  #シミュレーション結果を格納するファイルを生成するメソッド
  #デフォルトで""を利用するように設定
  def create_file(prefix: "")
    now = Time.now.strftime("%Y-%m-%d-%S")
    file_name = prefix <<  get_random_val() << "#{now}.txt"
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

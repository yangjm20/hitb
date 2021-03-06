defmodule Stat.Rand do
  alias Stat.Key

  #自定义取数据库
  def rand(key, val) do
    key = Key.cnkey(key)
    cond do
      val == "0.0000" -> Float.floor(:rand.uniform(1)/:rand.uniform(100)*:rand.uniform(99), 4)
      key in ["机构", "时间", "病种"] -> val
      val == nil ->
        cond do
          String.contains? key, "平均" ->
            cond do
              String.contains? key, ["住院日", "日数"] -> Float.floor(:rand.uniform(10)/100*99, 4)
              String.contains? key, "病床数" -> Float.floor(:rand.uniform(20)/100*99, 4)
              String.contains? key, "费用" -> Float.floor(:rand.uniform(10000)/100*99, 4)
              true -> Float.floor(:rand.uniform(10)/100*99, 4)
            end
          String.contains? key, "总" -> :rand.uniform(50)
            cond do
              String.contains? key, ["住院日", "日数"] -> :rand.uniform(10)
              String.contains? key, "病床数" -> :rand.uniform(20)
              String.contains? key, "费用" -> Float.floor(:rand.uniform(10000)/100*99, 4)
              String.contains? key, "权重" -> Float.floor(:rand.uniform(1)/:rand.uniform(100)*:rand.uniform(99), 4)
              true -> :rand.uniform(10)
            end
          String.contains? key, ["病例数", "病历数", "患者数"] -> :rand.uniform(100)
          String.contains? key, "指数" -> Float.floor(:rand.uniform(1)/100*99, 4)
          String.contains? key, "年龄" -> :rand.uniform(50)
          String.contains? key, "组数" -> :rand.uniform(20)
          String.contains? key, "人数" -> :rand.uniform(100)
          String.contains? key, "次数" -> :rand.uniform(5)
          String.contains? key, "率" -> Float.floor(:rand.uniform(), 4)
          true -> Float.floor(:rand.uniform(), 4)
        end
      true -> val
    end
  end
end

object GB_DFE_SERVICE: TGB_DFE_SERVICE
  OnCreate = ServiceCreate
  DisplayName = #174' GB_DFE_SERVICE'
  Height = 150
  Width = 215
  object tmstart: TTimer
    Enabled = False
    Interval = 15000
    OnTimer = tmstartTimer
    Left = 40
    Top = 56
  end
end

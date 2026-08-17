local starter = require('mini.starter')

local default_margin = '\n\n\n'

local waveASCII = table.concat({
  [[ ⣿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ]],
  [[ ⣸⢺⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ]],
  [[ ⣘⢸⣿⣿⣭⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣿⣿⣿⣿⣿⣿⣿⢛⢹⣙⣹⡿⣟⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ]],
  [[ ⣘⠈⠹⣺⡙⣿⣿⣿⣿⣿⣿⣿⣿⣟⣿⣷⣿⣿⣿⣿⣿⡛⠛⠹⡸⠉⠛⢛⢐⠙⠳⢞⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ]],
  [[ ⣈⠀⠈⠹⠯⢹⣿⣿⣿⣿⡿⣛⣵⣿⣿⡿⠟⠁⡐⠙⠋⠣⠅⠁⠀⠛⣠⣴⠈⡤⢜⣒⣝⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ]],
  [[ ⣐⠀⠈⡔⢐⣻⣿⣿⡿⣯⣾⣿⣿⣿⣟⠛⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠦⠈⢨⡛⢛⣿⣷⠏⣉⢛⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ]],
  [[ ⠖⠀⢰⣶⣶⣿⡟⢫⣾⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣮⠰⣉⢶⣩⠞⣽⠷⠛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ]],
  [[ ⠑⠀⠘⠛⠛⣩⣾⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⡶⢄⠀⠀⠀⠀⠀⠀⠀⠀⣠⣬⣷⣺⣷⣿⣿⣧⡭⠂⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ]],
  [[ ⠀⢀⣤⣶⣿⣿⣿⠿⣫⡿⢋⠼⣿⣿⡿⣈⣍⢻⣇⣠⡴⠀⠀⠀⠀⠀⢸⣿⣿⣿⣯⣾⣿⣿⣽⣿⣿⣏⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ]],
  [[ ⢹⠈⠹⢯⣉⣛⡛⠈⠿⠿⠖⡯⠠⠚⣣⠛⠿⠟⠛⣿⣷⣶⡿⠆⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ]],
  [[ ⡼⠀⠡⠔⢫⡹⢇⢀⠀⠀⠻⠏⠀⣾⡿⠤⣀⠄⠀⠀⠘⠓⠀⠀⠀⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣿⣿⣿⡿ ]],
  [[ ⡃⠀⠠⡀⠘⠁⠊⠈⠀⠀⠠⢀⡀⠉⠡⠲⢋⡀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣿⠟⣷⣿⡿⠿⠃ ]],
  [[ ⣴⠀⠠⢤⡀⠀⠀⠀⠀⠀⠒⠀⠀⠀⠀⠐⠂⠀⠀⠀⠀⣠⣤⣀⡂⠀⠀⠹⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⠿⡿⢟⠛⠛⠏⠀⣠⣾⣿⣿⢃⡁⠀ ]],
  [[ ⠄⠀⠠⠸⣷⠶⠐⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣼⣿⣿⣿⣿⣿⣄⠀⠀⠀⠀⠋⠉⠛⠛⠛⠛⠋⠋⠋⠉⠙⠙⠛⠙⠿⠙⠛⠉⠀⠀⠀⠀⠀⠀⠀⣀⣾⣿⣿⢿⠛⠓⠁⠀ ]],
  [[ ⢢⠀⠀⠸⠛⠉⠀⠈⠁⠒⢀⣄⡀⠀⠀⠀⠀⣀⣼⣿⣿⣿⣿⢻⣿⣿⣿⡵⢄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣴⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⡀⣠⡶⣿⢿⡛⠋⠀⠀⠀⣀⣄ ]],
  [[ ⢾⠄⠀⠀⠀⠀⠈⠀⠀⠀⠀⣁⠀⢀⣡⣾⣿⣿⣿⣿⣿⣫⣔⢺⣿⣿⣿⣿⣾⠿⣿⣷⣄⠀⠀⠀⠀⠄⡠⠾⠻⢻⠿⣦⣄⠀⠀⢀⣀⣤⢴⣪⣽⡿⠿⠻⠬⠌⡀⣠⡤⠖⣋⣷⣿ ]],
  [[ ⣽⢾⣷⣤⣤⣤⣤⣴⣾⣿⣷⣷⢿⣿⣿⣿⣿⡿⣧⣿⣿⣿⣹⣿⢿⢝⠿⠹⣻⣷⣗⡙⢿⠷⣦⣤⣀⡀⠀⠀⠀⠀⠀⢀⢀⣀⣠⣹⣭⣾⣿⡉⠁⣀⣠⣤⡶⠿⠟⢉⣥⣾⣿⣿⠟ ]],
  [[ ⣿⢸⢻⠿⢿⣿⣿⣿⣿⣿⣿⣿⡓⣟⣿⢿⣿⣴⣾⣿⢿⣿⣿⢿⣹⡎⠀⠀⠘⠘⠻⣤⠀⠡⠊⠛⠈⠻⣿⣿⣿⣯⣿⣿⣿⣿⣿⣷⣶⣾⣾⣿⣟⡛⠉⠁⠀⢀⣴⡿⠿⠏⠉⠁⠀ ]],
  [[ ⢿⢹⣿⢶⢾⡀⠶⡿⣿⠏⠈⠀⠠⣟⢂⡽⢿⢻⣿⣏⠩⡎⡩⡽⢹⣷⠀⠀⠀⠀⠀⠉⠻⢦⣄⡀⠀⠀⠈⠙⠿⣿⣟⠛⠿⢿⡷⠬⠉⠉⠀⠀⠀⠀⠀⣠⣶⣿⣿⣿⠶⠒⠂⠀⠀ ]],
  [[ ⢸⠐⠀⠀⠀⠁⠀⠀⠀⣀⣠⢞⡡⠆⣁⡄⠥⠤⡅⣡⡴⠒⠁⠘⢼⡻⢷⡀⠀⠀⠀⠀⠀⠀⠐⠀⠑⠂⠀⠀⠀⠀⠈⠓⠂⠀⠀⠀⠂⢀⠀⢀⣠⣴⡿⠿⠯⠅⠀⠀⠠⠔⠒⠀⠀ ]],
  [[ ⡌⠀⠀⠀⠀⠀⠀⠀⠀⠛⠀⠀⠀⠀⠀⠙⣭⣶⡾⢿⣿⠦⠤⡀⠈⠉⠺⣿⣦⣄⠀⠀⠀⠀⠠⢥⣤⣄⣡⣀⣀⢀⢀⣐⣾⣠⠵⣁⣢⡴⠾⠿⠛⠛⠀⠀⠀⢀⣀⣀⣄⣤⣄⣄⣀ ]],
  [[ ⠇⠀⠀⠀ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠯⠁⢀⢠⡉⣁⡴⡆⣀⡀⠀⠀⠈⠙⢷⣦⣤⣀⣀⡀⠉⠉⠉⠉⠉⡉⣠⣥⣿⣾⣿⣿⣦⣤⣤⣤⣤⣤⣴⣶⣾⣿⣿⣿⣿⣿⡿⣿⣿ ]]
}, '\n')

local proverbs = {
  { "七転び八起き", "Deru kui wa utareru", "The stake that sticks up gets hammered down." },
  { "知らぬが仏", "Shiranu ga hotoke", "Not knowing is Buddha." },
  { "見ぬが花", "Minu ga hana", "Not seeing is a flower." },
  { "井の中の蛙大海を知らず", "I no naka no kawazu taikai wo shirazu", "The frog in the well knows nothing of the ocean." },
  { "蛙の子は蛙", "Kaeru no ko wa kaeru", "The child of a frog is a frog." },
  { "馬鹿は風邪を引かない", "Baka wa kaze o hikanai", "Idiots don't catch colds." },
  { "猿も木から落ちる", "Saru mo ki kara ochiru", "Even monkeys fall from trees." },
  { "十人十色", "Junin toiro", "10 persons, 10 colors." },
}

math.randomseed(os.time())

local function random_proverb()
  local p = proverbs[math.random(#proverbs)]
  return string.format(default_margin .. '%s · %s\n\n"%s"', p[1], p[2], p[3])
end

local function recent_or_builtin()
  return function()
    local recent = starter.sections.recent_files(3, true, false)()
    if #recent > 0 and recent[1].action ~= '' then
      return recent
    else
      local builtin = starter.sections.builtin_actions()
      table.insert(builtin, 1, { name = 'Find file', action = 'Telescope find_files', section = 'Builtin actions' })
      return builtin
    end
  end
end

starter.setup({
  header = waveASCII .. default_margin,
  items = {
    recent_or_builtin()
  },
  content_hooks = {
    starter.gen_hook.aligning('center', 'center'),
  },
  footer = random_proverb
})

return {
  "nvim-orgmode/orgmode",
  event = "BufReadPre",
  ft = { "org" },
  config = function()
    require("orgmode").setup({
      org_agenda_files = "~/org/**/*",
      org_default_notes_file = "~/org/refile.org",
      org_todo_keywords = { "TODO", "ACTIVE", "WAITING", "|", "DONE" },
      org_todo_keyword_faces = {
        TODO = ":foreground #FFA500 :weight bold",
        ACTIVE = ":foreground #1E90FF :weight bold",
        WAITING = ":foreground #FF0000 :weight bold",
        DONE = ":foreground #32CD32 :weight bold",
      },
    })
  end,
}

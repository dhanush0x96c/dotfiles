-- Define all plugins by category
local plugins = {
  ai = {
    path = "lazyvim.plugins.extras.ai",
    modules = {
      -- "codeium",      -- AI code completion alternative to Copilot
      -- "copilot-chat", -- Chat interface for GitHub Copilot
      -- "copilot",      -- GitHub's AI pair programmer
      -- "supermaven",   -- AI-powered code suggestion engine
      -- "tabnine",      -- AI code completion with local processing
    }
  },
  
  coding = {
    path = "lazyvim.plugins.extras.coding",
    modules = {
      -- "blink",         -- Highlight cursor after jumps
      -- "luasnip",       -- Snippets engine written in Lua
      -- "mini-comment",  -- Commenting plugin from mini.nvim
      -- "mini-snippets", -- Minimal snippets solution
      -- "mini-surround", -- Add/delete/change surrounding pairs
      -- "neogen",        -- Code annotation generator
      -- "nvim-cmp",      -- Completion engine plugin
      -- "yanky",         -- Improved yank and put functionality
    }
  },
  
  dap = {
    path = "lazyvim.plugins.extras.dap",
    modules = {
      -- "core", -- Debug Adapter Protocol core setup
      -- "nlua", -- Lua debugging support
    }
  },
  
  editor = {
    path = "lazyvim.plugins.extras.editor",
    modules = {
      -- "aerial",          -- Code outline sidebar
      -- "dial",            -- Extended increment/decrement
      -- "fzf",             -- Fuzzy finder integration
      -- "harpoon2",        -- Quick file navigation marks
      -- "illuminate",      -- Highlight word under cursor
      -- "inc-rename",      -- Incremental LSP renaming
      -- "leap",            -- Quick navigation plugin
      -- "mini-diff",       -- Shows git changes in the sign column
      -- "mini-files",      -- Minimal file explorer
      -- "mini-move",       -- Move text with minimal keystrokes
      -- "navic",           -- Shows code context in statusline
      -- "neo-tree",        -- File explorer tree
      -- "outline",         -- Code outline window
      -- "overseer",        -- Task runner and job manager
      -- "refactoring",     -- Code refactoring tools
      -- "snacks_explorer", -- Alternative file explorer
      -- "snacks_picker",   -- Quick file picker
      -- "telescope",       -- Fuzzy finder and picker
    }
  },
  
  formatting = {
    path = "lazyvim.plugins.extras.formatting",
    modules = {
      -- "biome",    -- Fast JavaScript/TypeScript formatter
      -- "black",    -- Python code formatter
      -- "prettier", -- Frontend code formatter
    }
  },
  
  lang = {
    path = "lazyvim.plugins.extras.lang",
    modules = {
      -- "angular",    -- Angular framework support
      -- "ansible",    -- Infrastructure as code support
      -- "astro",      -- Astro web framework support
      -- "clangd",     -- C/C++ language support
      -- "clojure",    -- Clojure language support
      -- "cmake",      -- CMake build system support
      -- "docker",     -- Docker container support
      -- "elixir",     -- Elixir language support
      -- "elm",        -- Elm language support
      -- "erlang",     -- Erlang language support
      -- "git",        -- Git integration enhancements
      -- "gleam",      -- Gleam language support
      -- "go",         -- Go language support
      -- "haskell",    -- Haskell language support
      -- "helm",       -- Kubernetes Helm charts support
      -- "java",       -- Java language support
      -- "json",       -- JSON file format support
      -- "kotlin",     -- Kotlin language support
      -- "lean",       -- Lean theorem prover support
      -- "markdown",   -- Markdown support and extensions
      -- "nix",        -- Nix package manager support
      -- "nushell",    -- Nushell scripting support
      -- "ocaml",      -- OCaml language support
      -- "omnisharp",  -- C# language support
      -- "php",        -- PHP language support
      -- "prisma",     -- Prisma ORM support
      -- "python",     -- Python language support
      -- "r",          -- R language support
      -- "rego",       -- Open Policy Agent Rego support
      -- "ruby",       -- Ruby language support
      -- "rust",       -- Rust language support
      -- "scala",      -- Scala language support
      -- "sql",        -- SQL language support
      -- "svelte",     -- Svelte framework support
      -- "tailwind",   -- Tailwind CSS support
      -- "terraform",  -- Infrastructure as code support
      -- "tex",        -- LaTeX document support
      -- "thrift",     -- Apache Thrift support
      -- "toml",       -- TOML file format support
      -- "typescript", -- TypeScript language support
      -- "Unti",       -- Unknown/custom language support
      -- "vue",        -- Vue.js framework support
      -- "yaml",       -- YAML file format support
      -- "zig",        -- Zig language support
    }
  },
  
  linting = {
    path = "lazyvim.plugins.extras.linting",
    modules = {
      -- "eslint", -- JavaScript/TypeScript linter
    }
  },
  
  lsp = {
    path = "lazyvim.plugins.extras.lsp",
    modules = {
      -- "neoconf", -- Local project configuration for LSP
      -- "none-ls", -- Use Neovim as a language server
    }
  },
  
  test = {
    path = "lazyvim.plugins.extras.test",
    modules = {
      -- "core", -- Core testing framework integration
    }
  },
  
  ui = {
    path = "lazyvim.plugins.extras.ui",
    modules = {
      -- "alpha",              -- Greeter/dashboard for Neovim
      -- "dashboard-nvim",     -- Alternative fancy start screen
      -- "edgy",               -- UI layout manager for windows
      -- "indent-blankline",   -- Indentation guide lines
      -- "mini-animate",       -- Animations for Neovim actions
      -- "mini-indentscope",   -- Visualize current indent scope
      -- "mini-starter",       -- Minimal startup screen
      -- "smear-cursor",       -- Cursor trail effect
      -- "treesitter-context", -- Show code context while scrolling
    }
  },
  
  util = {
    path = "lazyvim.plugins.extras.util",
    modules = {
      -- "chezmoi",         -- Dotfile management integration
      -- "dot",             -- GraphViz dot file support
      -- "gitui",           -- Terminal UI for Git
      -- "mini-hipatterns", -- Highlight patterns in text
      -- "octo",            -- GitHub integration
      -- "project",         -- Project management
      -- "rest",            -- HTTP REST client
      -- "startuptime",     -- Measure startup performance
    }
  },
  
  others = {
    path = "lazyvim.plugins.extras",
    modules = {
      -- "code", -- General coding enhancements
    }
  },
}

-- Build config by processing all categories
local config = {}

for _, category in pairs(plugins) do
  for _, module in ipairs(category.modules) do
    table.insert(config, { import = category.path .. "." .. module })
  end
end

return config

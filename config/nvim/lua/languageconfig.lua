--require'lspconfig'.basedpyright.setup {
--    settings = {
--        basedpyright = {
--            analysis = {
--                diagnosticSeverityOverrides = {
--                    reportAny = false,
--                    reportUnusedCallResult = false,
--                    reportMissingTypeArgument = false,
--                    reportMissingParameterType = false,
--                    reportUnknownArgumentType = false,
--                    reportUnknownLambdaType = false,
--                    reportUnknownMemberType = false,
--                    reportUnknownParameterType = false,
--                    reportUnknownVariableType = false
--                }
--            }
--        }
--    }
--}
require'lspconfig'.ruff.setup{}
require'lspconfig'.rust_analyzer.setup{}
require'lspconfig'.lua_ls.setup{}
require'lspconfig'.html.setup{}
require'lspconfig'.jsonls.setup{}
require'lspconfig'.yamlls.setup{}
require'lspconfig'.omnisharp.setup{}
require'lspconfig'.dotls.setup{}
require'lspconfig'.cssls.setup{}
require'lspconfig'.gopls.setup{}
require'lspconfig'.nixd.setup{}

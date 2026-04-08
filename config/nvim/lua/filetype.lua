vim.filetype.add({
  pattern = {
    -- Docker-compose
    ['docker-compose%.yml'] = 'yaml.docker-compose',
    ['docker-compose%.yaml'] = 'yaml.docker-compose',
    ['compose%.yml'] = 'yaml.docker-compose',
    ['compose%.yaml'] = 'yaml.docker-compose',

    -- gowork/gotmpl
    ['go.work'] = 'gowork',
    ['*.tmpl'] = 'gotexttmpl',
    ['*.gotext'] = 'gotexttmpl',
    ['*.gohtml'] = 'gohtmltmpl',

    -- templ
    ['*.templ'] = 'templ',

    -- mdx
    ['*.mdx'] = 'mdx',

    -- helm
    [".*/templates/.*%.tpl"] = "helm",
    [".*/templates/.*%.ya?ml"] = "helm",
    [".*/templates/.*%.txt"] = "helm",
    ["helmfile.*%.ya?ml"] = "helm",
    ["helmfile.*%.ya?ml.gotmpl"] = "helm",
    ["values.*%.yaml"] = "yaml.helm-values",
  },
})

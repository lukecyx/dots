;; Inject GraphQL when using gql() call expression (matches any GraphQL syntax)
(call_expression
  function: (identifier) @func
  arguments: (template_string) @graphql
  (#eq? @func "gql")
  (#set! injection.language "graphql"))

;; Inject GraphQL when comment hints it
(variable_declarator
  (comment) @gql_comment
  (template_string) @graphql
  (#match? @gql_comment ".*GraphQL.*")
  (#set! injection.language "graphql"))

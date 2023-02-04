# api-wrapper

`api-wrapper` is an API wrapper for [Rawg API](https://rawg.io/apidocs)
`api-wrapper` covers the creators, developers, and most of games endpoints of [Rawg API](https://rawg.io/apidocs)

## Usage
`api-wrapper` only has one method, which is the `get` method
the `get` method builds an endpoint using the `route`, `path parameters`, and `query parameters`
 
Example usage:
request:
`<base_url>/api/games/3328/screenshots`
response:
`{code: 200, status: "Success", data: {count: x, results: []}`

## Available endpoints
`api/creators`
`api/creators/page/:page`
`api/creators/roles`
`api/creators/:creator_id`

`api/developers`
`api/developers/page/:page`
`api/developers/:developer_id`

`api/games`
`api/games/page/:page`
`api/games/top/:timespan`
`api/games/top/:timespan/page/:page`
`api/games/genres`
`api/games/:game_id`
`api/games/:game_id/:sub_directory`
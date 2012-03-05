# OmniAuth Hyves

OAuth 1 strategy to authenticate with [Hyves](http://www.hyves.nl) to make use of the Hyves Data-API. Hyves documentation can be found [here](http://www.hyves-developers.nl/documentation/data-api/hyves-api-oauth/).

## Usage

Use like it like any other OmniAuth strategy.

To allow the use of the various Data-API methods you need to specify them when getting the request token, you can do so by specifying them in options.request_params[:methods] (the default and minimum required is 'users.get,friends.get,media.get').

## Development
- Source hosted on [GitHub](https://github.com)
- Please report issues and feature requests using [GitHub issues](https://github.com/socialreferral/omniauth-hyves/issues)

Pull requests are welcome, please make sure your patches are well tested before contributing. When sending a pull request:

- Use a topic branch for your change
- Do not change the version number

## License
OmniAuth Hyves is released under the MIT license.

## Author
[Mark Kremer](https://github.com/mkremer)

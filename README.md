# Docker CyberChef


[![CI](https://github.com/RealOrangeOne/docker-website-server/actions/workflows/ci.yml/badge.svg)](https://github.com/RealOrangeOne/docker-website-server/actions/workflows/ci.yml)

A containerized deployment of [CyberChef](https://github.com/gchq/cyberchef), with additional protections.


## Usage

```yml
version: "2.3"

services:
  web:
    image: theorangeone/cyberchef:latest
    ports:
      - "80:80"
```


## Protections

CyberChef is a project from the UK's [Government Communications Headquarters (GCHQ)](https://www.gchq.gov.uk/). Whilst the project itself is great, given the nature of the data put into it, I don't quite trust GCHQ, regardless of the fact it's an open-source project. I want to be sure (or as sure as I can be) the data I give to CyberChef goes no further than my browser

For that reason, this container has a few additional protections to help secure it and any data entered into it:

- Add a `Content-Security-Policy` to prevent the browser from communicating with any other sites
- Add a `Permissions-Policy` to prevent access to more "interesting" browser features
- Just `nginx` on the server - no additional complexities
- Prevent embedding in an `iframe`
- Don't send `Referer` header when navigating to related links
- Don't cache files, always revalidate from the server
- Prevent search engines from indexing content on the page

## Customization

This image supports some customizations:

- `$PUID`: Set the user nginx runs as (default `1000`)

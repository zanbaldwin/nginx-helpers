Nginx Helper Scripts
====================

Helper scripts, including upstream declarations and site templates.

To add a new website to Nginx, copy the file either the file [`templates/site_with_ssl`](templates/site_with_ssl) or
[`templates/site_without_ssl`](templates/site_without_ssl) to `/etc/nginx/sites-available/$DOMAIN`.

Replace the string `{$domain_name}` with the correct domain name (without the `www.`), and make sure that you don't need
to alter the webroot directory (perhaps you need to add `public_html` or `web` to the end of it?).

Link the new configuration file to enable it in Nginx.

```bash
$ cd /etc/nginx/sites-enabled
$ sudo ln -s ../sites-available/$DOMAIN 20-$DOMAIN
```

Double check that there are no configuration errors, then tell Nginx to reload the configuration so that your website
becomes live.

```bash
$ sudo nginx -t
$ sudo service nginx reload
```

# Pass all PHP and Hack files onto the HipHop Virtual Machine.
location ~ [^/]\.hh(/|\?|$) {
    fastcgi_split_path_info ^(.+?\.hh)(\.*)$;
    if (!-f $document_root$fastcgi_script_name) {
        return 404;
    }
    try_files $uri $fastcgi_script_name =404;
    fastcgi_keep_conn on;
    fastcgi_index index.hh;
    include fastcgi_params;
    fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    fastcgi_pass hhvm;
}


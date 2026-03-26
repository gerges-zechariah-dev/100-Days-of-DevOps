#!/bin/bash

zip -r /backup/xfusioncorp_ecommerce.zip /var/www/html/ecommerce

scp /backup/xfusioncorp_ecommerce.zip natasha@ststor01:/backup/

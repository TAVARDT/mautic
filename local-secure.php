<?php
/**
 * TAVARDT Elite Mautic Security Configuration Snippets
 * 
 * Instructions: Add these parameters to your Mautic `app/config/local.php` 
 * inside the 'parameters' array.
 */

// 1. Trust Proxies (Essential for Cloudflare or Load Balancers)
// If not set, Mautic will log the proxy IP instead of the lead's real IP, destroying analytics.
'trusted_proxies' => array(
    '0' => '103.21.244.0/22',
    '1' => '103.22.200.0/22',
    '2' => '103.31.4.0/22',
    '3' => '104.16.0.0/13',
    '4' => '104.24.0.0/14',
    '5' => '108.162.192.0/18',
    '6' => '131.0.72.0/22',
    '7' => '141.101.64.0/18',
    '8' => '162.158.0.0/15',
    '9' => '172.64.0.0/13',
    '10' => '173.245.48.0/20',
    '11' => '188.114.96.0/20',
    '12' => '190.93.240.0/20',
    '13' => '197.234.240.0/22',
    '14' => '198.41.128.0/17',
),

// 2. Strict CORS Settings for Webhooks and Forms
// Limit which domains can post data to your Mautic instance to prevent spam and abuse.
'cors_restrict_domains' => true,
'cors_valid_domains' => array(
    '0' => 'https://tavardt.com',
    '1' => 'https://ag.tavardt.com',
),

// 3. Cache and Queue Configuration for High Performance
// Offload the heavy spooling to memory instead of reading/writing to disk.
'mailer_spool_type' => 'memory',
'mailer_spool_path' => '%kernel.root_dir%/../var/spool', // Only used if type is 'file'

// 4. Disable anonymous tracking if GDPR strictness is required
// 'anonymize_ip' => true,

// 5. Force HTTPS for Mautic URLs
'site_url' => 'https://seu-mautic.tavardt.com',

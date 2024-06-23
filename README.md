# cPanel to Synology SSL Export and Update Tool

This project provides two command-line tools for exporting SSL certificates from a cPanel server and updating them on a Synology NAS. The tools are designed to work together in a Docker environment.

## Tools Overview

### 1. cPanel Export SSL
This tool exports SSL certificates from a cPanel server.

#### Usage
```sh
cpanel-export-ssl -t <auth-token> -e <endpoint> [-d <domain1> -d <domain2> ...] [-o <output-path>]
```

#### Arguments
- `-d, --domains`: Domain(s) to be exported from cPanel. Can be specified multiple times.
- `-t, --auth-token`: Authentication token for the cPanel server. (required)
- `-e, --endpoint`: The endpoint of the cPanel server (e.g., "https://your-server.com:2083"). (required)
- `-o, --output-path`: Path to the export folder. Default is `./export`. (optional)

### 2. Synology Update Certificate
This tool updates SSL certificates on a Synology NAS.

#### Usage
```sh
synology-update-certificate -i <synology-ip> -p <synology-port> -u <synology-user> -w <synology-password> -c <certificates-path> [-s] [-v]
```

#### Arguments
- `-i, --synology-ip`: IP address of the Synology NAS. (required)
- `-p, --synology-port`: Port number of the Synology NAS. (required)
- `-u, --synology-user`: Username for accessing the Synology NAS. (required)
- `-w, --synology-password`: Password for the Synology NAS user. (required)
- `-c, --certificates-path`: Path to the folder containing the SSL certificates. (required)
- `-s, --synology-secure`: Use a secure (HTTPS) connection to the NAS. Default is False. (optional)
- `-v, --synology-verify-cert`: Verify the SSL certificate when connecting to the Synology NAS. Default is False. (optional)

## Running the Tools in Docker

### Environment Variables
- `DOMAINS`: Comma-separated list of domains to be exported.
- `CPANEL_AUTH`: Authentication token for the cPanel server.
- `CPANEL_ENDPOINT`: Endpoint of the cPanel server.
- `SYNOLOGY_IP`: IP address of the Synology NAS.
- `SYNOLOGY_PORT`: Port number of the Synology NAS.
- `SYNOLOGY_USER`: Username for accessing the Synology NAS.
- `SYNOLOGY_PASS`: Password for the Synology NAS user.

### Building and Running the Docker Image
1. **Build the Docker image:**
   ```sh
   docker build -t cpanel-to-synology-ssl-sync .
   ```

2. **Run the Docker container:**
   ```sh
   docker run -e DOMAINS="example.com,example.org" \
              -e CPANEL_AUTH="your-cpanel-auth-token" \
              -e CPANEL_ENDPOINT="https://your-cpanel-server:2083" \
              -e SYNOLOGY_IP="your-synology-ip" \
              -e SYNOLOGY_PORT="your-synology-port" \
              -e SYNOLOGY_USER="your-synology-user" \
              -e SYNOLOGY_PASS="your-synology-pass" \
              cpanel-to-synology-ssl-sync
   ```

## License
[MIT License](LICENSE)
